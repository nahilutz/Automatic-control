%Motor de continua

%Momento de inercia del motor
J = 3.2284e-6;
%Fricción viscosa 
b = 3.5077e-6;
%Constante de la FCEM 
Kb = 0.0274;
%Constante de torque 
Kt = 0.0274;
%Resistencia del devanado
R = 4;
%Inductancia del devanado 
L = 2.75e-6;

A = [0  1    0; 0 -b/J Kt/J; 0 -Kb/L -R/L];
B = [0;0;1/L];
C = [1 0 0];

%transferencia a partir de las variables de estado 
% usando la funciones ss y tf 

sys_ss = ss(A,B,C,0);
disp('Transferencia del motor continua');
sys_tf = tf(sys_ss)

%la transformada expresada de otra manera, me sirve para conocer los polos 
%y poder realizar los calculos a mano
zpk(sys_tf)

%calculo la exponencial matricial
disp('Exponencial matricial')
syms s;
I = eye(3);
ilaplace(inv(s*I - A))

%grafico de la respuesta al impulso: 
figure(1)
impulse(sys_tf)

%grafico de la respuesta al escalon: 
figure(2)
step(sys_tf)
 
%respuesta a condiciones iniciales: 
figure(3)
initial(sys_ss, [1; 8; 1])
