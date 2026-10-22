clear;
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

function [xe, xo, yorigin] = even_odd(xn, xorigin)
    xn = matrix(xn, 1, -1);
    xf = xn($:-1:1);
    xforigin = length(xn) - xorigin + 1;

    n1 = (1:length(xn)) - xorigin;
    n2 = (1:length(xf)) - xforigin;
    nmin = min(n1(1), n2(1));
    nmax = max(n1($), n2($));
    n = nmin:nmax;

    xp = zeros(1, length(n));
    xfp = zeros(1, length(n));
    xp(n1 - nmin + 1) = xn;
    xfp(n2 - nmin + 1) = xf;

    xe = (xp + xfp) / 2;
    xo = (xp - xfp) / 2;
    yorigin = 1 - nmin;

    figure();
    subplot(4, 1, 1);
    draw_sig(n, xp, "x(n)");
    subplot(4, 1, 2);
    draw_sig(n, xe, "xe(n) - even part");
    subplot(4, 1, 3);
    draw_sig(n, xo, "xo(n) - odd part");
    subplot(4, 1, 4);
    draw_sig(n, xe + xo, "xe(n) + xo(n)");
endfunction

x = [2, 3, 4, 5, 6];
xorigin = 3;

[xe, xo, yorigin] = even_odd(x, xorigin);
disp("xe = ");       disp(xe);
disp("xo = ");       disp(xo);
disp("origin = ");   disp(yorigin);

disp("xe(n) = xe(-n)  : " + string(norm(xe - xe($:-1:1)) < 1e-12));
disp("xo(n) = -xo(-n) : " + string(norm(xo + xo($:-1:1)) < 1e-12));
disp("xe + xo = x     : " + string(norm(xe + xo - x) < 1e-12));

d = [0, 1, 0, 1, 0];
xe2 = xe + d;
xo2 = xo - d;
disp("Another decomposition: xe2 = xe + d, xo2 = xo - d, with d(n) even");
disp("xe2 + xo2 = x   : " + string(norm(xe2 + xo2 - x) < 1e-12));
disp("xe2 is even     : " + string(norm(xe2 - xe2($:-1:1)) < 1e-12));
disp("xo2 is odd      : " + string(norm(xo2 + xo2($:-1:1)) < 1e-12));
disp("xo2(n) + xo2(-n) = ");  disp(xo2 + xo2($:-1:1));
