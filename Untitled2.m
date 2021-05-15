%% Specifications of the vehicle
m         = 1750      ;      %vehicle mass in                     (Kg)
Wheelbase = 2.675     ;      %wheelbase in                        (m)
T         = 1.07      ;      %Distance between COG and front axle (m)
W         = 1.505     ;      %Track width                         (m) 
Iz        = 2511      ;      %Vehicle inertia along z axis        (Kg/m2)
It        = 1         ;     %Tire and wheel inertia              (Kg/m2)
R         = 0.316     ;     %Tire nominal Radius                 (m)
g         = 9.81      ;     %Acceleration due to gravity         (m/s2)
%% Model 4DOF
A
B
C 
U         = [DEL_A V]       %Inputs steering angle & Speed        (degree & m/s)
X         