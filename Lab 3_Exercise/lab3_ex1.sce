function [yn, yorigin] = delay(xn, xorigin, k)
    if k <= 0 then
        error('k phải là số nguyên dương (k > 0)');
    end
    
    yn = xn;

    yorigin = xorigin - k;
    
    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;
    clf();
    
    subplot(2, 1, 1);
    plot2d3(nx, xn);
    plot(nx, xn, 'r.');
    xtitle('Tín hiệu gốc x(n)', 'n', 'x(n)');
    a1 = gca();
    a1.data_bounds = [min(nx)-1, min(xn)-1; max(nx)+1, max(xn)+1];
    xgrid();
    
    subplot(2, 1, 2);
    plot2d3(ny, yn);
    plot(ny, yn, 'b.');
    xtitle(msprintf('Tín hiệu trễ y(n) = x(n - %d)', k), 'n', 'y(n)');
    
    a2 = gca();
    a2.data_bounds = [min(ny)-1, min(yn)-1; max(ny)+1, max(yn)+1];
    xgrid();
endfunction
