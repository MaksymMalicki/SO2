#!/bin/bash

#chmod +x my-script.sh
#cat <nazwa pliku> - wypisuje zawartość pliku, cat - contatinate, mozna wypisać klika plików naraz
#date - aktualna data
#pobrać nazwę katalogu jako argument
#zasoby: https://explainshell.com/, man ls
DIRECTORY=${1} # deklaracja zmiennej, $ pozwala wyłuskać jak w pointerze, klamerki to dobra praktyka, 1
echo "Podałeś katalog: ${DIRECTORY}"
# -e = czy istnieje, -d = czy istnieje i czy jest folderem
if [[ -d ${DIRECTORY} ]]; then
    rm -rf ${DIRECTORY}
fi
mkdir -p ${DIRECTORY} # pozwala utworzyć katalog, jeśli tutaj np. bd błąd to oleje i leci dalej, trzeba zapamiętać

FILE=${2}
NAMES=$(cat ${FILE}) #$() - przechwycenie efektu wywołania funkcji, ${} - wyłuskanie wartości argumentu jako string

COUNT=0

#set -x flaga do debugowania, przed wykonaniem wypisz na ekranie
for NAME in ${NAMES}; do
    # inne porównywacze -lt, -ne itd.
    if [[ $((COUNT % 2)) -eq 0 ]]; then #$(()) castuje na inta
        touch ${DIRECTORY}/${NAME}
        echo "plik regularny ${NAME}"
    else 
        mkdir ${DIRECTORY}/${NAME}
        echo "katalog ${NAME}"
    fi
    COUNT=$((COUNT+1))

done