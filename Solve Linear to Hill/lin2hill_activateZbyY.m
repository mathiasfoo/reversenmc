function F = lin2hill_activateZbyY(x)

Ymax = 5e-3;

L1 = 0.2*Ymax;
L2 = 0.8*Ymax;
alpha_z2l = 0.0005;

F(1) = (x(1).*L1.^2)/(x(2).^2 + L1.^2) - alpha_z2l*L1;

F(2) = (x(1).*L2.^2)/(x(2).^2 + L2.^2) - alpha_z2l*L2;