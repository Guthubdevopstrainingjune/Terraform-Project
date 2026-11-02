terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "terraform_sg" {
  name        = "terraform-project-sg"
  description = "Allow SSH from my public IP"
  vpc_id      = "vpc-0de2d0ae31e870931"

  ingress {
    description = "SSH from my public IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["49.43.201.183/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraform-Project-SG"
  }
}

resource "aws_instance" "firstproject" {
  ami           = var.ami_id_value
  instance_type = var.instance_type_value
  subnet_id     = var.subnet_id_value
  key_name      = var.key_name

  vpc_security_group_ids = [
    aws_security_group.terraform_sg.id
  ]

  associate_public_ip_address = true

  tags = {
    Name        = "Terraform-Project-EC2"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }

}

output "public_id" {
  value = aws_instance.firstproject.public_ip
}
