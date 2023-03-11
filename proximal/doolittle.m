function [L U]=doolittle(A)
dim=size(A);
n=dim(1,1);
L=eye(n);
U=zeros(n);
for p=1:n
    for j=p:n
        U(p,j)=A(p,j)-L(p,1:p-1)*U(1:p-1,j);
    endfor
    for i=p+1:n
        L(i,p)=(A(i,p)-L(i,1:p-1)*U(1:p-1,p))*1/U(p,p);
    endfor
endfor
endfunction