clear;
clc;


set(gcf,'position',[10 10 1000 1000],'inverthardcopy','off','color',[1 1 1])

    load('..\Figure3\data\Couple_domain.mat');
    zeta_max=load('data\zeta_max.mat');
    combine_h=zeta_max.zeta_max;
    [i0,j0]=find(combine_h==0);
    for n=1:length(i0)
        combine_h(i0(n),j0(n))=0/0;
    end
    
    [im,jm]=size(combine_h);

    FPT_XMIN=lon(1,1);
    FPT_XMAX=lon(im,1);
    FPT_YMIN=lat(1,1);
    FPT_YMAX=lat(1,jm);
    
    map=load('data\cm.dat');
    colormap(map);
    set(gca,'box','on','Layer','top','FontName','times new roman','FontSize',15);
    hold on

    warning off;
    zmin=0.0;
    zmax=5.0;
    skipz=(zmax-zmin)/100;
    contourf(lon,lat,combine_h,[zmin:skipz:zmax],'linestyle','none');
    hold on
    
    set(gca,'XTick',-78.8:0.3:-77.6);
    set(gca,'XTickLabel',{'-78.8' '-78.5' '-78.2' '-77.9' '-77.6'});
    set(gca,'YTick',33.6:0.2:35.4);
    set(gca,'YTickLabel',{'33.6' '33.8' '34.0' '34.2' '34.4' '34.6' '34.8' '35.0' '35.2' '35.4'});
    set(gca,'FontSize',15);
    set(gca,'tickdir','out')
    axis equal
    axis([FPT_XMIN FPT_XMAX FPT_YMIN FPT_YMAX])
    xlabel('Longitude') 
    ylabel('Latitude') 
    hold on
    
    ap=get(gca,'position');
    shading flat;
    caxis([zmin zmax]);
    hc=colorbar;
    set(hc,'ylim',[zmin zmax],'Units','normalized','Position',[ap(3)+0.06 ap(2) 0.04 ap(4)],'FontName','times new roman','FontSize',15);
    text(0.98,1.06,'Water head /','Units','normalized','FontName','times new roman','FontSize',15)%,'HorizontalAlignment', 'center')
    text(0.98,1.03,'Water level (m)','Units','normalized','FontName','times new roman','FontSize',15)%,'HorizontalAlignment', 'center')
    hold on    
    
    bij=load('..\Figure3\data\boundary_ij.txt');
    [nbij,~]=size(bij);
    lonb=zeros(nbij,1);
    latb=zeros(nbij,1);
    for n=1:nbij
        lonb(n)=lon(bij(n,1),bij(n,2));
        latb(n)=lat(bij(n,1),bij(n,2));
    end
    plot(lonb,latb,'Color',[0.2,0.2,0.2],'LineWidth',0.5);    
    
    site4=load('..\Figure3\data\HWM_obs.txt');
    lons4=site4(:,2);
    lats4=site4(:,1);
    plot(lons4,lats4,'ko','Markersize',5,'MarkerFaceColor','k');   

    outfile=['disturbance_hwm','.png'];
    print(gcf,'-dpng',outfile)  
    close(figure(1));
