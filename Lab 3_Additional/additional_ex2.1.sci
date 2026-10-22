clear; // Xóa các biến cũ để tránh lỗi
funcprot(0); // Tắt cảnh báo redefining function

// Hàm phụ trợ vẽ tín hiệu rời rạc chuẩn của Scilab
function plot_sig(xn, xo, ttl)
    clf;
    n = (1:length(xn)) - xo;
    
    // 1. Vẽ các đường thẳng đứng từ trục 0 lên điểm
    plot([n; n], [zeros(1, length(xn)); xn], 'b');
    
    // 2. Vẽ các điểm tròn tại các mẫu
    plot(n, xn, 'bo'); 
    
    // 3. Vẽ trục hoành y=0 cho dễ nhìn
    plot([min(n)-1, max(n)+1], [0, 0], 'k');
    
    title(ttl);
    xlabel('n'); 
    ylabel('x(n)');
    xgrid();
endfunction

// Khai báo tín hiệu x(n) bài 2.1
xn = [0, 1/3, 2/3, 1, 1, 1, 1];
xorigin = 4;

// --- CÂU A ---
figure(1); // Mở cửa sổ đồ thị số 1
plot_sig(xn, xorigin, 'Cau (a): Tin hieu x(n)');

// --- CÂU B1 ---
figure(2);
xn_b1 = xn($:-1:1); // Đảo vector
xo_b1 = (length(xn) + 1 - xorigin) - 4; // Gập rồi delay 4
plot_sig(xn_b1, xo_b1, 'Cau (b1):');

// --- CÂU B2 ---
figure(3);
xo_b2 = length(xn) + 1 - (xorigin - 4); // Delay trước rồi gập
plot_sig(xn_b1, xo_b2, 'Cau (b2):');

// --- CÂU C ---
figure(4);
// x(-n+4) trùng với kết quả câu b1
plot_sig(xn_b1, xo_b1, 'Cau (c): x(-n+4)');
