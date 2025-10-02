resource "github_repository" "github_repository" {
  name        = "2025-09-30-student-deployments"
  description = "Deployment configuration and manifest description of student infrastructure."

  visibility = "public"

  # Configure features
  has_issues = true
}

output "github_repository_address" {
  description = "Address to the GitHub repository."
  value       = github_repository.github_repository.http_clone_url
}
