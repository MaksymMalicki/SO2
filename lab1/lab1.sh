#!/bin/bash -eu

# ex. 1
SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}
echo "SOURCE_DIR: ${SOURCE_DIR}"
echo "RM_LIST: ${RM_LIST}"
echo "TARGET_DIR: ${TARGET_DIR}"

# ex. 2
mkdir -p ${TARGET_DIR}

# ex. 3
NAMES=$(cat ${RM_LIST})
for NAME in ${NAMES}; do
    if [[ -e ${SOURCE_DIR}/${NAME} ]]; then
        echo "File ${SOURCE_DIR}/${NAME} has been removed from ${SOURCE_DIR}";
        rm -rf ${SOURCE_DIR}/${NAME}
    fi
done

# ex. 4, 5
for FILE in ${SOURCE_DIR}/*; do
    if [[ -f ${FILE} ]]; then
        echo "Moving file: ${SOURCE_DIR}/${FILE} to ${TARGET_DIR}"
        mv ${FILE} ${TARGET_DIR}
    fi
    if [[ -d ${FILE} ]]; then
        echo "Copying directory: ${SOURCE_DIR}/${FILE} to ${TARGET_DIR}"
        cp -r ${FILE} ${TARGET_DIR}
    fi
done

# ex. 6
FILES_IN_DIR=$( ls ${SOURCE_DIR} | wc -l )
if [[ $((FILES_IN_DIR)) -ne 0 ]]; then
    echo "jeszcze coś tu zostało"
    if [[ $((FILES_IN_DIR)) -ge 2 ]]; then
    echo "zostały conajmniej dwa pliki"
    fi
    if [[ $((FILES_IN_DIR)) -gt 4 ]]; then
        echo "zostało więcej ni 4 pliki"
    fi
    if [[ $((FILES_IN_DIR)) -lt 4 && $((FILES_IN_DIR)) -ge 2 ]]; then
        echo "tez coś piszemy"
    fi
else
    echo "tu był Kononowicz"
fi

# ex. 7
zip -r "bakap_$(date +%Y-%m-%d).zip" ${TARGET_DIR}