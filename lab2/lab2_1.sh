#!/bin/bash -eu

FIRST_DIR=${1:-}
SECOND_DIR=${2:-}

if [[ ! $# -eq 2 ]] ; then
    echo 'Not enough arguments were supplied!'
    exit 1
fi

if [[ ! -d ${FIRST_DIR} ]]; then
    echo "${FIRST_DIR} does not exist!"
    exit 1
fi

if [[ ! -d ${SECOND_DIR} ]]; then
    echo "${SECOND_DIR} does not exist!"
    exit 1
fi

for FILE in ${FIRST_DIR}/*; do
    if [[ -d ${FILE} ]]; then
        echo "${FILE} is a directory"
        ln -s ${FILE} ${SECOND_DIR}/${FILE^^}_ln
    fi
    if [[ -f ${FILE} ]]; then
        echo "${FILE} is a regular file"
        ln -s ${FILE} ${SECOND_DIR}/${FILE^^}_ln
    fi
    if [[ -L ${FILE} ]]; then
        echo "${FILE} is a symbolic link"
    fi
done