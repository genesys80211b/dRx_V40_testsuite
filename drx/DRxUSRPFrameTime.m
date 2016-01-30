load data.mat
t=t*1000;
bar(diff(t(2000:2300)),'k'); %Starts at 1386; post Preamble Det.
axis([0 300 0 50])
set(gca,'FontSize',12,'FontName','Arial','FontWeight','bold')
xlabel('Frame Number','FontSize',23,'FontName','Arial','FontWeight','bold')
ylabel('Elapsed Time (ms)','FontSize',23,'FontName','Arial','FontWeight','bold')
title('Process Time per USRP Frame at DRx','FontSize',25,'FontName','Arial','FontWeight','bold')

% plot(diff(t))
% plot(diff(t(1386:end)))
% 
% mean(diff(t(1386:end))) %post Preamble Det; 7ms
% mean(diff(t)) %Starting with Preamble Det; 7ms