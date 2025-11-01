pipeline {
    agent any

    environment {
        DOCKER_HOST = "tcp://docker:2375"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Aryanfour5/DevOps-2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t hello-devops:latest .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker stop hello-devops-container || true'
                    sh 'docker rm hello-devops-container || true'
                    sh 'docker run -d -p 5000:5000 --name hello-devops-container hello-devops:latest'
                }
            }
        }

        stage('Verify Container') {
            steps {
                sh 'docker ps | grep hello-devops-container'
            }
        }
    }

    post {
        success {
            echo "✅ Build and Container Run Successful!"
        }
        failure {
            echo "❌ Build Failed!"
        }
    }
}
