#!/bin/bash

sudo sudo apt -y update && sudo apt -y upgrade
sudo sudo apt install openssh-server -y
sudo systemctl enable --now ssh
sudo systemctl status ssh

sudo apt install git -y
sudo apt install -y ansible-core