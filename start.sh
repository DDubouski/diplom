#!/bin/bash

yes | sudo apt update
## yes | sudo apt install default-jdk

## Install JAVA and Jenkins + stard
yes | sudo apt install openjdk-11-jdk-headless
yes | sudo apt update
yes | sudo apt update
yes | wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
yes | sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
yes | sudo apt update
yes | sudo apt install jenkins
yes | sudo service jenkins start

# Opening the Firewall
yes | sudo ufw allow 8080
yes | sudo ufw allow 80
yes | sudo ufw allow OpenSSH
yes | sudo ufw enable


## Install Docker
yes | sudo apt update
yes | sudo apt install apt-transport-https ca-certificates curl software-properties-common
yes | curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
yes | sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
yes | sudo apt update
yes | apt-cache policy docker-ce
yes | sudo apt install docker-ce
sudo chmod 666 /var/run/docker.sock

## 

# grep 'текст_который_нужно_искать' -P -R -I -l  * | xargs sed -i 's/текст_который_нужно_искать/текст_который_нужно_заменить/g'
cd /var/lib/jenkins
sed -i 's/<label></label>/<label>master</label>/' config.xml

#add Jenkins' user role of sudo
sudo sh -c "echo ‘jenkins ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers"