function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
% test number of arguements 
if nargin < 3
    error('not enough inputs');
end
if nargin<4
    es = 0.0001;
end
if nargin<5
    maxit = 200;
end
if nargin >6
    error('too many arguments')
end

%run equation
ea = 100;
xIpre = 0;
iter = -1;
while ea>es
    if iter>maxit
        break %works?
    else xInew = xu - (((xl-xu)*func(xu))/(func(xl)-func(xu)));
        ea = (xInew - xIpre)/xInew;
        if (func(xInew) * xu) < 0
            xu = xInew;
        elseif (func(xInew)*xl)<0
            xl = xInew;
        end
        xIpre = xInew;
    end
    iter = iter + 1;
end
root = xInew; %root - predicted root
fx = func(xInew); %fx - function at root
%ea - aproximate error 
%iter - # of iterations 

end
