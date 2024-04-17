module fulladder_c(s,co,x,y,ci);
input x,y,ci;
output s,co;
wire w1,w2,w3;
xor G1(w1,x,y);
xor G2(s,w1,ci);
and G3(w2,w1,ci);
and G4(w3,x,y);
or G5(co,w2,w3);
endmodule
