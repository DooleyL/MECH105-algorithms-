function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
A=zeros(n,m)
for r=1:n
    for c=1:m
        if r==1
            A(r,c)=c;
          
        elseif c==1
            A(r,c)=r;
           
        else
            A(r,c) = A(r-1, c)+A(r, c-1);
            
        end
    end
end
% Now the real challenge is to fill in the correct values of A


end