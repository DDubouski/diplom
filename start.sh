#!/bin/bash

yes | sudo apt update
## yes | sudo apt install default-jdk

## Install JAVA and Jenkins + stard
yes | sudo apt install openjdk-8-jre
yes | wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg
yes | sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
yes | sudo apt update
yes | sudo apt install jenkins
yes | sudo service jenkins start
yes | systemctl start jenkins

## Install Docker
yes | sudo apt update
yes | sudo apt install apt-transport-https ca-certificates curl software-properties-common
yes | curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
yes | sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
yes | sudo apt update
yes | apt-cache policy docker-ce
yes | sudo apt install docker-ce
sudo chmod 666 /var/run/docker.sock