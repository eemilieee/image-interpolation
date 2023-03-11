function r = fx(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x a lui f in punctul (x, y).
    % =========================================================================

    % TODO: Calculeaza derivata.
    [m, n] = size(f);
    ok = 1;
    r = 0;
    
    % Verificarea coordonatei x (sa nu fie in afara imaginii)
    if x + 1 > n || x - 1 < 1
      ok = 0;
    endif
    
    if ok ~= 0
      r = (f(y, x+1) - f(y, x-1))/2;
    endif

endfunction