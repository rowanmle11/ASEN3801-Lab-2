clear;
clear all;
clc;

[t_vec_1, av_pos_inert_1, av_att_1, tar_pos_inert_1, tar_att_1] = LoadASPENData('3801_Sec002_Test1.csv');
[t_vec_2, av_pos_inert_2, av_att_2, tar_pos_inert_2, tar_att_2] = LoadASPENData('3801_Sec002_Test2.csv');
[t_vec_3, av_pos_inert_3, av_att_3, tar_pos_inert_3, tar_att_3] = LoadASPENData('3801_Sec002_Test3.csv');

%% Problem 3

    figure(); 
    hold on;
    plot3(av_pos_inert_1(1,:), av_pos_inert_1(2,:), av_pos_inert_1(3,:));
    plot3(tar_pos_inert_1(1,:),tar_pos_inert_1(2,:),tar_pos_inert_1(3,:));

%% Problem 4



%% Problem 5

n1 = size(av_pos_inert_1,2);
att313_av_1 = zeros(3,n1);
att313_tar_1 = zeros(3,n1);
for k = 1:n1
    DCM_av = RotationMatrix321(av_att_1(:,k));
    DCM_tar = RotationMatrix321(tar_att_1(:,k));
    att313_av_1(:,k) = EulerAngles313(DCM_av);
    att313_tar_1(:,k) = EulerAngles313(DCM_tar);
end

figure;
for i = 1:3
    subplot(3,1,i)
    plot(t_vec_1, rad2deg(att313_av_1(i,:)), '-b'); hold on;
    plot(t_vec_1, rad2deg(att313_tar_1(i,:)), '--r');
    ylabel(['313 angle ',num2str(i),' [deg]']);
    if i==1, title('Problem 5: 3-1-3 Euler angles (Test 1)'); end
    if i==3, xlabel('Time [s]'); end
    legend('Vehicle','Target');
    grid on;
end


%% Problem 6
FROMavTOtar_vec_inert_1 = [tar_pos_inert_1(1,:)-av_pos_inert_1(1,:); tar_pos_inert_1(2,:)-av_pos_inert_1(2,:); tar_pos_inert_1(3,:)-av_pos_inert_1(3,:)];
hold off

figure;

subplot(3,1,1);
plot(t_vec_1,FROMavTOtar_vec_inert_1(1,:)/1000);
title('x');
xlabel('Time [s]');
ylabel('Position [m]');

subplot(3,1,2);
plot(t_vec_1,FROMavTOtar_vec_inert_1(2,:)/1000);
title('y');
xlabel('Time [s]');
ylabel('Position [m]');

subplot(3,1,3);
plot(t_vec_1,FROMavTOtar_vec_inert_1(3,:)/1000);
title('z');
xlabel('Time [s]');
ylabel('Position [m]');
%% Problem 7
FROMavTOtar_vec_av_1=[];
i=1;
while i<size(av_att_1(1,:),2)+1
R_inert_av=RotationMatrix321([av_att_1(1,i),av_att_1(2,i),av_att_1(3,i)]);
FROMavTOtar_vec_av_1=[FROMavTOtar_vec_av_1;(R_inert_av*FROMavTOtar_vec_inert_1(:,i))'];
i=i+1;
end
figure;

subplot(3,1,1);
plot(t_vec_1',FROMavTOtar_vec_av_1(:,1)/1000);
title('x');
xlabel('Time [s]');
ylabel('Position [m]');

subplot(3,1,2);
plot(t_vec_1',FROMavTOtar_vec_av_1(:,2)/1000);
title('y');
xlabel('Time [s]');
ylabel('Position [m]');

subplot(3,1,3);
plot(t_vec_1',FROMavTOtar_vec_av_1(:,3)/1000);
title('z');
xlabel('Time [s]');
ylabel('Position [m]');


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
