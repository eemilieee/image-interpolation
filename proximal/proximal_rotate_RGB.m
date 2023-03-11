function out = proximal_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica Interpolarea Proximala pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % TODO: Extrage canalul rosu al imaginii.
    R = img(:,:,1);
    % TODO: Extrage canalul verde al imaginii.
    G = img(:,:,2);
    % TODO: Extrage canalul albastru al imaginii.
    B = img(:,:,3);
    % TODO: Aplica rotatia pe fiecare canal al imaginii.
    out_R = proximal_rotate(R, rotation_angle);
    out_G = proximal_rotate(G, rotation_angle);
    out_B = proximal_rotate(B, rotation_angle);
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out(:,:,1) = out_R;
    out(:,:,2) = out_G;
    out(:,:,3) = out_B;
 
endfunction