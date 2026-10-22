function [yn, yorigin] = fold(xn, xorigin)
    yn = xn($:-1:1);
    yorigin = length(xn) - xorigin + 1;

    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;

    clf();

    subplot(2, 1, 1);
    plot2d3(nx, xn);
    plot(nx, xn, 'r.');
    xtitle('Tin hieu goc x(n)', 'n', 'x(n)');
    xgrid();

    subplot(2, 1, 2);
    plot2d3(ny, yn);
    plot(ny, yn, 'b.');
    xtitle('Tin hieu lat y(n) = x(-n)', 'n', 'y(n)');
    xgrid();
endfunction
