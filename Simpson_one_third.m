function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
m = length(x); 
n = m - 1; %length minus 1 to get step size 
s = 0; % s,a,b,c place holders x1,x2,x3
a = 1;
b = 2;
c = 3;
h = x(n)-x(1); 
if length(x) ~= length(y)
    error('input lengths do not match');
else 
    e = linspace(x(1),x(m),m);
    for i = 1:m
        if e(i) ~= x(i)
            error('x is not evenly spaced');
        end
    end
end

if rem(m,2) == 0
    warning ('trapazoid Rule implemented')
    trap = (((x(m)-x(n))/2) .* ((y(n)+(m))));
    if m > 2
        for c = 3:2:n
            s = s+(y(a)+4*y(b)+y(c));
            a = a+2
            b = b+2
            c = c+2
        end
        h = x(n)-x(1)
        simps = (h/(3*(n-1)))*s;
    else
        simps = 0;
    end
    I = simps + trap;
else
    for c = 3:2:m
        s = s+(y(a)+4*y(b)+y(c));
        a = a+2;
        b = b+2;
        c = c+2;
    end
    h = x(m)-x(1);
    I = (h/(3*n))*s;
end
end