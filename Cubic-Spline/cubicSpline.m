x = [3 4.5 7 9];
y = [2.5 1 2.5 0.5];
grid on;
hold on;
title('Cubic Spline');

n = length(x);
h = zeros(n-1,1);
for j = 1:n-1
h(j) = x(j+1) - x(j);
end

H = zeros(n);
H(1,1)= 1;
H(n,n) = 1;

for i = 2:n-1
H(i,i-1) = h(i-1);
H(i,i) = 2*(h(i-1)+h(i));
H(i,i+1) = h(i);
end

b = zeros(n,1);

for i = 2:n-1
b(i) = (3/h(i))*(y(i+1)-y(i)) - (3/h(i-1))*(y(i)-y(i-1));
end

cj = H\b;

bj = zeros(n-1,1);
for i = 1:n-1
bj(i) = (1/h(i))*(y(i+1)-y(i)) - (1/3*h(i))*(2*cj(i)+cj(i+1));
end

dj = zeros(n-1,1);
for i = 1:n-1
dj(i) = (1/(3*h(i))) * (cj(i+1)-cj(i));
end

P = zeros(n-1,4);
for i = 1:n-1
P(i,1) = dj(i);
P(i,2) = cj(i);
P(i,3) = bj(i);
P(i,4) = y(i);
end

for i = 1:n-1
f = @(x) y(i) + bj(i).*(x-x(i)) + cj(i).*(x-x(i)).^2 + dj(i).*(x-x(i)).^3;
xf = linspace(x(i),x(i+1));
plot(xf,f(xf));
end
