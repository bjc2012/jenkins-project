# Variables.tf configuration

variable "vpc" {
  description         = "The Default VPC of EC2"
  type                = string
  default             = "vpc-0508cfb8601d09e79"
}

variable "ami" {
  description         = "AMI ID for EC2 Instance"
  type                = string
  default             = "ami-0d925fac3dbba7ca2"
}

variable "instance" {
  description         = "EC2 Instance Type"
  type                = string
  default             = "t2.micro"
}

variable "ec2_user_data" {
  description        = "Jenkins EC2 User Data"
  type               = string
  default            = <<-EOF
  
  #!/bin/bash
  
  sudo yum update -y
  sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
  sudo yum upgrade
  sudo amazon-linux-extras install java-openjdk11 -y
  sudo yum install -y jenkins
  sudo systemctl enable jenkins
  sudo systemctl start jenkins
  EOF
}
