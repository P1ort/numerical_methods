function sklejane(a,b,c)
a = -4; %przedzial 
b = 7;  %przedzial  
c = 100; %liczba rownomiernie rozm. pkt
x = linspace(a,b,c)
y = sin(x);
H = 10;
K = linspace(a,b,H);
f_k = zeros(size(K))
for i = 1:length(K)
    for j = 1:length(x)-1
        if x(j) <= K(i) && K(i) <= x(j+1)
            f_k (i) = y(j) + (y(j+1) - y(j))/(x(j+1) - x(j)) * (K(i) - x(j))
            break;
        end
    end
end
figure;
plot(x,y,'ro');
hold on;
grid on;
plot(K,f_k,'b-');