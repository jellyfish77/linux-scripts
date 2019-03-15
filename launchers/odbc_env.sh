# usage:
#
#   . odbc_env.sh
#
# (don't forget to source to set up env of shell)

set -x  #log commands

#ODBC_VAR_DIR="~/odbc"
ODBC_VAR_DIR="/opt/iib-10.0.0.7/ie02/etc"

export ODBCINI="$ODBC_VAR_DIR/odbc.ini"
export ODBCSYSINI="$ODBC_VAR_DIR"

set +x #disable command logging
