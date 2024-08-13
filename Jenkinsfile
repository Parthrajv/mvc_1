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

    }
}
