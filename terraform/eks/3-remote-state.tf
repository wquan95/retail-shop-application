data "terraform_remote_state" "vpc" {
    backend = "s3"

    config = {
        bucket = var.s3_bucket_id
        key = "vpc/dev/terraform.tfstate"
        region = var.aws_region
    }
}
output "vpc_id" {
    value = data.terraform_remote_state.vpc.outputs.vpc_id
}

output "public_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.public_subnet_ids
}
output "private_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  description = "List of private subnet IDs"
}