function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaz? coeficien?ii de Interpolare Bicubic? pentru 4 puncte al?turate
    % =========================================================================

    % TODO: Calculeaz? matricile intermediare.
    M1 = [1,0,0,0; 1,1,1,1; 0,1,0,0; 0,1,2,3;];
    M2 = [f(y1,x1), f(y2,x1), Iy(y1,x1), Iy(y2,x1);
          f(y1,x2), f(y2,x2), Iy(y1,x2), Iy(y2,x2);
          Ix(y1,x1), Ix(y2,x1), Ixy(y1,x1), Ixy(y2,x1);
          Ix(y1,x2), Ix(y2,x2), Ixy(y1,x2), Ixy(y2,x2);];
    M3 = [1,1,0,0; 0,1,1,1; 0,1,0,2; 0,1,0,3;];
    
    % TODO: Converte?te matricile intermediare la double.
    M1 = double(M1);
    M2 = double(M2);
    M3 = double(M3);
    
    % TODO: Calculeaz? matricea final?.
    M1_i = inv(M1);
    M3_i = inv(M3);
    A = M1_i * M2 * M3_i;
    
endfunction