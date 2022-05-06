function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
[m,n]=size(A);
if m~=n
    error('The Matrix needs to be a Square Matrix the one provided is not')
end

L = eye(n);
P = L;
U = A;

for k = 1:n-1
    
    if k == 1
        columnCheck = abs(U(k:end,k));
    else
        columnCheck = [zeros(k-1,1); abs(U(k:end,k))];
    end
    [~,index] = max(columnCheck);
    if index ~= k
        tempU1 = U(k,:);
        tempP1 = P(k,:);
        
        U(k,:)=U(index,:);
        U(index,:)=tempU1;
        
        P(k,:)=P(index,:);
        P(index,:)=tempP1;
    end
    for i = k+1:n
        factor = U(i,k)/U(k,k);
        U(i,k) = 0;
        U(i,k+1:n) = U(i,k+1:n)-factor*U(k,k+1:n);
    end
    L = (P*A)/U;
end