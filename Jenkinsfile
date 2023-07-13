pipeline {
    agent any
    environment {
        TF_IN_AUTOMATION = 'true'
        TF_CLI_CONFIG_FILE = credentials('tfcloudcreds')
        ACCESS_KEY = credentials('aws-access')
        SECRET_KEY = credentials('aws-sec')
    }
    stages {
        stage('TF INIT'){
            steps{
                sh 'terraform init -no-color'
            }
        }
        stage('TF PLAN'){
            steps{
                sh "terraform plan -no-color -var 'access_key=${env.ACCESS_KEY}' -var 'secret_key=${env.SECRET_KEY}'"
            }
        }
        stage('TF APPLY'){
            steps{
                sh "terraform apply -no-color -auto-approve -var 'access_key=${env.ACCESS_KEY}' -var 'secret_key=${env.SECRET_KEY}'"
            }
        }
        stage('EC2 Wait'){
            steps{
                sh "AWS_ACCESS_KEY_ID=${env.ACCESS_KEY} AWS_SECRET_ACCESS_KEY=${env.SECRET_KEY} aws ec2 wait instance-status-ok --region us-east-1"
            }
        }
        stage('Print IP'){
            steps{
                sh "cat aws_hosts"
            }
        }
        stage('Ansible Test'){
            steps{
                ansiblePlaybook(credentialsId: 'ec2-ssh', inventory: 'aws_hosts', playbook: 'playbooks/testans.yml')
            }
        }
        stage('TF DESTROY'){
            steps{
                sh "terraform destroy -no-color -auto-approve -var 'access_key=${env.ACCESS_KEY}' -var 'secret_key=${env.SECRET_KEY}'"
            }
        }
    }
}