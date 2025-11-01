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
                    docker.image('hello-devops:latest').run('-d -p 5000:5000 --name hello-devops-container')
                }
            }
        }

        stage('Verify Container') {
            steps {
                script {
                    docker.image('hello-devops:latest').inspect()
                }
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
