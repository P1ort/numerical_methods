N = 100;
x = linspace(0,10,N)
f = zeros(1,N)
for i = 1:N
    if abs(x(i) - 1) < 0.5
        f(i) = 1;
    elseif abs(x(i)-1) == 0.5
            f(i) = 0.5;
    else
        f(i) = 0
    end
end
L_val = [2,5,10,20,50]
figure;
hold on;
plot(x,f);
figure;
error = zeros(1,length(L_val));
for idx = 1:length(L_val)
    L = L_val(idx);
    c = zeros(1,L);
    for k = 1:L
        suma = 0;
        for n = 1:N
            suma = suma + f(n) * cos(pi*(k-1)*x(n)/10)
        end
        c(k) = (2/N) * suma
    end
    f_aprox = zeros(size(x))
    for k = 1:L
        f_aprox = f_aprox + c(k) * cos(pi * (k-1) * x/10)
    end
    plot(x,f_aprox)
    legend("1","2","3","4","5")
    hold on;
    error(idx) = mean((f-f_aprox).^2)
end
grid on;
figure;
plot(L_val, error,'ro')

    
