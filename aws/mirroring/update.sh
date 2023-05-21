#!/bin/bash -e

export WHOAMI=metlo

echo "UPDATING"
sudo curl -L https://metlo-releases.s3.us-west-2.amazonaws.com/metlo_agent_linux_amd64_latest > /usr/local/bin/metlo-agent
sudo curl -L https://raw.githubusercontent.com/metlo-labs/metlo-deploy/main/aws/mirroring/metlo-traffic-mirror.service > /home/$WHOAMI/metlo/metlo-traffic-mirror.service
sudo cp /home/$WHOAMI/metlo/metlo-agent /usr/local/bin
sudo mv /home/$WHOAMI/metlo/metlo-traffic-mirror.service /lib/systemd/system/metlo-traffic-mirror.service -f
sudo chmod +x /usr/local/bin/metlo-agent
