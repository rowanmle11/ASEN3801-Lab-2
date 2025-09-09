clear
clc
close all

o = [15, 30, 45];

DCM = RotationMatrix313(o);

function DCM = RotationMatrix313(attitude313)
    if numel(attitude313) ~= 3
        error('RotationMatrix313: attitude must be 3x1 vector');
    end

    alpha = attitude313(1);
    beta = attitude313(2);
    gamma = attitude313(3);

    Rz_alpha = [cos(alpha), sin(alpha), 0;
                -sin(alpha), cos(alpha), 0;
                0, 0, 1];
    Rx_beta = [1, 0, 0;
               0, cos(beta), sin(beta);
               0, -sin(beta), cos(beta)];
    Rz_gamma = [cos(gamma), sin(gamma), 0;
                -sin(gamma), cos(gamma), 0;
                0, 0, 1];

    DCM = Rz_alpha .* Rx_beta .* Rz_gamma;
end