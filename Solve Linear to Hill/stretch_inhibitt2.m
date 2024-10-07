function F = stretch_inhibitt2(x)

Zmax = 0.005;
L1 = 0.5*Zmax;
L2 = 0.5*Zmax;
BL = 0.005 + 0*0.001;
g = 1;

F(1) = (x(1).*x(2).^2)/(x(2).^2 + L1.^2) + g.*L1 - BL;

F(2) = (x(1).*x(2).^2)/(x(2).^2 + L2.^2) + g.*L2 - BL;