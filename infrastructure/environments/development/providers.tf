terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.53.1"
    }
  }
}

variable "hcloud_token" {
  description = "Hetzner API token"
  sensitive   = true
}

provider "hcloud" {
  token = var.hcloud_token
}
