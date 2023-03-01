%Tanques acoplados 

syms Qi1 H1 Qi2 H2 

%Ecuaciones diferenciales que definen al sistema 
f1 = Qi1 - (H1-H2)^(1/2);
f2 = Qi2 + (H1-H2)^(1/2) - H2^(1/2);
f3 = H2^(1/2);

%Linealizo el sistema calculando el jacobiano
A = jacobian([f1,f2],[H1,H2])
B = jacobian([f1,f2],[Qi1,Qi2])
C = jacobian([f3],[H1,H2])

%Evaluo en el punto de equilibrio
Qi1 = 1; H1 = 2; Qi2 = 0;  H2 = 1;

A = subs(A)
B = subs(B)
C = subs(C)