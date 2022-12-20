#!/bin/bash

yes | sudo apt update

## Install Docker
yes | sudo apt install openjdk-11-jdk-headless
yes | sudo apt update
yes | sudo apt update
yes | sudo apt install net-tools
yes | sudo apt-get install gnupg
yes | sudo apt-get install ca-certificates
yes | sudo apt-get install lsb-release
yes | sudo apt install apt-transport-https ca-certificates curl software-properties-common
yes | curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
yes | sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
yes | sudo apt-get update
yes | sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
yes | sudo apt update
yes | sudo apt  install docker-compose
yes | apt-cache policy docker-ce
sudo chmod 666 /var/run/docker.sock
yes | git clone https://github.com/DDubouski/Monitoring.git
cd Monitoring
yes | docker-compose up -d

# Opening the Firewall
yes | sudo ufw allow 8080
yes | sudo ufw allow 80
yes | sudo ufw allow OpenSSH
yes | sudo ufw allow 9000
yes | sudo ufw allow 9093
yes | sudo ufw allow 9090
yes | sudo ufw allow 3000
yes | sudo ufw enable

yes | sudo touch /etc/prometheus/prometheus.yml
sudo chmod 777 /etc/prometheus/prometheus.yml
sudo echo "global:
  scrape_interval: 15s
scrape_configs:
  - job_name: 'prometheus'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9090']" > 123.txt