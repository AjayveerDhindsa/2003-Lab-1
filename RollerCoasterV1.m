%% Roller Coaster Lab Code Version 1 
% ASEN 2003 Dynamics
% Group 5
% Garrett Bell
% Ryan Block
% Max Buchholz
% Ajay Dhindsa
%
clc
clear
view(3)
%% Initialize Variables

% initial position
intpos = [50 50 125]; % [m]
g = 9.8; % [m/s^2] gravitational constant

%% Element 1 Helix
% time vector of helix
t = linspace(0,8,100); % arbitrary units

% radius and height
r = 50; % [m] to change radius of helix
desiredheight = 40; % [m] to change height of helix
h = desiredheight / 8; % arbitrary units to change height in equation

% position vector
% x and y create circle z is linear decrease
helixpos = [intpos(1) - (r * cos(t * pi / 2)); intpos(2) - (r * sin(t * pi / 2)); intpos(3) - (h * t);];

% set new initial position
finalpos = [helixpos(1,end) helixpos(2,end) helixpos(3,end)]; % [m] position after helix

% G-Force during helix
[G_Helix_X G_Helix_Y G_Helix_Z] = Helix(intpos, helixpos, r); % [] determine the g's through the helix

%% Element 2 circular hill
% time vector of hill into zero g drop
t = linspace(0,1,100); % arbitrary units

% radius and height
r = 20; % to change radius of circlular hill

% position vector
% x constant y and z generate quarter circle
circlehill1 = [finalpos(1) + (0 * t); finalpos(2) - (r * sin(t * pi / 2));  (finalpos(3) + (r * cos(t * pi / 2)) - r)];

% G-Force during first hill
theta = linspace(90,0,100); % degree position on the circle
[G_CircularHill1_X G_CircularHill1_Y G_CircularHill1_Z] = CircularHill(finalpos, circlehill1, theta, r); % [] determine the g's through the circlular hill

% set new initial position
finalpos = [circlehill1(1,end) circlehill1(2,end) circlehill1(3,end)]; % [m] position after circular hill


%% Element 3 zero g drop
% time vector zero g drop
t = linspace(0,5,100); % arbitrary units

% height of drop
h = 10; % [m] set the height of the drop

% position vector
% x and y constant z decreases linearly
zerog = [finalpos(1) + (0*t); finalpos(2) + (0*t); finalpos(3) - h*t/10];

% G-Force during drop
G_ZeroG1 = zeros(1,100); % [] no g's experienced during drop

% set new initial position
finalpos = [zerog(1,end) zerog(2,end) zerog(3,end)]; % [m] position after zero g drop

%% Element 4 circular valley
% time vector circular valley out of zero g drop
t = linspace(1,3,100); % arbitrary units

% radius and height
r = 40; % to change radius of circlular hill

% position vector
% x constant y and z generate half circle
circlevalley1 = [finalpos(1) + (0 * t); finalpos(2) + (r * sin(t * pi / 2) - r); (finalpos(3) + (r * cos(t * pi / 2)))];

% G-Force during first valley
theta = linspace(0,180,100); % degree position on the circle
[G_CircularValley1_X G_CircularValley1_Y G_CircularValley1_Z] = CircularValley(finalpos, circlevalley1, theta, r); % [] determine the g's through the circlular valley

% set new initial position
finalpos = [circlevalley1(1,end) circlevalley1(2,end) circlevalley1(3,end)];  % [m] position after circular valley

%% Element 5 zero g up
% time vector for zero g up
t = linspace(0,5,100);

% height of up
h = 40; % [m]

% position of zero g up
% x and y constant z increases linearly
zerog2 = [finalpos(1) + (0*t); finalpos(2) + (0*t); finalpos(3) + h*t/10];

% G-Force during 2nd up 
G_ZeroG2 = zeros(1,100); % [] no g's experienced

% set new initial position
finalpos = [zerog2(1,end) zerog2(2,end) zerog2(3,end)];% [m] position after zero g up

%% Element 6 circular hill
t = linspace(1,3,100);

% radius and height
r = 30; % to change radius of circlular hill

% position vector
circlehill2 = [finalpos(1) + (0 * t); finalpos(2) + (r * sin(t * pi / 2) - r); (finalpos(3) - (r * cos(t * pi / 2)))];

% G-Force during 2nd hill
theta = linspace(180,0,100);
[G_CircularHill2_X G_CircularHill2_Y G_CircularHill2_Z] = CircularHill(finalpos, circlehill2, theta, r);

finalpos = [circlehill2(1,end) circlehill2(2,end) circlehill2(3,end)];

%% Element 7 circular valley

t = linspace(1,2,100);

% radius and height
r = 80; % to change radius of circlular valley

% position vector
circlevalley2 = [finalpos(1) + (0 * t); finalpos(2) + (r * sin(t * pi / 2) - r); (finalpos(3) + (r * cos(t * pi / 2)))];

% G-Force during 2nd valley
theta = linspace(0,90,100);
[G_CircularValley2_X G_CircularValley2_Y G_CircularValley2_Z] = CircularValley(finalpos, circlevalley2, theta, r);

finalpos = [circlevalley2(1,end) circlevalley2(2,end) circlevalley2(3,end)];

%% Element 8 bank turn
% generate time vector for bank turn
t = linspace(2,3,100); % arbitrary units

% radius and height
r = 40; % to change radius of bank turn

% position vector
bankturn = [(finalpos(1) + (r * cos(t * pi / 2)) + r); finalpos(2) + (r * sin(t * pi / 2)); (finalpos(3) + (0 * t))];

% G-Force during banked turn
[G_BankTurn_X G_BankTurn_Y G_BankTurn_Z] = BankTurn(finalpos, bankturn, r);

finalpos = [bankturn(1,end) bankturn(2,end) bankturn(3,end)];

%% Element 9 slow down
% generate time vector of slow down
t = linspace(0,5,100);
timeend = t(1,end); % determine the time end of track is reached

% stopping equations
l = 150; % [m] length of slow down
v0 = sqrt(2*g*125); % [m/s] speed going into slow down
afinal = -v0/timeend; % [arbitrary units] acceleration of slow down based on inital speed and remaining time
aactual = (-1 * (v0^2)) / (2 * l); % [m/s^2] actual acceleration during slow down

% position vector
% constant in y and z increasing linearly in x
slowdown = [finalpos(1) + (l*t/5); finalpos(2)+(0*t); finalpos(3) + (0*t)];

% speed
vslow = v0 + (afinal * t); % [m/s] speed during the final slow down of the track

% G-Force during final slow down
G_SlowDown = (aactual/g)*ones(1,100);% [] g's experienced during slow down

%% concatenating position vectors
% position vectors of all sections without slowdown (to calculate speeds)
pos = [helixpos circlehill1 zerog circlevalley1 zerog2 circlehill2 circlevalley2 bankturn];

%% Speed and Distance
% speed
v = sqrt(2 * g * (intpos(3) - pos(3,:))); % [m/s] derived from difference in potential energy of coaster
v = [v vslow]; % [m/s] concatenating the speeds with the slow down at the end

%final pos vector
pos = [pos slowdown]; % [m] final position of the coaster with the slow down

% distance s
L = [0]; % [m] initialize vector of length from start beginning at 0
for i = 1:(length(pos)-1) % iterator up to end of roller coaster position vector
    distance = sqrt(((pos(1,i+1) - pos(1,i))^2) + ((pos(2,i+1) - pos(2,i))^2) + ((pos(3,i+1) - pos(3,i))^2)); % pythagorean theorem between adjacent positions
    L = [L (L(i) + distance)]; % sum up length and concatenate to end of length vector
end
totallength = L(1,end); % [m] total length being the last value in the length vector

% G-Force vector
G_X = [G_Helix_X G_CircularHill1_X G_ZeroG1 G_CircularValley1_X G_ZeroG2 G_CircularHill2_X G_CircularValley2_X G_BankTurn_X zeros(1,100)];
G_Y = [G_Helix_Y G_CircularHill1_Y G_ZeroG1 G_CircularValley1_Y G_ZeroG2 G_CircularHill2_Y G_CircularValley2_Y G_BankTurn_Y G_SlowDown];
G_Z = [G_Helix_Z G_CircularHill1_Z G_ZeroG1 G_CircularValley1_Z G_ZeroG2 G_CircularHill2_Z G_CircularValley2_Z G_BankTurn_Z ones(1,100)];
G_Total = [G_X; G_Y; G_Z];
%% final plots of track
% Path plotted with speed
hold on
figure(1);
rollercoaster = patch([pos(1,:) nan],[pos(2,:) nan],[pos(3,:) nan],[v(1,:) nan],'EdgeColor','interp','FaceColor','none','LineWidth',5);
title('Roller Coaster Plotted with Speed');
axis equal;
speed = colorbar;
title(speed,'Speed [m/s]')
xlabel('x [m]');
ylabel('y [m]');
zlabel('z [m]');
hold off

% Speed vs Distance Travelled
figure(2);
plot(L,v,'lineWidth',3,'color','m');
hold on
title('Speed vs. Distance Travelled');
xlabel('Distance Travelled [m]');
ylabel('Speed [m/s]');
hold off

%% G-Force Plots
% lateral direction
figure(3);
plot(L,G_X,'lineWidth',3);
hold on
plot(L,(3*ones(1,900)),'lineWidth',3,'color','r');
plot(L,(-3*ones(1,900)),'lineWidth',3,'color','r');
title('Lateral Gs vs. Distance Travelled');
xlabel('Distance Travelled [m]');
ylabel('Gs');
xlim([0 totallength]);
ylim([-4 4]);
hold off

% forward back
figure(4);
plot(L,G_Y,'lineWidth',3,'color','b');
hold on
plot(L,(5*ones(1,900)),'lineWidth',3,'color','r');
plot(L,(-4*ones(1,900)),'lineWidth',3,'color','r');
title('Forward/Back Gs vs. Distance Travelled');
xlabel('Distance Travelled [m]');
ylabel('Gs');
xlim([0 totallength]);
ylim([-5 6]);
hold off

% up down
figure(5);
plot(L,G_Z,'lineWidth',3,'color','g');
hold on
plot(L,(6*ones(1,900)),'lineWidth',3,'color','r');
plot(L,(-1*ones(1,900)),'lineWidth',3,'color','r');
title('Up/Down vs. Distance Travelled');
xlabel('Distance Travelled [m]');
ylabel('Gs');
xlim([0 totallength]);
ylim([-2 7]);
hold off


