% LJH Comsol Cell input code
% This code makes Cell Figure from a matlab struct (.mat)
  
% assumes .mat has a CCCV Crate (C), Inner Diameter (mm), Charging Time (min), Li-Plating Potential (V) etc...


%% Interface

% .mat (struct) fullpath
origin_fullpath ='D:\Leejh\1. KENTECH\1. Modeling\COMSOL+MATLAB\Matlab\LJH\Final\Final\Cell_Result.mat';

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

% Charging Time vector
Time_column = cell2mat(data_accum.Time);

% SOC vector
SOC_column = cell2mat(data_accum.SOC);

