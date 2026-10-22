function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    n_min = min(min(n1), min(n2));
    n_max = max(max(n1), max(n2));
    n = n_min:n_max;
    
    y1 = zeros(1, length(n));
    y2 = zeros(1, length(n));
    
    y1(find(n >= min(n1) & n <= max(n1))) = x1n;
    y2(find(n >= min(n2) & n <= max(n2))) = x2n;
    
    yn = y1 + y2;
    
    yorigin = find(n == 0);
    
    figure;
    subplot(3, 1, 1);
    plot2d3(n, y1);
    title('Tín hiệu x1(n)');
    
    subplot(3, 1, 2);
    plot2d3(n, y2);
    title('Tín hiệu x2(n)');
    
    subplot(3, 1, 3);
    plot2d3(n, yn);
    title('Tín hiệu tổng y(n) = x1(n) + x2(n)');
endfunction
[yn, yorigin] = add([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);

disp("yn = ");       disp(yn);
disp("yorigin = ");  disp(yorigin);
