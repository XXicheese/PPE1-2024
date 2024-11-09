#!/bin/bash

#message d'affichage
usage() {
    echo "Usage: $0 <fichier_urls>"
    exit 1
}

#Lecture des arguments et des fichiers
if [ $# -ne 1 ]; then
    echo "Erreur : ce programme nécessite un fichier."
    usage
fi
if [ ! -f "$1" ]; then
    echo "Erreur : le fichier '$1' n'existe pas."
    exit 1
fi

#Validation des URLs
valid_url=()
invalid_url=()
num=1
while IFS= read -r line
do
    line=$(echo "$line" | xargs)
    if [ -z "$line" ]; then
        continue
    fi

    if [[ "$line" =~ ^https?:// ]]; then
        valid_url+=("$line")
    else
        invalid_url+=("$line")
    fi
done < "$1"

#URL valides
if [ ${#valid_url[@]} -eq 0 ]; then
    echo "Aucune URL valide trouvée dans le fichier."
fi

for url in "${valid_url[@]}"
do
    http_code=$(curl -o /dev/null -s -w "%{http_code}" "$url")
    encoding=$(curl -sI "$url" | grep -i "Content-Type" | grep -o "charset=[^;]*" | cut -d= -f2)
    word_count=$(curl -s "$url" | wc -w) #compter les mots

    if [[ "$http_code" =~ ^[45][0-9]{2}$ ]]; then
        echo -e "HTTP erreur: $http_code pour $url\nVous pouvez le corriger ou réessayer une fois.\n"
    else #compter les mots
        echo -e "${num}\t${url}\t${http_code}\t${encoding:-N/A}\t${word_count}"
        ((num++))
    fi

    if [ -z "$encoding" ]; then
        echo "Cet URL: $url n'a pas d'encodage spécifié.\n"
    fi
done

#URL invalides
if [ ${#invalid_url[@]} -gt 0 ]; then
    echo -e "\nURLs invalides :"
    for url in "${invalid_url[@]}"
    do
        echo "Ce URL n'est pas correct: $url"
    done
fi
