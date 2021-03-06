reset
set terminal epslatex color

# line styles
set style line 1 lt 1 lc rgb '#1B9E77' # dark teal
set style line 2 lt 1 lc rgb '#D95F02' # dark orange
set style line 3 lt 1 lc rgb '#7570B3' # dark lilac
set style line 4 lt 1 lc rgb '#E7298A' # dark magenta
set style line 5 lt 1 lc rgb '#66A61E' # dark lime green
set style line 6 lt 1 lc rgb '#E6AB02' # dark banana
set style line 7 lt 1 lc rgb '#A6761D' # dark tan
set style line 8 lt 1 lc rgb '#666666' # dark gray

# palette
set palette maxcolors 8
set palette defined ( 0 '#1B9E77',\
    	    	      1 '#D95F02',\
                      2 '#7570B3',\
                      3 '#E7298A',\
                      4 '#66A61E',\
                      5 '#E6AB02',\
                      6 '#A6761D',\
                      7 '#666666' )

set output "temp1.tex"

numbers ="1 3 4 5 6 7"
temp(i)=system("ls */*ETemporal".i.".dat")
insertions = "2.04 2.84 2.5 1.75 1.3 0.7 0"

set xrange [-80:80]
set yrange [0:1]
set y2range [-5:5]

set xlabel "Zeit $t$ [fs]"
set ylabel "Intensität $I$"
set y2label "Phase $\\Phi$ [rad]"

set y2tics
set ytics nomirror

f(x)=2**(-1)*a*(x-b)**2
fit [-10:10] f(x) temp(2) using 1:3 via a,b

plot for [i in numbers] temp(i) u 1:2 axes x1y1 w l lt i dt (4,7,7*i,7) lw 1.5 title "\\tiny$I:".word(insertions,int(i))."\\;\\text{nm}$", temp(2) u 1:2 axes x1y1 w l lc rgb 'black' lw 3.5 title "\\tiny$I:".word(insertions,int(2))."\\;\\text{nm (opt)}$", for [i in numbers] temp(i) u 1:(abs($3)) axes x1y2 w l lt i dt 3 lw 1.5 title "\\tiny$\\Phi:".word(insertions,int(i))."\\;\\text{nm}$", temp(2) u 1:3 axes x1y2 w l lc rgb 'black' lw 3.5 dt 2 title "\\tiny$\\Phi:".word(insertions,int(2))."\\;\\text{nm (opt)}$", f(x) axes x1y2 lw 2 title "\\small$\\text{fit}$" 

set output
