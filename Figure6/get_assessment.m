clear
clc

el_o=load('data\Wrightsville_Beach_o.txt');
el=load('data\Wrightsville_Beach.txt');
a1=el_o(1:10:end-1,2);
a2=el(:,4);
R=corrcoef(a1,a2);
RMSE=sqrt(mean((a1-a2).^2));

el_o=load('data\Wilmington_o.txt');
el=load('data\Wilmington.txt');
a1=el_o(1:10:end-1,2);
a2=el(:,4);
R2=corrcoef(a1,a2);
RMSE2=sqrt(mean((a1-a2).^2));
