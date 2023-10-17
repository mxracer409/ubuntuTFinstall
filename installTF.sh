#!/bin/bash
#simple bash startup script to install openssh, allow ssh through FW and install terraform. 

apt-get --assume-yes update
apt-get --assume-yes upgrade -y

apt-get --assume-yes install openssh-server -y

ufw allow ssh
ufw enable 

apt-get --assume-yes install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

reset

gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

apt-get update

apt-get --assume-yes install terraform

terraform --version 
