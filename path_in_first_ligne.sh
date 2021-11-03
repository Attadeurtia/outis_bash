#!/usr/bin/env bash
######################################################
# Name:             path_in_first_ligne.sh
# Author:           Geoffrey Posé
# Creation:         03.11.2021
# Description:      mettre le chemin du fichier .c en première ligne en commentaire. lancer le script dans le repertoir contenant les fichiers à modifier.
# Documentation:    https://github.com/Attadeurtia/outis_bash
######################################################

IFS=$'\n'
for fichier in $(find -type f -name "*.c" && find -type f -name "*.h"); do #appliquer pour tout les fichier .c et .h
    path=$(echo $fichier | cut -c 3-) #enleveler le "./" du chemin ./exemple/prog.c 
    sed -i '1i//'$path'' "$fichier" #mettre en première ligne
done