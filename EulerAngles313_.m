function attitude313 = EulerAngles313(DCM)

    alpha = atan2(DCM(1,3), DCM(2,3));
    beta = acos(DCM(3,3));
    gamma = atan2(DCM(3,1), -DCM(3,2));

    attitude313 = [alpha, beta, gamma]';

end