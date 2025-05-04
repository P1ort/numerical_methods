function ilocz_skalarny(x,y,a,b)
x = [1,2,9]
y = [3,4,9]
a = 0
b = 10
N = length(x)
if length(x) ~= length(y)
    disp("wektory nie sa tej samej dlugosci")
end
if any(x<a | x>b | y<a | y>b)
    disp("wektory musza nalezec do przedzialu a,b")
    return;
end
iloczyn = 0
for i = 1:N
    iloczyn = iloczyn + x(i) * y(i)
end
wynik = iloczyn
wynik_cyfrowo = dot(x,y)

end
    