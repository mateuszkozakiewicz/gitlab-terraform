terraform {
  backend "local" {
    path = "terraform.tfstate"
  }

  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "3.8.0"
    }
  }
}

# Configure the GitLab Provider
provider "gitlab" {
  token    = var.gitlab_token
  base_url = var.gitlab_url
  insecure = true
}

module "projects" {
  source       = "./projects"
  gitlab_token = var.gitlab_token
  gitlab_url   = var.gitlab_url
}

module "rules" {
  source          = "./rules"
  rule_1_projects = module.projects.rule_1_projects
}
