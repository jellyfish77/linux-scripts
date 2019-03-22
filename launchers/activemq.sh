#!/usr/bin/env sh
#OQ - start/stop activemq
#set -x

# e.g. 
#. .activemq.sh start
#. .activemq.sh stop

VERB_ARG=$1

#set these:
INSTALL_DIR='opt'
JAVA_DIR='java/current'
ACTIVEMQ_DIR='apache-activemq-5.15.8'

JAVA_DIR="/$INSTALL_DIR/$JAVA_DIR"
JRE_DIR="$JAVA_DIR/jre/bin"
ACTIVEMQ_DIR="/$INSTALL_DIR/$ACTIVEMQ_DIR/bin"

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

if contains "$PATH" "$ACTIVEMQ_DIR"
then
    echo "$ACTIVEMQ_DIR already in PATH"
else
    echo "Adding $ACTIVEMQ_DIR to PATH..."
    export PATH=$ACTIVEMQ_DIR:$PATH
fi

if contains "$PATH" "$JRE_DIR"
then
    echo "$JRE_DIR already in PATH"
else
    echo "Adding $JRE_DIR to PATH..."
    export PATH=$JRE_DIR:$PATH
fi
  
if contains "$JAVA_HOME" "$JAVA_DIR"
then
    echo "$JAVA_DIR already in JAVA_HOME"
else
    echo "Adding $JAVA_DIR to JAVA_HOME..."    
    export JAVA_HOME=$JAVA_DIR
fi  
  
    
case $VERB_ARG in
    "start") sudo $ACTIVEMQ_DIR/activemq start;;
    "stop") sudo $ACTIVEMQ_DIR/activemq stop;;
esac

#set +x
