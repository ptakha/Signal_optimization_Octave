function y_filtered = filtered_signal(f, x, y)
  pkg load signal
##  L=size(y,2);
##  T=x/(0:L-1);
##  Fs=1/T;
##  F=find_frequency(x, y);
  n=2;
  Wc=[f(1), f(2)];
  [b, a]=butter(n, Wc);
  y_filtered = filter(b, a, y);
endfunction