#!/usr/bin/env bash
sudo apt update -y
sudo apt install wget -yum
wget https://raw.githubusercontent.com/metlo-labs/metlo-deploy/azure_enterprise_deployment/azure/delete_python.sh
wget https://raw.githubusercontent.com/metlo-labs/metlo-deploy/azure_enterprise_deployment/azure/setup_python.sh
wget https://raw.githubusercontent.com/metlo-labs/metlo-deploy/main/deploy.sh
sudo -E ./delete_python.sh
sudo -E ./setup_python.sh
sudo -E ./deploy.sh