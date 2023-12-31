#!/bin/bash

#MEM_AVAILABLE_GB=$(awk '/MemAvailable/ { printf "%.3f \n", $2/1024/1024 }' /proc/meminfo)

source config

#STEP_TIME=${1}
#TOTAL_TIME=${2}

echo " - Step time: ${STEP_TIME} "
echo " - Total time: ${TOTAL_TIME} "

OUTPUT="./ouput.data"

if [ -f ${OUTPUT} ] ; then
   echo " - Removing old files."
   rm -f $OUTPUT
fi

MAX_STEPS=$(( $TOTAL_TIME / $STEP_TIME ))
echo " - Number of Steps: ${MAX_STEPS} "

for ((i=1; i<= MAX_STEPS; i++)) ; do
   MEM_AVAILABLE_GREP=$(grep "MemAvailable*" /proc/meminfo)

   MEM_AVAILABLE_END=${MEM_AVAILABLE_GREP#*:}
   MEM_AVAILABLE_NOUNIT=${MEM_AVAILABLE_END%* kB}
   MEM_AVAILABLE_VALUE_kB=${MEM_AVAILABLE_NOUNIT##* }
   MEM_AVAILABLE_VALUE_MB=$(($MEM_AVAILABLE_VALUE_kB/1024))
   MEM_AVAILABLE_VALUE_GB=$(( $MEM_AVAILABLE_VALUE_MB/1024 ))
   
   echo "$((10**9 * 20/7))e-9" 

ADAD=$(( printf %.10f\\n "$((1000000000 *   20/7  ))e-9" ))
echo "TEST ${ADAD}"
   echo " - Step: ${i}"
   echo "${i} ${MEM_AVAILABLE_VALUE_MB}e-3 ${MEM_AVAILABLE_VALUE_GB}" >> ${OUTPUT}

   sleep $STEP_TIME
done

read -p "Press ENTER to exit"

