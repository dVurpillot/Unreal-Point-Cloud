filename = 'Chambord.csv'; %read csv file from CloudCompare
A = csvread(filename); %read csv file from CloudCompare

B = A(:,4:6); %New matrix B keep color information
A = A(:,1:3); %Old maxtrix A keep spatial information

A(:,1) = A(:,1)-588500.00; %Get ride of big coordinates from .las file
A(:,2) = A(:,2)-6725000.00; %Get ride of big coordinates from .las file
A(:,3) = A(:,3)-0.00; %Get ride of big coordinates from .las file

A = A - min(A(:));
A = A/max(A(:)); %Get the 0-1 scale
A = round(A, 6); %round 6 decimals

Ai = reshape(A,2048,2048,3);
Bi = reshape(B,2048,2048,3);
%image(Ai);
%image(Bi);

imwrite((Ai), 'A:\Z_Projets\Unreal Engine\matlab scripts\spatial.png', 'png', 'BitDepth',16)
imwrite((Bi), 'A:\Z_Projets\Unreal Engine\matlab scripts\color.png', 'png', 'BitDepth',16)