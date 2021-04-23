function q_dd=dynamic_model(z)
%%%%%
q=z(1:3);
q_dot=z(4:6);
T=z(7:9);
%%%%%%
q11=q(1);
q12=q(2);
q13=q(3);
%%%%%
q11_dot=q_dot(1);
q12_dot=q_dot(2);
q13_dot=q_dot(3);
%%%%%


p1=0.0055;
p2=0.0080;
p3=0.0024;
p4=0.0118;
p5=0.0041;
p6=0.0009;
p7=0.0007;
p8=2.0007;
p9=11.800;
p10=2.8000;
p11=25;
p12=35;
p13=36;
p14=0.2;
p15=2.5;
p16=2.5;
p17=22;
p18=11;
%%
s1=sin(q11);
s2=sin(q12);
s3=sin(q13);
% s4=sin(q21);
% s5=sin(q22);
% s6=sin(q23);

c1=cos(q11);
c2=cos(q12);
c3=cos(q13);
% c4=cos(q21);
% c5=cos(q22);
% c6=cos(q23);
%%
aux1=0.75+0.25*cos(2*q12+2*q13);
aux2=0.25-0.5*cos(2*q12+2*q13);
aux3=s3+sin(2*q12+q13);
aux4=0.5+0.5*(2*q12+2*q13);
aux5=0.5-0.5*cos(2*q12+2*q13);
aux6=0.5+0.5*cos(2*q12);
aux7=0.5-0.5*cos(2*q12);
aux8=(q12_dot*cos(2*q12+q13)+0.5*q13_dot*c3+0.5*q13_dot*cos(2*q12+q13));
aux9=(0.5*q13_dot*sin(2*q12+2*q13)+0.5*q12_dot*sin(2*q12+2*q13));
aux10=(0.5*q11_dot*c3+0.5*q11_dot*cos(2*q12+q13));
%%

h11=aux1*p1+aux2*p2+aux3*p3+aux4*p4+aux5*p5+aux6*p6+aux7*p7+p8;
h12=0;
h13=0;
h21=0;
h22=0.5*p1+p2+2*s3*p3+p4+p9;
h23=0.5*p1+p2+s3*p3+p4+p5;
h31=0;
h32=0.5*p1+p2+s3*p3+p4+p5;
h33=0.5*p1+p2+p4+p10;
c11=aux8*p3+aux9*p5-0.5*q12_dot*sin(2*q12)*p6+0.5*q12_dot*sin(2*q12)*p7;
c12=q11_dot*cos(2*q12+q13)*p3+0.5*q11_dot*sin(2*q12+2*q13)*p5-0.5*q11_dot*sin(q12)+0.5*q11_dot*sin(2*q12)*p7;
c13=aux10*p3+0.5*q11_dot*sin(2*q12+2*q13)*p5;
c21=-q11_dot*cos(2*q12+q13)*p3-0.5*q11_dot*sin(2*q12+2*q13)*p5+0.5*q11_dot*sin(2*q12)*p6-0.5*q11_dot*sin(2*q12)*p7;
c22=q13_dot*c3*p3;
c23=(q12_dot*c3+q13_dot*c3)*p3;
c31=-(0.5*q11_dot*c3+0.5*q11_dot*cos(2*q12+q13))*p3-0.5*q11_dot*sin(2*q12+2*q13)*p5;
c32=-q12_dot*c3*p3;
c33=0;
%%
H=[h11 h12 h13;h21 h22 h23;h31 h32 h33];
C=[c11 c12 c13;c21 c22 c23;c31 c32 c33];


fc1=[p14*sign(q11_dot);p15*sign(q12_dot);p16*sign(q13_dot)];
g1=[0;c2*p17+sin(q12+q13)*p18;sin(q12+q13)*p18];
%%
q_dot=[q11_dot;q12_dot;q13_dot];
q_dd=inv(H)*(T-fc1-g1-C*q_dot);
