clear
clc

H=10;
Cd=3*10^-3;
L=52*10^3;
W=1000;
Q=1800;
g=9.81;
zeta0=0.25;

el=load('along_channle_el_212.txt');
x=el(:,1);
x0=0:10:L;
y=(H^3+3*Cd*Q^2/g/W^2*x0).^(1/3)-H;
y=fliplr(y);
y(:)=y(:)+zeta0;

y2=((H+zeta0)^3+3*Cd*Q^2/g/W^2*x0).^(1/3)-H;
y2=fliplr(y2);

fid=fopen('theoretical_el_212.txt','w');
for n=1:length(x0)
    fprintf(fid,'%12.1f%10.3f%10.3f\n',x0(n),y2(n),y(n));
end
fclose all;

