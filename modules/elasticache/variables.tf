variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "wordpress-memcached-cluster"
  type        = string
}

variable "node_type" {
  description = "The instance type for the Elasticache nodes"
  type        = string
  default     = "cache.t3.micro"
}

variable "num_cache_nodes" {
  description = "Number of cache nodes in the cluster"
  type        = number
  default     = 1
}

variable "parameter_group_name" {
  description = "The name of the parameter group to associate with this cluster"
  type        = string
  default     = "default.memcached1.6"
}

variable "port" {
  description = "Port for Elasticache Memcached"
  type        = number
  default     = 11211
}

variable "subnet_ids" {
  description = "module.vpc.private_subnets"
  type        = list(string)
}

variable "vpc_id" {
  description = "module.vpc.vpc_id"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to access the Elasticache cluster"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "environment" {
  description = "dev"
  type        = string
}

