pipeline {
    agent any
    stages {
        stage ('checkout') {
            steps{
                checkout scmGit(branches: [[name: '*/gal_y']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/galdevops/red-project/']])
            }
        }
        stage('build'){
            steps{
                sh 'echo build'
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