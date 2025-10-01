terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.6.0"
    }
  }
}

variable "github_token" {
  description = "GitHub API token for managing the repository"
  sensitive   = true
}

provider "github" {
  token = var.github_token
}
