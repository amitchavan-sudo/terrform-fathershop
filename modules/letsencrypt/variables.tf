variable "region" {
  description = "AWS region for ACM and Route 53"
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "amitchavan.live"
  type        = string
}

variable "subject_alternative_names" {
  description = "Optional subject alternative names (SANs) for the SSL certificate"
  type        = list(string)
  default     = []
}

variable "route53_zone_id" {
  description = "Z09031441ZMD1VOLPR429"
  type        = string
}

variable "environment" {
  description = "dev"
  type        = string
}
