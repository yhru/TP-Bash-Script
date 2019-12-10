
#!/bin/bash

# Création du dossiers stats.txt
echo '' > stats.txt

# On vérifie que la commande comporte bien le 1er paramètre
if [ -z $1 ]
then
    echo "Pour fonctionner ce script à besoin d'un fichier .txt en paramètre"
    exit 1

# On vérifie que le .txt existe belle et bien
elif [ ! -e $1 ]
then
    echo "Le fichier .txt entré en paramètre n'existe pas"
    exit 1
fi

# Exo 1 si il n'y a pas de deuxième paramètre faire :
if [ -z $2 ]
then
    echo ""
    echo "[Premier exercice avec un seul paramètre ($1)]"
    echo "Classement de lettre de la plus utilisée à la moins utilisée : "
    echo ""

    # Pour les lettres allant de A à Z faire :
    for lettre in {A..Z}
    do
        # Compter le nombre de lettre dans le param 1 et afficher la dite lettre
        echo "`grep -c $lettre $1` - $lettre" >> stats.txt
    # Trier de la plus grande occurence à la plus petite
    done && echo "`sort -rn stats.txt`"

# Exo 2 si il existe un deuxième paramètre
elif [ ! -z $2 ]
then
    echo ""
    echo "[Deuxième exo avec un parametre ($2)]"
    echo "Classement des voyelles de la moins utilisée à la plus utilisée : "

    # Uniquement pour les voyelles, faire :
    for lettre in {A,E,I,O,U,Y}
    do
        echo "`grep -c $lettre $1` - $lettre" >> stats.txt
    #Trier de la plus petite occurence à la plus grande
    done && echo "`sort -n stats.txt`"
fi

# Suppression du fichier stats.txt à la fin du script
echo "`rm stats.txt`"
echo "[TP Script Linux - Maxim JOSEAU - EPSI B2 Groupe A]"

# Fin du programme
exit 1
