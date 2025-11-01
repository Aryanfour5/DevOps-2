pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Aryanfour5/DevOps-2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def app = docker.build('hello-devops:latest')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove existing container
                    sh 'docker stop hello-devops-container || true'
                    sh 'docker rm hello-devops-container || true'
                    
                    // Run container using Docker plugin
                    docker.image('hello-devops:latest').run('-d -p 5000:5000 --name hello-devops-container')
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
