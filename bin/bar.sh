#!/bin/ksh

Clock() {
    DATETIME=$(date "+%a %b %d, %T")
    echo -n "$DATETIME"
}

Memory() {
    MEMORY=$(top -b1 | egrep ^Memory | awk '{print $3}' | awk -F '/' '{print $1}')
    echo -n " $MEMORY"
}

wlanip() {
  WLANIP=$(ifconfig iwm0 | grep inet | grep iwm0 | awk '{split($2,a,"%")}; {print a[1]}')
  [[ -n $WLANIP ]] && echo -n " $WLANIP"
}

wifi() {
  WIFI=$(ifconfig iwm0 | egrep ieee80211 | awk '{print $8}' | sed 's/\%//' )
  SSID=$(ifconfig iwm0 | egrep ieee80211 | awk '{print $3}')
  if [ $WIFI -lt 21 ]; then
    echo -n "${SSID} "
  elif [ $WIFI -lt 41 ]; then
    echo -n "${SSID} "
  elif [ $WIFI -lt 61 ]; then
    echo -n "${SSID} "
  elif [ $WIFI -lt 81 ]; then
    echo -n "${SSID} "
  else
    echo -n "${SSID} "  
  fi
}

Battery() {
	battery=$(apm -l)
	battcharge=$(apm -a)
	if [ $battcharge -eq 1 ]; then
		echo -n " ${battery}%"
	elif [ $battery -ge 90 ]; then
		echo -n " ${battery}%"
	elif [ $battery -ge 70 ]; then 
		echo -n " ${battery}%"
	elif [ $battery -ge 50 ]; then
		echo -n " ${battery}%"
	elif [ $battery -le 25 ]; then
		echo -n " ${battery}%"
	else
		echo -n "${battery}%"
	fi
}

Load() {
    LOAD=$(w | head -1 | awk -F ',' '{print $3 $4 $5}' | awk '{print $3" "$4" "$5}')
    echo -n "$LOAD"
}

CPU() {
    CPU=$(top -bn1 | grep "CPUs" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
    echo -n " $CPU"
}

Temp() {
    TEMPERATURE=$(sysctl -n hw.sensors.cpu0.temp0 | sed 's/\.00 degC/°/g')
    echo -n " $TEMPERATURE"
}

Audio() {
    AUDIO=$(mixerctl outputs.master)
    echo -n $AUDIO
}

while true; do
	echo "%{l}  $(wlanip)%{c}$(Clock)%{r}$(CPU)  |  $(Memory)  |  $(Load)  | $(Temp)  |  $(Battery)  "
  sleep 1
done
