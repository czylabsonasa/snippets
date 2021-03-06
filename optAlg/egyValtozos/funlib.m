% ARORA / ch1 / problem 8

fun1 = @(t) 204165.5 ./ (330.0 - 2.0*t) + 10400.0 ./ (t-20.0) ;
dfun1 = @(t) 2*204165.5 ./ (330.0 - 2.0*t).^2  - 10400.0 ./ (t-20.0).^2 ;
ddfun1 = @(t) 2*2*2*204165.5 ./ (330.0 - 2.0*t).^3 + 2*10400.0 ./ (t-20.0).^3 ;

fun1_t1 = struct(...
   'f', fun1,...
   'df', dfun1,...
   'ddf', ddfun1,...
   'a', 40,...
   'b', 90,...
   'npts', 10000,...
   'xtol', 1e-6,...
   'ftol', 1e-18,...
   'maxit', 300,...
   'x0', 65,...
   'name','fun1_t1'...
) ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% http://infinity77.net/global_optimization/test_functions_1d.html / problem 4
fun2 = @(x) -(16*x.^2 - 24*x + 5).*exp(-x) ;
dfun2 = @(x) (16*x.^2 - 56*x +29).*exp(-x) ;
ddfun2 = @(x) -(16*x.^2 - 88*x + 85).*exp(-x) ;

fun2_t1 = struct(...
  'f', fun2,...
  'df', dfun2,...
  'ddf', ddfun2,...
  'a', 2,...
  'b', 4,...
  'npts', 10000,...
  'xtol', 1e-6,...
  'ftol', 1e-18,...
  'maxit', 100,...
  'x0', 3,...
  'name','fun2_t1'...
) ;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% http://infinity77.net/global_optimization/test_functions_1d.html / problem 18
fun3 = @(x) pre_fun3(x) ;
dfun3 = @(x) pre_dfun3(x) ;
ddfun3 = @(x) pre_ddfun3(x) ;

fun3_t1 = struct(...
  'f', fun3,...
  'df', dfun3,...
  'ddf', ddfun3,...
  'a', 1,...
  'b', 5,...
  'npts', 10000,...
  'xtol', 1e-6,...
  'ftol', 1e-18,...
  'maxit', 100,...
  'x0', 0,...
  'name','fun3_t1'...
) ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ARORA ch1 / page 50

fun4 = @(x) 2.0*(x-3).^2 + exp(0.5*x.^2) ;
dfun4 = @(x) 4.0*(x-3) + exp(0.5*x.^2).*x ;
ddfun4 = @(x) 4.0 + exp(0.5*x.^2).*(x.^2 + 1)  ;

fun4_t1 = struct(...
  'f', fun4,...
  'df', dfun4,...
  'ddf', ddfun4,...
  'a', 0,...
  'b', 10,...
  'npts', 10000,...
  'xtol', 1e-6,...
  'ftol', 1e-18,...
  'maxit', 200,...
  'x0', 5,...
  'name','fun4_t1'...
) ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ARORA ch1 / page 51 / table 2.6

fun5 = @(x) -4.0*x.*sin(x) ;
dfun5 = @(x) -4.0*sin(x) - 4.0*x.*cos(x) ;
ddfun5 = @(x) -4.0*cos(x) -4.0*cos(x) + 4.0*x.*sin(x)  ;

fun5_t1 = struct(...
  'f', fun5,...
  'df', dfun5,...
  'ddf', ddfun5,...
  'a', 0.1,... % 0-ban maximuma van
  'b', pi,...
  'npts', 10000,...
  'xtol', 1e-2,...
  'ftol', 1e-18,...
  'maxit', 100,...
  'x0', 0.5*pi,...
  'name','fun5_t1'...
) ;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% nem egysoros függvények


function y=pre_fun3(x)
  y = zeros(size(x)) ;
  id = x<3 ;
  y(id) = (x(id)-2).^2 ;
  id = not(id) ;
  y(id) = 2.0*log(x(id)-2)+1 ;
end

function y=pre_dfun3(x)
  y = zeros(size(x)) ;
  id = x<3 ;
  y(id) = 2*(x(id)-2) ;
  id = not(id) ;
  y(id) = 2.0 ./ (x(id)-2);
end


function y=pre_ddfun3(x)
  y = zeros(size(x)) ;
  id = x<3 ;
  y(id) = 2 ;
  id = not(id) ;
  y(id) = -2.0 ./ (x(id)-2).^2 ;
end

