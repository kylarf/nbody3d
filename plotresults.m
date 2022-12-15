function fig = plotresults(x, use_o)
    fig = figure;
    hold on;
    axis equal;
    
    if use_o
        for ii = 1:size(x, 2)
            plot3(x(:,ii,1), x(:,ii,2), x(:,ii,3), '-o');
        end
    else
        for ii = 1:size(x, 2)
            plot3(x(:,ii,1), x(:,ii,2), x(:,ii,3));
        end
    end

    text_opts = {'interpreter', 'latex', 'fontsize', 24};
    set(gca, 'ticklabelinterpreter', 'latex');
    set(gca, 'fontsize', 18);
    xlabel('$x$ (m)', text_opts{:});
    ylabel('$y$ (m)', text_opts{:});
    zlabel('$z$ (m)', text_opts{:});
    xlim tight;
    ylim tight;
    zlim tight;
    grid on;
end
