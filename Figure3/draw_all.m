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

    FPT_XMIN=-87;
    FPT_XMAX=-73;
    FPT_YMIN=28.1;
    FPT_YMAX=38.8;

    bgcolor=[1.0 1.0 1.0];
    set(gca,'box','on','Layer','top','FontName','times new roman','FontSize',15);
    set(gca,'color',bgcolor);

    hold on
    
    set(gca,'FontSize',15);
    set(gca,'tickdir','out')
    axis tight 
    axis([FPT_XMIN FPT_XMAX FPT_YMIN FPT_YMAX])
    xlabel('Longitude') 
    ylabel('Latitude') 

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
    plot(xd,yd,'k--','LineWidth',1);
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
    plot(xd,yd,'k--','LineWidth',1);    
    clearvars lon lat im jm xd yd
    load('data\Couple_domain.mat')
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
    plot(-track(1:end-4,2),track(1:end-4,1),'ko','Markersize',6);
    
    xshift=0.23;
    yshift=0.3;
    text(-73.2-xshift-0.02,31.5-yshift,'9/13','FontName','times new roman','FontSize',10)
    text(-76.5-xshift,34.0-yshift,'9/14','FontName','times new roman','FontSize',10)
    text(-78.8-xshift,33.9-yshift,'9/15','FontName','times new roman','FontSize',10)
    text(-80.2-xshift,33.6-yshift,'9/16','FontName','times new roman','FontSize',10)
    text(-82.2-xshift-0.37,35.0,'9/17','FontName','times new roman','FontSize',10)
    
    text(0.015,0.97,'(b)','Units','normalized','FontName','times new roman','FontSize',16)
    text(0.015,0.91,'(a)','Units','normalized','FontName','times new roman','FontSize',16)

subplot(1,4,3,'Position',positionVector2)    
    
    [im,jm]=size(combine_h);

    FPT_XMIN=lon(1+20,1);
    FPT_XMAX=lon(im-20,1);
    FPT_YMIN=lat(1,1+20);
    FPT_YMAX=lat(1,jm-20);
    
    map = cmocean('topo');
    map(129:256,:)=flipud(map(129:256,:));

    colormap(map);
    set(gca,'box','on','Layer','top','FontName','times new roman','FontSize',15);
    set(gca,'color',bgcolor);
    hold on

    warning off;
    zmin=-50.0;
    zmax=50.0;
    skipz=(zmax-zmin)/100;
    contourf(lon,lat,-combine_h,zmin:skipz:zmax,'linestyle','none');

    shading flat;
    caxis([zmin zmax]);
    hold on
    
    set(gca,'XTick',-78.8:0.3:-77.6);
    set(gca,'XTickLabel',{'-78.8' '-78.5' '-78.2' '-77.9' '-77.6'});
    set(gca,'YTick',33.6:0.2:35.4);
    set(gca,'YTickLabel',{'33.6' '33.8' '34.0' '34.2' '34.4' '34.6' '34.8' '35.0' '35.2' '35.4'});
    set(gca,'FontSize',15);
    set(gca,'tickdir','out')
    axis([FPT_XMIN FPT_XMAX FPT_YMIN FPT_YMAX])
    xlabel('Longitude') 

    hold on
    
    bij=load('data\boundary_ij.txt');
    [nbij,~]=size(bij);
    lonb=zeros(nbij,1);
    latb=zeros(nbij,1);
    for n=1:nbij
        lonb(n)=lon(bij(n,1),bij(n,2));
        latb(n)=lat(bij(n,1),bij(n,2));
    end
    plot(lonb,latb,'Color',[0.2,0.2,0.2],'LineWidth',0.5);    
    
    site4=load('data\HWM_obs.txt');
    lons4=site4(:,2);
    lats4=site4(:,1);
    plot(lons4,lats4,'ko','Markersize',3,'MarkerFaceColor','k');   
    
    site=load('data\noaa_site.txt');
    [nsite,~]=size(site);
    nsite=nsite-1;
    lons=zeros(nsite,1);
    lats=zeros(nsite,1);
    for n=1:nsite
        lons(n)=lon(site(n,1),site(n,2));
        lats(n)=lat(site(n,1),site(n,2));
    end
    plot(lons,lats,'rp','Markersize',6,'MarkerFaceColor','r');  
    text(-78.140,34.226,'8658120','FontName','times new roman','FontSize',10)
    text(-77.761,34.215,'8658163','FontName','times new roman','FontSize',10)    

    site2=load('data\usgs_site.txt');
    [nsite2,~]=size(site2);
    lons2=zeros(nsite2,1);
    lats2=zeros(nsite2,1);
    for n=1:nsite2
        lons2(n)=lon(site2(n,1),site2(n,2));
        lats2(n)=lat(site2(n,1),site2(n,2));
    end
    plot(lons2,lats2,'bs','Markersize',6,'MarkerFaceColor','b');     
    text(-78.510,34.405,'02105769','FontName','times new roman','FontSize',10)
    text(-78.400,34.795,'02106500','FontName','times new roman','FontSize',10)
    text(-77.982,34.635,'02108566','FontName','times new roman','FontSize',10)
    
    plot(-77.995,34.273,'o','Color',[0.0 0.4 0.0],'Markersize',4,'MarkerFaceColor',[0.0 0.4 0.0]);  
    plot(-77.952,34.28,'o','Color',[0.0 0.4 0.0],'Markersize',4,'MarkerFaceColor',[0.0 0.4 0.0]);  
    
    xd=zeros(5,1);
    yd=zeros(5,1);
    xd(1)=-78.06;
    yd(1)=33.83;
    xd(2)=-78.06;
    yd(2)=34.33;
    xd(3)=-77.86;
    yd(3)=34.33;
    xd(4)=-77.86;
    yd(4)=33.83;
    xd(5)=-78.06;
    yd(5)=33.83;
    plot(xd,yd,'r--','LineWidth',1);    
    
    plot(-track1(:,2),track1(:,1),'b-','LineWidth',1);
    plot(-track2(:,2),track2(:,1),'m-','LineWidth',1);
    plot(-track3(:,2),track3(:,1),'g-','LineWidth',1);
    plot(-track4(:,2),track4(:,1),'y-','LineWidth',1);
    plot(-track(:,2),track(:,1),'ko','Markersize',6);
    
    xshift=0.01;
    yshift=0.04;
    text(-77.9+xshift,34.1-yshift+0.01,'9/14 12:00','FontName','times new roman','FontSize',10)
    text(-78.4+xshift,34-yshift,'9/14 18:00','FontName','times new roman','FontSize',10)
    text(-78.8+xshift,33.9-yshift,'9/15 00:00','FontName','times new roman','FontSize',10)
    
    text(0.03,0.97,'(c)','Units','normalized','FontName','times new roman','FontSize',16,'Color',[1,1,1])
    
subplot(1,4,4,'Position',positionVector3)     

    FPT_XMIN=-78.06;
    FPT_XMAX=-77.86;
    FPT_YMIN=33.83;
    FPT_YMAX=34.33;

    colormap(map);
    set(gca,'box','on','Layer','top','FontName','times new roman','FontSize',12);
    set(gca,'color',bgcolor);
    set(gcf,'inverthardcopy','off');
    set(gcf,'color',[1 1 1]);
    hold on

    warning off;
    contourf(lon,lat,-combine_h,zmin:skipz:zmax,'linestyle','none');

    shading flat;
    caxis([zmin zmax]);
    hc=colorbar;
    set(hc,'ylim',[zmin zmax],'Units','normalized','position',[0.87, 0.1, 0.02, 0.80],'FontName','times new roman','FontSize',15);
    text(0.94,1.05,'Topography(m)','Units','normalized','FontName','times new roman','FontSize',15)
    hold on
    
    set(gca,'XTick',-78.1:0.1:-77.9);
    set(gca,'XTickLabel',{'-78.1' '-78.0' '-77.9'});
    set(gca,'YTick',33.9:0.1:34.3);
    set(gca,'YTickLabel',{'33.9' '34.0' '34.1' '34.2' '34.3'});
    set(gca,'FontSize',15);
    set(gca,'tickdir','out')
    axis([FPT_XMIN FPT_XMAX FPT_YMIN FPT_YMAX])
    xlabel('Longitude') 
    hold on

    plot(lonb,latb,'Color',[0.2,0.2,0.2],'LineWidth',0.5);   
    
    plot(lons,lats,'rp','Markersize',6,'MarkerFaceColor','r');  

    site3=load('data\transection.txt');
    [nsite3,~]=size(site3);
    lons3=zeros(2,1);
    lats3=zeros(2,1);
    for n=1:nsite3
        lons3(1)=lon(site3(n,1),site3(n,2));
        lats3(1)=lat(site3(n,1),site3(n,2));
        lons3(2)=lon(site3(n,3),site3(n,4));
        lats3(2)=lat(site3(n,3),site3(n,4));       
        plot(lons3,lats3,'Color',[0.2,0.2,0.2],'LineWidth',1.5)
    end
    
    bleft=load('data\boundary_left.txt');
    [nbleft,~]=size(bleft);
    lonleft=zeros(nbleft,1);
    latleft=zeros(nbleft,1);
    for n=1:nbleft
        lonleft(n)=lon(bleft(n,1),bleft(n,2));
        latleft(n)=lat(bleft(n,1),bleft(n,2));
    end
    plot(lonleft,latleft,'Color',[0.2,0.2,0.2],'LineWidth',1.5);   
    
    bright=load('data\boundary_right.txt');
    [nbright,~]=size(bright);
    lonright=zeros(nbright,1);
    latright=zeros(nbright,1);
    for n=1:nbright
        lonright(n)=lon(bright(n,1),bright(n,2));
        latright(n)=lat(bright(n,1),bright(n,2));
    end
    plot(lonright,latright,'Color',[0.2,0.2,0.2],'LineWidth',1.5);   
    
    text(0.42,0.83,'tr1','Units','normalized','FontName','times new roman','FontSize',14)
    text(0.24,0.10,'tr2','Units','normalized','FontName','times new roman','FontSize',14)
    text(0.45,0.56,'tr3','Units','normalized','FontName','times new roman','FontSize',14)
    text(0.69,0.60,'tr4','Units','normalized','FontName','times new roman','FontSize',14)
    
    site4=load('data\along_channel_point.txt');
    [nsite4,~]=size(site4);
    lons4=zeros(nsite4,1);
    lats4=zeros(nsite4,1);
    for n=1:nsite4
        lons4(n)=lon(site4(n,1),site4(n,2));
        lats4(n)=lat(site4(n,1),site4(n,2));
    end
    plot(lons4,lats4,'ko','Markersize',2,'MarkerFaceColor','k');  
    
    plot(-77.995,34.273,'o','Color',[0.0 0.4 0.0],'Markersize',6,'MarkerFaceColor',[0.0 0.4 0.0]);  
    plot(-77.952,34.28,'o','Color',[0.0 0.4 0.0],'Markersize',6,'MarkerFaceColor',[0.0 0.4 0.0]);  
    
    plot(-track1(:,2),track1(:,1),'b-','LineWidth',1);
    plot(-track2(:,2),track2(:,1),'m-','LineWidth',1);
    plot(-track3(:,2),track3(:,1),'g-','LineWidth',1);
    plot(-track4(:,2),track4(:,1),'y-','LineWidth',1);
    plot(-track(:,2),track(:,1),'ko','Markersize',6);
    
    xshift=0.018;
    yshift=0.01;
    text(-77.9-xshift,34.1-yshift,'9/14 12:00','FontName','times new roman','FontSize',10)
    
    text(0.05,0.97,'(d)','Units','normalized','FontName','times new roman','FontSize',16)
    
    an=annotation('line', [0.304 0.4754], [0.503 0.1]);
    an.Color='red';
    an.LineStyle='--';
    an=annotation('line', [0.304 0.4754], [0.660 0.9]);
    an.Color='red';
    an.LineStyle='--';
    an=annotation('line', [0.63 0.7386], [0.219 0.1]);
    an.Color='red';
    an.LineStyle='--';
    an=annotation('line', [0.63 0.7386], [0.417 0.9]);
    an.Color='red';
    an.LineStyle='--';
    
    outfile=['domain_all','.png'];
    print(gcf,'-dpng',outfile)  
    close(figure(1));
