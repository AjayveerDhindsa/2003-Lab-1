function [G_Force_X G_Force_Y G_Force_Z] = BankTurn(initialpos, finalpos, r)
% The speed in the banked turn is dependent upon the radius of the turn and
% the angle at which the turn is made. The G-Force is only dependent upon
% the secant of the angle of the turn.

g = 9.81; % m/s^2

theta = 15.*ones(1,100);
v_0 = sqrt(r*g*tand(theta));
v = v_0 + sqrt(2 * g * (initialpos(3) - finalpos(3,:)));

G_Force_X = sind(theta);
G_Force_Y = secd(theta);
G_Force_Z = cosd(theta);

end

