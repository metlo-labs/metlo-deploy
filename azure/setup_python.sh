#!/bin/bash -xve
pyenv install 3.8.15
pyenv global 3.8.15
sudo apt-get update
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt-get update
sudo apt-get install python3.8 -y
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
sudo apt-get remove --purge apt_pkg
sudo apt-get install python3-apt -y