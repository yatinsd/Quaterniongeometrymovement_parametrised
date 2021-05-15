
clc
clear all
cosx = cos(0.21026723583029683); %% First calculate the angle of your custom input angle cos sin for all 3 angle in "RADIANS"
cosy = cos(0.18068363350700234);
cosz = cos(-0.5915997483335369);
sinx = sin(0.21026723583029683);
siny = sin(0.18068363350700234);
sinz = sin(-0.5915997483335369);

Finalw = cosx*cosy*cosz-sinx*siny*sinz;
Finalx = sinx*siny*cosz+cosx*cosy*sinz;
Finaly = sinx*cosy*cosz+cosx*siny*sinz;   %% USE THIS FUNCTION FOR WXYZ PARAMETERS FOR YOUR REQUIRED QUATERNION FOR ROTATION
Finalz = cosx*siny*cosz-sinx*cosy*sinz;


q1 = [Finalw Finalx Finaly Finalz];
q1c= quatconj(q1)

p1 = [0 0 1.224745]; 
p1t= transpose(p1)
q1ct= transpose(q1c)

rt = q1.*p1t;
