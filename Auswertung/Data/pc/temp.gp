reset

set xrange [-200:200]
set yrange [0:1]
set y2range [-5:5]

set y2tics
set ytics nomirror

p 'ETemporal.dat'  u 1:2 axes x1y1 w l lt 1 , 'ETemporal.dat' u 1:3 axes x1y2 w l lt 2
pause 30
reread
