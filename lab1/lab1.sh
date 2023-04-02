SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}

mkdir -p ${TARGET_DIR}
NAMES=$(cat ${RM_LIST})

for NAME in ${NAMES}; do
    if [[ -f ${TARGET_DIR}/${NAME} ]]; then
        rm -rf ${TARGET_DIR}/${NAME}
    fi
done

# FILES_IN_DIR = $((ls | wc -l))
# if [[ $((COUNT)) -ne 0 ]]; then
#     echo "jeszcze coś tu zostało"
# fi
# if [[ $((COUNT)) -ge 2 ]]; then
#     echo "zostały conajmniej dwa pliki"
# fi
# if [[ $((COUNT)) -gt 4 ]]; then
#     echo "zostało więcej ni 4 pliki"
# fi
# if [[ $((COUNT)) -lt 4 ] && [ $((COUNT)) -ge 2 ]]
#     echo "tez coś piszemy"
# fi
# if [[ $((COUNT)) -e 0 ]]; then
#     echo "tu był Kononowicz"
# fi