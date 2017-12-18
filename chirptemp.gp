reset
set terminal epslatex color

set output "chirptemp.tex"


set xlabel "Zeit $t$ [fs]"
set ylabel "Intensität $I$"
set y2label "Phase $\\Phi$ [rad]"

set yrange [0:1]
set y2range [-5:5]

set y2tics
set ytics nomirror

plot "chirptemp.dat" u 1:2 axes x1y1 w l lt 1 lw 2 t "$I$ (opt)", "chirptemp.dat" u 1:(abs($3)) axes x1y2 w l lt 2 lw 2 t "$\\Phi$ (opt)", "chirptemp2.dat" u 1:2 axes x1y1 w l lt 3 lw 2 t "$I$ (komp)", "chirptemp2.dat" u 1:(abs($3)) axes x1y2 w l lt 4 lw 2t "$\\Phi$ (komp)"


set output
