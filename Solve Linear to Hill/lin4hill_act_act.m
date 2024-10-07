function F = lin4hill_act_act(x)

% Expression ranges from 0  to 2. 
% So, 20% is 0.04 and 80% is 0.16;

Xmax = 0.2;

L1 = 0.2*Xmax;
L2 = 0.8*Xmax;

% ks = 0.9;%40;
ks = 0.025;

alpha_z1l = 0.0005;
alpha_z2l = 0.0005;

g = alpha_z1l + alpha_z2l*ks;


% alpha_yh = 0.0001;
% K_yh = 0.08;
% delta_yh = 0.02;
% 
% abydh = alpha_yh/delta_yh;
% 
% alpha_yl = 0.0005;
% delta_yl = 0.02;



F(1) = (x(1).*x(2).*ks.*ks.*L1.^4)/((x(3).^2 + L1.^2)*(x(4).^2 + ks.*ks.*L1.^2)) - g*L1;

F(2) = (x(1).*x(2).*ks.*ks.*L2.^4)/((x(3).^2 + L2.^2)*(x(4).^2 + ks.*ks.*L2.^2)) - g*L2;

% F(1) = ((x(1).*L1.^2)/(x(2).^2 + L1.^2))...
%     *((x(3)*((abydh.*L1.^2)/(K_yh.^2 + L1.^2))^2/(x(4).^2 + ((abydh*L1.^2)/(K_yh.^2 + L1.^2))^2)))...
%     - (alpha_z1l + alpha_z2l*(alpha_yl/delta_yl)).*L1;
% 
% 
% F(2) = ((x(1).*L2.^2)/(x(2).^2 + L2.^2))...
%     *((x(3)*((abydh.*L2.^2)/(K_yh.^2 + L2.^2))^2/(x(4).^2 + ((abydh*L2.^2)/(K_yh.^2 + L2.^2))^2)))...
%     - (alpha_z1l + alpha_z2l*(alpha_yl/delta_yl)).*L2;

