#!/bin/sh
# 1414eyedropper.sh by Robert Daeley Apr 2017
# Moves any files from a network folder (e.g. on Dropbox) into a folder on the current computer.
# Then moves original files to a Trash folder.
# Use cron for automated goodness!
# https://github.com/celsius1414/1414eyedropper.sh


#PATHS & SETTINGS
WATCHME="/path/to/network/dir"
PUTHERE="/path/to/where/to/store/stuff"
MYTRASH="/path/to/trash/folder"

##############################################################
#AND HERE WE GO

if [ "$(ls -A ${WATCHME})" ]; then
    NOWISH=$(date +%s)
    mkdir -p $PUTHERE-$NOWISH
    ITEM=$WATCHME/*
    for i in $ITEM
    do
        DESPACED=""
        DESPACED=${i// /-}
        cp -r "$i" "${}/$(basename ${DESPACED})"
        mv "$i" "$MYTRASH/$(basename ${DESPACED})"
    done
fi
