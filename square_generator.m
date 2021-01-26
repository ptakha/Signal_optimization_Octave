function [x, y] = square_generator(parameters)
T=1/parameters.frequency;
x=linspace(0, parameters.number_of_periods*T, parameters.number_of_periods*1000);
y=parameters.bias+parameters.amplitude.*sign(sin(pi.*parameters.frequency.*mod(x,T)./parameters.k))+parameters.noise.*0.25.*randn(size(x));
end