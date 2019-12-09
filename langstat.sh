#!/bin/bash

if [ -z $1 ] # On vérifie que la commande comporte bien le 1er paramètre
then
    echo "Pour fonctionner ce script à besoin d'un fichier .txt en paramètre"
    exit 1

elif [ ! -e $1 ] # On vérifie que le .txt existe belle et bien
then
    echo "Le fichier .txt entré en paramètre n'existe pas"
    exit 1

elif [ -z $2 ] # S'il n'y a pas de deuxième paramètre faire :
then
    echo '' > stats.txt # Création de stats.txt vide

    for lettre in {A..Z} # Des lettres allant de A à Z
    do
        echo "`grep -c $lettre $1` - $lettre" >> stats.txt # Compter le nombre de lettre dans le param 1 et afficher la lettre
    done && echo "`sort -rn stats.txt`" # Trier de la plus grande occurence à la plus petite

fi

echo "`rm stats.txt`" # Suppression du fichier stats.txt à la fin du script