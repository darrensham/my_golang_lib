#!/bin/bash

CURR_DIR=`dirname "$0"`
BASE_DIR=`cd "$CURR_DIR";pwd`

OLD_GOPATH=$GOPATH

NEW_GOPATH=`cd "${BASE_DIR}/..";pwd`
export GOPATH="${NEW_GOPATH}"

