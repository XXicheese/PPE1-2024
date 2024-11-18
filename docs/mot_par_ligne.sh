#!/bin/bash

fichier=$1

if [[ ! -f $fichier ]]; then
    echo "Le fichier $fichier n'existe pas."
    exit 1
else
    cat "$fichier" \
        | tr -d '[:punct:]' \
        | tr '[:upper:]' '[:lower:]' \
        | grep -oE '\w+'
fi

# chmod x+ mot_par_ligne.sh
# ./mot_par_ligne.sh ./candide.txt
