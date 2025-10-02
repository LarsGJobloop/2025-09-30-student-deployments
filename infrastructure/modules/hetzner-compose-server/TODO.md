# TODO!

Current stripping of the Hetzner base Debian-12 image is fragile, verbose and tedious, and utterly ridiculous.

The clear suggestion here is to move to an additative solution where we describe what we need, rather then trying to figure out what we don't.

Suggestion is to move over to something like NixOS flake based images, or one of the already hardened distroes.

## Requirements

- VCS mirror (Git): for reconciliation
- Container Runtime (Docker): for running Docker Compose stacks
- Secret Handler (SOPS): for decrypting secrets
- Cryptographic Handler (Age): for generating cryptographic identities (alternatives can be used)
- Exporter/Scraping endpoints (Promtail/Prometheus): for providing access to Logs and Metrics
- Webhooks/Timers: for triggering Garbage Collection tasks
