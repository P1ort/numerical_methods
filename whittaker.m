x_min = -4;
    x_max = 7;
    N = 15; % Liczba węzłów interpolacyjnych

    % Wybór równomiernie rozmieszczonych węzłów
    x_nodes = linspace(x_min, x_max, N);
    y_nodes = sin(x_nodes); % Przykładowa funkcja do interpolacji

    % Punktowa siatka do rysowania interpolacji
    x_interp = linspace(x_min, x_max, 500);
    
    % Interpolacja Whittakera
    y_interp = zeros(size(x_interp));
    for k = 1:N
        y_interp = y_interp + y_nodes(k) * sinc((x_interp - x_nodes(k)) / (x_nodes(2) - x_nodes(1)));
    end

    % Rysowanie wyników
    figure;
    plot(x_interp, y_interp, 'r', 'LineWidth', 2); % Interpolowana funkcja
    hold on;
    plot(x_nodes, y_nodes, 'bo', 'MarkerFaceColor', 'b'); % Punkty węzłowe
    plot(x_interp, sin(x_interp), 'k--', 'LineWidth', 1.5); % Oryginalna funkcja
    grid on;
    legend('Interpolacja Whittakera', 'Węzły', 'Oryginalna funkcja', 'Location', 'Best');
    xlabel('x');
    ylabel('f(x)');
    title('Interpolacja Whittakera dla f(x) = sin(x)');


