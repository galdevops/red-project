pipeline {
    agent any
    environment {
        TF_IN_AUTOMATION = 'true'
        TF_CLI_CONFIG_FILE = credentials('tfcloudcreds')
        ACCESS_KEY = credentials('aws-access')
        SECRET_KEY = credentials('aws-sec')
        KEY_PAIR = credentials('jenkey')
    }
    stages {
        stage('TF INIT'){
            steps{
                sh 'terraform init -no-color'
            }
        }
        stage('TF PLAN'){
            steps{
                sh "terraform plan -no-color -var 'access_key=${env.ACCESS_KEY}' -var 'secret_key=${env.SECRET_KEY}' -var 'public_key_pair=${env.KEY_PAIR}'"
            }
        }
    }
}