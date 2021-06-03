#!/bin/bash

# Install HAProxy-Lua-OAuth library
git clone https://github.com/haproxytech/haproxy-lua-oauth.git
cd haproxy-lua-oauth
chmod +x ./install.sh
sudo ./install.sh luaoauth

# Install HAProxy
sudo add-apt-repository ppa:vbernat/haproxy-1.9
sudo apt update
sudo apt install -y haproxy

sudo cp -rf /vagrant/haproxy/* /etc/haproxy/
sudo systemctl restart haproxy

# Install Docker
if [ ! $(which docker) ]; then
  sudo apt update
  sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt update
  sudo apt install -y docker-ce
  sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
else
  echo "docker already installed."
fi

# Start web app
cd /vagrant/web
docker-compose build
docker-compose up -d
