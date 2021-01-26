function frequency=find_frequency(x,y)
  L=size(y,2);
  T=x/(0:L-1);
  Fs=1/T;
  F=fft(y);
  P2=abs(F/L);
  P1=P2(1:(L/2+1));
  P1(2:end-1)=2*P1(2:end-1);
  f=Fs*(0:(L/2))/L;
  i=find(P1==max(P1));
  if f(i)==0
    s=sort(P1);
    ind=find(P1==s(end-1));
    frequency=f(ind);
    else
    frequency=f(i);
  end
endfunction