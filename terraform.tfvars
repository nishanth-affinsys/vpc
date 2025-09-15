# AWS Configuration
aws_region = "us-east-1"

# Project Configuration
environment  = "dev"
project_name = "eks-demo"

# VPC Configuration
vpc_name = "eks-vpc"
vpc_cidr = "10.0.0.0/16"

# Availability Zones
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

# Subnet Configuration
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

# NAT Gateway Configuration
enable_nat_gateway = true
single_nat_gateway = true

# EKS Configuration
cluster_name    = "my-eks-cluster"
cluster_version = "1.29"

# EKS Endpoint Configuration
cluster_endpoint_public_access  = true
cluster_endpoint_private_access = true

# EKS Node Group Configuration
node_group_instance_types = ["t3.medium"]
node_group_desired_size   = 2
node_group_min_size       = 1
node_group_max_size       = 3

# Common Tags
common_tags = {
  Environment = "dev"
  Project     = "eks-demo"
  ManagedBy   = "Terraform"
}
