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
                sh 'docker build . -t galdevops/biu12_red_backend -f server/Dockerfile'
            }
        }
        stage('build frontend'){
            steps{
                sh 'docker build . -t galdevops/biu12_red_frontend -f frontend/Dockerfile'
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
        post {
            always {
                sh 'docker logout'
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
}