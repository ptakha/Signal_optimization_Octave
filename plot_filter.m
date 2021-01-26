function plot_filter (x, y, yc, y_f_min, y_f_max, Title)
cf=figure()
subplot(1,2,1)
plot(x, y)
hold on
plot(x, yc, 'go')
plot(x, y_f_min,'linewidth', 5)
title(strcat(Title, ' filter optimization minimal error'))
legend('Noisy signal', 'Clean signal', 'de\_min')
subplot(1,2,2)
plot(x, y)
hold on
plot(x, yc, 'go')
plot(x, y_f_max, 'linewidth', 5)
title(strcat(Title, ' filter optimization maximal error'))
legend('Noisy signal', 'Clean signal', 'de\_min')
saveas(cf, strcat(Title, '_filter.png'))
endfunction