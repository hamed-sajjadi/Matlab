clear all
clc
x1=5.15;
x2=5.16;
hh=waitbar(0,'Code is on Proccess , please wait ...');
x=150;
Q(x,2)=0;
% 14 300
% 22 150
for j=1:x
    Q(j,1)=j*0.1; %TIME
    a=['D:\weir SPH models CSV\rounded edged\case 22 cm M second Data\CSVs\PIII.'];
    b=j;
    b=num2str(b);
    c=['.CSV'];
    d=[a b c];
    Q(j,2)=0;
    f=xlsread(d);
    N=size(f);
    n=N(1,1);
    bb=2;
    control=0;
    wpro=0;
    for i=1:n
        if ((f(i,11)<=x2) & (f(i,11)>=x1))
            wpro(bb,2)=f(i,11);     %x%
            wpro(bb,1)=f(i,13);    %z%
            wpro(bb,3)=f(i,2);      %vX%
            bb=bb+1;
            control=1;
        end
    end
    if control==1
        wpro=sortrows(wpro);
        N=size(wpro);
        n=N(1,1);
        wpro(n+1,1)=wpro(n,1)+0.005;
        wpro(1,1)=1;
        for i=2:n
            Q(j,2)=Q(j,2)+(wpro(i,3)*(0.5*(wpro(i+1,1)-wpro(i-1,1)))); %Discharge per length
        end
    end
    waitbar(j/x);
end
close(hh)