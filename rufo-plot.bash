#!/bin/bash

STEP_TIME=${1}
TOTAL_TIME=${2}

OUTPUT="./ouput.data"

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



