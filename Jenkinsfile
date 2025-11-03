pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "hello-devops:latest"
        CONTAINER_NAME = "hello-devops-container"
    }

    stages {
        stage('Setup Docker') {
            steps {
                echo "==================== SETTING UP DOCKER ===================="
                sh '''
                    which docker || (apt-get update && apt-get install -y docker.io)
                    echo "✓ Docker CLI installed/verified"
                '''
            }
        }

        stage('Checkout Code') {
            steps {
                echo "==================== CHECKING OUT CODE ===================="
                git branch: 'main', url: 'https://github.com/Aryanfour5/DevOps-2.git'
                sh 'echo "✓ Code checked out successfully"'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "==================== BUILDING DOCKER IMAGE ===================="
                sh '''
                    docker build -t ${DOCKER_IMAGE} .
                    echo "✓ Docker image built: ${DOCKER_IMAGE}"
                    docker images | grep hello-devops
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "==================== RUNNING DOCKER CONTAINER ===================="
                sh '''
                    docker run -d -p 5000:5000 --name ${CONTAINER_NAME} ${DOCKER_IMAGE}
                    echo "✓ Container started: ${CONTAINER_NAME}"
                '''
            }
        }

        stage('Verify Container') {
            steps {
                echo "==================== VERIFYING CONTAINER ===================="
                sh '''
                    sleep 2
                    docker ps | grep ${CONTAINER_NAME} && echo "✓ Container is running successfully"
                    docker logs ${CONTAINER_NAME} | head -20
                '''
            }
        }
    }

    post {
        success {
            echo "========== ✅ PIPELINE SUCCESSFUL =========="
        }
        failure {
            echo "========== ❌ PIPELINE FAILED =========="
            sh 'docker ps -a | grep ${CONTAINER_NAME} || true'
        }
        always {
            echo "========== CLEANUP =========="
            sh 'docker rm -f ${CONTAINER_NAME} 2>/dev/null || true'
        }
    }
}
