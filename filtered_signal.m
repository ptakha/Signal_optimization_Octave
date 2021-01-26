function y_filtered = filtered_signal(k, x, y)
  pkg load signal
  L=size(y,2);
  T=x/(0:L-1);
  Fs=1/T;
  F=find_frequency(x, y);
  n=2;
  Wc=[F./(Fs.*k), F.*k./Fs];
  [b, a]=butter(n, Wc);
  y_filtered = filter(b, a, y);
endfunction
