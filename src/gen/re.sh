#!/bin/bash
#########################################################################
# Author: Johnny Shi
# Created Time: 2014-04-17 22:20:48
# File Name: re.sh
# Description: 
#########################################################################

cd `dirname $0`

./install.sh && ./bootstrap.sh restart
