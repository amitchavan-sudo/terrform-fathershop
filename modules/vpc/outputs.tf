# Output VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

# Output Public Subnets
output "public_subnets" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public[*].id
}

# Output Private Subnets
output "private_subnets" {
  description = "List of private subnet IDs"
  value       = aws_subnet.private[*].id
}

