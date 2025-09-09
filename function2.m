clear; clc; clear all


o = [15, 30, 45];

DCM = RotationMatrix321(o)


function DCM = RotationMatrix321(attitude321)

%{

Goal: Use the Euler angles for the 3-2-1 rotation sequence to calculate the associated DCM

Inputs:
• attitude321: 3 x 1 vector with the 3-2-1 Euler angles in the form attitude321 = [𝛼, 𝛽, 𝛾]T (In
ASEN 3728 notation, this would be equivalent to [𝜙,𝜃,𝜓]T )

Outputs:
• DCM: the rotation matrix calculated from the Euler angles.

%}

a = attitude321(1); 
b = attitude321(2);
g = attitude321(3);

DCM = [cos(b)*cos(a), cos(b)*sin(a), -sin(b);
      (sin(g)*sin(b)*cos(a)-cos(g)*sin(a)), (sin(g)*sin(b)*sin(a)+cos(g)*cos(a)), sin(g)*cos(b);
      (cos(g)*sin(b)*cos(a)-sin(g)*sin(a)), (cos(g)*sin(b)*sin(a)+sin(g)*cos(a)), cos(g)*cos(b)];

end