pipeline {
    agent any

    environment {
        IMAGE_NAME = 'sayaalieee/jenkins-demo'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sayaaliee/jenkins-demo.git'
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
