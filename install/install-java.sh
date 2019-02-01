#!/bin/bash
#cd /opt/
#sudo mkdir java
#sudo tar -zxvf ~/Downloads/jdk-8u192-linux-x64.tar.gz
#sudo ln -s  jdk1.8.0_192 current
for file in /opt/java/current/bin/*
do
   if [ -x $file ]
   then
      filename=`basename $file`
      sudo update-alternatives --install /usr/bin/$filename $filename $file 20000
      sudo update-alternatives --set $filename $file
      #echo $file $filename
   fi
done