output "certificate_arn" {
  description = "The ARN of the ACM certificate"
  value       = aws_acm_certificate.letsencrypt_cert.arn
}

output "validation_records" {
  description = "The DNS validation records created for the ACM certificate"
  value       = { for record in aws_route53_record.validation_record : record.name => record.fqdn }
}

output "certificate_status" {
  description = "The status of the ACM certificate"
  value       = aws_acm_certificate.letsencrypt_cert.status
}

