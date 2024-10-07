%% Inhibition
% close all
fun = @lin2hill_inhibitt2;
x0 = [0.001,0.001];
xit2 = fsolve(fun,x0)

figure(1)
Z = 0:1e-4:5e-3;
linearZ = -Z + 0.005;
hill_inhibit_t2 = (xit2(1).*xit2(2).^2)./(xit2(2).^2 + Z.^2);
% subplot(1,2,2)
plot(Z,linearZ,Z,hill_inhibit_t2,'LineWidth',2)
legend('Linear','Hill Function','Location','Best')
xlabel('Z')
xlim([0 5e-3])


%% Inhibition Type 2 Non Biological
close all
fun = @lin2hill_inhibitt2_nb;
x0 = [1,1].*1;
xit2 = fsolve(fun,x0)

figure(1)
Z = 0:1e-1:1;
linearZ = -Z + 1.;
hill_inhibit_t2 = (xit2(1).*xit2(2).^2)./(xit2(2).^2 + Z.^2);
plot(Z,linearZ,Z,hill_inhibit_t2,'LineWidth',2)
legend('Linear','Hill Function','Location','Best')
xlabel('Z')
% xlim([0 5e-3])

%% Activation Non Biological X activate Z
close all
fun = @lin2hill_activate_nb;
x0 = [1,1].*10;
xact = fsolve(fun,x0)

figure(2)
% subplot(1,3,1)
X = 0:1e-1:1;
linearX = X;
hill_activateZbyX = (xact(1).*X.^2)./(xact(2).^2 + X.^2);
plot(X,linearX,X,hill_activateZbyX,'LineWidth',2)
hold on
legend('Linear','Hill Function','Location','Best')
xlabel('X [nM]')
ylabel('Activation of Z by X')
% xlim([0 0.2])


%% Activation Non Biological Y activate Z
close all
fun = @lin2hill_activate_nby;
x0 = [1,1].*10;
xact = fsolve(fun,x0)

figure(2)
% subplot(1,3,1)
X = 0:1e-2:0.1;
linearX = X;
hill_activateZbyX = (xact(1).*X.^2)./(xact(2).^2 + X.^2);
plot(X,linearX,X,hill_activateZbyX,'LineWidth',2)
hold on
legend('Linear','Hill Function','Location','Best')
xlabel('X [nM]')
ylabel('Activation of Z by X')
% xlim([0 0.2])
%% Activation
close all
fun = @lin2hill_activate;
x0 = [0.01,0.01]./1;
xact = fsolve(fun,x0)

figure(2)
subplot(1,3,1)
X = 0:0.01:0.2;
linearX = 0.0005.*X;
hill_activateZbyX = (xact(1).*X.^2)./(xact(2).^2 + X.^2);
plot(X,linearX,X,hill_activateZbyX,'LineWidth',2)
hold on
legend('Linear','Hill Function','Location','Best')
xlabel('X [nM]')
ylabel('Activation of Z by X')
xlim([0 0.2])

subplot(1,3,2)
X = 0:0.01:0.2;
linearX = 0.0005.*X;
hill_activateYbyX = (xact(1).*X.^2)./(xact(2).^2 + X.^2);
plot(X,linearX,X,hill_activateYbyX,'LineWidth',2)
hold on
legend('Linear','Hill Function','Location','Best')
xlabel('X [nM]')
ylabel('Activation of Y by X')
xlim([0 0.2])

subplot(1,3,3)
Y = 0:0.01:0.2;
linearY = 0.0005.*Y;
hill_activateZbyY = (xact(1).*Y.^2)./(xact(2).^2 + Y.^2);
plot(Y,linearY,X,hill_activateZbyY,'LineWidth',2)
hold on
legend('Linear','Hill Function','Location','Best')
xlabel('Y [nM]')
ylabel('Activation of Z by Y')
xlim([0 0.2])


%% Product Activate-Activate X (AND)
close all
clc
fun = @lin4hill_act_act;
x0 = [0.005*100,0.005*50,0.25,0.25-0.11].*1;
xaa = fsolve(fun,x0)
xaa = abs(xaa)

ks = 0.025;
X = 0:0.01:0.2;
linearXaYa = (0.0005 + 0.0005*ks).*X;
hillXaYa = (xaa(1).*xaa(2).*ks^2.*X.^4)./((xaa(3).^2 + X.^2).*(xaa(4).^2 + ks^2.*X.^2));

plot(X,linearXaYa,'LineWidth',2)
hold on
plot(X,hillXaYa,'LineWidth',2)
xlim([0 0.2])
ylim([0 0.0001])

% 0.0136    0.0136    0.0428    0.0428

%% Product Activate-Inhibit X (AND)
close all
clc
fun = @lin4hill_act_inh;
x0 = [0.005*1,0.005*1,0.25*1,0.25].*1;
xai = fsolve(fun,x0)
xai = abs(xai)

ks = 0.025;
X = 0:0.01:0.2;
% X = 0:0.1:1;
linearXaYi = (0.0005 - 0.0005*ks).*X + 0*0.006;
hillXaYi = (xai(1).*xai(2).*xai(4).^2.*X.^2)./((xai(3).^2 + X.^2).*(xai(4).^2 + ks^2.*X.^2));


MSE = (sum(linearXaYi - hillXaYi).^2)./length(linearXaYi)

plot(X,linearXaYi,'LineWidth',2)
hold on
plot(X,hillXaYi,'LineWidth',2)
% xlim([0 0.2])
% ylim([0 0.0002])


%% Sum Activate-Activate X and Y (OR)
close all
funzbyx = @lin2hill_activateZbyX;
x0 = [0.01,0.01]./1;
xactzbyx = fsolve(funzbyx,x0)


X = 0:0.01:0.5;
linearX = 0.0005.*X;
hill_activateZbyX = (xactzbyx(1).*X.^2)./(xactzbyx(2).^2 + X.^2);


funzbyy = @lin2hill_activateZbyY;
x0 = [0.0005,0.0005]./1;
xactzbyy = fsolve(funzbyy,x0)

Y = 0:1e-4:5e-3;
linearY = 0.0005.*Y;
hill_activateZbyY = (xactzbyy(1).*Y.^2)./(xactzbyy(2).^2 + Y.^2);

figure(123)
subplot(2,1,1)
plot(X,linearX,X,hill_activateZbyX,'LineWidth',2)
hold on
legend('Linear','Hill Function','Location','Best')
xlabel('X [nM]')
ylabel('Activation of Z by X')
xlim([0 0.2])

subplot(2,1,2)
plot(Y,linearY,Y,hill_activateZbyY,'LineWidth',2)
hold on
legend('Linear','Hill Function','Location','Best')
xlabel('Y [nM]')
ylabel('Activation of Z by Y')
xlim([0 5e-3])


%% Sum Activate-Inhibit X and Y (OR)
close all
funzbyx = @lin2hill_activateZbyX;
x0 = [0.01,0.01]./1;
xactzbyx = fsolve(funzbyx,x0)


X = 0:0.01:0.5;
linearX = 0.0005.*X;
hill_activateZbyX = (xactzbyx(1).*X.^2)./(xactzbyx(2).^2 + X.^2);


funzbyy = @lin2hill_inhibitt2ZbyY;
x0 = [0.0005,0.0005]./1;
xinzbyy = fsolve(funzbyy,x0)

Y = 0:1e-4:5e-3;
linearY = -0.0005.*Y + 0.006;
hill_inhibitZbyY = (xinzbyy(1).*xinzbyy(2).^2)./(xinzbyy(2).^2 + Y.^2);

figure(123)
subplot(2,1,1)
plot(X,linearX,X,hill_activateZbyX,'LineWidth',2)
hold on
xlim([0 0.2])

subplot(2,1,2)
plot(Y,linearY,Y,hill_inhibitZbyY,'LineWidth',2)
hold on
xlim([0 5e-3])


%% Analysis of stretch rule

% Activation
close all
fun = @stretch_activate;
x0 = [0.01,0.01]./1;
xact = fsolve(fun,x0)

X = 0:0.01:0.2;
linearX = 0.0005.*X;
hill_activateZbyX = (xact(1).*X.^2)./(xact(2).^2 + X.^2);

figure(222)
% subplot(2,3,6)
plot(X,linearX,X,hill_activateZbyX,'LineWidth',2)
hold on
% legend('Linear','Hill Function','Location','Best')
title('10-90 rule')
xlabel('X [a.u.]')
ylabel('Activation of Z by X')
xlim([0 0.2])
xticks([0:0.05:0.2])
sse = sum((linearX - hill_activateZbyX).^2)

% Inhibition 

fun = @stretch_inhibitt2;
x0 = [0.001,0.001];
xit2 = fsolve(fun,x0)

Z = 0:1e-4:5e-3;
linearZ = -Z + 0.005;
hill_inhibit_t2 = (xit2(1).*xit2(2).^2)./(xit2(2).^2 + Z.^2);

figure(223)
% subplot(2,3,6)
plot(Z,linearZ,Z,hill_inhibit_t2,'LineWidth',2)
title('50-50 rule')
% legend('Linear','Hill Function','Location','Best')
xlabel('Z')
xlim([0 5e-3])
xticks([0:1e-3:5e-3])
sse = sum((linearZ - hill_inhibit_t2).^2)
