reset

set term epslatex color solid
set output "spec2.tex"

numbers ="1 2 3 4 5"
spec(i)=system("ls ".i."*/*ESpectral.dat")

insertions = "0.95 1.45 1.95 2.45 2.84"

set xrange [750:850]
set yrange [0:1]
set y2range [-5:5]

set xlabel "Wellenllänge $\\lambda$ [nm]"
set ylabel "Spektrale Intensität $S$"
set y2label "Phase $\\Phi$ [rad]"

set y2tics
set ytics nomirror

b=797
f(x)=a*(x-b)**2
fit [790:810] f(x) spec(5) using 1:(abs($3))via a,b

plot for [i in numbers] spec(i) u 1:2 axes x1y1 w l lt i dt (4,7,7*i,7) lw 1.5 title "\\tiny$S:".word(insertions,int(i))."\\;\\text{nm}$", spec(5) u 1:2 axes x1y1 w l lc rgb 'black' lw 3.5 title "\\tiny$S:".word(insertions,int(5))."\\;\\text{nm (opt)}$", for [i in numbers] spec(i) u 1:(abs($3)) axes x1y2 w l lt i dt 3 lw 1.5 title "\\tiny$\\Phi:".word(insertions,int(i))."\\;\\text{nm}$", spec(5) u 1:(abs($3)) axes x1y2 w l lc rgb 'black' lw 3.5 dt 2 title "\\tiny$\\Phi:".word(insertions,int(5))."\\;\\text{nm (opt)}$", f(x) axes x1y2 lw 2 lc rgb "red" title 'fit'

#plot for [i in numbers] spec(i) u 1:2 axes x1y1 w l lt i dt (4,7,7*i,7) lw 1.5 title i, f(x) axes x1y2 lw 2 lc rgb 'red' title 'fit', spec(5) u 1:2 axes x1y1 w l lc rgb 'black' lw 3.5 title 'opt', for [i in numbers] spec(i) u 1:(abs($3)) axes x1y2 w l lt i dt 3 lw 1.5 title i, spec(5) u 1:(abs($3)) axes x1y2 w l lc rgb 'black' lw 3.5 dt 2 title 'opt phase' 

set output
