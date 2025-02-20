variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "wordpress-vpc"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = [
    "10.0.1.0/24", # Public Subnet 1
    "10.0.2.0/24"  # Public Subnet 2
  ]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = [
    "10.0.3.0/24", # Private Subnet 1
    "10.0.4.0/24"  # Private Subnet 2
  ]
}

