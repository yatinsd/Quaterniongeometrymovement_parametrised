% Investigating 3d quaternion rotation
clear
clc
close all
%% View coordinates
a1 = [0 0 0];
a2 = [0 0 3];
r1= [a1(1) a2(1)];
r2= [a1(2) a2(2)];
r3= [a1(3) a2(3)];

%% Cube coordinates
p1 = [0 0 1.224745];                    
p2 = [1.154701 0 0.4082483];            
p3 = [-0.5773503 1 0.4082483];
p4 = [-0.5773503 -1 0.4082483];         
p5 = [0.5773503 1 -0.4082483];
p6 = [0.5773503 -1 -0.4082483];
p7 = [-1.154701 0 -0.4082483];
p8 = [0 0 -1.224745]; 

%% Plane formation
x  = [p1(1) p2(1) p5(1) p3(1)];       %% done  
y  = [p1(2) p2(2) p5(2) p3(2)];
z  = [p1(3) p2(3) p5(3) p3(3)];
x1 = [p1(1) p3(1) p7(1) p4(1)];        %%done
y1 = [p1(2) p3(2) p7(2) p4(2)];
z1 = [p1(3) p3(3) p7(3) p4(3)];
x2 = [p1(1) p4(1) p6(1) p2(1)];         %%done
y2 = [p1(2) p4(2) p6(2) p2(2)];
z2 = [p1(3) p4(3) p6(3) p2(3)];
x3 = [p2(1) p6(1) p8(1) p5(1)];         %%done
y3 = [p2(2) p6(2) p8(2) p5(2)];
z3 = [p2(3) p6(3) p8(3) p5(3)];
x4 = [p3(1) p5(1) p8(1) p7(1)];         %%done
y4 = [p3(2) p5(2) p8(2) p7(2)];
z4 = [p3(3) p5(3) p8(3) p7(3)];
x5 = [p4(1) p7(1) p8(1) p6(1)];         %%done
y5 = [p4(2) p7(2) p8(2) p6(2)];
z5 = [p4(3) p7(3) p8(3) p6(3)];




%% Orientation of face

ab = ((p1(1)+p2(1)+p5(1)+p3(1))/4); 
ac = ((p1(2)+p2(2)+p5(2)+p3(2))/4);
ad = ((p1(3)+p2(3)+p5(3)+p3(3))/4);


V0 = [ab ac ad];
a2 = [0 0 3];
V0N=normalize(V0);
a2N=normalize(a2);
qV0N= [0 V0N];
a2N= [0 a2N];
qV0N= quaternion(qV0N);
a2N= quaternion(a2N);
%% Formulation of quaternion

Qxyz = cross(a2,V0);
L = dot(a2,V0);
a2L  = sqrt(a2(1)^2+a2(2)^2+a2(3)^2);
V0L  = sqrt(V0(1)^2+V0(2)^2+V0(3)^2);

% if 
Qw   = sqrt((a2L^2)*(V0L^2))+dot(a2,V0);
q    = [Qw Qxyz];

n    = quatnormalize(q)
q1   = quaternion(n)

%% Quaternion SLERP
qa = slerp(qV0N,a2N,0.25);
qb = slerp(qV0N,a2N,0.5);
qc = slerp(qV0N,a2N,0.01);

%% Draw view vector
% figure
% grid on
% hold all
% g1 = [a1(1) Finalx];
% g2 = [a1(2) Finaly];
% g3 = [a1(3) Finalz];
% g1 = [a1(1) qXYZ(1)];
% g2 = [a1(2) qXYZ(2)];
% g3 = [a1(3) qXYZ(3)];
% plot3(g1,g2,g3)
%% Rotated coordinates

% q1 = quaternion(Finalw,Finalx,Finaly,Finalz)
% n   = quatconj(q)
%  p2t = [0 0 1.224745 0];
%  hh  = n*transpose(p2t);  
% BB  = hh*n;


% rt1 = 0.5*((p1tw-q1*p1tw*q1));
% rt2 = 0.5*((p2-q1*p2*q1));
% rt3 = 0.5*((p3-q1*p3*q1));
% rt4 = 0.5*((p4-q1*p4*q1));
% rt5 = 0.5*((p5-q1*p5*q1));
% rt6 = 0.5*((p6-q1*p6*q1));
% rt7 = 0.5*((p7-q1*p7*q1));
% rt8 = 0.5*((p8-q1*p8*q1));

rt1 = rotateframe(q1, p1)
rt2 = rotateframe(q1, p2)
rt3 = rotateframe(q1, p3)
rt4 = rotateframe(q1, p4)
rt5 = rotateframe(q1, p5)
rt6 = rotateframe(q1, p6)
rt7 = rotateframe(q1, p7)
rt8 = rotateframe(q1, p8)


rt1s1 = rotateframe(qa, p1)
rt2s1 = rotateframe(qa, p2)
rt3s1 = rotateframe(qa, p3)
rt4s1 = rotateframe(qa, p4)
rt5s1 = rotateframe(qa, p5)
rt6s1 = rotateframe(qa, p6)
rt7s1 = rotateframe(qa, p7)
rt8s1 = rotateframe(qa, p8)

rt1s2 = rotateframe(qb, p1)
rt2s2 = rotateframe(qb, p2)
rt3s2 = rotateframe(qb, p3)
rt4s2 = rotateframe(qb, p4)
rt5s2 = rotateframe(qb, p5)
rt6s2 = rotateframe(qb, p6)
rt7s2 = rotateframe(qb, p7)
rt8s2 = rotateframe(qb, p8)


rt1s3 = rotateframe(qc, p1)
rt2s3 = rotateframe(qc, p2)
rt3s3 = rotateframe(qc, p3)
rt4s3 = rotateframe(qc, p4)
rt5s3 = rotateframe(qc, p5)
rt6s3 = rotateframe(qc, p6)
rt7s3 = rotateframe(qc, p7)
rt8s3 = rotateframe(qc, p8)


xa  = [rt1(1) rt2(1) rt5(1) rt3(1)];
ya  = [rt1(2) rt2(2) rt5(2) rt3(2)];
za  = [rt1(3) rt2(3) rt5(3) rt3(3)];

x1a = [rt1(1) rt3(1) rt7(1) rt4(1)];
y1a = [rt1(2) rt3(2) rt7(2) rt4(2)];
z1a = [rt1(3) rt3(3) rt7(3) rt4(3)];

x2a = [rt1(1) rt4(1) rt6(1) rt2(1)];
y2a = [rt1(2) rt4(2) rt6(2) rt2(2)];
z2a = [rt1(3) rt4(3) rt6(3) rt2(3)];

x3a = [rt2(1) rt6(1) rt8(1) rt5(1)];
y3a = [rt2(2) rt6(2) rt8(2) rt5(2)];
z3a = [rt2(3) rt6(3) rt8(3) rt5(3)];

x4a = [rt3(1) rt5(1) rt8(1) rt7(1)];
y4a = [rt3(2) rt5(2) rt8(2) rt7(2)];
z4a = [rt3(3) rt5(3) rt8(3) rt7(3)];

x5a = [rt4(1) rt7(1) rt8(1) rt6(1)];
y5a = [rt4(2) rt7(2) rt8(2) rt6(2)];
z5a = [rt4(3) rt7(3) rt8(3) rt6(3)];


%% rotate  1
xas1  = [rt1s1(1) rt2s1(1) rt5s1(1) rt3s1(1)];
yas1  = [rt1s1(2) rt2s1(2) rt5s1(2) rt3s1(2)];
zas1  = [rt1s1(3) rt2s1(3) rt5s1(3) rt3s1(3)];

x1as1 = [rt1s1(1) rt3s1(1) rt7s1(1) rt4s1(1)];
y1as1 = [rt1s1(2) rt3s1(2) rt7s1(2) rt4s1(2)];
z1as1 = [rt1s1(3) rt3s1(3) rt7s1(3) rt4s1(3)];

x2as1 = [rt1s1(1) rt4s1(1) rt6s1(1) rt2s1(1)];
y2as1 = [rt1s1(2) rt4s1(2) rt6s1(2) rt2s1(2)];
z2as1 = [rt1s1(3) rt4s1(3) rt6s1(3) rt2s1(3)];

x3as1 = [rt2s1(1) rt6s1(1) rt8s1(1) rt5s1(1)];
y3as1 = [rt2s1(2) rt6s1(2) rt8s1(2) rt5s1(2)];
z3as1 = [rt2s1(3) rt6s1(3) rt8s1(3) rt5s1(3)];

x4as1 = [rt3s1(1) rt5s1(1) rt8s1(1) rt7s1(1)];
y4as1 = [rt3s1(2) rt5s1(2) rt8s1(2) rt7s1(2)];
z4as1 = [rt3s1(3) rt5s1(3) rt8s1(3) rt7s1(3)];

x5as1 = [rt4s1(1) rt7s1(1) rt8s1(1) rt6s1(1)];
y5as1 = [rt4s1(2) rt7s1(2) rt8s1(2) rt6s1(2)];
z5as1 = [rt4s1(3) rt7s1(3) rt8s1(3) rt6s1(3)];

%% rotate 2
xas2  = [rt1s2(1) rt2s2(1) rt5s2(1) rt3s2(1)];
yas2  = [rt1s2(2) rt2s2(2) rt5s2(2) rt3s2(2)];
zas2  = [rt1s2(3) rt2s2(3) rt5s2(3) rt3s2(3)];

x1as2 = [rt1s2(1) rt3s2(1) rt7s2(1) rt4s2(1)];
y1as2 = [rt1s2(2) rt3s2(2) rt7s2(2) rt4s2(2)];
z1as2 = [rt1s2(3) rt3s2(3) rt7s2(3) rt4s2(3)];

x2as2 = [rt1s2(1) rt4s2(1) rt6s2(1) rt2s2(1)];
y2as2 = [rt1s2(2) rt4s2(2) rt6s2(2) rt2s2(2)];
z2as2 = [rt1s2(3) rt4s2(3) rt6s2(3) rt2s2(3)];

x3as2 = [rt2s2(1) rt6s2(1) rt8s2(1) rt5s2(1)];
y3as2 = [rt2s2(2) rt6s2(2) rt8s2(2) rt5s2(2)];
z3as2 = [rt2s2(3) rt6s2(3) rt8s2(3) rt5s2(3)];

x4as2 = [rt3s2(1) rt5s2(1) rt8s2(1) rt7s2(1)];
y4as2 = [rt3s2(2) rt5s2(2) rt8s2(2) rt7s2(2)];
z4as2 = [rt3s2(3) rt5s2(3) rt8s2(3) rt7s2(3)];

x5as2 = [rt4s2(1) rt7s2(1) rt8s2(1) rt6s2(1)];
y5as2 = [rt4s2(2) rt7s2(2) rt8s2(2) rt6s2(2)];
z5as2 = [rt4s2(3) rt7s2(3) rt8s2(3) rt6s2(3)];

%% rotate  3
xas3  = [rt1s3(1) rt2s3(1) rt5s3(1) rt3s3(1)];
yas3  = [rt1s3(2) rt2s3(2) rt5s3(2) rt3s3(2)];
zas3  = [rt1s3(3) rt2s3(3) rt5s3(3) rt3s3(3)];

x1as3 = [rt1s3(1) rt3s3(1) rt7s3(1) rt4s3(1)];
y1as3 = [rt1s3(2) rt3s3(2) rt7s3(2) rt4s3(2)];
z1as3 = [rt1s3(3) rt3s3(3) rt7s3(3) rt4s3(3)];

x2as3 = [rt1s3(1) rt4s3(1) rt6s3(1) rt2s3(1)];
y2as3 = [rt1s3(2) rt4s3(2) rt6s3(2) rt2s3(2)];
z2as3 = [rt1s3(3) rt4s3(3) rt6s3(3) rt2s3(3)];

x3as3 = [rt2s3(1) rt6s3(1) rt8s3(1) rt5s3(1)];
y3as3 = [rt2s3(2) rt6s3(2) rt8s3(2) rt5s3(2)];
z3as3 = [rt2s3(3) rt6s3(3) rt8s3(3) rt5s3(3)];

x4as3 = [rt3s3(1) rt5s3(1) rt8s3(1) rt7s3(1)];
y4as3 = [rt3s3(2) rt5s3(2) rt8s3(2) rt7s3(2)];
z4as3 = [rt3s3(3) rt5s3(3) rt8s3(3) rt7s3(3)];

x5as3 = [rt4s3(1) rt7s3(1) rt8s3(1) rt6s3(1)];
y5as3 = [rt4s3(2) rt7s3(2) rt8s3(2) rt6s3(2)];
z5as3 = [rt4s3(3) rt7s3(3) rt8s3(3) rt6s3(3)];


%% Draw rotated and unrotated cube
figure 
hold all
grid on
xlabel('x')
ylabel('y')
zlabel('z')
fill3(x,y,z,1);
fill3(x1,y1,z1,2);
fill3(x2,y2,z2,3);
fill3(x3,y3,z3,4);
fill3(x4,y4,z4,5);
fill3(x5,y5,z5,6);
figure
hold all
plot3(r1,r2,r3)
fill3(xa,ya,za,1);
fill3(x1a,y1a,z1a,2);
fill3(x2a,y2a,z2a,3);
fill3(x3a,y3a,z3a,4);
fill3(x4a,y4a,z4a,5);
fill3(x5a,y5a,z5a,6);

%% plot slerp1
% fill3(xas1,yas1,zas1,1);
% fill3(x1as1,y1as1,z1as1,2);
% fill3(x2as1,y2as1,z2as1,3);
% fill3(x3as1,y3as1,z3as1,4);
% fill3(x4as1,y4as1,z4as1,5);
% fill3(x5as1,y5as1,z5as1,6);

%% plot slerp2
% fill3(xas2,yas2,zas2,1);
% fill3(x1as2,y1as2,z1as2,2);
% fill3(x2as2,y2as2,z2as2,3);
% fill3(x3as2,y3as2,z3as2,4);
% fill3(x4as2,y4as2,z4as2,5);
% fill3(x5as2,y5as2,z5as2,6);

%% plot slerp3
fill3(xas3,yas3,zas3,1);
fill3(x1as3,y1as3,z1as3,2);
fill3(x2as3,y2as3,z2as3,3);
fill3(x3as3,y3as3,z3as3,4);
fill3(x4as3,y4as3,z4as3,5);
fill3(x5as3,y5as3,z5as3,6);
