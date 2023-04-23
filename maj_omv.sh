#!/usr/bin/env bash
######################################################
# Name:             maj_omv.sh
# Author:           Geoffrey Posé
# Creation:         23.04.2023
# Description:      mets à jours les apt et nettoie les repertoires pour openmediavault ou debian.
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
apt update -y
echo -e "Update System  [ \033[32m OK \033[0m]"

#Upgrade apt
echo "--------------------------------"
echo "apt upgrade"
apt upgrade -y
echo -e "Upgrade System [ \033[32m OK \033[0m]"

#Clean apt
echo "--------------------------------"
echo "apt autoremove --purge && apt autoclean"
apt autoremove --purge -y
apt clean
echo -e "Clean System [ \033[32m OK \033[0m]"