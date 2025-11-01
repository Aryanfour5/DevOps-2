pipeline{
    agent any
    stages{
        stage('checkcout code'){
            steps{
                git 'https://github.com/Aryanfour5/DevOps-2.git'
            }
        }
        stage('Build Docker Image'){
            script{
                sh 'docker build -t hello-devops'
            }
        }
        stage("Run Docker"){
            sh 'docker run -d -p 5000:5000 --name hello-devops-container hello-devops'
        }
    }
    post{
        success{
             echo "✅ Jenkins Build and Container Run Successful!"
        }
        failure{
                   echo "❌ Build Failed!"
        }
    }

}
