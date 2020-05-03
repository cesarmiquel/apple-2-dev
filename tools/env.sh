#!/bin/bash

#
# Get path to this script:
# http://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
#
pushd `dirname $0` > /dev/null
SCRIPT_PATH=`pwd -P`
ROOTFS=`dirname "$SCRIPT_PATH"`
popd > /dev/null

alias ac="java -jar $SCRIPT_PATH/ac.jar"
