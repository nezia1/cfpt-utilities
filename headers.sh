#!/bin/sh
name="John Doe"
while getopts "h?n:" opt; do
  case "$opt" in
    n)  name=$OPTARG
      ;;
    h|\?)
        printf "Usage: %s: [-n author name] args\n" $0
        exit 2;;
  esac
done
shift $(($OPTIND - 1))

find $1 -name '*.cs' ! -path '*/obj/*' ! -name 'Usings.cs' -exec sh -c 'sed -i "1i /// \\\ file $(basename -s .cs "{}")\n/// \\\ brief File summary\n/// \\\ author $name, CFPTI\n/// \\\ date $(date +%Y.%m.%d) initial version" "{}"' \;
