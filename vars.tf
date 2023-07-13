variable "vpc_cidr" {
  type    = string
  default = "10.114.0.0/16"
}


variable "access_key" {
  type    = string
}


variable "secret_key" {
  type    = string
}



# set local machine ip for private secure access
variable "access_ip" {
  type    = string
  default = "0.0.0.0/0"
    
}


variable "cloud9_ip" {
  type    = string
  default = "18.206.203.122/32"
  
}


variable "hp_local_ip" {
  type    = string
  default = "62.0.133.161/32"
  
}


variable "main_instance_type" {
  type    = string
  default = "t2.micro"
    
}

variable "main_instance_count" {
  type    = number
  default = 1
}

variable "main_vol_size" {
  type    = number
  default = 8
    
}