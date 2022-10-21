clear
clc

order=1;
framelen=39;

fn='LOCK1_601_989';
flux=load([fn,'.txt']);
t=flux(:,1);
X=flux(:,2);
X2=sgolayfilt(X,order,framelen);
figure
plot(t,X)
hold on
plot(t,X2)
fid=fopen([fn,'_f.txt'],'w');
for i=1:length(t)
    fprintf(fid,'%5.2f%6.2f\n',t(i),X2(i));
end
fclose all;

fn='Burgaw_978_1194';
flux=load([fn,'.txt']);
t=flux(:,1);
X=flux(:,3);
X2=sgolayfilt(X,order,framelen);
figure
plot(t,X)
hold on
plot(t,X2)
fid=fopen([fn,'_f.txt'],'w');
for i=1:length(t)
    fprintf(fid,'%5.2f%6.2f\n',t(i),X2(i));
end
fclose all;

fn='BlackRiver_605_1364';
flux=load([fn,'.txt']);
t=flux(:,1);
X=flux(:,2);
X2=sgolayfilt(X,order,framelen);
figure
plot(t,X)
hold on
plot(t,X2)
fid=fopen([fn,'_f.txt'],'w');
for i=1:length(t)
    fprintf(fid,'%5.2f%6.2f\n',t(i),X2(i));
end
fclose all;


