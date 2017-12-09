reset
set term epslatex color solid

set output "temp1.eps"

numbers ="1 3 4 5 6 7"
temp(i)=system("ls */*ETemporal".i.".dat")
insertions = "2.04 2.84 2.5 1.75 1.3 0.7 0"

set xrange [-80:80]
set yrange [0:1]
set y2range [-5:5]

set xlabel "Zeit $t$ [fs]"
set ylabel "Intensität $I$"
set y2label "Phase [rad]"

set y2tics
set ytics nomirror

f(x)=a*(x-b)**2
fit [-10:10] f(x) temp(2) using 1:3 via a,b

plot for [i in numbers] temp(i) u 1:2 axes x1y1 w l lt i dt (4,7,7*i,7) lw 1.5 title "\\tiny$I-$".word(insertions,int(i))."\\;\\text{nm}", temp(2) u 1:2 axes x1y1 w l lc rgb 'black' lw 3.5 title "\\tiny$I-$".word(insertions,int(2))."$\\;\\text{nm (opt)}$", for [i in numbers] temp(i) u 1:(abs($3)) axes x1y2 w l lt i dt 3 lw 1.5 title "\\tiny$\\Phi-$".word(insertions,int(i))."$\\;\\text{nm}$", temp(2) u 1:3 axes x1y2 w l lc rgb 'black' lw 3.5 dt 2 title "\\tiny$\\Phi-".word(insertions,int(2))."$\\;\\text{nm (opt)}$", f(x) axes x1y2 lw 2 title "\\small fit" 

set output
