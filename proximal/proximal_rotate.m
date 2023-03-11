function R = proximal_rotate(I, rotation_angle)
    % =========================================================================
    % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul rotation_angle,
    % aplicând Interpolare Proximala.
    % rotation_angle este exprimat în radiani.
    % =========================================================================
    [m n nr_colors] = size(I);
    
    % Se converteste imaginea de intrare la alb-negru, daca este cazul.
    if nr_colors > 1
        R = -1;
        return
    endif

    I = double(I);
    
    % Obs:
    % Atunci când se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % În Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza în indici de la 1 la n si se inmultesc x si y cu s_x respectiv s_y,
    % atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici în intervalul [0, n - 1].

    % TODO: Calculeaza cosinus si sinus de rotation_angle.
    sinus = sin(rotation_angle);
    cosinus = cos(rotation_angle);
    
    % TODO: Initializeaza matricea finala.
    R = zeros(m, n);
    
    % TODO: Calculeaza matricea de transformare.
    T = [cosinus, -sinus; sinus, cosinus];
    
    % TODO: Inverseaza matricea de transformare, FOLOSIND doar functii predefinite!
    Ti = inv(T);
    
    punct = zeros(2,1);
    punct_nou = zeros(2,1);
    
    % Se parcurge fiecare pixel din imagine.
    for y = 0 : m - 1
        for x = 0 : n - 1
            % TODO: Aplica transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.
            punct_nou(1,1) = x;
            punct_nou(2,1) = y;
            
            punct = Ti * punct_nou;
            punct = punct';
            
            x_p = punct(1);
            y_p = punct(2);
            
            % TODO: Trece (xp, yp) din sistemul de coordonate [0, n - 1] în
            % sistemul de coordonate [1, n] pentru a aplica interpolarea.
            
            x_p = x_p + 1;
            y_p = y_p + 1;
            
            % TODO: Daca xp sau yp se afla în exteriorul imaginii,
            % se pune un pixel negru si se trece mai departe.
            
            if x_p < 1 || x_p > n || y_p < 1 || y_p > m
              R(y+1, x+1) = 0;
            else
              % TODO: Afla punctele ce înconjoara(xp, yp).
              x1 = floor(x_p);
              y1 = floor(y_p);
              x2 = x1 + 1;
              y2 = y1 + 1;
              
              % Daca punctele inconjuratoare sunt in afara imaginii,
              % se pune un pixel negru
              if x1 < 1 || x1 > n || y1 < 1 || y1 > m
                R(y+1, x+1) = 0;
              endif
              
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
              
              % TODO: Calculeaza coeficientii de interpolare notati cu a
              % Obs: Se poate folosi o functie auxiliara în care sau se calculeze coeficientii,
              % conform formulei.
              coef = proximal_coef(I, x1, y1, x2, y2);
              
              % TODO: Calculeaza valoarea interpolata a pixelului (x, y).
              R(y+1, x+1) = coef(1) + coef(2) * x_p + coef(3) * y_p + coef(4) * x_p * y_p;
          endif
          
        endfor
    endfor

    % TODO: Transforma matricea rezultata în uint8 pentru a fi o imagine valida.
    R = uint8(R);
    
endfunction
