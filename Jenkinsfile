pipeline {
    agent { label 'docker-python-agent' }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Image') {
            steps {
                script {
                    // כאן ג'נקינס בונה את האימג' מה-Dockerfile שלך
                    docker.build("matanlahmi/my-agent:latest")
                }
            }
        }
        stage('Push to Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        def customImage = docker.image("matanlahmi/my-agent:latest")
                        customImage.push()
                    }
                }
            }
        }
    }
}