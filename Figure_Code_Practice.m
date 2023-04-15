%% April 2023; Junghwan Lee
% Written in MATLAB version 2023b.
% Contours instead of surf

% Example 04/25/2023
bx = readmatrix('BX X,Z.xlsx');
bz = readmatrix('BZ X,Z.xlsx');
B=sqrt(bx.^2+bz.^2);

x=-12.4:0.5:12.6;
y=24:-2:0;
[Y,X]=meshgrid(x,y);
%surf(Y,X,transpose(B));
%hold on;

contour(Y,X,transpose(B),'fill','on');
%colormap(parula(18));
xlabel('X-axis');
ylabel('Z-axis');
zlabel('B-value');
title('the value of B data');
colorbar;

%% to do list
% Load txt file and use this file to attach my figure (Plot)

% Load the data from a text file
data = load('data.txt');

% Extract the x, y, and z data from the loaded data
x = data(:, 1);
y = data(:, 2);
z = data(:, 3);

% Reshape the x, y, and z data to create a grid
n = sqrt(length(x));
x = reshape(x, n, n);
y = reshape(y, n, n);
z = reshape(z, n, n);

% Create the contour plot
contour(x, y, z)

% Add a color bar to show the values of the contour lines
colorbar

%% to do list
% CCCV rate (C), SOC (15~100%), Maximum Temperature (oC), Charging Time(min), Li Plating Potential(V), (Tubular Radius 2mm Fix)...
% Save Mat file and transfer to txt File
