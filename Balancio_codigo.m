%Balancio

syms m11 m12 m22 x u Gb x2

%Matrices M y vector f
M = [0 m12*cos(x) m11;0 m22 m12*cos(x); 1 0 0]
M_inversa = inv(M)
f = [u ; -u+Gb*sin(x) ; x2]

%Descomposicion y linealizacion del x' e y
A = [0 1 0 ; -Gb*m11/((m12)^2-m11*m22) 0 0 ; Gb*m12/ ((m12)^2-m11*m22) 0 0];
B = [0 ; (m11+m12)/((m12)^2-m11*m22) ; -(m22+m12)/((m12)^2-m11*m22)];
C = [1 0 0];
D = 0;

I = [1 0 0; 0 1 0; 0 0 1];

syms s

%Planta P
P = C*(s*I-A)^(-1)*B+D


% Relizo lo mismo pero con valores
Ib = 6.536e-4;
Iw = 4.306e-5;
mb = 0.244;
mw = 0.0058;
r = 0.033;
l = 0.031;
g = 9.8;

m11_ = (mb+mw)*r^2+Iw;
m12_ = mb*l*r;
m22_ = mb*l^2+Ib;
Gb_ = mb*g*l;

A_2 = [0 1 0 ; -Gb_*m11_/((m12_)^2-m11_*m22_) 0 0 ; Gb_*m12_/ ((m12_)^2-m11_*m22_) 0 0] 
B_2 = [0 ; (m11_+m12_)/((m12_)^2-m11_*m22_) ; -(m22_+m12_) / ((m12_)^2-m11_*m22_)] 
C_2 = [1 0 0] 
D_2 = 0 
P_valor = C_2*(s*I-A_2)^(-1)*B_2+D_2

% La nueva transferencia siendo la entrada la velocidad angular

p = P_valor*Iw*s



