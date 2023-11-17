#!/bin/bash

OUTPUT="./ouput.data"
file="image.png"

gnuplot <<EOF
set terminal png size 1200,800
set output "$file"

set style data lines
set key outside bottom center horizontal

set title "HMI data"
set xlabel "Steps"
set ylabel "MemoryAvailable (MB) and Core usage"
set grid
plot '$OUTPUT' using 1 lw 3 title 'Ram' ,\
plot '$OUTPUT' using 2 lw 3 title 'Core' ,\
EOF




