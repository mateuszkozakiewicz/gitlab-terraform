resource "gitlab_project" "sample_group_project" {
  name                             = "example"
  namespace_id                     = gitlab_group.sample_group.id
  request_access_enabled           = false
  default_branch                   = "develop"
  remove_source_branch_after_merge = true
  initialize_with_readme           = true

  lifecycle {
    prevent_destroy = true
  }
  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command     = <<-EOT
      curl -H 'PRIVATE-TOKEN: ${var.gitlab_token}' -X POST '${var.gitlab_url}projects/${self.id}/repository/branches?branch=stage&ref=${self.default_branch}'
      curl -H 'PRIVATE-TOKEN: ${var.gitlab_token}' -X POST '${var.gitlab_url}projects/${self.id}/repository/branches?branch=uat&ref=${self.default_branch}'
      curl -H 'PRIVATE-TOKEN: ${var.gitlab_token}' -X POST '${var.gitlab_url}projects/${self.id}/repository/branches?branch=master&ref=${self.default_branch}'
    EOT
  }
}
