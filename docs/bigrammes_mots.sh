#!/bin/bash

fichier=$1
nombre_de_bigramme=$2

if [[ ! -f $fichier ]]; then
    echo "Le fichier $fichier n'existe pas."
    exit 1
fi

# Si non préciser, afficher les 15 premiers bigrammes ex:./bigrammes_mots.sh candide.txt
if [ -z "$nombre_de_bigramme" ]; then
    ./mot_par_ligne.sh "$fichier" \
        | paste -d' ' - - \
        | sort \
        | uniq -c \
        | sort -n \
        | tail -n 15

# Si préciser, afficher le nb de bigrammes demandé ex:./bigrammes_mots.sh candide.txt 10
else
    ./mot_par_ligne.sh "$fichier" \
        | paste -d' ' - - \
        | sort \
        | uniq -c \
        | sort -n \
        | tail -n "$nombre_de_bigramme"
fi
