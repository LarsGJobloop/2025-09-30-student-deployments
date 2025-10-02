#!/bin/bash
set -e

REPO_DIR="/srv/gitops/repo"
COMPOSE_FILE="$REPO_DIR/${compose_path}"

if [ ! -d "$REPO_DIR/.git" ]; then
    echo "[INFO] Initial clone of repo..."
    git clone --branch "${branch}" "${git_remote}" "$REPO_DIR"
else
    echo "[INFO] Syncing with remote repo..."
    git -C "$REPO_DIR" fetch origin "${branch}"
    git -C "$REPO_DIR" reset --hard "origin/${branch}"
    git -C "$REPO_DIR" clean -fd
fi

docker compose --file "$COMPOSE_FILE" pull
docker compose --file "$COMPOSE_FILE" up --detach --remove-orphans