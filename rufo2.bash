#!/bin/bash

FMG_ZIP="average*"


uptime_data=$( uptime )

load_average="${uptime_data##*:}" 
load_average_perMinute="${load_average%%, *}" 

echo "${uptime_data}"
echo "${load_average}"
echo "${load_average_perMinute}"

#read -p "Press ENTER to exit"

