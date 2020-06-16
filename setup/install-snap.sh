#!/bin/bash

sudo apt update -y
sudo apt install snap
sudo apt install snapd
sudo snap install snap-store

# Clean up unrequired packages
sudo apt autoremove -y
