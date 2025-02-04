output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.subnets.private_subnet_ids
}

output "public_subnet_ids" {
  value = module.subnets.public_subnet_ids
}

output "security_group_id" {
  value = module.vpc.security_group_id
}

output "eks_cluster_name" {
  value = module.eks.eks_cluster_name
}

output "s3_bucket_names" {
  value = module.s3.s3_buckets
}

output "ecr_repository_name" {
  value = module.ecr.ecr_repository_name
}
output "rds_endpoint" {
  value       = module.rds.rds_endpoint
  description = "RDS MySQL endpoint"
}

