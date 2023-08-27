#!/bin/bash


 list=$(cat fichier.txt)






#data=$(echo "$list" | grep -oP '\([^)]+\)' | sed 's/[()]//' | sed 's/[()]//')

data=$(echo "$list" | grep -oP '\([^)]+\)' | sed 's/[()]//' | sed 's/[()]//' )

echo "$data"



#version=$(echo "$list" | grep -oE '[0-9]+\.[0-9]\.[0-9]*')
#version=$(echo "$list" | grep -oE '[0-9]+(\.[0-9]+[a-z]*)+')

#version=$(echo "$list" | grep -oE '([0-9]-[a-z]-[0-9]+\.[0-9]+|[0-9]+\.[0-9]+\.[0-9]+)')
#version=$(echo "$list" | grep -oE '([0-9]-[a-z]-[0-9]+\.[0-9]+|[0-9]+\.[0-9]+\.[0-9]+)')
#version=$(echo "$list" | grep -oE '[0-9]+(\.[a-z]|[a-z]-)[0-9]+\.[0-9]+')


#version=($(echo "$list" | grep -oE '[0-9]+\.[0-9]+(\.[0-9]+)?|[0-9]+(\.[a-z]-)?[0-9]+\.[0-9]+'))
version=$(echo "$list" | grep -oE '[0-9]+\.[0-9]+(\.[0-9]+)?|[0-9]+(\.[a-z]-)?[0-9]+\.[0-9]+')

#version=$(echo "$line" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+[a-z]*')
#versions=$(echo "$list" | grep -oE '[0-9]+(\.[0-9]+[a-z]*)*')

echo "$version"


