%% Inhibition Type 1
close all
fun = @lin2hill_inhibitt1;
x0 = [0.001,0.001];
xit1 = fsolve(fun,x0)

figure(1)
Z = 0:1e-4:5e-3;
linearZ = -Z + 0.005;
hill_inhibit_t1 = xit1(1)./(xit1(2).^2 + Z.^2);
subplot(1,2,1)
plot(Z,linearZ,Z,hill_inhibit_t1)
legend('Linear','Hill Function','Location','Best')
xlabel('Z')
xlim([0 5e-3])

% Inhibition Type 2
% close all
fun = @lin2hill_inhibitt2;
x0 = [0.001,0.001];
xit2 = fsolve(fun,x0)

figure(1)
Z = 0:1e-4:5e-3;
linearZ = -Z + 0.005;
hill_inhibit_t2 = (xit2(1).*xit2(2).^2)./(xit2(2).^2 + Z.^2);
% subplot(1,2,2)
plot(Z,linearZ,Z,hill_inhibit_t2)
legend('Linear','Hill Function','Location','Best')
xlabel('Z')
xlim([0 5e-3])

%% Activation
close all
fun = @lin2hill_activate;
x0 = [0.01,0.01]./1;
xact = fsolve(fun,x0)

figure(2)
X = 0:0.01:0.2;
linearX = 0.0005.*X;
hill_activate = (xact(1).*X.^2)./(xact(2).^2 + X.^2);
plot(X,linearX,X,hill_activate)
hold on
legend('Linear','Hill Function','Location','Best')
xlabel('X')
xlim([0 0.2])

%% Product activate-inhibit 2 DOF
close all
fun = @lin2hill_2levels;
x0 = [0.2,0.2]*20;
x2dof = fsolve(fun,x0)

figure(3)
X = 0:0.01:0.6;
linear2level = X;
subplot(1,2,1)
% hill2level = (0.235).^2.*X.^2./(sqrt(0.067).^2 + X.^2).^2;
hill2level = x2dof(1).^2.*X.^2./(x2dof(2).^2 + X.^2).^2;
plot(X,linear2level,X,hill2level)
legend('Linear','Hill Function (2DOF)','Location','Best')
xlabel('X')


% Product activate-inhibit 4 DOF
% close all
fun = @lin2hill_4levels;
x0 = [0.25,0.25,0.25,0.25].*1.5;
% x0 = [0.005,0.005,0.005,0.005].*4;
x4dof = fsolve(fun,x0)

figure(3)
X = 0:0.01:0.6;
linear2level = 0.0005*X;
subplot(1,2,2)
% hill2level = sqrt(0.0144).^2.*X.^2./(sqrt(0.0224).^2 + X.^2).^2;
% hill2level = x4dof(1).*x4dof(2).*X.^2./((x4dof(3).^2 + X.^2).*(x4dof(4).^2 + X.^2));
hill2level = x4dof(1).*x4dof(2).*x4dof(4)^2.*X.^2./((x4dof(3).^2 + X.^2).*(x4dof(4).^2 + X.^2));
plot(X,linear2level,X,hill2level)
legend('Linear','Hill Function (4DOF)','Location','Best')
xlabel('X')


% Summation of activate and inhibit


%% % Inhibition Type 2 for IFFL 
% close all
fun = @lin2hill_inhibitt2;
x0 = [0.005,0.2683];
xit2 = fsolve(fun,x0)

figure(1)
Z = 0:1e-4:5e-3;
linearZ = -0.0005.*Z + 0.005+0.001;
hill_inhibit_t2 = (xit2(1).*xit2(2).^2)./(xit2(2).^2 + Z.^2);
% subplot(1,2,2)
plot(Z,linearZ,Z,hill_inhibit_t2)
legend('Linear','Hill Function','Location','Best')
xlabel('Z')
% xlim([0 5e-3])

%% Product Activate-Inhibit to Sum of Activate-Inhibit
close all
fun = @lin2hill_product_sum;
x0 = [0.005,0.2683,0.005,0.2683];
xp = fsolve(fun,x0)

figure(6)
X = 0:0.01:0.2;
Y = 0:1e-4:2e-3;
linearXY = 0.0005.*X - 0.0005.*Y + 0.006;
hillXY = ((xp(1).*X.^2)./(xp(2).^2 + X.^2)).*((xp(3).*xp(4))./(xp(4).^2 + Y.^2));
plot(linearXY)
hold on
plot(hillXY)

