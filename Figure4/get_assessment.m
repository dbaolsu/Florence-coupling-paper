clear
clc

el=load('data\LOCK1_601_989_o1.txt');
el2=load('data\LOCK1_601_989_o2.txt');
a1=vertcat(el(:,2),el2(:,2));
a2=vertcat(el(:,4),el2(:,4));
R1=corrcoef(a1,a2);
RMSE1=sqrt(mean((a1-a2).^2));
Percentage1=RMSE1/max(a1);

el=load('data\Burgaw_978_1194.txt');
a1=el(:,2);
a2=el(:,4);
R2=corrcoef(a1,a2);
RMSE2=sqrt(mean((a1-a2).^2));
Percentage2=RMSE2/max(a1);

el=load('data\BlackRiver_605_1364_o1.txt');
el2=load('data\BlackRiver_605_1364_o2.txt');
a1=vertcat(el(:,2),el2(:,2));
a2=vertcat(el(:,4),el2(:,4));
R3=corrcoef(a1,a2);
RMSE3=sqrt(mean((a1-a2).^2));
Percentage3=RMSE3/max(a2);