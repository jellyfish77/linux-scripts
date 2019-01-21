#!/bin/bash

# Run with:
# ./ ./install-linux-perf-tools.sh 2>&1 | tee ~/logs/install-linux-perf-tools.log
sudo apt update -y
sudo apt install dstat -y
sudo apt install sysstat -y
sudo apt install iotop -y
sudo apt install blktrace -y
sudo apt install net-tools -y
sudo apt install nicstat -y
sudo apt install tiptop -y
sudo apt install htop -y

# doesn't work:
#sudo apt install linux-tools-common 
#sudo apt install linux-tools-4.15.0-34-generic
