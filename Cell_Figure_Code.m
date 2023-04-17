% LJH Comsol Cell input code
% This code makes Cell Figure from a matlab struct (.mat)
  
% assumes .mat has a CCCV Crate (C), Inner Diameter (mm), Charging Time (min), Li-Plating Potential (V) etc...

clear;clc;close all

%% Interface

% .mat (struct) fullpath
origin_fullpath ='D:\Leejh\1. KENTECH\1. Modeling\COMSOL+MATLAB\Matlab\LJH\Final\Final\Cell_Result_v2.mat';

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
        SOC_vec_ij = data_accum.SOC{(i-1)*length(Diameter_unique)+j};
        Charging_Time_vec_ij = data_accum.Charging_Time{(i-1)*length(Diameter_unique)+j};
        
        % length of the i, j - vector
        L_ij = size(data_accum.SOC{(i-1)*length(Diameter_unique)+j});
             
 
        Charging_Time = [Charging_Time;...
                    Crate_unique(i)*ones(L_ij), Diameter_unique(j)*ones(L_ij), SOC_vec_ij, Charging_Time_vec_ij];
        
        Selected_data = Charging_Time(Charging_Time(:,3) > 1, :);
        Final_data = Selected_data(Selected_data(:,3) < 1.0010, :);

    end
end

