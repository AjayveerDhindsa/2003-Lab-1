function [G_Force_X, G_Force_Y G_Force_Z] = CircularValley(initialpos, finalpos, theta, r)
% G-Force in a valley depends on velocity throughout the circle and the
% angle betweem the cart to the ground.

g = 9.81; % m/s^2

v = sqrt(2 * g * (initialpos(3) - finalpos(3,:)));

G_Force_X = zeros(1,100);
G_Force_Y = ((v.^2)./(g*r) + sind(theta)).*cosd(theta);
G_Force_Z = ((v.^2)./(g*r) + sind(theta)).*sind(theta);

end

