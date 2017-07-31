# Losant-Communication
Example Shell scripts to facilitate communication with the Losant Cloud Platform

## First Step

Connect your Omega with the Losant Cloud Platform with just a single command! See: https://github.com/OnionIoT/Losant-Setup-Script

## Receiving Commands from Losant

```
mosquitto_pub -t losant/[DEVICE-ID]/state | sh receive.sh
```


