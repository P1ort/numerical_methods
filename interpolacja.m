function [suma] = interpolacja(x,p1,p2,H)
x = 40;
H = 20;
p1 = 0;
p2 = 10;
a = 11/H;
P = -4:a:7;
X = linspace(p1,p2,x);
Y = randn(1,x);
suma = 0;
for k = 1:x
    prod = 1;
    for j = 1:x
        if j ~= k
            prod = prod .* (X - X(j))/(X(k) - X(j))
        end
    end
    suma = suma + Y(k) * prod;
end
        subplot(2,1,1)
        plot(X,suma)
        legend("funkcja z punktami interpolacji");
        hold on;
        grid on;
        plot(X,Y,'or')
        subplot(2,1,2)
        plot(X,suma,'r.')
        grid on;
        legend("wartosci punktow numerycznych")

end