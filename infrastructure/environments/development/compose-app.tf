resource "hcloud_ssh_key" "debug_key" {
  name       = "debug_key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMcjUpCUBeS4utOWaHwMXkJYMaTRYEnXFnGTPnA3Hp87"
}

module "compose_server" {
  source = "../../modules/hetzner-compose-server"
  name   = "compose-server"

  reconciliation_interval = "1min"
  git_source              = "https://github.com/LarsGJobloop/2025-09-30-student-deployments.git"
  branch                  = "main"
  manifest_path           = "manifests/deployments/development/compose.yaml"

  server_type = "cax21"    # Hetzner SKU -> arch=x86, cores=4vCPU, ram=8GB, hdd=80GB
  datacenter  = "hel1-dc2" # Helsinki

  debug_key_id = hcloud_ssh_key.debug_key.id # TODO! Remove once complete
}

# TODO! Clean this up
output "compose_server" {
  description = "Application stack information"
  value       = module.compose_server.compose_server
}
