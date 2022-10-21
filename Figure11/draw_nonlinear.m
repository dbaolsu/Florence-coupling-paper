clear;
clc;

data_dir='data\';
add_MA='MA_';

el=load([data_dir,add_MA,'elevation_real_hydro.txt']);
el_nowind=load([data_dir,add_MA,'elevation_real_hydro_nowind.txt']);
el_p=load([data_dir,add_MA,'elevation_real_hydro_p.txt']);
el_p_nowind=load([data_dir,add_MA,'elevation_real_hydro_p_nowind.txt']);

[tm,nm]=size(el);
tm0=720;
xx=zeros(tm0,nm-1);
yy=zeros(tm0,nm-1);
nonliear=zeros(tm0,nm-1);
dis=load('..\Figure9\data\along_channel_dis.txt');

for t=1:tm0
    for n=1:nm-1
        xx(t,n)=t;
        yy(t,n)=-dis(n)/1000.;
    end
end

for t=1:tm
    for n=1:nm-1
        nonliear(t+5,n)=el_p(t,n+1)-(el(t,n+1)+el_p_nowind(t,n+1)-el_nowind(t,n+1));
    end
end

set(gcf,'position',[10 10 700 900],'inverthardcopy','off','color',[1 1 1])
positionVector1 = [0.06, 0.46, 0.7, 0.4];
positionVector2 = [0.06, 0.261, 0.7, 0.2];

subplot(2,1,2,'Position',positionVector2)

    set(gca,'FontName','times new roman','FontSize',8);

    flux_mouth=load('..\Figure7\data\flux_mouth.txt');
    elevation_mouth=load('..\Figure7\data\elevation_mouth.txt');
    
    yyaxis left
    plot(elevation_mouth(:,1),elevation_mouth(:,4),'b-');
    set(gca,'YTick',-1.0:0.5:0.75);
    ylim([-1.0 0.75])
    set(gca,'ycolor','b') 
    ylabel('Water level (m)');
    hold on

    yyaxis right
    plot(flux_mouth(:,1),flux_mouth(:,4)/1000.,'r-');
    set(gca,'YTick',-4:1:2);
    ylim([-4 3])
    set(gca,'ycolor','r') 
    ylabel('Flux (\times10^3 m^3/s)');
    plot([0,720],[0,0],'k:')

    set(gca,'XTick',1:48:721);
    set(gca,'XTickLabel',{'9/8' '9/10' '9/12' '9/14' '9/16' '9/18' '9/20' '9/22' '9/24' '9/26' '9/28' '9/30' '10/2' '10/4' '10/6' '10/8'});
    
    set(gca,'tickdir','out')
    axis([1 721 -4 3])

subplot(2,1,1,'Position',positionVector1)

FPT_XMIN=1;
FPT_XMAX=721;
FPT_YMIN=-51.55;
FPT_YMAX=0;
    
    colormap jet;
    
    set(gca,'FontName','times new roman','FontSize',8);
    set(gcf,'inverthardcopy','off');
    set(gcf,'color',[1 1 1]);
    hold on
    

    set(gca,'XTick',[]);
    set(gca,'XTickLabel',{});
    set(gca,'YTick',-50:5:0);
    set(gca,'YTickLabel',{'50' '45' '40' '35' '30' '25' '20' '15' '10' '5' '0'});
    ylabel('Distance from the head (km)') 
    set(gca,'FontSize',8);
    set(gca,'tickdir','out')
    axis tight 
    axis([FPT_XMIN FPT_XMAX FPT_YMIN FPT_YMAX])
    box on
    
    hold on
    
    warning off;
    zmin=-0.1;
    zmax=0.1;
    skipz=(zmax-zmin)/100;
    contourf(xx,yy,nonliear,[zmin:skipz:zmax],'linestyle','none');

    shading flat;
    caxis([zmin zmax]);
    hc=colorbar;
    set(hc,'xlim',[zmin zmax],'FontName','times new roman','FontSize',8,'Location','east','Position',[0.78,0.46,0.03,0.4]); %
    hold on
    text(750,2,'Water level difference (m)','FontSize',8,'HorizontalAlignment','center');
        
    t0=41;
    t1=129;
    t2=178;
    t3=211;
    
    a1=annotation('line',[0.0995 0.0995],[0.8605 0.8810],'Color',[0.5 0.5 0.5]);
    
    a2=annotation('line',[0.1845 0.1845],[0.8605 0.8810],'Color',[0.5 0.5 0.5]);
    text((t0+t1)/2,1.8,'I','Color',[0.5 0.5 0.5],'FontName','Times','HorizontalAlignment','center')
    
    a3=annotation('line',[0.2327 0.2327],[0.8605 0.8810],'Color',[0.5 0.5 0.5]);
    text((t1+t2)/2,1.8,'II','Color',[0.5 0.5 0.5],'FontName','Times','HorizontalAlignment','center')
    
    a4=annotation('line',[0.2642 0.2642],[0.8605 0.8810],'Color',[0.5 0.5 0.5]);
    text((t2+t3)/2,1.8,'III','Color',[0.5 0.5 0.5],'FontName','Times','HorizontalAlignment','center')
    
    text((t3+FPT_XMAX)/2,1.8,'IV','Color',[0.5 0.5 0.5],'FontName','Times','HorizontalAlignment','center')
    
    a00=annotation('line',[0.06 0.76],[0.8598 0.8598],'Color',[0 0 0],'LineWidth',0.1);

    hold on
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    b1=annotation('line',[0.26 0.26],[0.261 0.86],'LineStyle','--','Color',[0.0 0.0 0.0]);
    b2=annotation('line',[0.50 0.50],[0.261 0.86],'LineStyle','--','Color',[0.0 0.0 0.0]);

    ta=annotation('textbox','String','(a)','Position',[0.06 0.85 0.01 0.01],'LineStyle','none','Color',[0.0 0.0 0.0]);
    tb=annotation('textbox','String','(b)','Position',[0.06 0.451 0.01 0.01],'LineStyle','none','Color',[0.0 0.0 0.0]);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    outfile='Nonliearity.png';
    exportgraphics(gcf,outfile,'Resolution',300)
    close(figure(1));


