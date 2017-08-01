#!/bin/sh

## script to parse JSON commands received from the Losant Cloud Platform

# include the json sh library
. /usr/share/libubox/jshn.sh

# function to parse messages received from Losant
parseReceived () {
	# parse received json
	json_init
	json_load $1

	# read the command and arguments
	json_get_var cmd name
	json_get_var argument payload

	# take action based on the command
	if [ "$cmd" == "expled" ]; then
		handleExpLed $argument
	fi
	## YOUR TURN: extend this 'if' statement with your custom command that calls your very own handler function
}

# program the Expansion Dock LED - handler for the 'expled' command
handleExpLed () {
	# only call expled if an argument is present
	colour="$1"
	if [ "$colour" != "" ]; then
		expled $colour > /dev/null
	fi
}

## YOUR TURN: add your own handler functions


# main script - loop reading stdin
while read input
do
	parseReceived $input
done
