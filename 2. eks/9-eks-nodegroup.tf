resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${local.name}-node-group"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = data.terraform_remote_state.vpc.outputs.private_subnet_ids

  disk_size = var.node_disk_size
  instance_types = var.node_instance_types
  capacity_type = var.node_capacity_type
  ami_type = "AL2023_x86_64_STANDARD"
  scaling_config {
    desired_size = 3
    max_size     = 6
    min_size     = 1
  }

  update_config {
    max_unavailable_percentage = 33
  }

  force_update_version = true
  
  labels = {
    "env"  = var.environment_name
    "team" = var.business_division
  }

  tags = merge(var.tags, {
    # Standard EC2 name tag
    Name = "${local.name}-private-ng"

    # Logical environment (e.g., dev, prod)
    Environment = var.environment_name
  })


  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.eks_ecr_policy,
  ]
}