`timescale 100ns/100ns

module Litton_tb;
`include "Litton-logic-diagrams.v"

reg S1,S2,S3,S4,S6,_S20,_S21,_S22,_S23,_S24,_S25,_S26,_S27,_S28,_S29,_S30;
initial begin
    {S1,S2,S3,S4,S6,_S20,_S21,_S22,_S23,_S24,_S25,_S26,_S27,_S28,_S29,_S30}=16'h0FFF;
end

reg Ib1,Ib2,Ib3,Ib4,Ib5,Ib6,Ib7,Ib8;
wire Ib101,Ib102,Ib103,Ib104,Ib105,Ib106,Ib107,Ib108;
assign {Ib101,Ib102,Ib103,Ib104,Ib105,Ib106,Ib107,Ib108}={Ib1,Ib2,Ib3,Ib4,Ib5,Ib6,Ib7,Ib8};
initial begin
    {Ib1,Ib2,Ib3,Ib4,Ib5,Ib6,Ib7,Ib8}=8'hFF;
end

reg K75,K76;
wire _K75,K176,K150,K80,K82,K83;
assign {_K75,K176}={~K75,K76};
assign {K150,K80,K82,K83}={~_K150,~_K80,~_K82,~_K83};
initial begin
    {K75,K76}=2'b11;
end



/*T4, T7  and T39 logic 3.205*/
wire T4,T7,_T4,_T7,T39,_T39;
JK_MS_FF M10((T7&_Z2),_T7,Z1,1'b1,1'b1,T4,_T4);
JK_MS_FF M9((_T4&Z2),(T4&Z2),Z1,1'b1,1'b1,T7,_T7);

assign _T39=~(_T7&T4);
assign T39=~_T39;

/*Z1, Z2, Z3 logic*/
reg Z1,Z2,Z3;
reg [6:0]adr;
wire _Z1,_Z2,_Z3;

assign _Z1=~Z1;
initial begin
    Z1=1;
    forever begin
        Z1=1;
        #2;
        Z1=0;
        #8;
    end
end

assign _Z2=~Z2;
initial begin
    Z2=0;
    #2;
    forever begin
        #(31*10);
        Z2=1;
        #(3*10);
        Z2=0;
        #(4*10);
        Z2=1;
        #(2*10);
        Z2=0;
    end
end

assign _Z3=~Z3;
initial begin
    Z3=0;
    adr=0;
    #2;
    forever begin
        adr=adr+1;
        if(adr>127)adr=0;
        #(32*10);
        Z3=adr[0];
        #(10);
        Z3=adr[1];
        #(10);
        Z3=adr[2];
        #(10);
        Z3=adr[3];
        #(10);
        Z3=adr[4];
        #(10);
        Z3=adr[5];
        #(10);
        Z3=adr[6];
        #10;
        Z3=0;
        #10;
    end
end
reg _W2;
initial begin
    _W2=0;
    #800;
    _W2=1;
end

initial begin
    $dumpfile("Litton-tb.vcd");
    $dumpvars(0,Litton_tb);
    #(10*40*128*1)
    $finish();
end
endmodule

/*FlipFlop Modules*/

/*585017  page 4.20*/
module JK_MS_FF(input J, K, CLK, CLR, PRE, output Q, _Q);

reg Q=0;
reg mQ=0;

assign _Q=~Q;
always @(CLR,PRE) begin
    if(~CLR)begin 
        Q=0;
        mQ=0;
    end
    if(~PRE)begin
        Q=1;
        mQ=1;
    end
end

always @(posedge CLK) begin
    if(CLR&PRE) begin
        if(J)mQ=1;
        if(K)mQ=0;
        if(J&K)mQ=~Q;
    end
end
always @(negedge CLK) begin
    Q=mQ;
end

endmodule

/*585018  page 4.22*/
module DL_JK_MS_FF(input J, K, CLK, CLR, output Q, _Q);

reg Q=0;
reg mQ=0;

assign _Q=~Q;
always @(CLR) begin
    if(~CLR)Q=0;
end
always @(posedge CLK) begin
    if(CLR) begin
        if(J)mQ=1;
        if(K)mQ=0;
        if(J&K)mQ=~Q;
    end
end
always @(negedge CLK) begin
    Q=mQ;
end

endmodule

/*585019  page 4.24*/
module DL_D_FF(input D, CLK, CLR, PRE, output Q, _Q);

reg Q=0;

assign _Q=~Q;
always @(CLR,PRE) begin
    if(~CLR)Q=0;
    if(~PRE)Q=0;
end
always @(negedge CLK) begin
    if(CLR&PRE)
        Q=D;
end

endmodule

/*585020  page 4.26*/
module B8_SR(input A, B, _CP, output Q, _Q);

reg [7:0] SR=8'h00;

assign Q=SR[7];
assign _Q=~Q;

always @(negedge _CP) begin
    SR={SR[6:0],A&B};
end

endmodule