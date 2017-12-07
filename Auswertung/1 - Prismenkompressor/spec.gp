reset

numbers ="1 3 4 5 6 7"
spec(i)=system("ls */*ESpectral".i.".dat")

set xrange [740:850]
set yrange [0:1]
set y2range [-3:3]

set y2tics
set ytics nomirror

b=700
f(x)=a*(x-b)**2
fit  [740:830] f(x) spec(2) using 1:(abs($3)) via a,b

plot for [i in numbers] spec(i) u 1:2 axes x1y1 w l lt i dt (4,7,7*i,7) lw 1.5 title i, f(x) axes x1y2 lw 2 title 'fit', spec(2) u 1:2 axes x1y1 w l lc rgb 'black' lw 3.5 title 'opt', for [i in numbers] spec(i) u 1:(abs($3)) axes x1y2 w l lt i dt 3 lw 1.5 title i, spec(2) u 1:(abs($3)) axes x1y2 w l lc rgb 'black' lw 3.5 dt 2 title 'opt phase' 


pause 30
reread
