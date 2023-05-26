#!/bin/bash

sudo apt -y update
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
sudo python3 --version
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/ansible.list
sudo apt update -y 
sudo apt install ansible -y
sudo ansible --version

# sudo sudo apt install openssh-server -y 
# sudo systemctl enable --now ssh
# sudo systemctl status ssh

