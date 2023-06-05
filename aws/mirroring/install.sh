#!/bin/bash -e

echo "ADDING METLO USER"
sudo useradd -m metlo
sudo usermod -aG sudo metlo
echo "metlo:metlo" | sudo chpasswd
export WHOAMI=metlo

echo "GETTING FILES"
mkdir -p /home/$WHOAMI/metlo
sudo curl -L https://metlo-releases.s3.us-west-2.amazonaws.com/metlo_agent_pcap_linux_amd64_latest > /usr/local/bin/metlo-agent
sudo curl -L https://raw.githubusercontent.com/metlo-labs/metlo-deploy/main/aws/mirroring/metlo-traffic-mirror.service > /home/$WHOAMI/metlo/metlo-traffic-mirror.service
sudo chmod +x /usr/local/bin/metlo-agent

INTERFACE=$(ip link | egrep "ens[0-9]*" -o -m 1 || true)
[ ! -z "$INTERFACE" ] || INTERFACE=$(ip link | egrep "eth[0-9]*" -o -m 1 || true)
echo "Placing packet capture on interface $INTERFACE"
echo "INTERFACE=$INTERFACE" | sudo tee -a /opt/metlo/credentials

echo "ADDING SERVICES"
echo "metlo" | sudo mv /home/$WHOAMI/metlo/metlo-traffic-mirror.service /lib/systemd/system/metlo-traffic-mirror.service -f

echo "STARTING SERVICES"
echo "metlo" | sudo systemctl daemon-reload
echo "metlo" | sudo systemctl enable metlo-traffic-mirror.service
echo "metlo" | sudo systemctl start metlo-traffic-mirror.service
