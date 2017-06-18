#!/bin/bash

# This program is free software. It comes without any warranty, to the extent
# permitted by applicable law. You can redistribute it and/or modify it under
# the terms of the Do What The Fuck You Want To Public License, Version 2, as
# published by Sam Hocevar. See WTFPL.txt or http://www.wtfpl.net/ for more
# details.

shopt -s expand_aliases
alias fail='{ echo $LINENO; exit 1; }'


function main {

if test '' == "${FILE}"; then
  echo "ERROR:  Specify a file to tag."
  exit 1
fi

if ! test -e "${FILE}"; then
  echo "ERROR:  File does not exist (or is a broken link):  ${FILE}"
  exit 1
fi

echo "Current file:  ${FILE}: "
read -p "tags:  " LINE

SUFFIX=''
for TAG in ${LINE}; do
  SUFFIX+=" -t '${TAG}'"
done

COMMAND="~/bin/symtag -c '${SYMTAGRC}' '${FILE}' ${SUFFIX}"
eval nohup "${COMMAND}" >/dev/null 2>&1 &

}


SYMTAGRC=~/.symtagrc
SYMTAGDIR=~/.symtag

while test $# -gt 0; do
  case "${1}" in
    -c|--config|--rc)
      SYMTAGRC="${2}"
      shift
      ;;
    -*)
      fail
      ;;
    *)
      FILE="${1}"
      ;;
  esac
  shift
done

if test -f "${SYMTAGRC}"; then
  . "${SYMTAGRC}" || fail
fi

main
