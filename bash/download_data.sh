#!/usr/bin/env bash

: <<'END'
Скрипт для скачивания данных с сайта
END

set -e

YEAR=$1 # 2023

URL_PREFIX="https://raw.githubusercontent.com/grishenkovp/linux/main/bash/datasets"

for MONTH in {1..2}; do
  FMONTH=`printf "%02d" ${MONTH}`

  URL="${URL_PREFIX}/plan_${YEAR}_${FMONTH}.csv"

  LOCAL_PREFIX="data/${YEAR}/${FMONTH}"
  LOCAL_FILE="plan_${YEAR}_${FMONTH}.csv"
  LOCAL_PATH="${LOCAL_PREFIX}/${LOCAL_FILE}"

  echo "donwloading ${URL} to ${LOCAL_PATH}"
  mkdir -p ${LOCAL_PREFIX}
  wget ${URL} -O ${LOCAL_PATH}

  echo "compressing ${LOCAL_PATH}"
  gzip ${LOCAL_PATH}
done