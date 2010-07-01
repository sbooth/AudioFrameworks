#!/bin/bash

set -o errexit

LIB_DIR="$PROJECT_DIR/mp4v2-src"
CONFIG_FILE="$LIB_DIR/libplatform/config.h"

if [ -f $CONFIG_FILE ] ; then {
	echo "config.h exists. Refresh it manually if necessary. "
}
else {
	echo "$CONFIG_FILE is missing. It will be created now. "
	cd "$LIB_DIR"
	./configure --enable-ub
}
fi
