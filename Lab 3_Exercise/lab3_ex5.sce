funcprot(0);

function draw_sig(n, x, ttl)
    plot([n; n], [zeros(1, length(x)); x], "b");
    plot(n, x, "bo");
    plot([min(n) - 1, max(n) + 1], [0, 0], "k");
    a = gca();
    a.data_bounds = [min(n) - 1, min([x, 0]) - 1; max(n) + 1, max([x, 0]) + 1];
    xgrid();
    xtitle(ttl, "n", "amplitude");
endfunction

function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    x1n = matrix(x1n, 1, -1);
    x2n = matrix(x2n, 1, -1);
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    nmin = min(n1(1), n2(1));
    nmax = max(n1($), n2($));
    n = nmin:nmax;

    y1 = zeros(1, length(n));
    y2 = zeros(1, length(n));
    y1(n1 - nmin + 1) = x1n;
    y2(n2 - nmin + 1) = x2n;

    yn = y1 .* y2;
    yorigin = 1 - nmin;

    figure();
    subplot(3, 1, 1);
    draw_sig(n, y1, "x1(n)");
    subplot(3, 1, 2);
    draw_sig(n, y2, "x2(n)");
    subplot(3, 1, 3);
    draw_sig(n, yn, "y(n) = x1(n) . x2(n)");
endfunction

[yn, yorigin] = multi([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);
disp("Example 1");
disp("yn = ");       disp(yn);
disp("yorigin = ");  disp(yorigin);

[yn, yorigin] = multi([1, 2, 3, 4], 2, [2, 1, 1], 1);
disp("Example 2");
disp("yn = ");       disp(yn);
disp("yorigin = ");  disp(yorigin);
