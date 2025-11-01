pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/Aryanfour5/DevOps-2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t hello-devops .'
                }
            }
        }

        stage('Run Docker') {
            steps {
                script {
                    // Stop and remove any existing container
                    sh 'docker stop hello-devops-container || true'
                    sh 'docker rm hello-devops-container || true'
                    // Run the container
                    sh 'docker run -d -p 5000:5000 --name hello-devops-container hello-devops'
                }
            }
        }
    }

    post {
        success {
            echo "✅ Jenkins Build and Container Run Successful!"
        }
        failure {
            echo "❌ Build Failed!"
        }
    }
}
