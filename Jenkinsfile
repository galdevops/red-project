pipeline {
    agent any
    environment {
        SERVER_IP = "1"
        TF_IN_AUTOMATION = 'true'
        TF_CLI_CONFIG_FILE = credentials('tfcloudcreds')
        ACCESS_KEY = credentials('aws-access')
        SECRET_KEY = credentials('aws-sec')
    }
    stages {
        // stage('TF INIT'){
        //     steps{
        //         sh 'terraform init -no-color'
        //     }
        // }
        // stage('TF DESTROY_1'){
        //     steps{
        //         sh "terraform destroy -no-color -auto-approve -var 'access_key=${env.ACCESS_KEY}' -var 'secret_key=${env.SECRET_KEY}'"
        //     }
        // }
        // stage('TF PLAN'){
        //     steps{
        //         sh "terraform plan -no-color -var 'access_key=${env.ACCESS_KEY}' -var 'secret_key=${env.SECRET_KEY}'"
        //     }
        // }
        // stage('TF APPLY'){
        //     steps{
        //         sh "terraform apply -no-color -auto-approve -var 'access_key=${env.ACCESS_KEY}' -var 'secret_key=${env.SECRET_KEY}'"
        //     }
        // }
        // stage('EC2 Wait'){
        //     steps{
        //         sh "AWS_ACCESS_KEY_ID=${env.ACCESS_KEY} AWS_SECRET_ACCESS_KEY=${env.SECRET_KEY} aws ec2 wait instance-status-ok --region us-east-1"
        //     }
        // }
        stage('Update Server IP'){
            steps{
                echo "sed -n '2p' aws_hosts"
            }
        }
        stage("Test IP") {
            steps {
                echo "ip is '${SERVER_IP}'"
                
                script {
                    SERVER_IP = sh (
                            script: "sed -n '2p' aws_hosts",
                            returnStdout: true
                        ).trim()
                        echo "updated ip: ${SERVER_IP}"
                }
            }
        }
        
        // stage('Ansible User'){
        //     steps{
        //         sh "cat user.txt >> aws_hosts"
        //     }
        // }
        // stage('Inventory'){
        //     steps{
        //         sh "cat aws_hosts"
        //     }
        // }
        // stage('Ansible Test'){
        //     steps{
        //         ansiblePlaybook(credentialsId: 'ec2-ssh', inventory: 'aws_hosts', playbook: 'playbooks/dockerans.yml')
        //     }
        // }
        // stage('TF DESTROY'){
        //     steps{
        //         sh "terraform destroy -no-color -auto-approve -var 'access_key=${env.ACCESS_KEY}' -var 'secret_key=${env.SECRET_KEY}'"
        //     }
        // }
    }
}