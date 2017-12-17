reset
set terminal epslatex color

set output "longpass.tex"


set xrange [-80:80]
set yrange [0:1]
set y2range [-5:5]

set xlabel "Zeit $t$ [fs]"
set ylabel "Intensität $I$"
set y2label "Phase $\\Phi$ [rad]"

set y2tics
set ytics nomirror


plot "nolongtemp.dat" u 1:2 axes x1y1 w l lt 1 lw 2 t "$I$ LP (opt)", "nolongtemp.dat" u 1:3 axes x1y2 w l lt 2 lw 2 t "$\\Phi$ LP (opt)", "longtemp.dat" u 1:2 axes x1y1 w l lt 3 lw 2 t "$I$ LP (komp)", "longtemp.dat" u 1:3 axes x1y2 w l lt 4 lw 2t "$\\Phi$ LP (komp)", "longtempopt.dat" u 1:2 axes x1y1 w l lt 5 lw 2 t "$I$ ohne LP", "longtempopt.dat" u 1:3 axes x1y2 w l lt 7 lw 2t "$\\Phi$ ohne LP"


set output
