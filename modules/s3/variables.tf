variable "region" {
  description = "us-east-1"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "wordpress-media-bucket"
  type        = string
}

variable "acl" {
  description = "The access control list (ACL) for the S3 bucket"
  type        = string
  default     = "private"
}

variable "force_destroy" {
  description = "Whether to force destroy the bucket (deletes all objects in it)"
  type        = bool
  default     = false
}

variable "versioning_enabled" {
  description = "Enable versioning on the bucket"
  type        = bool
  default     = true
}

variable "environment" {
  description = "dev"
  type        = string
}

