#!/usr/bin/env bash
######################################################
# Name:             maj.sh
# Author:           Geoffrey Posé
# Creation:         03.11.2021
# Description:      mets à jours les apt et les flatpacks et nettoie les repertoires.
# Documentation:    https://github.com/Attadeurtia/outis_bash
######################################################
                                                                    
# test si on est root                                                           
test=`whoami`
if [ $test != "root" ]; then
  echo "a lancer en root ou sous sudo"
  exit
fi

while [ $i -le 25 ]
do
printf "="
sleep 1
let i=$i+1
done
echo -e ">]"

#Update apt 
echo "apt update"                                                            
apt update
printf "["
i=0
while [ $i -le 5 ]
do
printf "="
sleep 1
let i=$i+1
done
echo -e ">]"
echo -e "Update System  [ \033[32m OK \033[0m]"

#Upgrade apt
echo "-------------------------------"
echo "apt upgrade"                                                                     
apt -y upgrade
apt -y dist-upgrade
printf "["
i=0
while [ $i -le 5 ]
do
printf "="
sleep 1
let i=$i+1
done
echo -e ">]"
echo -e "Upgrade System [ \033[32m OK \033[0m]"
apt -y autoremove --purge && apt autoclean

#Upgrade flatpack                                                                       
echo "-------------------------------"
echo "flatpack"
flatpak update -y

printf "["
i=0
while [ $i -le 5 ]
do
printf "="
sleep 1
let i=$i+1
done
echo -e ">]"
echo -e "Udpate System [ \033[32m OK \033[0m]"

echo "-------------------------------"
echo "flatpak uninstall --unused"
flatpak uninstall --unused

echo -e "clean System [ \033[32m OK \033[0m]"