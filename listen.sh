#!/bin/sh

## script to run as part of an /etc/init.d service

# argument defines the Losant Device ID
DEVICE_ID=$1
# command to subscribe to Losant device's command topic and pipe incoming messages to the receive.sh script
mosquitto_sub -t losant/$DEVICE_ID/command | sh /root/losant/receive.sh
