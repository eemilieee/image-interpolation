function R = bicubic_resize(I, p, q)
    % =========================================================================
    % Se scaleaza imaginea folosind algoritmul de Interpolare Bicubic?.
    % Transforma imaginea I din dimensiune m x n in dimensiune p x q.
    % =========================================================================

    [m n nr_colors] = size(I);

    % TODO: Initializeaza matricea finala drept o matrice nula.
    R = zeros(p,q);
    
    % daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % respectiv s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul [0, n - 1]!

    I = double(I);

    % TODO: Calculeaza factorii de scalare
    % Obs: Daca se lucreaza cu indici in intervalul [0, n - 1], ultimul pixel
    % al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
    % s_x nu va fi q ./ n
    sx = (q-1)./(n-1);
    sy = (p-1)./(m-1);
    
    % TODO: Defineste matricea de transformare pentru redimensionare.
    T = [sx,0;0,sy];
    
    % TODO: Calculeaza inversa transformarii.
    Ti = [1/sx,0;0,1/sy];
    
    % TODO: Precalculeaza derivatele.
    [Ix, Iy, Ixy] = precalc_d(I);
    
    punct_nou = zeros(2,1);
    punct = zeros(2,1);
    % Parcurge fiecare pixel din imagine.
    for y = 0 : p - 1
        for x = 0 : q - 1
            % TODO: Aplica transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.
            punct_nou(1,1) = x;
            punct_nou(2,1) = y;
            
            punct = Ti* punct_nou;
            punct = punct';
            
            x_p = punct(1);
            y_p = punct(2);
            % TODO: Trece (xp, yp) din sistemul de coordonate 0, n - 1 in
            % sistemul de coordonate 1, n pentru a aplica interpolarea.
            x_p = x_p + 1;
            y_p = y_p + 1;
            
            % TODO: Gaseste cele 4 puncte ce inconjoara punctul x, y
            x1 = floor(x_p);
            y1 = floor(y_p);
            x2 = x1 + 1;
            y2 = y1 + 1;
            
            % Daca punctul din stanga-sus se afla pe ultima linie,
            % se "urca" coordonatele y cu o pozitie pentru a preveni
            % iesirea punctelor inconjuratoare din aria fotografiei

            if y1 == m
              y1 = y1 - 1;
              y2 = y2 - 1;
            endif
            
            % Daca punctul din stanga-sus se afla pe ultima coloana,
            % se "muta la stanga" coordonatele x cu o pozitie pentru
            % a preveni iesirea punctelor inconjuratoare
            % din aria fotografiei

            if x1 == n
              x1 = x1 - 1;
              x2 = x2 - 1;
            endif
            
            % TODO: Calculeaza coeficientii de interpolare A.
            coef = bicubic_coef(I, Ix, Iy, Ixy, x1, y1, x2, y2);
            
            % TODO: Trece coordonatele (xp, yp) in patratul unitate, scazand (x1, y1).
            x_p = x_p - x1;
            y_p = y_p - y1;
            
            % TODO: Calculeaza valoarea interpolata a pixelului (x, y).
            % Obs: Pentru scrierea in imagine, x si y sunt in coordonate de
            % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n.
            v1 = [1, x_p, x_p^2, x_p^3];
            v2 = [1, y_p, y_p^2, y_p^3];
            R(y+1, x+1) = v1 * coef * v2';
            
        endfor
    endfor

    % TODO: Transforma matricea rezultata în uint8 pentru a fi o imagine valida.
    R = uint8(R);
    
endfunction





