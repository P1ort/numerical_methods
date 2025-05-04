
    
   



function X = Cardano(A)
     A = [6, 5, 3, 6]
    
    % Pobranie współczynników
    a3 = A(1);
    a2 = A(2);
    a1 = A(3);
    a0 = A(4);
    
    % Przekształcenie do postaci zredukowanej: y^3 + py + q = 0
    p = (3*a3*a1 - a2^2) / (3*a3^2);
    q = (2*a2^3 - 9*a3*a2*a1 + 27*a3^2*a0) / (27*a3^3);
    
    % Obliczenie dyskryminantu
    D = (q^2)/4 + (p^3)/27;
    
    if D > 0
        % Jeden pierwiastek rzeczywisty, dwa zespolone
        u = nthroot(-q/2 + sqrt(D), 3);
        v = nthroot(-q/2 - sqrt(D), 3);
        
        Y(1) = u + v;
        Y(2) = (-1/2) * (u + v) + (sqrt(3)/2) * (u - v) * 1j;
        Y(3) = (-1/2) * (u + v) - (sqrt(3)/2) * (u - v) * 1j;
    else
        % Trzy pierwiastki rzeczywiste
        phi = acos(-q / (2 * sqrt(-p^3 / 27)));
        Y(1) = 2 * sqrt(-p/3) * cos(phi / 3);
        Y(2) = 2 * sqrt(-p/3) * cos((phi + 2*pi) / 3);
        Y(3) = 2 * sqrt(-p/3) * cos((phi + 4*pi) / 3);
    end
    
    % Przekształcenie do pierwiastków x
    X = Y - a2 / (3 * a3);
    
    % Wyświetlenie wyniku
    x = linspace(-10,10,1000)
    y = 6*x.^3 + 5*x.^2 + 3*x + 6
    plot(x,y)
    hold on
    plot(X,'r.')
    grid on;
    disp('Pierwiastki równania:');
    disp(X);
end