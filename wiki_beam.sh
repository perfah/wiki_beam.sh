#!/bin/bash

html=$(wget -qO- https://$1.wikipedia.org/wiki/$2)

start="</tbody></table>"
stop1="<span class=\"mw-headline\" id=\"See_also\""
stop2="<span class=\"mw-headline\" id=\"References\""

html=${html#*$start}
html=${html%$stop1*}
html=${html%$stop2*}

txt=$(echo $html | sed -e 's/<[^=]*=\"[^"]*"[^>]*> / /g' | sed -e 's/<[^>]*>//g' | sed -e 's/&#[0-9]*;//g' | sed -E 's/\.[^0-9]+[^ ]+ /  /g')

echo $txt > "$1-$2.txt"
echo "Saved as $1-$2.txt!"
