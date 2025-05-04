function [C_int,error] = calka(c,a)
c = [5,5,5,2] % wielomian 5x^3 + 5x^2 + 5x + 2
a = 5 % stala calkowania
n = length(c)
C_int = zeros(1,n+1)
for i = 1:n
    C_int(i) = c(i)/(n-i+1)
end
C_int(end) = a
C_ref = polyint(c,a)
error = norm(C_int - C_ref)
if error < 1*exp(-20)
    disp("jest ok")
else
    disp("blad za duzy");
end
end