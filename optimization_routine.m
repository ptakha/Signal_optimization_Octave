clear all
close all
clc
% sin signal params_square
parameters_signal_sin.amplitude=3;
parameters_signal_sin.frequency=1000;
parameters_signal_sin.bias=3;
parameters_signal_sin.noise=3;
parameters_signal_sin.number_of_periods=2;
% triangle signal parameters_signal_square
parameters_signal_triangle.amplitude=3;
parameters_signal_triangle.frequency=1000;
parameters_signal_triangle.bias=3;
parameters_signal_triangle.noise=3;
parameters_signal_triangle.number_of_periods=2;
% square signal parameters_signal_square
parameters_signal_square.amplitude=3;
parameters_signal_square.frequency=1000;
parameters_signal_square.bias=1;
parameters_signal_square.k=0.7;
parameters_signal_square.noise=3;
parameters_signal_square.number_of_periods=2;
%optimization routine
[x_sin, y_sin] = sin_generator(parameters_signal_sin);
[x_triangle, y_triangle] = triangle_generator(parameters_signal_triangle);
[x_square, y_square] = square_generator(parameters_signal_square);

parameters_signal_sin.noise = 0
[x_sin, y_c_sin] = sin_generator(parameters_signal_sin);
parameters_signal_triangle.noise = 0;
[x_triangle, y_c_triangle] = triangle_generator(parameters_signal_triangle);
parameters_signal_square.noise = 0;
[x_square, y_c_square] = square_generator(parameters_signal_square);
save data_problem parameters_signal_*

for i=1:10
  printf("%d\n",i)
  [params_f_sin(:,i), error_f_sin(i), params_d_sin(:,i), error_d_sin(i)]=optim_signal('sin', x_sin, y_sin);
  [params_f_triangle(:,i), error_f_triangle(i), params_d_triangle(:,i), error_d_triangle(i)]=optim_signal('triangle', x_triangle, y_triangle);
  [params_f_square(:,i), error_f_square(i), params_d_square(:,i), error_d_square(i)]=optim_signal('square', x_square, y_square);
  
  [filter_d_sin(i), filter_d_sin_error(i)]=optim_filter(x_sin, y_sin, y_c_sin);
  [filter_d_triangle(i), filter_d_triangle_error(i)]=optim_filter(x_triangle, y_triangle, y_c_triangle);
  [filter_d_square(i), filter_d_square_error(i)]=optim_filter(x_square, y_square, y_c_square);
endfor
save data_filter filter*
save data_params params*
save data_errors error*
save data_signal x* y* 
