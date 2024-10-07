function F = lin2hill_activateZbyX(x)

Xmax = 0.2;

L1 = 0.2*Xmax;
L2 = 0.8*Xmax;
alpha_z1l = 0.0005;

F(1) = (x(1).*L1.^2)/(x(2).^2 + L1.^2) - alpha_z1l*L1;

F(2) = (x(1).*L2.^2)/(x(2).^2 + L2.^2) - alpha_z1l*L2;