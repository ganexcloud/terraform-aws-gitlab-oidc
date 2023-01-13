data "tls_certificate" "gitlab" {
  url = var.tls_certificate_url
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"
    condition {
      test     = "StringLike"
      values   = var.repositories
      variable = "${local.openid_provider_url}:sub"
    }
    principals {
      identifiers = [local.openid_provider_arn]
      type        = "Federated"
    }
  }
}
