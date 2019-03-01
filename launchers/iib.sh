#!/usr/bin/env sh
#OQ - start/stop iib
#set -x  #log commands

# usage:
#
#   . iib.sh
#
# (source to re-use env variables)
#
# Note that IIB contains it's own JDK

INST_DIR="/opt"
IIB_DIR="$INST_DIR/iib-10.0.0.7"
BIN_DIR="$IIB_DIR/server/bin"
LIB_DIR="$IIB_DIR/server/lib"
ODBC_LIB_DIR="$INST_DIR/lib/odbc"
ODBC_VAR_DIR="/var/mqsi/odbc"

# Returns 0 if the specified string contains the specified substring,
# otherwise returns 1.
contains() {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        return 0    # $substring is in $string
    else
        return 1    # $substring is not in $string
    fi
}

if contains "$PATH" "$IIB_DIR"
then
    echo "$IIB_DIR already in PATH"
else
    echo "Adding $IIB_DIR to PATH..."
    export PATH=$PATH:$IIB_DIR
fi

if contains "$PATH" "$BIN_DIR"
then
    echo "$BIN_DIR already in PATH"
else
    echo "Adding $BIN_DIR to PATH..."
    export PATH=$PATH:$BIN_DIR
fi

if contains "$PATH" "$LIB_DIR"
then
    echo "$LIB_DIR already in PATH"
else
    echo "Adding $LIB_DIR to PATH..."
    export PATH=$PATH:$LIB_DIR
fi

export ODBCINI="$ODBC_VAR_DIR/odbc.ini"
export ODBCSYSINI="$ODBC_VAR_DIR

# Source the mqsiprofile to set up env variables to run IIB mqsi* commands
. mqsiprofile

eval "$IIB_DIR/iib toolkit"

#set +x
