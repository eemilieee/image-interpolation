function r = fxy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x si y a lui f in punctul (x, y).
    % =========================================================================
    
    % TODO: Calculeaza derivata.
    [m, n] = size(f);
    ok = 1;
    r = 0;
    
    % Verificarea coordonatelor x si y (sa nu fie in afara imaginii)
    if x + 1 > n || x - 1 < 1 || y + 1 > m || y - 1 < 1
      ok = 0;
    endif
    
    if ok ~= 0
      r = (f(y-1, x-1) + f(y+1, x+1) - f(y-1, x+1) - f(y+1, x-1))/4;
    endif
  
endfunction