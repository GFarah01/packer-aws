#!/bin/bash

sudo yum install -y git
sudo yum install -y ansible-core

sudo yum install -y epel-release


#!/bin/bash

# Install common packages
sudo yum install -y  python3-pip\
    htop \
    jq \
    curl \
    nmon \
    vim \
    telnet \
    nmap \
    iputils \
    dos2unix \
    snapd \
    net-tools \
    zip \
    wget \
    tcpdump

sudo pip3 install hvac


#install sudo packages 
sudo yum install -y sudo

#install ssh packages
sudo yum install -y openssh-server openssh-clients


# Install docker 
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker CE Stable, Edge, and Test packages
sudo yum install -y docker-ce-stable docker-ce-edge docker-ce-test

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# install fail2ban 
sudo yum install -y fail2ban

#install firewall
sudo yum install -y ufw

