#!/bin/bash

#
# Get path to this script:
# http://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
#
pushd `dirname $0` > /dev/null
SCRIPT_PATH=`pwd -P`
ROOTFS=`dirname "$SCRIPT_PATH"`
popd > /dev/null

# Alias to run Apple Commander
alias ac="java -jar $SCRIPT_PATH/ac.jar"

# Alias to run Apple Emulator
alias linapple="$SCRIPT_PATH/linapple --config $SCRIPT_PATH/linapple.conf"

# Alias to run Disk Browser tool.
alias diskbrowser="java -jar $SCRIPT_PATH/DiskBrowser.jar"
