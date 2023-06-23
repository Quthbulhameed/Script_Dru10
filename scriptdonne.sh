#!/bin/bash


list=$(cat fichier.txt)

#data=$(echo "$list" | grep -oP '\([^)]+\)' | sed 's/[()]//' | sed 's/[()]//')

#data=($(echo "$list" | grep -oP '\([^)]+\)' | sed 's/[()]//' | sed 's/[()]//'))
donne=($(echo "$list" | awk '{gsub(/.*\(|\).*/, "", $0); print}'))


#version=$(echo "$list" | grep -oE '[0-9]+\.[0-9]\.[0-9]*')
#version=$(echo "$list" | grep -oE '[0-9]+(\.[0-9]+[a-z]*)+')

#version=$(echo "$list" | grep -oE '([0-9]-[a-z]-[0-9]+\.[0-9]+|[0-9]+\.[0-9]+\.[0-9]+)')
#version=$(echo "$list" | grep -oE '([0-9]-[a-z]-[0-9]+\.[0-9]+|[0-9]+\.[0-9]+\.[0-9]+)')
#version=$(echo "$list" | grep -oE '[0-9]+(\.[a-z]|[a-z]-)[0-9]+\.[0-9]+')


#version=($(echo "$list" | grep -oE '[0-9]+\.[0-9]+(\.[0-9]+)?|[0-9]+(\.[a-z]-)?[0-9]+\.[0-9]+'))
version=($(echo "$list" | grep -oE '[0-9]+\.[0-9]+(\.[0-9]+)?|[0-9]+(\.[a-z]-)?[0-9]+\.[0-9]+'))

#version=$(echo "$line" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+[a-z]*')
#versions=$(echo "$list" | grep -oE '[0-9]+(\.[0-9]+[a-z]*)*')


i=0
while true :
do
    if [ "$i" -gt "${#donne[@]}" ]; then
        break
    fi
     printf "%-50s %s\n" "${donne[i]}"    "${version[i]}"
    i=$((i+1))
done
