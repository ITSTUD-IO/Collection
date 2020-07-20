#!/bin/bash
sudo apt update
sudo apt install --Yes xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils
sudo apt install --Yes xrdp
sudo adduser xrdp ssl-cert
sudo ufw allow 3389