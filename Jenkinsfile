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
                echo 'ls'
            }
        }
        stage('test'){
            steps{
                sh 'echo test'
            }
        }
        stage('build image'){
            steps{
                sh 'echo image'
            }
        }
        stage('post'){
            steps{
                sh 'echo post'
            }
        }
    }
}