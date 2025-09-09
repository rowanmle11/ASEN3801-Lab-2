function attitude321 = EulerAngles321(DCM)
%Goal: use the DCM to extract the 3-2-1 Euler angles 
%Inputs: 
%• DCM: a rotation matrix 
%Outputs: 
%• attitude321: 3 x 1 vector with the 3-2-1 Euler angles in the form attitude321 = [𝛼𝛼, 𝛽𝛽, 𝛾𝛾]T (In 
%ASEN 3728 notation, this would be equivalent to [𝜙𝜙,𝜃𝜃,𝜓𝜓]T).

    beta = asin(max(min(-DCM(1,3), 1), -1));%from DCM(1,3)=-sin(beta)
    alpha=atan2(DCM(2,3),DCM(3,3));%atan2=(x,y)from tan(alpha)=DCM(2,3)/DCM(3,3)
    gamma=atan2(DCM(1,2),DCM(1,1)); %from tan(gamma)=DCM(1,2)/DCM(1,1)

    attitude321=[alpha;beta;gamma];%3 x 1 vector with the 3-2-1 Euler angles in the form attitude321 = [𝛼𝛼, 𝛽𝛽, 𝛾𝛾]T
end