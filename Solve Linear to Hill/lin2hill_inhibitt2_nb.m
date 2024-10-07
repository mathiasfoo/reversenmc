function F = lin2hill_inhibitt2_nb(x)

Zmax = 1;
L1 = 0.2*Zmax;
L2 = 0.8*Zmax;

BL = 1.;

g = 1;

F(1) = (x(1).*x(2).^2)/(x(2).^2 + L1.^2) + g.*L1 - BL;

F(2) = (x(1).*x(2).^2)/(x(2).^2 + L2.^2) + g.*L2 - BL;