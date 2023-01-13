<!-- BEGIN_TF_DOCS -->
# AWS Gitlab OIDC Provider Terraform Module

## Purpose
This module allows you to create a Gitlab OIDC provider for your AWS account, that will help Gitlab Actions to securely authenticate against the AWS API using an IAM role

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.63 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [tls_certificate.gitlab](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aud_value"></a> [aud\_value](#input\_aud\_value) | (Required) A list of client IDs (also known as audiences). When a mobile or web app registers with an OpenID Connect provider, they establish a value that identifies the application. (This is the value that's sent as the client\_id parameter on OAuth requests.) | `list(string)` | <pre>[<br>  "https://gitlab.com"<br>]</pre> | no |
| <a name="input_create_oidc_provider"></a> [create\_oidc\_provider](#input\_create\_oidc\_provider) | Whether or not to create the associated oidc provider. If false, variable 'oidc\_provider\_arn' is required | `bool` | `true` | no |
| <a name="input_create_oidc_role"></a> [create\_oidc\_role](#input\_create\_oidc\_role) | Whether or not to create the OIDC attached role | `bool` | `true` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Maximum session duration in seconds. | `number` | `3600` | no |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | If create\_oidc\_provider is false configure OpenID provider ARN. | `string` | `null` | no |
| <a name="input_oidc_provider_url"></a> [oidc\_provider\_url](#input\_oidc\_provider\_url) | If create\_oidc\_provider is false configure OpenID provider URL. | `string` | `null` | no |
| <a name="input_oidc_role_attach_policies"></a> [oidc\_role\_attach\_policies](#input\_oidc\_role\_attach\_policies) | Attach policies to OIDC role. | `list(string)` | `[]` | no |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | List of GitLab organization/repository names authorized to assume the role. | `list(string)` | `[]` | no |
| <a name="input_role_description"></a> [role\_description](#input\_role\_description) | (Optional) Description of the role. | `string` | `"Role assumed by the Gitlab OIDC provider."` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | (Optional, Forces new resource) Friendly name of the role. | `string` | `"gitlab-oidc-provider-aws"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |
| <a name="input_tls_certificate_url"></a> [tls\_certificate\_url](#input\_tls\_certificate\_url) | GitLab OpenID TLS certificate URL. The address of your GitLab instance, such as https://gitlab.com or http://gitlab.example.com. | `string` | `"https://gitlab.com/oauth/discovery/keys"` | no |
| <a name="input_url"></a> [url](#input\_url) | GitLab OpenID URL. The address of your GitLab instance, such as https://gitlab.com or http://gitlab.example.com. | `string` | `"https://gitlab.com"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oidc_provider_arn"></a> [oidc\_provider\_arn](#output\_oidc\_provider\_arn) | OIDC provider ARN |
| <a name="output_oidc_provider_url"></a> [oidc\_provider\_url](#output\_oidc\_provider\_url) | OIDC provider URL |
| <a name="output_oidc_role"></a> [oidc\_role](#output\_oidc\_role) | IAM role. |
| <a name="output_thumbprint"></a> [thumbprint](#output\_thumbprint) | TLS endpoint certificate SHA1 Fingerprint |
<!-- END_TF_DOCS -->