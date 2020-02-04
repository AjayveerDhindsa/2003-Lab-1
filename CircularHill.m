function [G_Force_X, G_Force_Y, G_Force_Z] = CircularHill(initialpos, finalpos, theta, r)
% Similar to the valley, the G-Force is calculated using the angle
% throughout the cart travelling over the top of the circle

g = 9.81; % m/s^2

v = sqrt(2 * g * (initialpos(3) - finalpos(3,:)));

G_Force_X = zeros(1,100);
G_Force_Y = (sind(theta) - (v.^2)./(g*r)).*cosd(theta);
G_Force_Z = (sind(theta) - (v.^2)./(g*r)).*sind(theta);

end

