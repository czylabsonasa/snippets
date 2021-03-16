clear ;
% f = @(t,y) (-t+2).*y + (t.^3 - t.^2 + 3*t + 3) ;
f = @(t,y) cos(-2*t).*y + sin(3*t) ;


t0 = 1 ; tv = 5 ;
y0 = -1 ;
n = 100 ;
h = (tv - t0) / n ;

y = y0 ; t = t0 ;
for k=1:n
  y = y + f(t,y)*h ;
  t = t + h ;
end
fprintf("sima       \t %.4f\n",y) ;

n = floor(n/2) ;
h = (tv - t0 )/n ;
y = y0 ; t = t0 ;
for k=1:n
  M1 = f(t,y) ;
  M = f(t+0.5*h, y + M1*0.5*h) ;
  y = y + M*h ;
  t = t + h ;
end
fprintf("kozeppontos\t %.4f\n",y) ;



n = floor(n/2) ;
h = (tv - t0 )/n ;
y = y0 ; t = t0 ;
for k=1:n
  M1 = f(t,y) ;
  M2 = f(t+0.5*h, y + M1*0.5*h) ;
  M3 = f(t+0.5*h, y + M2*0.5*h) ;
  M4 = f(t+h, y + M3*h) ;
  M = (1*M1 +  2*M2 +  2*M3 + 1*M4)/6 ;
  
  y = y + M*h ;
  t = t + h ;
end
fprintf("RKIII      \t %.4f\n",y) ;




[tt,yy] = ode45(f, [t0, tv], y0) ;
fprintf("ode45      \t %.4f\n",yy(end)) ;


% syms y(t)
% egyenlet = diff(y,t) == cos(-2*t)*y + sin(3*t) ;
% % mo = matlabFunction(dsolve(egyenlet, y(t0)==y0)) ;
% dsolve(egyenlet, y(t0)==y0)
% 
% % fprintf("pontos     \t %.4f\n",mo(tv)) ;

