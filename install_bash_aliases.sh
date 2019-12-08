#!/bin/bash

INSTALL_SH_FILENAME=`readlink -f $0`
INSTALL_SH_DIRNAME=`dirname $INSTALL_SH_FILENAME`

echo "if [ -f $INSTALL_SH_DIRNAME/bash_aliases.sh ]; then" > $HOME/.bash_aliases
echo "  . $INSTALL_SH_DIRNAME/bash_aliases.sh" >> $HOME/.bash_aliases
echo "fi" >> $HOME/.bash_aliases
