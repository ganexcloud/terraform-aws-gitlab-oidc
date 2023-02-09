output "oidc_provider_arn" {
  description = "OIDC provider ARN"
  value       = try(aws_iam_openid_connect_provider.this[0].arn, "")
}

output "oidc_provider_url" {
  description = "OIDC provider URL"
  value       = try(aws_iam_openid_connect_provider.this[0].url, "")
}

output "oidc_role" {
  description = "IAM role."
  value       = try(aws_iam_role.this[0].arn, "")
}

output "thumbprint" {
  description = "TLS endpoint certificate SHA1 Fingerprint"
  value       = data.tls_certificate.gitlab.certificates[0].sha1_fingerprint
}

output "iam_role_arn" {
  description = "IAM role ARN."
  value       = try(aws_iam_role.this[0].arn, "")
}
