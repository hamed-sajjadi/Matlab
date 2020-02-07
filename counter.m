clear all
clc
%0.060 200
%0.139 300
%0.220 150
f=xlsread('D:\weir SPH models CSV\rounded edged\case 6.6 cm M 0.97 Data\CSVs\PIII.200.CSV');
p=101;
%input('Precision of F.W. Surface Gragh : ');
N=size(f);
n=N(1,1);
count(p+1,2)=0;
hh=waitbar(0,'Code is on Proccess , please wait ...');
s(p,1)=0;
for i=1:n
    for j=1:p
        if ((f(i,11)>=((j-1)/p)+4.6) & (f(i,11)<=((j/p)+4.6)))
            s(j,1)=s(j,1)+1;
        end
        count(j,1)=j;
        count(j,2)=s(j,1);
    end
    waitbar(i/n);
end  
close(hh)
