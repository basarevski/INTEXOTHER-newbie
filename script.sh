#!/bin/bash

LOG_FILE=/var/log/syslog
LOG_FILE_NAME=syslog
OUTPUT_PATH=/home/vitali/Documents/scriptOutput
CURRENT_DATE=$(date +"%b %d")

if [ -e $LOG_FILE ]
  then
    cat $LOG_FILE | head -n 10 > $OUTPUT_PATH/"${LOG_FILE_NAME}_first-10"
    cat $LOG_FILE | tail -n 10 > $OUTPUT_PATH/"${LOG_FILE_NAME}_last-10"
    awk -v date="$CURRENT_DATE" '$0 ~ date {p=1} p' $LOG_FILE| head -n 10 > $OUTPUT_PATH/"${LOG_FILE_NAME}_today-10"
    cat $LOG_FILE | grep cron > $OUTPUT_PATH/"${LOG_FILE_NAME}_cron-full"
  else
    echo "File $LOG_FILE doesn't exist"
fi
