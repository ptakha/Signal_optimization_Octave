function [x, y] = triangle_generator(parameters)
T=1/parameters.frequency;
x=linspace(0, parameters.number_of_periods*T, parameters.number_of_periods*1000);
y=parameters.bias+parameters.amplitude.*asin(sin(2*pi.*parameters.frequency.*x))*2/pi+parameters.noise.*0.25.*randn(size(x));
end