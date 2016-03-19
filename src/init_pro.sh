#!/bin/bash

CURR_DIR=`dirname "$0"`
BASE_DIR=`cd "$CURR_DIR";pwd`
GEN_DIR="gen"

if [ ! -n "$1" ];then
    echo "commond param project name is null"
    exit -1
fi

PRO_DIR=$1

if [ ! -d "${BASE_DIR}/${PRO_DIR}" ];then
    echo "this project is not exist"
    exit -1
fi
#将构建文件移到项目目录
mv_files=`ls "${BASE_DIR}/${GEN_DIR}"`
for mv_file in $mv_files
do
   cp "${BASE_DIR}/${GEN_DIR}/${mv_file}" "${BASE_DIR}/${PRO_DIR}"
done

echo "Build done"
