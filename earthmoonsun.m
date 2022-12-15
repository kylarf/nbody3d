clf; close all; clear;

% Data from JPL Horizons. t = 0 corresponds to 00:00 on Dec. 7
x0_sun = [0, 0, 0]';
x0_earth = [3.796098393980272e10, 1.421006563478616e11, 2.353596803709865e7]';
x0_moon = [3.815145340016395e10, 1.424488093136910e11, 3.492821333138645e7]';

v0_sun = [0, 0, 0]';
v0_earth = [-2.918137923188195e4, 7.812053440797876e3, -1.202505238594664e1]';
v0_moon = [-3.003548315473496e4, 8.315244260382761e3, 8.525762585949792e1]';

x0 = [x0_sun, x0_earth, x0_moon];
v0 = [v0_sun, v0_earth, v0_moon];
m = [1988500e24 5.97219e24 7.349e22];

[t, x] = nbody3d([0 31536000], m, x0, v0);
plotresults(x, true);
geocentric = x(:,2:3,:) - x(:,2,:);
plotresults(geocentric, true)

columns = reshape(x, [], 9);
headings = ["x_sun", "y_sun", "z_sun", "x_earth", "y_earth", "z_earth", "x_moon", "y_moon", "z_moon"];
data = array2table(columns, 'VariableNames', headings);
writetable(data, "earthmoonsun.csv")