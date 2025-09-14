function [t_vec, av_pos_inert, av_att, tar_pos_inert, tar_att] = LoadASPENData(filename)
    % LoadASPENData - read and convert ASPEN.csv data file
    % Usage:
    %   [t_vec, av_pos_inert, av_att, tar_pos_inert, tar_att] = LoadASPENData(filename)
    %
    % Inputs:
    %   filename - path to CSV file (no headers, 13 columns expected)
    %              Expected column order (one common arrangement):
    %                1: frame_index
    %                2-4: aerospace vehicle pos in frame N (x,y,z)
    %                5-7: aerospace vehicle helical angles (aspen)
    %                8-10: target pos in frame N (x,y,z)
    %                11-13: target helical angles (aspen)
    %
    % Outputs:
    %   t_vec         - 1 x n time vector (s), assumes 100 Hz capture
    %   av_pos_inert  - 3 x n aerospace vehicle position in frame E (meters)
    %   av_att        - 3 x n 3-2-1 Euler angles for aerospace vehicle (radians)
    %   tar_pos_inert - 3 x n target position in frame E (meters)
    %   tar_att       - 3 x n 3-2-1 Euler angles for target (radians)
    %
    % NOTE: This function calls ConvertASPENData to perform the frame & angle conversion.
    % If your raw angles are already in radians remove the deg2rad conversion below.

    data = readmatrix(filename);

    if isempty(data)
        error('LoadASPENData: Empty data read from %s', filename);
    end

    % "Sanity check," expect >=13 columns per assignment
    if size(data,2) < 13
        error('LoadASPENData: expected at least 13 columns in file, found %d', size(data,2));
    end

    %frame = data(:,1);
    frame = data(6:end,1);
    n = length(frame);

    % Time vector (100 Hz capture)
    t_vec = (frame - frame(1))'./100;
    
    % Extract assumed columns
    att_av_aspen = data(6:end,3:5)';   % 3 x n
    pos_av_aspen = data(6:end,6:8)';   % 3 x n
    att_tar_aspen = data(6:end,9:11)'; % 3 x n
    pos_tar_aspen = data(6:end,12:14)'; % 3 x n

    [av_pos_inert, av_att, tar_pos_inert, tar_att] = ConvertASPENData(pos_av_aspen, att_av_aspen, pos_tar_aspen, att_tar_aspen);

end
