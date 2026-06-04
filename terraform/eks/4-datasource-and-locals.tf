locals {
    owner = var.business_division
    environment = var.environment_name
    name = "${local.owner}-${local.environment}"
    eks_cluster_name = "${local.name}-${var.cluster_name}"
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
    public_subnet_ids = data.terraform_remote_state.vpc.outputs.public_subnet_ids
    private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
}