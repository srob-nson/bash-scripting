#!/usr/bin/env bash
FILE="$HOME/logseq/journals/$(date +%Y_%m_%d).md"

write_file() {
#  if [[ ! -f "$FILE" ]]; then
#    echo "# $(date)" > "$FILE"
#  fi
  for i in "$@"; do 
    echo "" >> "$FILE"
    echo "- $i" >> "$FILE"
  done
}

if [[ -n "$1" ]]; then
  write_file "$@"
else
  read -p "Log what?: " NOARGS
  if [[ -n "$NOARGS" ]]; then
    write_file "$NOARGS"
  else
    exit 2
  fi
fi
