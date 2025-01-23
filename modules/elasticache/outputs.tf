output "elasticache_endpoint" {
  description = "The primary endpoint of the Elasticache cluster"
  value       = aws_elasticache_cluster.elasticache_cluster.cache_nodes[0].address
}

output "elasticache_port" {
  description = "The port for the Elasticache cluster"
  value       = aws_elasticache_cluster.elasticache_cluster.port
}

output "elasticache_cluster_id" {
  description = "The cluster ID of the Elasticache instance"
  value       = aws_elasticache_cluster.elasticache_cluster.id
}

output "elasticache_security_group_id" {
  description = "The security group ID created for Elasticache"
  value       = aws_security_group.elasticache_sg.id
}

