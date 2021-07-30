#!/bin/bash

LOG_FILE=/var/log/syslog
CURRENT_DATE=$(date +"%b %d")

#echo $CURRENT_DATE

if [ -e $LOG_FILE ]
  then
    echo "-------------------- First 10 lines --------------------"
    cat $LOG_FILE | head -n 10
    echo "-------------------- Last 10 lines --------------------"
    cat $LOG_FILE | tail -n 10
    echo "-------------------- First 10 lines as of $CURRENT_DATE  --------------------"
    sed -n "/^$CURRENT_DATE/p" $LOG_FILE | head -n 10
    echo "-------------------- All cron & anacron logs  --------------------"
    cat $LOG_FILE | grep cron
  else
    echo "File $LOG_FILE doesn't exist"
fi
