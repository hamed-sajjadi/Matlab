clear all
clc

f=xlsread('D:\weir SPH models CSV\rounded edged\case 22 cm M second Data\CSVs\PIII.22.CSV');
x1=2.6;
x2=5.6;
z1=0.9;

N=size(f);
n=N(1,1);
bb=1;

hh=waitbar(0,'Code is on Proccess , please wait ...');

for i=1:n
    if ((f(i,11)<=x2) & (f(i,11)>=x1)& (f(i,13)>=z1))
        wpro(bb,1)=f(i,11)-4.6; %x%
        wpro(bb,2)=f(i,13); %z%
        bb=bb+1;
    end
    waitbar(i/n);
end
close(hh)
