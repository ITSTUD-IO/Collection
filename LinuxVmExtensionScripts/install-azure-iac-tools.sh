#!/bin/bash
sudo apt update
sudo apt install --yes unzip
wget https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip
unzip terraform_0.12.29_linux_amd64.zip
sudo mv terraform /usr/local/bin/
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash