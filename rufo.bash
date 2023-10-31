#!/bin/bash

#MEM_AVAILABLE_GB=$(awk '/MemAvailable/ { printf "%.3f \n", $2/1024/1024 }' /proc/meminfo)


STEP_TIME=${1}
TOTAL_TIME=${2}

OUTPUT="./ouput.data"

MAX_STEPS=$(( $TOTAL_TIME / $STEP_TIME ))
echo "MAX: ${MAX_STEPS} "


echo "VAL4: ${MEM_AVAILABLE_VALUE_MB}"

for ((i=1; i<= MAX_STEPS; i++)) ; do
   MEM_AVAILABLE_GREP=$(grep "MemAvailable*" /proc/meminfo)

   MEM_AVAILABLE_END=${MEM_AVAILABLE_GREP#*:}
   MEM_AVAILABLE_NOUNIT=${MEM_AVAILABLE_END%* kB}
   MEM_AVAILABLE_VALUE_kB=${MEM_AVAILABLE_NOUNIT##* }
   MEM_AVAILABLE_VALUE_MB=$(($MEM_AVAILABLE_VALUE_kB/1024))
   
   echo "${i} ${MEM_AVAILABLE_VALUE_MB}" >> ${OUTPUT}

   sleep $STEP_TIME
done

file="image.png"
gnuplot <<EOF
set terminal png size 1200,800
set output "$file"
set title "MemoryRam"
set xlabel "Steps"
set ylabel "MemoryAvailable (MB)"
set grid
plot 'ouput.data' with lp
EOF

read -p "Press ENTER to exit"

