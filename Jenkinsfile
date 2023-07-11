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
        stage('build'){
            steps{
                sh 'ls'
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