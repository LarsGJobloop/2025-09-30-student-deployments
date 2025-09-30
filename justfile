default:
    @just --list

# Ensure Development infrastructure is correct
dev-infra-apply:
    sops exec-env \
        infrastructure/environments/development/secrets.yaml \
        "tofu -chdir=infrastructure/environments/development apply"

# Destroy Development infrastructure
dev-infra-destroy:
    sops exec-env \
        infrastructure/environments/development/secrets.yaml \
        "tofu -chdir=infrastructure/environments/development destroy"

# Output current state
dev-infra-output:
    tofu -chdir=infrastructure/environments/development output
