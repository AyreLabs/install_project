#!/bin/sh

#45.32.240.90

###############################################
# First change the password
###############################################
sudo apt-get update

###############################################
# Second change the password
###############################################
sudo ufw allow ssh
sudo ufw allow from 49.195.149.43
sudo ufw enable # inject Y

#
sudo apt-get install default-jdk # inject Y
sudo apt-get install default-jre

apt install npm # inject Y
npm install http-server -g

apt install nodejs-legacy

###############################################
# Second change the password
###############################################
git clone https://github.com/ayrelabs/Nautilus.git

###############################################
# Second change the password
###############################################
cd Nautilus/NautilusServer/screen_service_for_Nautilus
# write instructions here get them to accept instructions
./StartCommandProxyAndTerminalServiceForTerminalWithID.sh 0
#control-A, D
./StartCommandProxyAndTerminalServiceForTerminalWithID.sh 1
#control-A, D
./StartCommandProxyAndTerminalServiceForTerminalWithID.sh 2
#control-A, D

./screen -S NAUTILUS_SERVER
cd ../
./compileAndRun.sh
# ctr -a, d


./screen -S NAUTILUS_VR_WEB_SERVER
cd ../../NautilusVRClient
http-server ./ -p 80
#control-A, D


