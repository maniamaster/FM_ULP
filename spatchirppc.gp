reset
set terminal epslatex color

set output "pcpft.tex"

set xlabel "Insertion $I$ [nm]"
set ylabel "Spatial chirp [$\\times 10^{-5} \\Delta \\lambda/\\Delta x$]"
set y2label "PFT [fs/mm]"

set y2tics
set ytics nomirror

p "spatchirppc.dat" u 1:2 axes x1y1 t "Spatial Chirp" ps 2, "spatchirppc.dat" u 1:3 axes x1y2 t "PFT" ps 2 lc rgb "blue"

set output
