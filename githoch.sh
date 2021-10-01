#!/bin/bash

# Mit diesem Skript laede ich Datei hoch (add ., commit und push)

usage () {
    echo "Nutzung: ${0} [VERZEICHNIS] '[COMMIT-text]' [REPOSITORY] [BRANCHE]" >&2
    echo "Beispiel: githoch . 'Das ist ein Commit' origin branche-name" >&2
    echo 'Falls [REPOSITORY] und [BRANCHE] leer sind, dann wird zum origin gepushed' >&2
    
}


fehler () {
   # usage
    echo
    local MESSAGE="${@}"
    if [[ "${?}" -ne 0 ]]
    then
	echo "${@}" >&2
	exit 1
    fi
}
git add "${1}"
fehler "Das Verzeichnis konnte nicht hochgeladen werden."

DATUM=$(date +%c)
COMMIT=${2}" --- "${DATUM}
git commit -m "${COMMIT}"
fehler "Der Commit ist fehlgeschlagen"

git push ${3} ${4}
fehler "Es gibt ein Problem mit dem Brachen"


