clear
clc 
close all
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
x  = [p1(1) p2(1) p5(1) p3(1)];         
y  = [p1(2) p2(2) p5(2) p3(2)];
z  = [p1(3) p2(3) p5(3) p3(3)];
x1 = [p1(1) p3(1) p7(1) p4(1)];
y1 = [p1(2) p3(2) p7(2) p4(2)];
z1 = [p1(3) p3(3) p7(3) p4(3)];
x2 = [p1(1) p4(1) p6(1) p2(1)];
y2 = [p1(2) p4(2) p6(2) p2(2)];
z2 = [p1(3) p4(3) p6(3) p2(3)];
x3 = [p2(1) p6(1) p8(1) p5(1)];
y3 = [p2(2) p6(2) p8(2) p5(2)];
z3 = [p2(3) p6(3) p8(3) p5(3)];
x4 = [p3(1) p5(1) p8(1) p7(1)];
y4 = [p3(2) p5(2) p8(2) p7(2)];
z4 = [p3(3) p5(3) p8(3) p7(3)];
x5 = [p4(1) p7(1) p8(1) p6(1)];
y5 = [p4(2) p7(2) p8(2) p6(2)];
z5 = [p4(3) p7(3) p8(3) p6(3)];


%% View vector 
% V1 = [0 0 3];
% a0 = [0 0 0];
% 
% r1= [a0(1) V1(1)];
% r2= [a0(2) V1(2)];
% r3= [a0(3) V1(3)];

%% Initial vector 
ab = ((p1(1)+p2(1)+p5(1)+p3(1))/4); 
ac = ((p1(2)+p2(2)+p5(2)+p3(2))/4);
ad = ((p1(3)+p2(3)+p5(3)+p3(3))/4);
V0 = [ab ac ad];
V1 = [2 2 3];
a0 = [0 0 0];
r1= [a0(1) V1(1)];
r2= [a0(2) V1(2)];
r3= [a0(3) V1(3)];

XU = [1 0 0];
YU = [0 1 0];

%% Formulation of quaternion
VD01 = dot(V0,V1);
VC10 = cross(V1,V0);
VC01 = cross(V0,V1);
% tempV;
% RESULT;

if VD01<(-0.999999)
    tempV = cross(XU,V0);
    tempVl= sqrt(tempV(1)^2+tempV(2)^2+tempV(3)^2);
    if tempVl<(0.000001)
        tempV=cross(YU,V0);
    tempVn=normalize(tempV);
    RESULT(1)=cos(pi/2);
    RESULT(2)=sin(pi/2)*tempV(1);
    RESULT(3)=sin(pi/2)*tempV(2);
    RESULT(4)=sin(pi/2)*tempV(3);
    end
elseif  VD01>(0.999999)
    RESULT=[1 0 0 0];
else 
    tempV=VC01;
    RESULT(1)=1+VD01;
    RESULT(2)=tempV(1);
    RESULT(3)=tempV(2);
    RESULT(4)=tempV(3);
    RESULT= normalize(RESULT);
end
q1=quaternion(RESULT);

%% Rotated coordinates
rt1 = rotateframe(q1, p1)
rt2 = rotateframe(q1, p2)
rt3 = rotateframe(q1, p3)
rt4 = rotateframe(q1, p4)
rt5 = rotateframe(q1, p5)
rt6 = rotateframe(q1, p6)
rt7 = rotateframe(q1, p7)
rt8 = rotateframe(q1, p8)
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

%% Draw rotated and unrotated cube
figure 
hold all
grid on
xlabel('x')
ylabel('y')
zlabel('z')
plot3(r1,r2,r3)
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

    


