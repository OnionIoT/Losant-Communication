# Losant-Communication
Example Shell scripts to facilitate communication with the Losant Cloud Platform

## First Step

Connect your Omega with the Losant Cloud Platform with just a single command!  

**See: https://github.com/OnionIoT/Losant-Setup-Script**


## Sending State Values to Losant

The `send.sh` script collects data, formats it in a Losant-friendly JSON object, and outputs it to stdout. Use it as the message payload when publishing to your device's state topic:

```
mosquitto_pub -t losant/[DEVICE-ID]/state -m "$(sh send.sh)"
```

## Receiving Commands from Losant

The `receive.sh` script parses JSON-formatted command messages received from Losant and executes the appropriate actions. It parses data from stdin, so pipe the messages from your device's command topic to the script:

```
mosquitto_sub -t losant/[DEVICE-ID]/command | sh receive.sh
```

## Your Own Twist

To customize the two scripts, look for comments with `YOUR TURN`, they will indicate what should be added.
