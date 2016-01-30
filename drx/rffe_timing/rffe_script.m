clear all; close all; clc;

%%rffe test script
load rffe_var

%% Codegen

% codegen rffe_25 -args {df,false,cas,cau}
% codegen rffe_50 -args {df,false,cas,cau}
% codegen rffe_75 -args {df,false,cas,cau}
% codegen rffe_100 -args {df,false,cas,cau}

nRuns=10;

rffeInterpreted = zeros(4,nRuns);
rffeMex = zeros(4,nRuns);

%%
for i = 1:nRuns
tic
rffe_25(df,ft,cas,cau);
rffeInterpreted(1,i) = toc;

tic
rffe_50(df,ft,cas,cau);
rffeInterpreted(2,i) = toc;

tic
rffe_75(df,ft,cas,cau);
rffeInterpreted(3,i) = toc;

tic
rffe_100(df,ft,cas,cau);
rffeInterpreted(4,i) = toc;

tic
rffe_25_mex(df,ft,cas,cau);
rffeMex(1,i) = toc;

tic
rffe_50_mex(df,ft,cas,cau);
rffeMex(2,i) = toc;

tic
rffe_75_mex(df,ft,cas,cau);
rffeMex(3,i) = toc;

tic
rffe_100_mex(df,ft,cas,cau);
rffeMex(4,i) = toc;

end

muInterpreted=mean(rffeInterpreted(:,2:end),2);
muMex=mean(rffeMex(:,2:end),2);
sigInterpreted=std(rffeInterpreted(:,2:end),0,2);
sigMex=std(rffeMex(:,2:end),0,2);

figure(1)
subplot(2,1,1)
bar(muInterpreted,0.5);
hold on;
errorbar(muInterpreted,sigInterpreted,'Color','[0.5 0.5 0.5]','LineWidth',1.5);
axis([0 5 0 0.01])
ax = gca;
ax.XTickLabel = [25 50 75 100];
ax.YTickLabel = 0:2:10;
ax.FontSize=14;
ax.FontName='Arial';
ax.FontWeight='bold';
xlabel('Frequency Resolution (Hz)','FontSize',19,'FontWeight','bold')                                                       );
ylabel('Time for RFFE Block (ms)','FontSize',19,'FontWeight','bold');
title('RFFE Block Timing - (1) Interpreted MATLAB','FontSize',25,'FontWeight','bold');
h=legend('Mean (\mu)','Std Dev (\sigma)');
set(h,'FontSize',20,'FontName','Arial','FontWeight','bold');

subplot(2,1,2)
bar(muMex,0.5);
hold on;
errorbar(muMex,sigMex,'Color','[0.5 0.5 0.5]','LineWidth',1.5);
axis([0 5 0 0.01])
ax = gca;
ax.XTickLabel = [25 50 75 100];
ax.YTickLabel = 0:2:10;
ax.FontSize=14;
ax.FontName='Arial';
ax.FontWeight='bold';
xlabel('Frequency Resolution (Hz)','FontSize',19,'FontWeight','bold');
ylabel('Time for RFFE Block (ms)','FontSize',19,'FontWeight','bold');
title('RFFE Block Timing - (2) Using MEX','FontSize',25,'FontWeight','bold');
h=legend('Mean (\mu)','Std Dev (\sigma)');
set(h,'FontSize',20,'FontName','Arial','FontWeight','bold');
                                                                
colormap(gray)

figure(2);
bar([muInterpreted';muMex']',0.5)
hold on;
errorbar([0.85 1.85 2.85 3.85],muInterpreted,0.5*sigInterpreted,'.','Color','[0.5 0.5 0.5]');
errorbar([1.15 2.15 3.15 4.15],muMex,0.5*sigMex,'.','Color','[0.5 0.5 0.5]');
axis([0 5 0 0.004])
ax = gca;
ax.XTickLabel = [25 50 75 100];
ax.YTickLabel = 0:0.5:4;
ax.FontSize=14;
ax.FontName='Arial';
ax.FontWeight='bold';
xlabel('Frequency Resolution (Hz)','FontSize',21,'FontWeight','bold');
ylabel('Time for RFFE Block (ms)','FontSize',21,'FontWeight','bold');
title('RFFE Block Timing','FontSize',25,'FontWeight','bold');
h=legend('Interpreted MATLAB','Using MEX');
set(h,'FontSize',20,'FontName','Arial','FontWeight','bold');
colormap(gray)