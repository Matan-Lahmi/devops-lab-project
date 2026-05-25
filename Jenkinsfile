pipeline {
    agent { label 'docker-agent' }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Flake8 - Code Quality') {
            steps {
                sh 'pip install flake8 --break-system-packages'
                sh 'flake8 main.py'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t matanlahmi/my-python-app:latest .'
            }
        }

        stage('Trivy - Security Scan') {
            steps {
                script {
             def imageToScan = "matanlahmi/my-python-app:latest"
            sh """
            trivy image \
            --exit-code 1 \
            --severity HIGH,CRITICAL \
            --ignore-unfixed \
            ${imageToScan}
            """
               }
            }
        }
         stage('push to DOCKER-HUB') {
            steps {
              sh 'docker build -t matanlahmi/my-python-app:${BUILD_NUMBER} .'
            }
         }
    }

    post {
        always {
            cleanWs()
        }
    }
}
