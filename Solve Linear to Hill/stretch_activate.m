function F = stretch_activate(x)

Xmax = 0.2;
L1 = 0.1*Xmax;
L2 = 0.9*Xmax;
g = 0.0005;

F(1) = (x(1).*L1.^2)/(x(2).^2 + L1.^2) - g*L1;

F(2) = (x(1).*L2.^2)/(x(2).^2 + L2.^2) - g*L2;