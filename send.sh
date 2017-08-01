#!/bin/sh

## script to generate a json string to send to Losant Cloud Platform

# include the json sh library
. /usr/share/libubox/jshn.sh


# function to add free memory to the json object
addFreeMem () {
	# find the amount of free memory
	freeMem=$(cat /proc/meminfo | grep MemFree | sed -e 's/MemFree:[[:space:]]*//' -e 's/ kB//')

	# add it to the json object
	json_add_int freeMemory $freeMem
}

## YOUR TURN: add a function to measure/collect data, and then add it to the JSON object



# main script -
# 	1) create a json object formatted for Losant
#	2) populate it with the desired data
#	3) output it to stdout
json_init
json_add_object data

# functions that add to 'data' object
addFreeMem
## YOUR TURN: place your own functions that add to the 'data' object here

# close the 'data' object
json_close_object

# print the entire json object to stdout
json_dump
