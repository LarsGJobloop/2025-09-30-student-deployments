resource "hcloud_server" "compose_server" {
  name = var.name

  server_type = var.server_type

  image = "debian-12"

  ssh_keys = [ var.debug_key_id ]
}
