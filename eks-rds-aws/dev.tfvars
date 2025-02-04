aws_region          = "us-east-1"
vpc_cidr            = "10.0.0.0/16"
private_subnets     = ["10.0.0.0/19", "10.0.32.0/19"]
public_subnets      = ["10.0.64.0/19"]
eks_cluster_name    = "dev-eks-cluster"
s3_buckets          = ["dev-air-test-eks-123456", "dev-air-test-eks-1234567"]
ecr_repository_name = "dev-ecr-repo"

# RDS Variables
rds_password       = "SecurePassword123!"

