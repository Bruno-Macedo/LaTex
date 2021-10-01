#!/bin/bash

# Mit diesem Skript laede ich Datei hoch (add ., commit und push)

usage () {
    echo "Nutzung: ${0} [VERZEICHNIS] '[COMMIT-text]' [REPOSITORY] [BRANCHE]" >&2
    echo "Beispiel: githoch . 'Das ist ein Commit' origin branche-name" >&2
    echo 'Falls [REPOSITORY] und [BRANCHE] leer sind, dann wird zum origin gepushed' >&2
    
}


fehler () {
    usage
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
echo "Ergebnis push: ${?}"

#fehler "Es gibt ein Problem mit dem Brachen"

#for NAME in "${@}"
#do
#    echo "${NAME}"
   
#done

#"VERZEICHNIS="${1}"

# git add
#if [[ "${1}" == "" ]]
#then
#    git add .
#else
#    git add "${VERZEICHNIS}"
#fi

#shift

# git commit
#if [[ "${1}" == "" ]]
#then
#    echo "Schreiben Sie bitte eine Nachricht fuer Ihren commit."
#else
#	DATE_TIME=$(date +%c)
#    git commit - "${1} -- ${DATE_TIME}"
#fi

#shift

# git push
#ORIGIN="${1}"
#BRANCH="${2}"

#if [[ "${1}" == "" ]]
#then
#    git push 
#else
 #   git push "${ORIGIN}" "${BRANCH}"
#fi
