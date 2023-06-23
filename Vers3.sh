#!/bin/bash

file_verif() {
    file="$1"

    if [ ! -f "$file" ]; then
        echo "Le fichier $file n'existe pas."
        exit 1
    fi
}

drupal_data() {
    li="$1"
    awk '{gsub(/.*\(|\).*/, "", $0); print}' <<< "$li"
}


drupal_versions() {
    li="$1"
    grep -oE '[0-9]+\.[0-9]+(\.[0-9]+)?|[0-9]+(\.[a-z]-)?[0-9]+\.[0-9]+' <<< "$li"
}

boucle_fichier() {
    file="$1"

    while read -r line; do
        data=$(drupal_data "$line")
        version=$(drupal_versions "$line")
        printf "%-50s %s\n" "$data" "$version"
    done < "$file"
}

fichier_transfere() {
    file="$1"

    if [ -f "fichier2.txt" ]; then
        echo "Le fichier fichier2.txt existe deja.Voulez-vous lecraser ? (oui/non)"
        read -r response

        if [ "$response" = "non" ]; then
            echo "Operation annule.Le fichier n'a pas ete enregistre."
            return
        else
            rm fichier2.txt
             echo "fichier2.txt supprime"
        fi
    fi

    boucle_fichier "$file" > fichier2.txt
    echo "Les donnees ont ete enregistrees dans le fichier2.txt."


     if ! boucle_fichier "$file" > fichier2.txt; then
        echo "Erreur lors de l'enregistrement dans le fichier2.txt."
    fi

}





main() {
    file="fichier.txt"

    if ! file_verif "$file"; then
        echo "erreur : echec de la verification du fichier."
        exit 1
    fi

    if ! boucle_fichier "$file"; then
        echo "erreur : echec de la boucle de traitement du fichier."
        exit 1
    fi

    fichier_transfere "$file"
}



main


