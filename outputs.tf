output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}
output "eks_cluster_name" {
  value = module.eks.eks_cluster_name
}


output "eks_cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
}
output "s3_bucket_name" {
  description = "The name of the S3 bucket for media storage"
  value       = module.s3.bucket_name
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket for media storage"
  value       = module.s3.bucket_arn
}
output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.rds.rds_endpoint
}
