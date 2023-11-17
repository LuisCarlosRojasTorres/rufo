#!/bin/bash

OUTPUT="./output.data"
file="image.png"

gnuplot <<EOF
set terminal png size 1200,800
set output "$file"
set title "MemoryRam"
set xlabel "Steps"
set ylabel "MemoryAvailable (MB)"
set grid
plot '$OUTPUT' with lp
EOF



