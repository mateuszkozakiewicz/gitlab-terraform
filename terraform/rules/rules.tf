resource "gitlab_branch_protection" "master" {
  for_each = var.rule_1_projects

  project                      = each.value
  branch                       = "master"
  push_access_level            = "maintainer"
  merge_access_level           = "developer"
  code_owner_approval_required = false
}

resource "gitlab_branch_protection" "uat" {
  for_each = var.rule_1_projects

  project                      = each.value
  branch                       = "uat"
  push_access_level            = "maintainer"
  merge_access_level           = "developer"
  code_owner_approval_required = false
}

resource "gitlab_branch_protection" "stage" {
  for_each = var.rule_1_projects

  project                      = each.value
  branch                       = "stage"
  push_access_level            = "maintainer"
  merge_access_level           = "developer"
  code_owner_approval_required = false
}
