#!/bin/bash -eu

TARGET_DIR=${1:-}

if [[ ! $# -eq 1 ]] ; then
    echo 'Not enough arguments were supplied!'
    exit 1
fi

if [[ ! -d ${TARGET_DIR} ]]; then
    echo "${TARGET_DIR} does not exist!"
    exit 1
fi

for FILE in ${TARGET_DIR}/*; do
    # checks the regular file
    if [[ -f ${FILE} && "${FILE##*.}" = "bak" ]]; then
        chmod go-w ${FILE} 
        echo "${FILE} is a regular file with .bak extension"
        
    fi

    # checks the directory
    if [[ -d ${FILE} && "${FILE##*.}" = "bak" ]]; then
        chmod o+x ${FILE}
        echo "${FILE} is a directory with .bak extension"
    fi

    if [[ -f ${FILE} && "${FILE##*.}" = "txt" ]]; then
        chmod 421 ${FILE}
        echo "${FILE} is a directory with .txt extension"
    fi

done