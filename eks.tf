module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.24.1"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Cluster endpoint configuration
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access
  cluster_endpoint_private_access = var.cluster_endpoint_private_access

  # EKS Managed Node Groups
  eks_managed_node_groups = {
    default = {
      instance_types = var.node_group_instance_types
      
      desired_size = var.node_group_desired_size
      min_size     = var.node_group_min_size
      max_size     = var.node_group_max_size

      # Node group configuration
      ami_type       = "AL2_x86_64"
      capacity_type  = "ON_DEMAND"
      disk_size      = 20

      # Taints and labels can be added here if needed
      labels = {
        Environment = var.environment
        NodeGroup   = "default"
      }

      tags = merge(var.common_tags, {
        Name = "${var.cluster_name}-node-group"
      })
    }
  }

  # Cluster tags
  tags = merge(var.common_tags, {
    Name = var.cluster_name
  })
}
