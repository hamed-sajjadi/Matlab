clear all
clc
f=xlsread('D:\weir SPH models CSV\rounded edged\case 6.6 cm M 0.97 Data\CSVs\PIII.200.CSV');
x1=4.59;
%input('Startig of Domain : ');
x2=5.61;
%input('Ending of Domain : ');
y0=0;
t=0.00015;
%input('Tolerance of Particles : ');

N=size(f);
n=N(1,1);
b=1;
bb=1;
hh=waitbar(0,'Code is on Proccess , please wait ...');
for i=1:n
    if ((f(i,11)<=x2) & (f(i,11)>=x1))
        if f(i,13)>=1.0150-t & f(i,13)<=1.0150+t
            wpro(bb,1)=f(i,11); %x%
            wpro(bb,2)=f(i,13); %z%
            wpro(bb,3)=f(i,2); %vX%
            wpro(bb,4)=f(i,4); %vZ%
            wpro(bb,5)=f(i,6); %p%
            wpro(bb,6)=f(i,8); %vorY%
            bb=bb+1;
        end
    end
    waitbar(i/n);
end
close(hh)