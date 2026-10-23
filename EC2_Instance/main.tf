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
  profile = "terraform-practice"
}

resource "aws_instance" "firstproject" {
  ami = var.ami_id_value
  instance_type = var.instance_type_value
  subnet_id = var.subnet_id_value
  key_name = var.key_name
}

output "public_id" {
  value = aws_instance.firstproject.public_ip
}
