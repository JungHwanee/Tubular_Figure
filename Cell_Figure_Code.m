% LJH Comsol Cell input code
% This code makes Cell Figure from a matlab struct (.mat)
  
% assumes .mat has a CCCV Crate (C), Inner Diameter (mm), Charging Time (min), Li-Plating Potential (V) etc...

clear;clc;close all

%% Interface

% .mat (struct) fullpath
origin_fullpath ='D:\Leejh\1. KENTECH\1. Modeling\COMSOL+MATLAB\Matlab\LJH\Final\Final\Cell_Result_v4.mat';

% parameters
A = 1; % scaling factor
Roff = 0; % correction factor

%% Engine

% load cell model 
load(origin_fullpath) % assume variable name 'data_accum'

% CCCV(Crate) vector
Crate_column = cell2mat(data_accum.Crate); % the table column is in 'cell'. convert cell to matrix (double).
Crate_unique = unique(Crate_column);

% Inner Diameter vector
Diameter_column = cell2mat(data_accum.Diameter);
Diameter_unique = unique(Diameter_column);

Charging_Time = [];

for i = 1:length(Crate_unique)
    for j = 1:length(Diameter_unique)

        % i, j - th data to write in .txt 
        SOC_vec_Cylinder_ij = data_accum.SOC_Cylinder{(i-1)*length(Diameter_unique)+j};
        SOC_vec_Tubular_ij = data_accum.SOC_Tubular{(i-1)*length(Diameter_unique)+j};
        Charging_Time_vec_ij = data_accum.Charging_Time{(i-1)*length(Diameter_unique)+j};
        
        % length of the i, j - vector
        L_ij = size(data_accum.SOC_Cylinder{(i-1)*length(Diameter_unique)+j});
             
        Charging_Time = [Charging_Time;...
                    Diameter_unique(j)*ones(L_ij), Crate_unique(i)*ones(L_ij), Charging_Time_vec_ij, SOC_vec_Cylinder_ij, SOC_vec_Tubular_ij];
        
       
        diffs = diff([Charging_Time(3,:); Charging_Time]);

        negative_cols = find(sum(diffs<0)>0);

        result = Charging_Time(:,negative_cols(end));

%         Selected_data = Charging_Time(Charging_Time(:,4) > 0.92, :);
%         Final_data = Selected_data(Selected_data(:,4) < 0.96, :);
        
%         Final_data(:,4) = []; 
    end
end

%         
%         x = Final_data(:,1);
%         y = Final_data(:,2);
%         z = Final_data(:,3);
%      

%         my_struct = struct('Diameter', Final_data(:,1), 'C_rate', Final_data(:,2), 'Time', Final_data(:,3));
%         result = zeros(length(x), length(y)); % 결과 행렬 초기화

%         for i = 1:length(x)
%              for j = 1:length(y)
%              result(i, j) = z(find(x==x(i)), find(y==y(j))); % x, y 값에 따른 z 값 찾기
%              end
%         end


%         [unique_x, ~, idx_x] = unique(Final_data(:, 1));
%         [unique_y, ~, idx_y] = unique(Final_data(:, 2));
% 
%         Z = zeros(length(unique_x), length(unique_y));
%         for i = 1:size(Final_data, 2)
%             Z(idx_x(i), idx_y(i)) = Final_data(i, 3);
%         end

%         xy = [Final_data(1,:), Final_data(2,:)]';
%         
%         [unique_xy, ~, idx] = unique(xy, 'rows');
%         unique_z = accumarray(idx, Final_data(3,:)', [], @(x) {x});
%         result = [unique_xy(:,1) unique_xy(:,2) unique_z];


%         X = Crate_unique;
%         X = [0; X];
%         Y = Diameter_unique;
%         Y = transpose(Y);
%         Y(1, 2:end+1) = Y(1, 1:end);
%         Y(1,1) = 0;

%% Plot & Figure


% figure;
% contourf(x, y, z);
% 
% colorbar
% caxis([20 100])
% xlim([1 8])
% ylim([1 12])
% zlim([0 100])

%%




