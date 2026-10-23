variable "ami_id_value" {
  description = "Pass ami id for EC2"
  type = string
}

variable "instance_type_value" {
  description = "Pass instance type value for EC2"
  type = string
}

variable "subnet_id_value" {
  description = "Pass subnet id value for EC2"
  type = string
}

variable "key_name" {
  description = "Give key pair value to for EC2 access"
  type = string
}
