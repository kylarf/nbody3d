x0 = randi([-3000, 3000], 3, 3);
v0 = randn(3, 3) / 100;
% x0 = [-1088, -2487, -2825;
%       -455, -1425, 2574;
%       47, 1806, 1382];
% v0 = [-0.0003, -0.0008, 0.0004;
%       0.0018, 0.0160, -0.0073;
%       -0.0157, 0.0010, -0.0003];
m = repmat(1e13, 1, 3);

[t, x] = nbody3d([0 200000], m, x0, v0);
plotresults(x, false);
