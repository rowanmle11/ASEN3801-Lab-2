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



%% Problem 6



%% Problem 7


