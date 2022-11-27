#!/usr/bin/env bash

command_present() {
  type "$1" >/dev/null 2>&1
}

if command_present metlo-deploy; then
  echo "metlo-deploy command already exists..."
  exit 0
fi

export LICENSE_KEY=<YOUR_LICENSE_KEY>
wget https://raw.githubusercontent.com/metlo-labs/metlo-deploy/main/deploy.sh
chmod +x deploy.sh
sudo -E ./deploy.sh
