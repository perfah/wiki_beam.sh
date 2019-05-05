#!/bin/bash

# auto_beam.sh
# ============

# This script automatically downloads (if found) a Wikipedia article with a title exactly equal to each word found in stdin.
# It can, for instance, be used to download vast amounts of plain text content related to some particular text.
# Works with compound words (of two stems) by looking up the corresponding article for consecutively neighboring words. (e.g. United Nations)
# Non-alphabetical characters are ignored.

download () {
    file="en-$1.txt"

    if test -f "$file"; then
        echo "Reusing $file!"
    else
        content=$(sh wiki_beam.sh en $1)

        if [ -z "$content" ]; then 
            echo "Skipping $file!"
        else
            echo $content > "$file" 
            echo "Saving $file!"
        fi
    fi

}

x=$(echo $(</dev/stdin) | sed 's/[^a-zA-Z ]//g' | tr '[:upper:]' '[:lower:]')
arr=($x)
len=${#arr[@]}

for i in $(seq 1 $len); do
    a=$(echo "${arr[@]:$((i - 1)):1}")
    b=$(echo "${arr[@]:$((i + 0)):1}")
    c=$(echo "${arr[@]:$((i + 1)):1}")

    article1="${b}"
    article2="${a}_${b}"
    article3="${b}_${c}"

    download $article1
    download $article2
    download $article3
done

