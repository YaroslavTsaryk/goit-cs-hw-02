#!/usr/bin/bash

urlArray=("https://google.com" "https://facebook.com" "https://twitter.com" "http://www.yahoo55555.com")


LOG_FILE="check_url.log"

> $LOG_FILE

for url in ${urlArray[@]}; do
  echo $url checking
  res=`curl -s -L --head --request GET "$url" | grep "HTTP/2 200"`
  if [ -n "$res" ]; then
    echo $url is UP
    echo $url is UP >> $LOG_FILE
  else
    echo $url is DOWN
    echo $url is DOWN >> $LOG_FILE
  fi
done

echo Logs saved into $LOG_FILE