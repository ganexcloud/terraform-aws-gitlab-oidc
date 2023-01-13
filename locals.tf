locals {
  openid_provider_url = var.create_oidc_provider == true ? join("", aws_iam_openid_connect_provider.this.*.url) : var.oidc_provider_url
  openid_provider_arn = var.create_oidc_provider == true ? join("", aws_iam_openid_connect_provider.this.*.arn) : var.oidc_provider_arn
}
