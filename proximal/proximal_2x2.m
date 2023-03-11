function out = proximal_2x2(f, STEP)
    % ===================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 f cu puncte intermediare echidistante.
    % f are valori cunoscute în punctele (1, 1), (1, 2), (2, 1) ?i (2, 2).
    % Parametrii:
    % - f = imaginea ce se va interpola;
    % - STEP = distan?a dintre dou? puncte succesive.
    % ===================================================================================
    
    % Se afl? num?rul de puncte.
    n = ceil(1/STEP) + 1;
    
    % TODO: Cele 4 puncte încadratoare vor fi aceleasi pentru toate punctele din interior.
    A = f(1,1);
    B = f(1,2);
    C = f(2,1);
    D = f(2,2);
 
    % TODO: Initializeaza rezultatul cu o matrice nula n x n.
    out = zeros(n,n);

    % Se parcurge fiecare pixel din imaginea finala.
    for i = 1 : n
        for j = 1 : n
            % TODO: Afla cel mai apropiat pixel din imaginea initiala.
            % (se "imparte" imaginea finala in 4 blocuri de dimensiuni
            % egale, fiecarui bloc revenindu-i unul dintre cei 4 pixeli
            % inconjuratori)
            if i <= n/2 && j <= n/2
                punct = A;
            endif
            if i <= n/2 && j > n/2
                punct = B;
            endif
            if i > n/2 && j <= n/2
                punct = C;
            endif
            if i > n/2 && j > n/2
                punct = D;
            endif
            % TODO: Calculeaza pixelul din imaginea finala.
            out(i, j) = punct;
        endfor
    endfor
endfunction