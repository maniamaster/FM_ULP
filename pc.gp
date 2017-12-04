reset


f(x)=a*x+b
fit f(x) 'pc.txt' via a,b
plot f(x), 'pc.txt' u 1:2
pause 30
reread

