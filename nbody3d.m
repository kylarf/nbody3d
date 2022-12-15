function [t, x] = nbody3d(t, m, x0, v0)
    G = 6.6743e-11;
    n_bodies = length(m);
    
    assert(n_bodies == size(x0, 2) && n_bodies == size(v0, 2),...
        "Initial conditions needed for all masses.");
    assert(size(x0, 1) == 3 && size(v0, 1) == 3,...
        "Initial conditions must have 3 spatial dimensions.");

    if verLessThan('matlab','9.11')
        solver = @ode113;
    else
        solver = @ode89;
    end
    
    IC = [x0(:); v0(:)];
    [t, x] = solver(@odefun, t, IC);
    x = permute(reshape(x(:,1:end/2), length(t), 3, []), [1, 3, 2]);
    
    function dxdt = odefun(~, x)
        x_3d = permute(reshape(x(1:end/2), 3, n_bodies), [2, 3, 1]);
        rij = pagetranspose(x_3d) - x_3d;
        norms = vecnorm(rij, 2, 3) + eye(n_bodies);
        scaled = rij ./ (norms.^3);
        acc = squeeze(G * sum(m .* scaled, 2))';
        dxdt = [x(end/2+1:end); acc(:)];
    end
end
