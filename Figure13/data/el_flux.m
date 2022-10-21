clear
clc

H=10;
Cd=3*10^-3;
L=51434.6;
W=1000;
Q=1800;
g=9.81;

zz=-1:0.05:1;
qq=0:1000:5000;

for j=1:length(qq)
for i=1:length(zz)

zeta0=zz(i);
Q=qq(j);
y=(H^3+3*Cd*Q^2/g/W^2*L).^(1/3)-H+zeta0;
y2=((H+zeta0)^3+3*Cd*Q^2/g/W^2*L).^(1/3)-H;

dy(i,j)=y2-y;

end

plot(zz,dy(:,j),'k-')
hold on

end

text(1.01,dy(41,6),'Q=5000','Fontname','Times New Roman')
text(1.01,dy(41,5),'Q=4000','Fontname','Times New Roman')
text(1.01,dy(41,4),'Q=3000','Fontname','Times New Roman')
text(1.01,dy(41,3),'Q=2000','Fontname','Times New Roman')
text(1.01,dy(41,2),'Q=1000','Fontname','Times New Roman')
text(1.01,dy(41,1)+0.01,'Q=0','Fontname','Times New Roman')

xlabel('\eta_0')
ylabel('\Delta\eta')

fid=fopen('Nonlinearity_theoretical.txt','w');
for i=1:length(zz)
    fprintf(fid,'%8.2f%15.7f%15.7f%15.7f%15.7f%15.7f%15.7f\n',zz(i),dy(i,1),dy(i,2),dy(i,3),dy(i,4),dy(i,5),dy(i,6));
end
fclose all;