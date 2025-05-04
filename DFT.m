N = 9;
Q = 5;
x = linspace(-2,2,N)
dx = x(2) - x(1);
lambda = @(x) (abs(x) <= 1) .* (1 - abs(x))
f = lambda(x)
c = zeros(1,N)
for K = 1:N
    for n = 1:N
        c(K) = c(K) + f(n) * exp(j*2*pi*(K-1)*(n-1)/N)
    end
    c(K) = c(K)/N
end
f_aprox = zeros(1,N)
for n = 1:N
    for K = 1:Q
        f_aprox(n) = f_aprox(n) + c(K)*exp(j*2*pi*(K-1)*(n-1)/N)
    end
    f_aprox(n) = real(f_aprox(n))
end
error = abs(f-f_aprox)
subplot(2,1,1)
plot(x,f,'b')
hold on;
plot(x,f_aprox,'r--')
legend('oryginalna funkcja', 'aproksymacja')
subplot(2,1,2)
plot(x,error)
legend('blad aproksymacji')

    