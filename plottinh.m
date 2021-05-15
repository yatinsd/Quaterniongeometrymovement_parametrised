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



%% Orientation of view vector
% V = a2(3)/sqrt(a2(1)^2+a2(2)^2+a2(3)^2);
% U = a2(2)/sqrt(a2(1)^2+a2(2)^2+a2(3)^2);
% T = a2(1)/sqrt(a2(1)^2+a2(2)^2+a2(3)^2);
alpha = acosd(a2(1)/sqrt(a2(1)^2+a2(2)^2+a2(3)^2));
beta  = acosd(a2(2)/sqrt(a2(1)^2+a2(2)^2+a2(3)^2));
gamma = acosd(a2(3)/sqrt(a2(1)^2+a2(2)^2+a2(3)^2));


%% Orientation of face
A11 = [0 0 1.224745];                   %p1
A12 = [1.154701 0 0.4082483];           %p2
A15 = [0.5773503 1 -0.4082483];         %p5
A13 = [-0.5773503 1 0.4082483];         %p3
%   %Centroid coordinates
ab = ((A11(1)+A12(1)+A15(1)+A13(1))/4); 
ac = ((A11(2)+A12(2)+A15(2)+A13(2))/4);
ad = ((A11(3)+A12(3)+A15(3)+A13(3))/4);
%   %Face angles
ANGLE1 = acosd(ab/sqrt(ab^2+ac^2+ad^2)); 
ANGLE2 = acosd(ac/sqrt(ab^2+ac^2+ad^2));
ANGLE3 = acosd(ad/sqrt(ab^2+ac^2+ad^2));
%  
% qx = ax * sin(angle/2)
% qy = ay * sin(angle/2)
% qz = az * sin(angle/2)
% qw = cos(angle/2)
%% Quaternion travel angles in Radians
ANGLEX = 0.5*(alpha)*0.017453292;    %% ANGLEX=0.5*(ANGLEX)
ANGLEY = 0.5*(beta)*0.017453292;     %% ANGLEY=0.5*(ANGLEY)
ANGLEZ = 0.5*(gamma)*0.017453292;    %% ANGLEZ=0.5*(ANGLEZ)
% ANGLEX = 0.5*(alpha-ANGLE1);    
% ANGLEY = 0.5*(beta-ANGLE2);
% ANGLEZ = 0.5*(gamma-ANGLE3);
H1=alpha-ANGLE1;
H2=beta-ANGLE2;
H3=gamma-ANGLE3;
cosx = cos(ANGLEX); %% First calculate the angle of your custom input angle cos sin for all 3 angle in "RADIANS"
cosy = cos(ANGLEY);
cosz = cos(ANGLEZ);
sinx = sin(ANGLEX);
siny = sin(ANGLEY);
sinz = sin(ANGLEZ);
%% Quaternion from euler
% Finalw = cosx*cosy*cosz+sinx*siny*sinz;%% input X,Y, Z
% Finalx = sinx*cosy*cosz+cosx*siny*sinz;
% Finaly = cosx*siny*cosz-sinx*cosy*sinz;
% Finalz = cosx*cosy*sinz-sinx*siny*cosz;

Finalw = cosx*cosy*cosz-sinx*siny*sinz;
Finalx = sinx*siny*cosz+cosx*cosy*sinz;
Finaly = sinx*cosy*cosz+cosx*siny*sinz;   %% USE THIS FUNCTION FOR WXYZ PARAMETERS FOR YOUR REQUIRED QUATERNION FOR ROTATION
Finalz = cosx*siny*cosz-sinx*cosy*sinz;

% Finalw = cosx*cosy*cosz+sinx*siny*sinz;
% Finalx = sinx*cosy*cosz-cosx*siny*sinz;
% Finaly = cosx*siny*cosz+sinx*cosy*sinz;
% Finalz = cosx*cosy*sinz-sinx*siny*cosz;
% eul=[ANGLEX ANGLEY ANGLEZ];
% qXYZ = eul2quat(eul,'XYZ')
% 
% q1 = quaternion(qXYZ)
%% Draw view vector
figure
grid on
hold all
g1 = [a1(1) Finalx];
g2 = [a1(2) Finaly];
g3 = [a1(3) Finalz];
% g1 = [a1(1) qXYZ(1)];
% g2 = [a1(2) qXYZ(2)];
% g3 = [a1(3) qXYZ(3)];
plot3(g1,g2,g3)
%% Rotated coordinates

q1 = quaternion(Finalw,Finalx,Finaly,Finalz)

rt1 = rotateframe(q1, p1)
rt2 = rotateframe(q1, p2)
rt3 = rotateframe(q1, p3)
rt4 = rotateframe(q1, p4)
rt5 = rotateframe(q1, p5)
rt6 = rotateframe(q1, p6)
rt7 = rotateframe(q1, p7)
rt8 = rotateframe(q1, p8)

% rt1 = rotateframe(q1, p1)
% rt2 = rotateframe(q1, p2)
% rt3 = rotateframe(q1, p3)
% rt4 = rotateframe(q1, p4)
% rt5 = rotateframe(q1, p5)
% rt6 = rotateframe(q1, p6)
% rt7 = rotateframe(q1, p7)
% rt8 = rotateframe(q1, p8)
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
