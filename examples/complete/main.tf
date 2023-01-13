provider "aws" {
  region = "us-east-1"
}

# OIDC + Iam Role
module "gitlab_oidc_full" {
  source                    = "../../"
  create_oidc_provider      = true
  create_oidc_role          = true
  role_name                 = "terraform"
  url                       = "https://gitlab.com"
  aud_value                 = ["https://gitlab.com"]
  repositories              = ["project_path:ganex/*:ref_type:branch:ref:master"]
  oidc_role_attach_policies = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}

# Only OIDC Provider
module "gitlab_oidc" {
  source                    = "../../"
  create_oidc_provider      = true
  create_oidc_role          = false
  role_name                 = "terraform"
  url                       = "https://gitlab.com"
  aud_value                 = ["https://gitlab.com"]
  repositories              = ["project_path:ganex/*:ref_type:branch:ref:master"]
  oidc_role_attach_policies = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}

# Only iam role
module "gitlab_oidc_terraform" {
  source                    = "../../"
  create_oidc_provider      = false
  create_oidc_role          = true
  oidc_provider_url         = module.gitlab_oidc.oidc_provider_url
  oidc_provider_arn         = module.gitlab_oidc.oidc_provider_arn
  role_name                 = "terraform"
  url                       = "https://gitlab.com"
  aud_value                 = ["https://gitlab.com"]
  repositories              = ["project_path:ganex/*:ref_type:branch:ref:main"]
  oidc_role_attach_policies = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}
