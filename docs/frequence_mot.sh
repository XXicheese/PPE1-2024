 #!/bin/bash

fichier=$1
nombre_de_mot=$2

if [[ ! -f $fichier ]]; then
    echo "Le fichier $fichier n'existe pas."
    exit 1
fi

if [ -z "$nombre_de_mot" ]; then
    # Pas de 2eme arguments, afficher 25 premiers ex: ./frequence_mot.sh candide.txt
    ./mot_par_ligne.sh "$fichier" | sort | uniq -c | sort -n | tail -n 25
else
    # Sinon, affiche le nombre demandé ex: ./frequence_mot.sh candide.txt 10
    ./mot_par_ligne.sh "$fichier" | sort | uniq -c | sort -n | tail -n "$nombre_de_mot"
fi


