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
                echo ls
            }
        }
        stage('test'){
            steps{
                sh 'cd backend'
            }
        }
        stage('build image'){
            steps{
                echo ls
            }
        }
        stage('post'){
            steps{
                sh 'echo post'
            }
        }
    }
}