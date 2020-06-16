#!/bin/bash

sudo apt install wireshark-qt
sudo dpkg-reconfigure wireshark-common
sudo usermod -a -G wireshark otto
cat /etc/group | grep "otto":
