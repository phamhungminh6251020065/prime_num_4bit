module songuyento_dataflow(a, y);
  input [3:0] a;  // ??u v�o 4 bit
  output y;       // ??u ra ki?m tra s? nguy�n t?

 /* // S? d?ng to�n t? ?i?u ki?n ?? t�nh gi� tr? c?a y
  assign y = (a == 4'b0010) ? 1'b1 :  // 2 l� s? nguy�n t?
             (a == 4'b0011) ? 1'b1 :  // 3 l� s? nguy�n t?
             (a == 4'b0101) ? 1'b1 :  // 5 l� s? nguy�n t?
             (a == 4'b0111) ? 1'b1 :  // 7 l� s? nguy�n t?
             (a == 4'b1011) ? 1'b1 :  // 11 l� s? nguy�n t?
             (a == 4'b1101) ? 1'b1 :  // 13 l� s? nguy�n t?
             1'b0;                    // C�c gi� tr? c�n l?i kh�ng ph?i s? nguy�n t?
*/
assign y = (a[2] & ~a[1] & a[0])  // ?i?u ki?n w1
           | (~a[3] & a[2] & a[0])  // ?i?u ki?n w2
           | (~a[3] & ~a[2] & a[1]) // ?i?u ki?n w3
           | (~a[2] & a[1] & a[0]); // ?i?u ki?n w4
endmodule

module songuyento_dataflow_tb;
  reg [3:0] a;   // ??u v�o 4 bit
  wire y;        // Bi?n ??u ra y ?? ki?m tra k?t qu?

  // Kh?i t?o m�-?un songuyento
  songuyento_dataflow DUT(a, y);

  // Testbench
  initial begin
    // In gi� tr? ra console ?? theo d�i qu� tr�nh ki?m tra s? nguy�n t?
    $monitor("a=%d, Prime=%b", a, y);

    // C�c tr??ng h?p ki?m tra c�c gi� tr? t? 0 ??n 15
    #10 a = 4'b0000;  // 0 kh�ng ph?i s? nguy�n t?
    #10 a = 4'b0001;  // 1 kh�ng ph?i s? nguy�n t?
    #10 a = 4'b0010;  // 2 l� s? nguy�n t?
    #10 a = 4'b0011;  // 3 l� s? nguy�n t?
    #10 a = 4'b0100;  // 4 kh�ng ph?i s? nguy�n t?
    #10 a = 4'b0101;  // 5 l� s? nguy�n t?
    #10 a = 4'b0110;  // 6 kh�ng ph?i s? nguy�n t?
    #10 a = 4'b0111;  // 7 l� s? nguy�n t?
    #10 a = 4'b1000;  // 8 kh�ng ph?i s? nguy�n t?
    #10 a = 4'b1001;  // 9 kh�ng ph?i s? nguy�n t?
    #10 a = 4'b1010;  // 10 kh�ng ph?i s? nguy�n t?
    #10 a = 4'b1011;  // 11 l� s? nguy�n t?
    #10 a = 4'b1100;  // 12 kh�ng ph?i s? nguy�n t?
    #10 a = 4'b1101;  // 13 l� s? nguy�n t?
    #10 a = 4'b1110;  // 14 kh�ng ph?i s? nguy�n t?
    #10 a = 4'b1111;  // 15 kh�ng ph?i s? nguy�n t?

    #10 $finish;  // K?t th�c m� ph?ng
  end
endmodule
