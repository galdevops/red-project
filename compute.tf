# Create a rnd, for version tag
resource "random_id" "mtc_mode_id" {
  byte_length = 2
  count = var.main_instance_count
}


# Create a key pair for ssh connection
# resource "aws_key_pair" "mtc_auth" {
#     key_name = var.key_name
#     public_key = var.public_key_pair
# }


# Create a ami profile
data "aws_ami" "server_ami" {
    most_recent = true
    owners = ["099720109477"]
    
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }
}


# Create an instance
resource "aws_instance" "mtc_main" {
    count = var.main_instance_count
    instance_type = var.main_instance_type
    ami = data.aws_ami.server_ami.id
    # ami = "ami-06ca3ca175f37dd66"
    key_name = "test_tf"
    vpc_security_group_ids = [aws_security_group.sgrp.id]
    subnet_id = aws_subnet.mtc_public_subnet[count.index].id
    # user_data = templatefile("./main_userdata.tpl", {new_hostname="mtc_main_gal-${random_id.mtc_mode_id[count.index].dec}"})
    root_block_device {
        volume_size = var.main_vol_size
    }
    
    
    tags = {
        Name = "mtc_main_gal-${random_id.mtc_mode_id[count.index].dec}"
    }
    
    lifecycle {
        create_before_destroy = true
    }
    
    
    provisioner "local-exec" {
        command = "printf '\n${self.public_ip}' >> aws_hosts"
        # && aws ec2 wait instance-status-ok --instance-ids ${self.id} --region us-east-1"
    }
    
    provisioner "local-exec" {
        when = destroy
        command = "sed -i '/^[0-9]/d' aws_hosts" #remove line that begin with numbers from file aws_hosts
    }
}

# Create a command to run via ssh connection to instance
# resource "null_resource" "file_update" {
#     count = var.main_instance_count
#     provisioner "remote-exec" {
#         inline = ["echo 'I updated grafana' >> upgrade.log"]
#         # inline = ["sudo apt upgrade -y grafana && touch upgrade.log && echo 'I updated grafana' >> upgrade.log"]
#     }
    
#     connection {
#         type="ssh"
#         user="root"
#         private_key = file("transiblekg")
#         host = aws_instance.mtc_main[count.index].public_ip
#     }
# }



# resource "null_resource" "bootstrap_instance" {
#     depends_on = [aws_instance.mtc_main]
#     provisioner "local-exec" {
#         command = "ansible-playbook -i aws_hosts --key-file /home/ubuntu/.ssh/bootstrap_key playbooks/bootstrap.yml"
#     }
# }


output "grafana_access" {
    value = {for i in aws_instance.mtc_main[*] : i.tags.Name => "${i.public_ip}:3000"}
}

output "prometheus_access" {
    value = {for i in aws_instance.mtc_main[*] : i.tags.Name => "${i.public_ip}:9090"}
}
