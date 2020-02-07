clear all
clc
f=xlsread('D:\weir SPH models CSV\rounded edged\case 14 cm M Data\CSVs\PIII.200.CSV');
x1=4.59;
%input('Startig of Domain : ');
x2=5.61;
%input('Ending of Domain : ');
y0=0;
t=0.001;
%input('Tolerance of Particles : ');

N=size(f);
n=N(1,1);
b=1;
bb=1;
hh=waitbar(0,'Code is on Proccess , please wait ...');
for i=1:n
    if ((f(i,11)<=x2) & (f(i,11)>=x1))
        for j=1:8
            loc= 0.0039*(j^3) - 0.0455*(j^2) + 0.2776*(j) + 4.3017;%gives X on the crest based on H1/Lcrest in paper%
            if ((f(i,11)>=(loc-t)) & (f(i,11)<=(loc+t)))
                wpro(bb,1)=f(i,11); %x%
                wpro(bb,2)=f(i,13); %z%
                wpro(bb,3)=f(i,2); %vX%
                wpro(bb,4)=f(i,4); %vZ%
                wpro(bb,5)=f(i,6); %p%
                wpro(bb,6)=f(i,8); %vorY%
                bb=bb+1;
            end
        end
    end
    waitbar(i/n);
end
close(hh)