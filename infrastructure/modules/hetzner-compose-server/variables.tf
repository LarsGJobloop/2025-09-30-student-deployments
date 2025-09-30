variable "name" {
  description = "Name for the server."
  type = string
  sensitive = false
}

variable "git_source" {
  description = "The source Git repository for the configuration."
  type = string
  sensitive = false
}

variable "branch" {
  description = "The branch to use."
  type = string
  sensitive = false
}

variable "manifest_path" {
  description = "The path to the manifest from the root of the repository."
  type = string
  sensitive = false
}

variable "reconciliation_interval" {
  description = "The interval to reconcile at."
  type = string
  sensitive = false
}

variable "server_type" {
  description = "Hetzner server SKU."
  type = string
  sensitive = false
}

variable "debug_key_id" {
  description = "FOR DEBUG! ID of SSH key uploaded to Hetzner."
  type = string
  sensitive = false
}
