function [params_d, error_d] = optim_filter(x, y, yc)
  pkg load optim
  L=size(y,2);
  T=x/(0:L-1);
  Fs=1/T;
  F=find_frequency(x, y);
  f_min=@(params) sum((filtered_signal(params, x, y)-yc).^2)/size(y,2);
  ctl.XVmin=[1];
  ctl.XVmax=[Fs/F];
  ctl.constr=1;
  ctl.tol=1e-6;
  [params_d, error_d, nfeval, convergence]=de_min(f_min, ctl); 
endfunction