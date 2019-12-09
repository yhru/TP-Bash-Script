#!/bin/bash

if [ -z $1 ]
then
    echo "Pour fonctionner ce script à besoin d'un fichier .txt en paramètre"
    exit 1

elif [ ! -e $1 ]
then
    echo "Le fichier .txt entré en paramètre n'existe pas"
    exit 1

elif [ -z $2 ]
then
    echo '' > stats.txt

    for lettre in {A..Z}
    do
        echo "`grep -c $lettre $1` - $lettre" >> stats.txt
    done | sort -k3 stats.txt

fi

echo "`cat stats.txt`"
echo "`rm stats.txt`"
exit 1

