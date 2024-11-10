#!/bin/bash

# Vérifier si le fichier des URLs est fourni en argument
if [ -z "$1" ]; then
    echo "Erreur : Veuillez fournir un fichier d'URL en argument."
    exit 1
fi

# Vérifier que le fichier existe
if [ ! -f "$1" ]; then
    echo "Erreur : Le fichier '$1' n'existe pas."
    exit 1
fi

valid_url=()
invalid_url=()
num=1

# Définir le fichier de sortie et créer le dossier cible
output_file="../tableaux/tableau-fr.tsv"
mkdir -p "../tableaux"

# Écrire l'en-tête du fichier TSV
echo -e "Numéro\tURL\tCode HTTP\tEncodage\tNombre de mots" > "$output_file"

# Lire le fichier ligne par ligne
while IFS= read -r line; do
    line=$(echo "$line" | xargs)  # Supprime les espaces en début et fin de ligne

    # Vérifier si l'URL commence par http ou https
    if [[ "$line" =~ ^https?:// ]]; then
        valid_url+=("$line")
    else
        invalid_url+=("$line")
    fi
done < "$1"

# Traiter les URLs valides
for url in "${valid_url[@]}"; do
    http_code=$(curl -o /dev/null -s -w "%{http_code}" "$url")
    encoding=$(curl -sI "$url" | grep -i "Content-Type" | grep -o "charset=[^;]*" | cut -d= -f2)
    word_count=$(curl -s "$url" | wc -w)

    # Vérifier si le code HTTP est une erreur (4xx ou 5xx)
    if [[ "$http_code" =~ ^[45][0-9]{2}$ ]]; then
        echo -e "HTTP erreur: $http_code pour $url\nVous pouvez le corriger ou réessayer une fois.\n"
    else
        # Écrire les informations avec des tabulations dans le fichier TSV
        echo -e "${num}\t${url}\t${http_code}\t${encoding:-N/A}\t${word_count}" >> "$output_file"
        echo -e "${num}\t${url}\t${http_code}\t${encoding:-N/A}\t${word_count}"  # Affiche aussi dans le terminal
        ((num++))
    fi

    # Vérifier si l'encodage est vide
    if [ -z "$encoding" ]; then
        echo "Cet URL: $url n'a pas d'encodage spécifié.\n"
    fi
done

# Afficher les URLs invalides
if [ ${#invalid_url[@]} -gt 0 ]; then
    echo -e "\nURLs invalides :"
    for url in "${invalid_url[@]}"; do
        echo "Ce URL n'est pas correct: $url"
    done
fi

echo "La sortie a été enregistrée dans $output_file"
