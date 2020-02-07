clear all
clc
clc
clear all
close all

[X,Y,Z] = peaks(30);

cmap = [1 0 0;  % Red
        0 0 1;  % Blue
        1 1 0;  % Yellow
        0 1 0]; % Green
    
colormap(cmap); 

colors = zeros(size(Z));                   
colors(Z <=-1.7            ) = -2;        % red
colors(Z > -1.7 & Z < 0    ) = -1;        % blue
colors(Z >= 0   & Z < 1.5  ) =  0;        % yellow 
colors(Z >= 1.5            ) =  1;        % green

surf(X,Y,Z);
contourf(X,Y,Z)
