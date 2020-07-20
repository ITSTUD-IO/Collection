#!/bin/bash
sudo apt update
sudo apt install --yes xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils
sudo apt install --yes xrdp
sudo adduser xrdp ssl-cert
sudo ufw allow 3389
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install --yes ./google-chrome-stable_current_amd64.deb