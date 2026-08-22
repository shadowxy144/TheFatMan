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

echo -e "${GREEN}"

echo ""
echo "1) Download required data"
echo ""
echo "2) Use Tool "
echo ""
echo "3) Read this before using."
echo ""
echo "4) Close localhost"
echo ""
echo "5) Exit"

echo -e "${NC}"

read -p "make a selection : " secim 

if [[ "$secim" == "1" ]]; then

 clear
 
 { sudo apt update && sudo apt upgrade -y; } > /dev/null 2>&1 
 { sudo apt install bettercap; } > /dev/null 2>&1 

 clear

 echo "Everything is all set ! "
 
 sleep 2

 continue

elif [[ "$secim" == "2" ]]; then
 
 bash "$anadizin/tool/fatman.sh"

elif [[ "$secim" == "3" ]]; then

 clear
 
 cd "$anadizin/tool/readme"

 python3 -m http.server 8080 > /dev/null 2>&1 & 
     xdg-open "http://127.0.0.1:8080" > /dev/null 2>&1 & 


cd "$anadizin"

echo "Reade localhost:8080"

continue 

elif [[ "$secim" == "4" ]]; then

 sudo pkill -f "python3 -m http.server 8080" > /dev/null 2>&1 

 sleep 2
 continue

elif [[ "$secim" == "5" ]]; then

clear
  
  sudo pkill -f "python3 -m http.server 8080" > /dev/null 2>&1
  

  echo -e "${NC}"

  echo -e "${YELLOW}Goodbye! Thanks for using the tool.${NC}\n"
  
  sleep 1
  break

else

 clear
 echo "Invalid selection; please try a different one."
 sleep 2
 continue

fi
done


