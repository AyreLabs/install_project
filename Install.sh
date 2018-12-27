#!/bin/sh

#45.32.240.90

###############################################
# First change the password
###############################################
sudo apt-get update

###############################################
# Second change the password
###############################################

echo "Firewall installation..."
sudo ufw allow ssh
read -p "Enter your KeyboardClient IP address: " keyboard_client_ip_address
sudo ufw allow from $keyboard_client_ip_address
read -p "Enter your VR Client IP address: " vr_client_ip_address
sudo ufw allow from $vr_client_ip_address
echo "Y" | sudo ufw enable

echo "Java environment installation..."
echo "Y" | sudo apt-get install default-jdk
sudo apt-get install default-jre

echo "NPM installation..."
echo "Y" | apt install npm
npm install http-server -g
apt install nodejs-legacy

###############################################
# Second change the password
###############################################
echo "Nautilus installation..."
cd ~
if [ ! -d "Nautilus" ]; then 
    git clone https://github.com/ayrelabs/Nautilus.git
fi
###############################################
# Second change the password
###############################################
echo "Nautilus runtime setup..."
cd Nautilus/NautilusServer/screen_service_for_Nautilus
# write instructions here get them to accept instructions
./StartCommandProxyAndTerminalServiceForTerminalWithID.sh 0
#control-A, D
./StartCommandProxyAndTerminalServiceForTerminalWithID.sh 1
#control-A, D
./StartCommandProxyAndTerminalServiceForTerminalWithID.sh 2
#control-A, D

./screen -S NAUTILUS_SERVER -d -m ./../compileAndRun.sh
#cd ../
#./compileAndRun.sh
# ctr -a, d


./screen -S NAUTILUS_VR_WEB_SERVER -d -m http-server ./../../NautilusVRClient -p 80
#cd ../../NautilusVRClient
#http-server ./ -p 80
#control-A, D


