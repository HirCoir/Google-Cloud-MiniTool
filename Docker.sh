#!/bin/bash
FIGLET=/usr/bin/figlet
CONTAINERS=/var/lib/docker/containers/
if [ -f $FIGLET ]
then
   echo ""
else
sudo apt install figlet -y
fi
figlet -c GitHub.com/
figlet -c HirCoir
sleep 3
#INICIO IDIOMA ENGLISH#
clear
echo "#####################################################"
echo "#            HirCoir Google Cloud Shell             #"
echo "#####################################################"
echo "# 1) Desktop Environments                           #"
echo "# 2) Install Portainer (Requires Ngrok token)       #"
echo "# 3) Install Apache Guacamole (Web Client RDP,VNC)  #"
echo "# 4) Stop and delete All Containers                 #"
echo "# 5) Exit                                           #"
echo "#####################################################"
while true; do
    read -p "" op
    case $op in
        [1]* )
echo "#########################################"
echo "#       Docker Virtual Desktops         #"
echo "#########################################"
echo "# Choose which version of Linux to run  #"
echo "# 1) Ubuntu XFCE                        #"
echo "# 2) Ubuntu KDE                         #"
echo "# 3) Ubuntu Mate                        #"
echo "# 4) Ubuntu Openbox                     #"
echo "# 5) Ubuntu IceWM                       #"
echo "# 6) Exit                               #"
echo "#########################################"
while true; do
    read -p "" op
    case $op in
        [1]* )
if [ -d "$CONTAINERS" ]
then
echo "Containers found."
echo "Eliminating containers..."
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
else
   echo "Without containers"
fi
docker run -d -p 8080:3000 linuxserver/webtop:ubuntu-xfce
        break;;
        [2]* )
if [ -d "$CONTAINERS" ]
then
echo "Containers found."
echo "Eliminating containers..."
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
else
   echo "Without containers"
fi
docker run -d -p 8080:3000 linuxserver/webtop:ubuntu-kde
break;;
        [3]* ) 
if [ -d "$CONTAINERS" ]
then
echo "Containers found."
echo "Eliminating containers..."
stop $(docker ps -a -q)
rm $(docker ps -a -q)
else
   echo "Without containers"
fi
sudo docker run -d -p 8080:3000 linuxserver/webtop:ubuntu-mate
break;;
        [4]* )
if [ -d "$CONTAINERS" ]
then
echo "Containers found."
echo "Eliminating containers..."
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
else
   echo "Without containers"
fi
sudo docker run -d -p 8080:3000 linuxserver/webtop:ubuntu-openbox
break;;
        [5]* )
if [ -d "$CONTAINERS" ]
then
echo "Containers found."
echo "Eliminating containers..."
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
else
   echo "Without containers"
fi
docker run -d -p 8080:3000 linuxserver/webtop:ubuntu-icewm
break;;
        [6]* ) exit; break;;        
        * ) exit;;
    esac
done
break;; 
        [2]* )
clear
if [ -d "$CONTAINERS" ]
then
echo "Containers found."
echo "Eliminating containers..."
sudo docker stop $(docker ps -a -q)
sudo docker rm $(docker ps -a -q)
else
   echo "Without containers"
fi
echo "Installing Portainer..."
sleep 1
docker volume create portainer_data
docker run -d -p 9000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
echo "Downloading Ngrok"
ls /home/
rm ngrok-stable-linux-amd64.deb
wget https://raw.githubusercontent.com/HirCoir/Ngrok/main/ngrok-stable-linux-amd64.deb
echo "Ngrok Token Format: XXXXXXXXXXXXXXXXXXXXXXXXXXX_XXXXXXXXXXXXXXXXXXXXX"
dpkg -i ngrok-stable-linux-amd64.deb
echo "Get your Token from the following URL: https://dashboard.ngrok.com/get-started/your-authtoken"

read -p "Enter ONLY YOUR NGROK TOKEN: " ngrok_token
echo ""
sleep 5
echo "Copy and paste the link provided by Ngrok and paste it into your browser to access Portainer."
echo
echo "Do not close this window because the tunnel will close."
ls /home/
sudo ngrok authtoken $ngrok_token
sudo ngrok http 9000
break;;
[3]* )
if [ -d "$CONTAINERS" ]
then
echo "Containers found."
echo "Eliminating containers..."
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
else
   echo "Without containers"
fi
docker run -d -p 8080:8080 --name Guacamole -v /config -v /portainer/Files/AppData/Config/Guacamole oznu/guacamole:latest
break;;
[4]* )
if [ -d "$CONTAINERS" ]
then
echo "Containers found."
echo "Eliminating containers..."
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
else
   echo "Error.. No container.."
fi
break;;
        [5]* ) exit; break;;        
        * ) exit;;
    esac
done
#FIN IDIOMA ENGLISH#
