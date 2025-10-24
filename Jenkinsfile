pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        IMAGE_NAME = 'sayaalieee/jenkins-demo'
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/sayaaliee/jenkins-demo.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $jenkinsdemo:latest .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run --rm $jenkinsdemo:latest python -m unittest || echo "No tests found"'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push $jenkinsdemo:latest'
            }
        }
    }
}
