variable "aws_region" {
  description = "AWS region to deploy resources"
  type = string
  default = "us-east-1"
}

variable "aws_cidr"{
  description = "CIDR block for vpc"
  type = string
  default = "10.0.0.0/16"
}

variable "tags" {
  description = "Global tags to apply to all resource"
  type = map(string)
  default = {
    terraform = true
  }
}

variable "enviroment_name" {
  description = "Enviroment name used in tags and all resources"
  type = string
  default = "dev"
}

variable "subnet_newbits" {
  description = "Number of new bits to add to VPC cidr to generate subnet"
  type = number
  default = 8
}