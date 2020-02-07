clear all
clc

f=xlsread('D:\weir SPH models CSV\rounded edged\case 6.6 cm M 0.97 Data\CSVs\PIII.200.CSV');
x1=5.59;
%input('Startig of Domain :4.7145 ');
x2=6.61;
%input('Ending of Domain :4.7155 ');
y0=0;
x11=4;
%input('Starting of F.W. Surface : ');
x22=7;
%input('Ending of F.W. Surface : ');
p=40;
%input('Precision of F.W. Surface Gragh : ');
t=0.005;
%input('Tolerance of Particles : ');

N=size(f);
n=N(1,1);
b=1;
bb=1;
wsp(p+1,2)=0;
hh=waitbar(0,'Code is on Proccess , please wait ...');

for i=1:n
    if ((f(i,11)<=x2) & (f(i,11)>=x1)) 
        for q=1:13
                newf(b,q)=f(i,q);
        end
                b=b+1;
                if (f(i,13)>y0)
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
        if ((f(i,11)<=x22) & (f(i,11)>=x11))
            for j=1:p+1
                loc=x11+((j-1)*((x22-x11)/p));
                if ((f(i,11)>=(loc-t)) & (f(i,11)<=(loc+t)))
                    if f(i,13)>wsp(j,2)
                        wsp(j,1)=f(i,11);
                        wsp(j,2)=f(i,13);
                    end
                end
            end   
        end
    end
    waitbar(i/n);
end
close(hh)
