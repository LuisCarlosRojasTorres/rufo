#!/bin/bash

#MEM_AVAILABLE_GB=$(awk '/MemAvailable/ { printf "%.3f \n", $2/1024/1024 }' /proc/meminfo)

STEP_TIME=${1}
TOTAL_TIME=${2}

MAX_STEPS=$(( $TOTAL_TIME / $STEP_TIME ))
echo "MAX: ${MAX_STEPS} "

MEM_AVAILABLE_GREP=$(grep "MemAvailable*" /proc/meminfo)

MEM_AVAILABLE_END=${MEM_AVAILABLE_GREP#*:}
MEM_AVAILABLE_NOUNIT=${MEM_AVAILABLE_END%* kB}
MEM_AVAILABLE_VALUE_kB=${MEM_AVAILABLE_NOUNIT##* }
MEM_AVAILABLE_VALUE_MB=$(($MEM_AVAILABLE_VALUE_kB/1024))

echo "VAL4: ${MEM_AVAILABLE_VALUE_MB}"

for ((i=1; i<= MAX_STEPS; i++)) ; do
   echo "LOBO"
   sleep $STEP_TIME
done

read -p "Press ENTER to exit"

