#!/usr/bin/env bash
######################################################
# Name:             maj.sh
# Author:           Geoffrey Posé
# Creation:         03.11.2021
# Modified:         23.04.2023
# Description:      mets à jours les apt et les flatpacks et nettoie les repertoires.
# Documentation:    https://github.com/Attadeurtia/outis_bash
######################################################

# test si on est root
test=$(whoami)
if [ $test != "root" ]; then
  echo "sudo ou root requis"
  exit
fi

#Update apt
echo "--------------------------------"
echo "apt update"
apt update
echo -e "Update System  [ \033[32m OK \033[0m]"

#Upgrade apt
echo "--------------------------------"
echo "apt upgrade"
apt dist-upgrade -y
echo -e "Upgrade System [ \033[32m OK \033[0m]"

#Clean apt
echo "--------------------------------"
echo "apt autoremove --purge && apt autoclean"
apt autoremove --purge -y
apt autoclean
echo -e "Clean System [ \033[32m OK \033[0m]"

#vérifier si flatpack est installé
echo "--------------------------------"
flatpak --version
if [ $? -eq 0 ]; then

  #Upgrade flatpack
  echo "--------------------------------"
  echo "flatpack update"
  flatpak update -y
  echo -e "Udpate System [ \033[32m OK \033[0m]"

  echo "--------------------------------"
  echo "flatpak uninstall --unused"
  flatpak uninstall --unused -y
  echo -e "clean System [ \033[32m OK \033[0m]"

else
  echo "flatpack n'est pas installé"
fi
