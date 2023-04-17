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
 
