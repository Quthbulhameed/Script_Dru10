#!/bin/bash


file_verif() {
    file="$1"

    if [ ! -f "$file" ]; then
        echo "Le fichier $file n'existe pas."
        exit 1

    fi
}


#extraire les données
drupal_data() {

    li="$1"

    awk '{gsub(/.*\(|\).*/, "", $0); print}' <<< "$li"
}

#extraire les versions
drupal_versions() {
    li="$1"

    grep -oE '[0-9]+\.[0-9]+(\.[0-9]+)?|[0-9]+(\.[a-z]-)?[0-9]+\.[0-9]+' <<< "$li"
}




boucle_fichier() {
    file="$1"

    lines


    IFS=$'\n' read -d '' -r -a lines < "$file"

        for ((index=0; index<${#lines[@]}; index++)); do
        ligne="${lines[index]}"
        data=$(drupal_data "$ligne")
        version=$(drupal_versions "$ligne")
        printf "%-50s %s\n" "$data" "$version"
    done
}


main() {
    file="fichier.txt"

    file_verif "$file"
    boucle_fichier "$file"
}
main
###