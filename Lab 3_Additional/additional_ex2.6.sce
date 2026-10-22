n = -4:8;

// 1
xn = zeros(1, length(n));
xn(find(n >= 0 & n <= 3)) = 1;

// 2.
x2n = zeros(1, length(n));
for i = 1:length(n)
    idx = find(n == n(i) - 2);
    if ~isempty(idx) then
        x2n(i) = xn(idx);
    end
end

// 3.
yb_n = zeros(1, length(n));
for i = 1:length(n)
    n_sq = n(i)^2;
    idx = find(n == n_sq);
    if ~isempty(idx) then
        yb_n(i) = xn(idx);
    end
end

// 4.
yb_shift = zeros(1, length(n));
for i = 1:length(n)
    idx = find(n == n(i) - 2);
    if ~isempty(idx) then
        yb_shift(i) = yb_n(idx);
    end
end

// 5.
y2b_n = zeros(1, length(n));
for i = 1:length(n)
    n_sq = n(i)^2;
    idx = find(n == n_sq);
    if ~isempty(idx) then
        y2b_n(i) = x2n(idx);
    end
end

// --- VẼ ĐỒ THỊ ---
clf();

subplot(5, 1, 1);
plot2d3(n, xn); plot(n, xn, 'r.');
xtitle('x(n)', 'n', 'x(n)');
a = gca(); a.data_bounds = [min(n)-0.5, -0.2; max(n)+0.5, 1.2]; xgrid();

subplot(5, 1, 2);
plot2d3(n, yb_n); plot(n, yb_n, 'm.');
xtitle('y(n) = T[x(n)] = x(n^2)', 'n', 'y(n)');
a = gca(); a.data_bounds = [min(n)-0.5, -0.2; max(n)+0.5, 1.2]; xgrid();

subplot(5, 1, 3);
plot2d3(n, yb_shift); plot(n, yb_shift, 'b.');
xtitle('y(n-2)', 'n', 'y(n-2)');
a = gca(); a.data_bounds = [min(n)-0.5, -0.2; max(n)+0.5, 1.2]; xgrid();

subplot(5, 1, 4);
plot2d3(n, x2n); plot(n, x2n, 'k.');
xtitle('x2(n) = x(n-2)', 'n', 'x2(n)');
a = gca(); a.data_bounds = [min(n)-0.5, -0.2; max(n)+0.5, 1.2]; xgrid();

subplot(5, 1, 5);
plot2d3(n, y2b_n); plot(n, y2b_n, 'g.');
xtitle('y2(n) = T[x2(n)] = x2(n^2) -> Time-Variant (y2 != y_shift)', 'n', 'y2(n)');
a = gca(); a.data_bounds = [min(n)-0.5, -0.2; max(n)+0.5, 1.2]; xgrid();
