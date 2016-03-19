#!/usr/bin/env bash

CURRDIR=`dirname "$0"`
BASEDIR=`cd "$CURRDIR"; cd ..; pwd`
NAME=`basename \`pwd\``
OUT_NAME=my_golang_lib

PID_FILE="$BASEDIR/$NAME/$OUT_NAME.pid"
if [ -f "$PID_FILE" ]; then
    RUNPID=`cat "$PID_FILE"`
    echo "kill proc $RUNPID"
    kill -9 "$RUNPID"
fi

make update-dev-build

echo "begin run $OUT_NAME"
nohup ./$OUT_NAME &
PID=$!
echo "$PID" > "$OUT_NAME".pid
echo "$OUT_NAME run as $PID"
exit 0
