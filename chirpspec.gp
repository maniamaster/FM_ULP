reset
set terminal epslatex color

set output "chirpspec.tex"


set xlabel "Wellenlänge $\\lambda$ [nm]"
set ylabel "Spektrale Intensität $S$"
set y2label "Spektrale Phase $\\varphi$ [rad]"

set xrange [740:850]
set yrange [0:1]
set y2range [-3:3]

set y2tics
set ytics nomirror

plot "chirpspec.dat" u 1:2 axes x1y1 w l lt 1 lw 2 t "$S$ (opt)", "chirpspec.dat" u 1:(abs($3)) axes x1y2 w l lt 2 lw 2 t "$\\varphi$ (opt)", "chirpspec2.dat" u 1:2 axes x1y1 w l lt 3 lw 2 t "$S$ (komp)", "chirpspec2.dat" u 1:(abs($3)) axes x1y2 w l lt 4 lw 2t "$\\varphi$ (komp)"


set output
