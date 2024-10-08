function F = lin4hill_act_inh(x)

% Expression ranges from 0  to 2. 
% So, 20% is 0.04 and 80% is 0.16;

Xmax = 0.2+0*0.8;

L1 = 0.2*Xmax;
L2 = 0.8*Xmax;

% ks = 0.95;
ks = 0.025;

alpha_z1l = 0.0005;
alpha_z2l = 0.0005;
% 
% alpha_z1l = 1;
% alpha_z2l = 1;


g = alpha_z1l - alpha_z2l*ks;

% L1 = 0.04;
% L2 = 0.001;
% L3 = 0.16;
% L4 = 0.004;
% g = 0.0005;

Bs = 0*0.006;

% F(1) = (x(1).*L1.^2)/(x(2).^2 + L1.^2) * ((x(3).*x(4).^2)./(x(4).^2 + L2.^2)) - g*L1 + g*L2 - Bs;
% 
% F(1) = (x(1).*L3.^2)/(x(2).^2 + L3.^2) * ((x(3).*x(4).^2)./(x(4).^2 + L4.^2)) - g*L3 + g*L4 - Bs;


F(1) = (x(1).*x(2).*x(4).^2.*L1.^2)/((x(3).^2 + L1.^2)*(x(4).^2 + ks.^2.*L1.^2)) - g*L1 - Bs;

F(2) = (x(1).*x(2).*x(4).^2.*L2.^2)/((x(3).^2 + L2.^2)*(x(4).^2 + ks.^2.*L2.^2)) - g*L2 - Bs;


