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

function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    xn = matrix(xn, 1, -1);
    hn = matrix(hn, 1, -1);
    Lx = length(xn);
    Lh = length(hn);

    yn = zeros(1, Lx + Lh - 1);
    for i = 1:Lx
        for j = 1:Lh
            yn(i + j - 1) = yn(i + j - 1) + xn(i) * hn(j);
        end
    end
    yorigin = xorigin + horigin - 1;

    nx = (1:Lx) - xorigin;
    nh = (1:Lh) - horigin;
    ny = (1:length(yn)) - yorigin;

    figure();
    subplot(3, 1, 1);
    draw_sig(nx, xn, "x(n)");
    subplot(3, 1, 2);
    draw_sig(nh, hn, "h(n)");
    subplot(3, 1, 3);
    draw_sig(ny, yn, "y(n) = x(n) * h(n)");
endfunction

[yn, yorigin] = convolution([1, 2, 3], 2, [1, -1, 2], 1);
disp("Example 1");
disp("yn = ");       disp(yn);
disp("yorigin = ");  disp(yorigin);
disp("error vs convol = ");  disp(norm(yn - convol([1, 2, 3], [1, -1, 2])));

[yn, yorigin] = convolution([2, 1, 3], 2, [1, 2], 2);
disp("Example 2");
disp("yn = ");       disp(yn);
disp("yorigin = ");  disp(yorigin);
disp("error vs convol = ");  disp(norm(yn - convol([2, 1, 3], [1, 2])));
