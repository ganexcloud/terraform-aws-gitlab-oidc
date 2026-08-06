locals {
  openid_provider_url = var.create_oidc_provider == true ? aws_iam_openid_connect_provider.this[0].url : var.oidc_provider_url
  openid_provider_arn = var.create_oidc_provider == true ? aws_iam_openid_connect_provider.this[0].arn : var.oidc_provider_arn
}
