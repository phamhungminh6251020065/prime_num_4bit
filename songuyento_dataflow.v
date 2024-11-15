module songuyento_dataflow(a, y);
  input [3:0] a;  // ??u vào 4 bit
  output y;       // ??u ra ki?m tra s? nguyên t?

 /* // S? d?ng toán t? ?i?u ki?n ?? tính giá tr? c?a y
  assign y = (a == 4'b0010) ? 1'b1 :  // 2 là s? nguyên t?
             (a == 4'b0011) ? 1'b1 :  // 3 là s? nguyên t?
             (a == 4'b0101) ? 1'b1 :  // 5 là s? nguyên t?
             (a == 4'b0111) ? 1'b1 :  // 7 là s? nguyên t?
             (a == 4'b1011) ? 1'b1 :  // 11 là s? nguyên t?
             (a == 4'b1101) ? 1'b1 :  // 13 là s? nguyên t?
             1'b0;                    // Các giá tr? còn l?i không ph?i s? nguyên t?
*/
assign y = (a[2] & ~a[1] & a[0])  // ?i?u ki?n w1
           | (~a[3] & a[2] & a[0])  // ?i?u ki?n w2
           | (~a[3] & ~a[2] & a[1]) // ?i?u ki?n w3
           | (~a[2] & a[1] & a[0]); // ?i?u ki?n w4
endmodule

module songuyento_dataflow_tb;
  reg [3:0] a;   // ??u vào 4 bit
  wire y;        // Bi?n ??u ra y ?? ki?m tra k?t qu?

  // Kh?i t?o mô-?un songuyento
  songuyento_dataflow DUT(a, y);

  // Testbench
  initial begin
    // In giá tr? ra console ?? theo dõi quá trình ki?m tra s? nguyên t?
    $monitor("a=%d, Prime=%b", a, y);

    // Các tr??ng h?p ki?m tra các giá tr? t? 0 ??n 15
    #10 a = 4'b0000;  // 0 không ph?i s? nguyên t?
    #10 a = 4'b0001;  // 1 không ph?i s? nguyên t?
    #10 a = 4'b0010;  // 2 là s? nguyên t?
    #10 a = 4'b0011;  // 3 là s? nguyên t?
    #10 a = 4'b0100;  // 4 không ph?i s? nguyên t?
    #10 a = 4'b0101;  // 5 là s? nguyên t?
    #10 a = 4'b0110;  // 6 không ph?i s? nguyên t?
    #10 a = 4'b0111;  // 7 là s? nguyên t?
    #10 a = 4'b1000;  // 8 không ph?i s? nguyên t?
    #10 a = 4'b1001;  // 9 không ph?i s? nguyên t?
    #10 a = 4'b1010;  // 10 không ph?i s? nguyên t?
    #10 a = 4'b1011;  // 11 là s? nguyên t?
    #10 a = 4'b1100;  // 12 không ph?i s? nguyên t?
    #10 a = 4'b1101;  // 13 là s? nguyên t?
    #10 a = 4'b1110;  // 14 không ph?i s? nguyên t?
    #10 a = 4'b1111;  // 15 không ph?i s? nguyên t?

    #10 $finish;  // K?t thúc mô ph?ng
  end
endmodule
