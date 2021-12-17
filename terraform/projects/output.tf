locals {
  rule_1_projects = {
    sample_group_project = gitlab_project.sample_group_project.id
  }
}

output "rule_1_projects" {
  value = local.rule_1_projects
}
