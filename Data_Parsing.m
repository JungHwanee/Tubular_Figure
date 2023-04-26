% LJH Comsol Charging Time input code
% This code makes Cell Figure from a matlab struct (.mat)
  
% assumes .mat has a CCCV Crate (C), Inner Diameter (mm), Charging Time (min), Li-Plating Potential (V) etc...

clear;clc;close all

%% Interface

% .mat (struct) fullpath
origin_fullpath ='D:\Leejh\1. KENTECH\1. Modeling\COMSOL+MATLAB\Matlab\LJH\Final\Final\Charging_Time.mat';


%% Engine

% load cell model 
load(origin_fullpath) % assume variable name 'data_accum'


    Charging_Time(1,:) = [];

    zero_found = false; % 0을 찾았는지 여부를 저장할 변수
    result = []; % 결과를 저장할 배열

        for i = 1:size(Charging_Time, 1)
           if Charging_Time(i, 3) == 0 % 3열에서 0을 찾았을 경우
               if ~zero_found % 0을 처음 찾은 경우
                  zero_found = true; % 0을 찾았다고 표시
                  result = [result; Charging_Time(i-1, :)]; % 0 이전의 모든 행 저장
              end
               elseif zero_found % 0 이후의 행에서 0을 찾지 못한 경우
        zero_found = false; % 0을 다시 찾을 준비
           end
        end
        
    x = result(:, 1);
    y = result(:, 2);
    z = result(:, 3);
        
    unique_x = unique(x);
    unique_y = unique(y);

    [X, Y] = meshgrid(unique_x, unique_y);

    Z = zeros(size(X));

    for i = 1:numel(unique_x)
        for j = 1:numel(unique_y)
             idx = find((x == unique_x(i)) & (y == unique_y(j)));
            if ~isempty(idx)
             Z(j, i) = z(idx);
            end
        end
    end
        
        xyz_mat = horzcat(x, y, z);

%         [xy_vals, ~, idx] = unique(Final_data(:,1:2), 'rows');
%         z_mat = accumarray(idx, Final_data(:,3), [], @(x) {x});
        
%         xyz_mat = [xy_vals, cell2mat(z_mat)];
        
figure(1)
        scatter(x,y, [], z);
figure(2)     
        scatter3(x,y,z);

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
