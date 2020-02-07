clear all
clc
f=xlsread('D:\weir SPH models CSV\rounded edged\case 22 cm M second Data\New CSVs\C0.22dp0.5coefh1.00.CSV');
x1=5.59;
x2=6.61;
N=size(f);
n=N(1,1);
bb=1;
hh=waitbar(0,'Code is on Proccess , please wait ...');
for i=1:n
    if ((f(i,11)<=x2) & (f(i,11)>=x1)) & (f(i,13)>=0.015) & (f(i,13)<=0.025)
        wpro(bb,1)=f(i,11); %x%
        wpro(bb,2)=f(i,13); %z%
        wpro(bb,3)=f(i,2); %vX%
        wpro(bb,4)=f(i,4); %vZ%
        wpro(bb,5)=f(i,6); %p%
        wpro(bb,6)=f(i,8); %vorY%
        bb=bb+1;
    end
    waitbar(i/n);
end
close(hh)
