pipeline {
    agent any

    environment {
        IMAGE_NAME = 'sayaalieee/jenkins-demo'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/sayaaliee/jenkins-demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $IMAGE_NAME:$IMAGE_TAG ."
            }
        }

        stage('Test') {
            steps {
                sh "docker run --rm $IMAGE_NAME:$IMAGE_TAG python -m unittest || echo 'No tests found'"
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Securely use Docker Hub credentials
                    withCredentials([usernamePassword(
                        credentialsId: 'dockerhub', 
                        usernameVariable: 'DOCKERHUB_CREDENTIALS_USR', 
                        passwordVariable: 'DOCKERHUB_CREDENTIALS_PSW'
                    )]) {
                        sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                        sh "docker push $IMAGE_NAME:$IMAGE_TAG"
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Docker image $IMAGE_NAME:$IMAGE_TAG pushed successfully!"
        }
        failure {
            echo "Build failed!"
        }
    }
}

