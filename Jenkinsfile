pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven"
    }

    stages {
        stage('Code download') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url: 'https://github.com/Parthrajv/mvc_1.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
            
        post
