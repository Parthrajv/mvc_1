pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Parthrajv/mvc_1.git'
            }
        }

        stage('Build') {
            steps {
                // Build the Java project
                sh 'mvn clean install'
            }
        }

	stage('Build Docker Image') {
            steps {
                // Build the Docker image using Dockerfile
                sh "docker build -t parthrajv/sample_app:$BUILD_NUMBER ."
            }
        }

	stage('User Approval') {
            steps {
                script {
                    // Pauses the pipeline and asks for user input before proceeding
                    def userInput = input(id: 'PushConfirmation', message: 'Do you want to push the Docker image to Docker Hub?', ok: 'Yes', parameters: [])
                    echo "User approved the push: ${userInput}"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    echo 'Pushing Docker image to Docker Hub...'
                    sh "docker login -u pXXXXXXjv -p RXXXXXXX3"
                    sh "docker push pXXXXXXjv/sample_app:$BUILD_NUMBER"
                }
            }
        }

	stage('Send artifact to Nexus') {
            steps {
                nexusArtifactUploader artifacts: [[artifactId: 'SNAPSHOT', classifier: '', file: 'target/mvc_1.war', type: 'war']], credentialsId: 'nexus', groupId: 'vpro-maven-group', nexusUrl: '35.183.27.32:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'vprofile-snapshots', version: '1.3'
            }
        }

    }
}
