clear;
funcprot(0);

// Hàm phụ trợ vẽ tín hiệu rời rạc
function plot_sig(xn, xo, ttl)
    clf;
    n = (1:length(xn)) - xo;
    // Vẽ nét đứt từ trục 0 lên điểm
    plot([n; n], [zeros(1, length(xn)); xn], 'b');
    // Vẽ chấm tròn
    plot(n, xn, 'bo');
    // Vẽ trục hoành
    plot([min(n)-1, max(n)+1], [0, 0], 'k');
    title(ttl); xlabel('n'); ylabel('x(n)'); xgrid();
endfunction

// Khai báo tín hiệu x(n) từ Hình P2.2
// x(-1)=1, x(0)=1, x(1)=1, x(2)=1, x(3)=0.5, x(4)=0.5
xn = [1, 1, 1, 1, 0.5, 0.5];
xorigin = 2; // Phần tử thứ 2 ứng với n=0

// --- (a) x(n-2) ---
// Dịch phải 2 mẫu
xn_a = xn;
xo_a = xorigin - 2; 
figure(1); plot_sig(xn_a, xo_a, 'Cau (a): x(n-2)');

// --- (b) x(4-n) ---
// Gập rồi dịch phải 4 mẫu
xn_b = xn($:-1:1);
xo_b = length(xn) + 1 - xorigin - 4;
figure(2); plot_sig(xn_b, xo_b, 'Cau (b): x(4-n)');

// --- (c) x(n+2) ---
// Dịch trái 2 mẫu
xn_c = xn;
xo_c = xorigin + 2;
figure(3); plot_sig(xn_c, xo_c, 'Cau (c): x(n+2)');

// --- (d) x(n)u(2-n) ---
// Giữ nguyên khi n <= 2, bằng 0 khi n > 2
xn_d = xn;
for i = 1:length(xn)
    n_hien_tai = i - xorigin;
    if n_hien_tai > 2 then
        xn_d(i) = 0;
    end
end
xo_d = xorigin;
figure(4); plot_sig(xn_d, xo_d, 'Cau (d): x(n)u(2-n)');

// --- (e) x(n-1)δ(n-3) ---
// Kết quả là xung đơn vị tại n=3 với biên độ x(2) = 1
xn_e = [1];
xo_e = -2; // Để index 1 ứng với n=3 (1 - (-2) = 3)
figure(5); plot_sig(xn_e, xo_e, 'Cau (e): x(n-1)delta(n-3)');

// --- (f) x(n^2) ---
// n^2 nhận các giá trị 0, 1, 4 => n = 0, +/-1, +/-2
// x(0)=1, x(1)=1, x(4)=0.5
xn_f = [0.5, 1, 1, 1, 0.5]; // Tương ứng n=-2, -1, 0, 1, 2
xo_f = 3; // Phần tử thứ 3 (giá trị 1) ứng với n=0
figure(6); plot_sig(xn_f, xo_f, 'Cau (f): x(n^2)');

// --- (g) & (h) Thành phần chẵn và lẻ ---
// Mở rộng tín hiệu ra khoảng n = -4 đến 4 để tính đối xứng
n_ext = -4:4;
x_ext = zeros(1, length(n_ext));
// Rải x(n) vào mảng mở rộng
for i = 1:length(xn)
    n_val = i - xorigin;
    idx = n_val - n_ext(1) + 1;
    x_ext(idx) = xn(i);
end

// Tính x(-n) bằng cách đảo ngược mảng mở rộng
x_flip = x_ext($:-1:1);

// Tính chẵn lẻ
xe = (x_ext + x_flip) / 2;
xo_part = (x_ext - x_flip) / 2;
xo_center = 5; // n=0 nằm ở vị trí thứ 5 trong mảng dài 9 phần tử

figure(7); plot_sig(xe, xo_center, 'Cau (g): Thanh phan chan xe(n)');
figure(8); plot_sig(xo_part, xo_center, 'Cau (h): Thanh phan le xo(n)');
