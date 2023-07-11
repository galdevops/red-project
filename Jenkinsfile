pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages {
        stage ('checkout') {
            steps{
                checkout scmGit(branches: [[name: '*/gal_y']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/galdevops/red-project/']])
            }
        }
        stage('build backend'){
            steps{
                sh 'cd server && docker build -t galdevops/biu12_red_backend .'
            }
        }
        stage('build frontend'){
            steps{
                sh 'cd frontend && docker build -t galdevops/biu12_red_frontend .'
            }
        }
        stage('Login dockerhub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push backend to dockerhub') {
            steps {
                sh 'docker push galdevops/biu12_red_backend'
            }
        }
        stage('Push frontend to dockerhub') {
            steps {
                sh 'docker push galdevops/biu12_red_frontend'
            }
        }
        stage('test'){
            steps{
                sh 'cd frontend/src'
            }
        }
        stage('build image'){
            steps{
                sh 'ls'
            }
        }
        stage('post'){
            steps{
                sh 'echo post'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}