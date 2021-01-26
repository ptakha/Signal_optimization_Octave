clear all
close all
clc
%loading package
pkg load optim
%generating signal with noice
Noise=4;
[x, y] = sin_generator(3, 1000, 3, Noise, 1);
%initial point
bias=mean(y);
amplitude=0.5.*(max(y)-min(y));

L=size(y,2);
T=x/(0:L-1);
Fs=1/T;
F=fft(y);
P2=abs(F/L);
P1=P2(1:(L/2+1));
P1(2:end-1)=2*P1(2:end-1);
f=Fs*(0:(L/2))/L;
figure
plot(f, P1);
xlabel('Frequency, Hz')
ylabel('Power')
title('Spectre')
i=find(P1==max(P1))
if f(i)==0
 s=sort(P1);
 ind=find(P1==s(end-1));
 frequency=f(ind)
else
 frequency=f(i);
end
%function to generate signal without noice
%with parameters as amplitude, frequency and bias
test_function = @(a, f, b) a*sin(2*pi*f*x)+b;
%function which minimum we need to find
f_min=@(params) sum((test_function(params(1), params(2), params(3))-y).^2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fminsearch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Zero value of parameters
params_0=[amplitude, frequency, bias];
options=optimset("TolX", 1e-9);
[params_f, error_f]=fminsearch(f_min, params_0, options);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%de_min
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Control options
ctl.XVmin=[0.5*amplitude, frequency/10, 0.5*bias];
ctl.XVmax=[0.5*amplitude, frequency*10, 1.5*bias];
[params_d, error_d, nfeval, convergence]=de_min(f_min, ctl);
%optimized function
y_f=test_function(params_f(1), params_f(2), params_f(3));
y_d=test_function(params_d(1), params_d(2), params_d(3));
%plot
figure
plot(x, y);
grid on;
hold on
plot(x, y_f)
plot(x, y_d)
legend('signal', 'fminsearch', 'de\_min')