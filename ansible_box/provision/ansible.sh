#!/bin/bash

sudo sed -i '/PasswordAuthentication no/c\PasswordAuthentication yes' /etc/ssh/sshd_config
sudo systemctl restart sshd
sudo apt update -y
sudo cat ~/inventory.ini
