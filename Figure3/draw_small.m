clear;
clc;

set(gcf,'position',[10 50 1900 700],'inverthardcopy','off','color',[1 1 1])

positionVector1 = [0.04, 0.1, 0.3854, 0.80];
positionVector2 = [0.4754, 0.1, 0.2132, 0.80];
positionVector3 = [0.7386, 0.1, 0.1179, 0.80];

track=load('data\track.txt');
track1=load('data\track1.txt');
track2=load('data\track2.txt');
track3=load('data\track3.txt');
track4=load('data\track4.txt');

subplot(1,4,[1,2],'Position',positionVector1)

    FPT_XMIN=-102;
    FPT_XMAX=-53;
    FPT_YMIN=11.5;
    FPT_YMAX=49;

    bgcolor=[1.0 1.0 1.0];
    set(gca,'box','on','Layer','top','FontName','times new roman','FontSize',15,'LineWidth',2);
    set(gca,'color',bgcolor);

    hold on
    
    set(gca,'FontSize',15);
    set(gca,'tickdir','none')
    axis tight 
    axis([FPT_XMIN FPT_XMAX FPT_YMIN FPT_YMAX])
    xlabel('') 
    ylabel('') 
    set(gca,'XTickLabel',{});
    set(gca,'YTickLabel',{});

    hold on
    
    bij=load('data\coastal_line.dat');
    plot(bij(:,1),bij(:,2),'Color',[0.2,0.2,0.2],'LineWidth',0.5);    
    
    load('data\USEast.mat');
    [im,jm]=size(lon);
    xd=zeros(5,1);
    yd=zeros(5,1);
    xd(1)=lon(1,jm);
    yd(1)=lat(1,jm);
    xd(2)=lon(1,1);
    yd(2)=lat(1,1);
    xd(3)=lon(im,1);
    yd(3)=lat(im,1);
    xd(4)=lon(im,jm);
    yd(4)=lat(im,jm);
    xd(5)=lon(1,jm);
    yd(5)=lat(1,jm);
    plot(xd,yd,'k--','LineWidth',2);
    clearvars lon lat im jm xd yd
    load('data\Carolinas.mat');
    [im,jm]=size(lon);
    xd=zeros(5,1);
    yd=zeros(5,1);
    xd(1)=lon(1,jm);
    yd(1)=lat(1,jm);
    xd(2)=lon(1,1);
    yd(2)=lat(1,1);
    xd(3)=lon(im,1);
    yd(3)=lat(im,1);
    xd(4)=lon(im,jm);
    yd(4)=lat(im,jm);
    xd(5)=lon(1,jm);
    yd(5)=lat(1,jm);
    plot(xd,yd,'k--','LineWidth',2);    
    clearvars lon lat im jm xd yd
    load('data\Couple_domain.mat');
    [im,jm]=size(lon);
    xd=zeros(5,1);
    yd=zeros(5,1);
    xd(1)=lon(1,jm);
    yd(1)=lat(1,jm);
    xd(2)=lon(1,1);
    yd(2)=lat(1,1);
    xd(3)=lon(im,1);
    yd(3)=lat(im,1);
    xd(4)=lon(im,jm);
    yd(4)=lat(im,jm);
    xd(5)=lon(1,jm);
    yd(5)=lat(1,jm);
    plot(xd,yd,'r--','LineWidth',1);
    
    plot(-track1(:,2),track1(:,1),'b-','LineWidth',1);
    plot(-track2(:,2),track2(:,1),'m-','LineWidth',1);
    plot(-track3(:,2),track3(:,1),'g-','LineWidth',1);
    plot(-track4(:,2),track4(:,1),'y-','LineWidth',1);
    
    outfile=['domain_small','.png'];
    print(gcf,'-dpng',outfile)  
    close(figure(1));
