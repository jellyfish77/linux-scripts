#!/bin/bash
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