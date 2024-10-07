function F = lin2hill_activate_nb(x)

Xmax = 1;
L1 = 0.2*Xmax;
L2 = 0.8*Xmax;
g = 1;

F(1) = (x(1).*L1.^2)/(x(2).^2 + L1.^2) - g*L1;

F(2) = (x(1).*L2.^2)/(x(2).^2 + L2.^2) - g*L2;