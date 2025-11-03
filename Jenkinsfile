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
                    set -e
                    echo "Current user: $(whoami)"
                    echo "Installing Docker..."
                    apt-get update -y
                    apt-get install -y docker.io
                    echo "✓ Docker installed"
                    docker --version
                '''
            }
        }

        stage('Checkout Code') {
            steps {
                echo "==================== CHECKING OUT CODE ===================="
                sh '''
                    echo "Workspace: $(pwd)"
                    echo "Files in workspace:"
                    ls -la
                    echo "✓ Code ready"
                '''
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
                    docker ps | grep ${CONTAINER_NAME} && echo "✓ Container is running"
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
        }
        always {
            sh 'docker rm -f ${CONTAINER_NAME} 2>/dev/null || true'
        }
    }
}
