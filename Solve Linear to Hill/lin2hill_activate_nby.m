function F = lin2hill_activate_nby(x)

Ymax = 0.1;
L1 = 0.2*Ymax;
L2 = 0.8*Ymax;
g = 1;

F(1) = (x(1).*L1.^2)/(x(2).^2 + L1.^2) - g*L1;

F(2) = (x(1).*L2.^2)/(x(2).^2 + L2.^2) - g*L2;