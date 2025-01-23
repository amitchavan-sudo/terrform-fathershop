variable "db_instance_identifier" {
  description = "wordpress-db"
  type        = string
}

variable "vpc_id" {
  description = "module.vpc.vpc_id"
  type        = string
}

variable "subnet_ids" {
  description = "module.vpc.private_subnets"
  type        = list(string)
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to access the RDS instance"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "db_name" {
  description = "wordpress"
  type        = string
}

variable "db_username" {
  description = "admin"
  type        = string
}

variable "db_password" {
  description = "admin@1234"
  type        = string
  sensitive   = true
}

variable "db_port" {
  description = "The port for the RDS database"
  type        = number
  default     = 3306
}

# Instance Configuration
variable "engine" {
  description = "The database engine to use (e.g., mysql, postgres)"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "8.0.28"
}

variable "instance_class" {
  description = "The instance class for the RDS instance (e.g., db.t3.micro)"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "The amount of allocated storage (in GB)"
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "The maximum amount of allocated storage (in GB)"
  type        = number
  default     = 100
}

# Backup Configuration
variable "backup_retention_period" {
  description = "The number of days to retain backups"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "The preferred backup window"
  type        = string
  default     = "01:00-02:00"
}

# Maintenance Configuration
variable "maintenance_window" {
  description = "The preferred maintenance window"
  type        = string
  default     = "sun:05:00-sun:06:00"
}

variable "apply_immediately" {
  description = "Whether to apply changes immediately"
  type        = bool
  default     = false
}

# Encryption
variable "storage_encrypted" {
  description = "Whether to enable storage encryption"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "The KMS key ID for encryption"
  type        = string
  default     = null
}


variable "multi_az" {
  description = "Enable Multi-AZ deployment"
  type        = bool
  default     = true
}


variable "deletion_protection" {
  description = "Enable deletion protection for the RDS instance"
  type        = bool
  default     = true
}


variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
}

