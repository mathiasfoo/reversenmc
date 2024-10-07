function F = lin2hill_activate(x)

L1 = 0.04;
L2 = 0.16;
g = 0.0005;

F(1) = (x(1).*L1.^2)/(x(2).^2 + L1.^2) - g*L1;

F(2) = (x(1).*L2.^2)/(x(2).^2 + L2.^2) - g*L2;