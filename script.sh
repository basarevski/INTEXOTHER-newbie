#!/bin/bash

LOG_FILE=/var/log/syslog
LOG_FILE_NAME=syslog
CURRENT_DATE=$(date +"%b %d")
EXECUTION_TIME=$(date +"%H:%M:%S")
OUTPUT_PATH=$PWD/output_logs

# Check output folder
if [ ! -d "$OUTPUT_PATH" ]
  then
    mkdir "$OUTPUT_PATH"
fi

# Create log files
if [ -e $LOG_FILE ]
  then
    cat $LOG_FILE | head -n 10 > "$OUTPUT_PATH"/"${EXECUTION_TIME}_${LOG_FILE_NAME}_first-10"
    cat $LOG_FILE | tail -n 10 > "$OUTPUT_PATH"/"${EXECUTION_TIME}_${LOG_FILE_NAME}_last-10"
    awk -v date="$CURRENT_DATE" '$0 ~ date {p=1} p' $LOG_FILE| head -n 10 > "$OUTPUT_PATH"/"${EXECUTION_TIME}_${LOG_FILE_NAME}_today-10"
    cat $LOG_FILE | grep cron > "$OUTPUT_PATH"/"${EXECUTION_TIME}_${LOG_FILE_NAME}_cron-full"
  else
    echo "File $LOG_FILE doesn't exist"
fi

# Remove files older than 10 minutes
find "$OUTPUT_PATH" -type f  -mmin +10 -delete