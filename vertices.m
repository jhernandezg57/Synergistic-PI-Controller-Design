% Calculate the x-coordinates of the rectangle vertices
Kkp_rect = [min(Kkp) + (i - 1) * ancho, min(Kkp) + i * ancho, ...
            min(Kkp) + i * ancho, min(Kkp) + (i - 1) * ancho, ...
            min(Kkp) + (i - 1) * ancho];

% Find intersection points with the Y vector
Kkp_cruce = Kkp(Kkp >= min(Kkp_rect) & Kkp <= max(Kkp_rect));
Kki_cruce = Kki(Kkp >= min(Kkp_rect) & Kkp <= max(Kkp_rect));

% Calculate the y-coordinates of the rectangle vertices
Kki_rect = [min(Kki_cruce), min(Kki_cruce), max(Kki_cruce), ...
            max(Kki_cruce), min(Kki_cruce)];
