function [d] = lagrange(xmin, xmax, h)
xmin = -4;
xmax = 7;
h = 10;
    % Generowanie punktów w przedziale
    x = linspace(xmin, xmax, h);
    y = rand(1, h); % Wartości funkcji w punktach X
    
    X = linspace(xmin, xmax, h*10); % Więcej punktów do rysowania wykresu
    P = zeros(size(X)); % Inicjalizacja interpolowanego wielomianu
    
    % Obliczanie interpolacji Lagrange'a
    n = length(x);
    for i = 1:n
        Li = ones(size(X)); 
        for j = 1:n
            if i ~= j
                Li = Li .* (X - x(j)) / (x(i) - x(j));
            end
        end
        P = P + Li * y(i); % Sumowanie wielomianów bazowych
    end
    
    % Rysowanie wykresu
    plot(X, P, 'b-', x, y, 'ro')
    xlabel('X')
    ylabel('Wartości interpolacji')
    title('Interpolacja Lagrange’a')
    
    % Funkcja zwraca wartości wielomianu interpolacyjnego
    d = P; 
end