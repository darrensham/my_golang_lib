#!/bin/bash
#########################################################################
# Author: Johnny Shi
# Created Time: 2014-04-03 14:03:55
# File Name: install.sh
# Description: 
#########################################################################

#!/usr/bin/bash

GOROOT=/usr/local/go

cd `dirname $0`

CURDIR=`pwd`/../
FAILED=0

# 备份已有的GOPATH，换成当前项目路径
OLDGOPATH="$GOPATH"
export GOPATH="$CURDIR"

VERSION="0.0.0"
if [ "$1" != "" ]
then
	VERSION="$1"
fi
#echo 'Formating...'
echo 'Compiling and installing...'
$GOROOT/bin/go install -gcflags "-N -l" -ldflags "-X main.__version__ $VERSION" my_golang_lib

if (( $? != 0 ))
then
	FAILED=1
fi

# 恢复原来的GOPATH
export GOPATH="$OLDGOPATH"

if (( $FAILED == 0 ))
then
	echo 'Done'
else
	echo 'Error'
	exit 1
fi
