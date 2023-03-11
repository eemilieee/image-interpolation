function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia.
    % =========================================================================
    
    % Obtinem dimensiunea imaginii.
    [m n nr_colors] = size(I);
    
    % TODO: Tranforma matricea I in double.
    I = double(I);
    
    % TODO: Calculeaza matricea cu derivate fata de x Ix.
    Iy = zeros(m, n);
    
    for i = 1:m
      for j = 1:n
          Iy(i,j) = fy(I, j, i);
      endfor
    endfor
    
    Iy = double(Iy);
    % TODO: Calculeaza matricea cu derivate fata de y Iy.
    Ix = zeros(m, n);
    
    for i = 1:m
      for j = 1:n
          Ix(i,j) = fx(I, j, i);
      endfor
    endfor

    Ix = double(Ix);
    % TODO: Calculeaza matricea cu derivate fata de xy Ixy.
    Ixy = zeros(m, n);
    
    for i = 1:m
      for j = 1:n
          Ixy(i,j) = fxy(I, j, i);
      endfor
    endfor

    Ixy = double(Ixy);
endfunction
