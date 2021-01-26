function [params_f, error_f, params_d, error_d]=optim_signal(type, x, y)
%loading package
pkg load optim
switch (type)
  case 'sin'
  test_function = @(a, f, b) a*sin(2*pi*f*x)+b;
  %initial point
  bias=mean(y);
  amplitude=0.5.*(max(y)-min(y));
  frequency=find_frequency(x,y);
  %function which minimum we need to find
  f_min=@(params) sum((test_function(params(1), params(2), params(3))-y).^2)/size(y,2);
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %fminsearch
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %Zero value of parameters
  params_0=[amplitude, frequency, bias];
  options=optimset("TolX", 1e-6);
  [params_f, error_f]=fminsearch(f_min, params_0, options);
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %de_min
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %Control options
  ctl.XVmin=[0.5*amplitude, frequency/10, 0.5*bias];
  ctl.XVmax=[1.5*amplitude, frequency*10, 1.5*bias];
  ctl.constr=1;
  ctl.tol=1e-6;
  [params_d, error_d, nfeval, convergence]=de_min(f_min, ctl);  
  case 'triangle'
  test_function = @(a, f, b) b+a.*asin(sin(2*pi.*f.*x))*2/pi;
 
  bias=mean(y);
  amplitude=0.5.*(max(y)-min(y));
  frequency=find_frequency(x,y);
  f_min=@(params) sum((test_function(params(1), params(2), params(3))-y).^2)/size(y,2);

  params_0=[amplitude, frequency, bias];
  options=optimset("TolX", 1e-6);
  [params_f, error_f]=fminsearch(f_min, params_0, options);

  ctl.XVmin=[0.5*amplitude, frequency/10, 0.5*bias];
  ctl.XVmax=[1.5*amplitude, frequency*10, 1.5*bias];
  ctl.constr=1;
  ctl.tol=1e-6;
  [params_d, error_d, nfeval, convergence]=de_min(f_min, ctl);

  case 'square'
  test_function = @(a, f, b, k) b+a.*sign(sin(pi.*f.*mod(x,1./f)./k));
  
  amplitude=0.5.*(max(y)-min(y));
  bias=max(y)-amplitude;
  k=0.5+(mean(y)-bias)/(2*amplitude);
  frequency=find_frequency(x,y);
  
  f_min=@(params) sum((test_function(params(1), params(2), params(3), params(4))-y).^2)/size(y,2);

  params_0=[amplitude, frequency, bias, k];
  options=optimset("TolX", 1e-6);
  options=optimset("TolFun", 1e-6);
  [params_f, error_f]=fminsearch(f_min, params_0, options);

  ctl.XVmin=[0.5*amplitude, frequency/10, 0.5*bias, 0];
  ctl.XVmax=[1.5*amplitude, frequency*10, 1.5*bias, 1];
  ctl.constr=1;
  ctl.tol=1e-6;
  [params_d, error_d, nfeval, convergence]=de_min(f_min, ctl);
endswitch
endfunction