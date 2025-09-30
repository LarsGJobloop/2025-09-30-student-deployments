locals {
  reconciliation_script = templatefile("${path.module}/reconciliation-script.sh", {
    git_remote   = var.git_source
    branch       = var.branch
    compose_path = var.manifest_path
  })

  cloud_init = templatefile("${path.module}/cloud-init.yaml", {
    boot_delay                     = "2min"
    reconciliation_intervall       = var.reconciliation_interval
    # Mind the indentation here, as we are stiching this together manually (and hacky)
    indented_reconciliation_script = indent(6, local.reconciliation_script)
  })
}

resource "hcloud_server" "compose_server" {
  name = var.name

  server_type = var.server_type
  datacenter = var.datacenter

  image = "debian-12"

  user_data = local.cloud_init

  # TODO! Make this optional, or dissallow fully
  ssh_keys = [ var.debug_key_id ]

  labels = {
    type = "compose-server"
    interval = var.reconciliation_interval
  }
}
