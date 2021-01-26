function plot_error (error_f, error_d, filter_d, Title)
cf=figure()
semilogy(error_f)
hold on
semilogy(error_d)
semilogy(filter_d)
legend('Signal fminsearch', 'Signal de\_min','Filter de\_min')
title(strcat(Title, ' optimization error'))
saveas(cf, strcat(Title, '_error.png'))
endfunction
