resource "aws_acm_certificate" "letsencrypt_cert" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
  subject_alternative_names = var.subject_alternative_names

  tags = {
    Name        = var.domain_name
    Environment = var.environment
  }
}


resource "aws_route53_record" "validation_record" {
  for_each = { for d in aws_acm_certificate.letsencrypt_cert.domain_validation_options : d.domain_name => d }

  zone_id = var.route53_zone_id
  name    = each.value.resource_record_name
  type    = each.value.resource_record_type
  records = [each.value.resource_record_value]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "letsencrypt_validation" {
  certificate_arn         = aws_acm_certificate.letsencrypt_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.validation_record : record.fqdn]
}
