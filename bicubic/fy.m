function r = fy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de y a lui f in punctul (x, y).
    % =========================================================================
    
    % TODO: Calculeaza derivata.
    [m, n] = size(f);
    ok = 1;
    r = 0;
    
    % Verificarea coordonatei y (sa nu fie in afara imaginii)
    if y + 1 > m || y - 1 < 1
      ok = 0;
    endif
    
    if ok ~= 0
      r = (f(y+1,x) - f(y-1,x))/2;
    endif
    
endfunction