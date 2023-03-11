function [Y]=SIT(A,B)
    dim=size(A);
    n=dim(1,1);
    for i=1:n
       s=0;
       for j=1:i-1
           s=s+A(i,j)*Y(j);
       endfor
       Y(i)=(B(i,1)-s)*1/A(i,i);
    endfor
 endfunction