reset

set term epslatex color solid
set output "spec1.eps"

numbers ="1 3 4 5 6 7"
spec(i)=system("ls */*ESpectral".i.".dat")

insertions = "2.04 2.84 2.5 1.75 1.3 0.7 0"

set xrange [740:850]
set yrange [0:1]
set y2range [-3:3]

set y2tics
set ytics nomirror

set xlabel "Wellenlänge $\\lambda$ [nm]"
set ylabel "Spektrale Intensität $S$"
set y2label "Phase $\\Phi$ [rad]"

a=0.00036*2
b=-790
f(x)=2**(-1)*a*(x-b)**2
fit  [740:830] f(x) spec(2) using 1:(abs($3)) via a,b

plot for [i in numbers] spec(i) u 1:2 axes x1y1 w l lt i dt (4,7,7*i,7) lw 1.5 title "\\tiny$S:".word(insertions,int(i))."\\;\\text{nm}$", spec(2) u 1:2 axes x1y1 w l lc rgb 'black' lw 3.5 title "\\tiny$S:".word(insertions,int(2))."\\;\\text{nm (opt)}$", for [i in numbers] spec(i) u 1:(abs($3)) axes x1y2 w l lt i dt 3 lw 1.5 title "\\tiny$\\Phi:".word(insertions,int(i))."\\;\\text{nm}$", spec(2) u 1:(abs($3)) axes x1y2 w l lc rgb 'black' lw 3.5 dt 2 title "\\tiny$\\Phi:".word(insertions,int(2))."\\;\\text{nm (opt)}$", f(x) axes x1y2 lw 2 title 'fit'


set output
