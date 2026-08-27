#!/usr/bin/env bash
FILE="$HOME/logseq/journals/$(date +%Y_%m_%d).md"
if [[ ! -f "$FILE" ]]; then
  echo "# $(date)" > "$FILE"
fi
for i in "$@"; do 
  echo "- $i" >> "$FILE"
done
