%Pl�nio Ant�nio de Moraes Neto
%Universidade Federal de Uberl�ndia
%Equacionamento do estado triplo de tens�o
%19/09/2020
%----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%Inicializa��o
clear 
clc
close all

%Vari�veis de Entrada
fprintf('Dados: \n \n')
prompt_x = 'Sigma X = ';
prompt_y = 'Sigma Y = ';
prompt_z = 'Sigma Z = ';
prompt_tauxy = 'Tau XY = ';
prompt_tauxz = 'Tau XZ = ';
prompt_tauyz = 'Tau YZ = ';

sigma_x = input(prompt_x);
sigma_y = input(prompt_y); 
sigma_z = input(prompt_z);

tau_xy = input(prompt_tauxy);
tau_yz = input(prompt_tauyz);
tau_xz = input(prompt_tauxz);

%l = 0.669;
%m = 0.326;
%n = 0.668;

mat = [sigma_x tau_xy tau_xz; tau_xy sigma_y tau_yz; tau_xz tau_yz sigma_z]; 
%----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%C�lculo dos Invariantes

i1 = sigma_x + sigma_y + sigma_z;

i2 = sigma_x*sigma_y + sigma_x*sigma_z + sigma_z*sigma_y - tau_xy^2 - tau_yz^2 - tau_xz^2;

i3 = det(mat);
%----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%C�lculo das tens�es normais principais

s = [1 -i1 i2 -i3];
raiz = sort(roots(s));
%----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%C�lculo das m�ximas tens�es tangenciais

t = [((raiz(3)-raiz(1))/2) ((raiz(2)-raiz(1))/2) ((raiz(3)-raiz(2))/2)];
tau = sort(t);
%----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%C�rculos de Mohr
%C�rculo 1
R1 = t(1);
xc1 = (raiz(3) + raiz(1))/2;
yc1 = 0;

th = linspace(0,2*pi);
x1 = R1*cos(th) + xc1;
y1 = R1*sin(th) + yc1;

%C�rculo 2
R2 = t(2);
xc2 = (raiz(2) + raiz(1))/2;
yc2 = 0;

th = linspace(0,2*pi);
x2 = R2*cos(th) + xc2;
y2 = R2*sin(th) + yc2;

%C�rculo 3
R3 = t(3);
xc3 = (raiz(3) + raiz(2))/2;
yc3 = 0;

th = linspace(0,2*pi);
x3 = R3*cos(th) + xc3;
y3 = R3*sin(th) + yc3;

%----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%Valores

disp('----------------------------------------------------------')
fprintf('\n Respostas: \n\n');

%Invariantes

fprintf('Invariantes: \n\n');
fprintf('\n Invariante 1:'); disp(i1);
fprintf('\n Invariante 2:'); disp(i2);
fprintf('\n Invariante 3:'); disp(i3);

disp('----------------------------------------------------------')

%Tens�es Normais Principais

fprintf('Tens�es Normais Principais: \n\n')
fprintf('\n Sigma 1:');disp(raiz(3));
fprintf('\n Sigma 2:');disp(raiz(2));
fprintf('\n Sigma 3:');disp(raiz(1));

disp('----------------------------------------------------------')

%Tens�es Tangenciais M�ximas

fprintf('Tens�es Tangenciais M�ximas: \n\n')
fprintf('\n Tau 1:');disp(tau(3));
fprintf('\n Tau 2:');disp(tau(2));
fprintf('\n Tau 3:');disp(tau(1));

disp('----------------------------------------------------------')

%C�rculo de Mohr

figure
xlabel('sigma');
ylabel('tau');
axis on

plot(x1,y1);
hold on;
plot(x2,y2);
hold on;
plot(x3,y3)
hold on
grid on

axis equal;


