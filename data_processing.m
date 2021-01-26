clc
close all

load data_signal
load data_params
load data_errors
load data_filter

%%Sin plots
plot_error(error_f_sin, error_d_sin, filter_d_sin_error, "Sin")

[params_d_sin_min, params_d_sin_max, params_f_sin_min, params_f_sin_max]=min_max_routine(params_d_sin, error_d_sin, params_f_sin, error_f_sin);

filter_d_sin_min = filter_d_sin(find(filter_d_sin_error==min(filter_d_sin_error),1))
filter_d_sin_max = filter_d_sin(find(filter_d_sin_error==max(filter_d_sin_error),1))

test_function = @(a, f, b) a*sin(2*pi*f*x_sin)+b;
y_d_min=test_function(params_d_sin_min(1), params_d_sin_min(2), params_d_sin_min(3));
y_d_max=test_function(params_d_sin_max(1), params_d_sin_max(2), params_d_sin_max(3));
y_f_min=test_function(params_f_sin_min(1), params_f_sin_min(2), params_f_sin_min(3));
y_f_max=test_function(params_f_sin_max(1), params_f_sin_max(2), params_f_sin_max(3));

y_filtered_sin_d_min=filtered_signal(filter_d_sin_min, x_sin, y_sin);
y_filtered_sin_d_max=filtered_signal(filter_d_sin_max, x_sin, y_sin);

plot_routine(x_sin, y_sin, y_c_sin, y_d_min, y_d_max, y_f_min, y_f_max, "Sin")
plot_filter(x_sin, y_sin, y_c_sin, y_filtered_sin_d_min, y_filtered_sin_d_max, "Sin")
%%Triangle plots
plot_error(error_f_triangle, error_d_triangle, filter_d_triangle_error, "Triangle")

[params_d_triangle_min, params_d_triangle_max, params_f_triangle_min, params_f_triangle_max]=min_max_routine(params_d_triangle, error_d_triangle, params_f_triangle, error_f_triangle);

filter_d_triangle_min = filter_d_triangle(find(filter_d_triangle_error==min(filter_d_triangle_error),1))
filter_d_triangle_max = filter_d_triangle(find(filter_d_triangle_error==max(filter_d_triangle_error),1))

test_function = @(a, f, b) b+a.*asin(sin(2*pi.*f.*x_triangle))*2/pi;
y_d_min=test_function(params_d_triangle_min(1), params_d_triangle_min(2), params_d_triangle_min(3));
y_d_max=test_function(params_d_triangle_max(1), params_d_triangle_max(2), params_d_triangle_max(3));
y_f_min=test_function(params_f_triangle_min(1), params_f_triangle_min(2), params_f_triangle_min(3));
y_f_max=test_function(params_f_triangle_max(1), params_f_triangle_max(2), params_f_triangle_max(3));

y_filtered_triangle_d_min=filtered_signal(filter_d_triangle_min, x_triangle, y_triangle);
y_filtered_triangle_d_max=filtered_signal(filter_d_triangle_max, x_triangle, y_triangle);

plot_routine(x_triangle, y_triangle, y_c_triangle, y_d_min, y_d_max, y_f_min, y_f_max, "Triangle")
plot_filter(x_triangle, y_triangle, y_c_triangle, y_filtered_triangle_d_min, y_filtered_triangle_d_max, "Triangle")
%%Square plots
plot_error(error_f_square, error_d_square, filter_d_square_error, "Square")

[params_d_square_min, params_d_square_max, params_f_square_min, params_f_square_max]=min_max_routine(params_d_square, error_d_square, params_f_square, error_f_square);

filter_d_square_min = filter_d_square(find(filter_d_square_error==min(filter_d_square_error),1))
filter_d_square_max = filter_d_square(find(filter_d_square_error==max(filter_d_square_error),1))

test_function = @(a, f, b, k) b+a.*sign(sin(pi.*f.*mod(x_square,1./f)./k));
y_d_min=test_function(params_d_square_min(1), params_d_square_min(2), params_d_square_min(3), params_d_square_min(4));
y_d_max=test_function(params_d_square_max(1), params_d_square_max(2), params_d_square_max(3), params_d_square_max(4));
y_f_min=test_function(params_f_square_min(1), params_f_square_min(2), params_f_square_min(3), params_f_square_min(4));
y_f_max=test_function(params_f_square_max(1), params_f_square_max(2), params_f_square_max(3), params_f_square_max(4));

y_filtered_square_d_min=filtered_signal(filter_d_square_min, x_square, y_square);
y_filtered_square_d_max=filtered_signal(filter_d_square_max, x_square, y_square);

plot_routine(x_square, y_square, y_c_square, y_d_min, y_d_max, y_f_min, y_f_max, "Square")
plot_filter(x_square, y_square, y_c_square, y_filtered_square_d_min, y_filtered_square_d_max, "Square")