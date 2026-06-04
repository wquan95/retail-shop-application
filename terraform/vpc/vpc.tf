module "vpc" {
    source = "./module/vpc"
    enviroment_name = var.enviroment_name
    aws_cidr = var.aws_cidr
    subnet_newbits = var.subnet_newbits
    tags = var.tags
}