function [G_Force_X G_Force_Y G_Force_Z] = Helix(initialpos, finalpos, r)
% Normal force of cart on helix is mg*sin(theta) - mv^2/r. M is arbitarary
% and g is known. Theta is calculated by arcsin(h/(2*pi*r)). G-force is
% calculated by [g*(h/(2*pi*r)) - v^2/r]/g. All are known variables.

g = 9.81; % m/s^2
h = 20; % Height of one loop of helix is 20m. Two loops total

theta = asind(h / (2*pi*r));
v = sqrt(2 * g * (initialpos(3) - finalpos(3,:)));
G_Force = (g * (h / (2*pi*r)) - (v.^2)./r)/g;
G_Force_Y = ((g * (h / (2*pi*r)) - (v.^2)./r)/g).*sind(theta);
G_Force_Z = cosd(theta).*ones(1,100);
theta_ = acosd(G_Force./G_Force_Y);
G_Force_X = G_Force.*sind(theta).*cosd(theta_);

end

