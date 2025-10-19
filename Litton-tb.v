`timescale 100ns/100ns

module Litton_tb;
`include "Litton-logic-diagrams.v"

reg S1,S2,S3,S4,S6,_S20,_S21,_S22,_S23,_S24,_S25,_S26,_S27,_S28,_S29,_S30;
initial begin
    {S1,S2,S3,S4,S6,_S20,_S21,_S22,_S23,_S24,_S25,_S26,_S27,_S28,_S29,_S30}=16'h0FFF;
    S6=0;
    S1=0;
    S2=1;
    S3=0;
    #20000;
    S1=0;
    S2=0;
    S3=1;
    #100000;
    {S1,S2,S3,S4}=4'b0100;//TCR
    #10000;
    {S1,S2,S3,S4}=4'b0001;
    #10000;
    {S1,S2,S3,S4}=4'b0100;//32
    #10000;
    {S1,S2,S3,S4}=4'b0001;
    #10000;
    {S1,S2,S3,S4}=4'b0100;//24
    #10000;
    {S1,S2,S3,S4}=4'b0001;
    #10000;
    {S1,S2,S3,S4}=4'b0100;//16
    #10000;
    {S1,S2,S3,S4}=4'b0001;
    #10000;
    {S1,S2,S3,S4}=4'b0100;//8
    #10000;
    {S1,S2,S3,S4}=4'b0001;
    #10000;
    {S1,S2,S3,S4}=4'b0100;//0
    #10000;
    {S1,S2,S3,S4}=4'b0001;
    #10000;
    S6=1;
    {S1,S2,S3,S4}=4'b0100;//LCR
end

wire dbg_run,dbg_halt,dbg_ready,dbg_K_F14,dbg_track_F9;
assign dbg_run=M6;
assign dbg_halt=~M6;
assign dbg_ready=_W2;
assign dbg_K_F14=~_F14;
assign dbg_track_F9=~_F9;

wire dbg_MC_C10,dbg_MC_C20,dbg_MC_C30,dbg_MC_C40;
assign {dbg_MC_C10,dbg_MC_C20,dbg_MC_C30,dbg_MC_C40}={C1 & C2, C1 & _C2, _C1 & _C2 , _C1 & C2};
wire dbg_MC_auto_M3,dbg_MC_step_M2,dbg_MC_idle_M1,dbg_MC_stop_M0;
assign {dbg_MC_auto_M3,dbg_MC_step_M2,dbg_MC_idle_M1,dbg_MC_stop_M0}={M5 & M6, _M5 & M6, M5 & _M6, _M5 & _M6};

wire [4:0]g_track={1'b0,A24|A25|A26|A27,A22|A23|A26|A27,A21|A23|A25|A27,1'b0}|{~_A32|~_A33,3'b000,~_A31|~_A33};
wire [5119:0] dbg_active_GS_track=Drum_GS.drum[g_track];

wire [7:0]dbg_CR={F8,F7,F6,F5,F4,F3,F2,F1};
wire [39:0]dbg_I,dbg_A;
assign dbg_I={M155.SR,M156.SR,M157.SR,M158.SR,M159.SR};
assign dbg_A={M150.SR,M151.SR,M152.SR,M153.SR,M154.SR};

reg [39:0]dbg_A_TS,dbg_I_TS;
always @(posedge T39) begin
    dbg_I_TS=dbg_I;
    dbg_A_TS=dbg_A;
end

reg [0:7]Ib;
wire Ib101,Ib102,Ib103,Ib104,Ib105,Ib106,Ib107,Ib108;
assign {Ib101,Ib102,Ib103,Ib104,Ib105,Ib106,Ib107,Ib108}=Ib;
initial begin
    Ib=8'hFF;
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
reg [6:0]g_adr;
reg [13:0]g_bit;
wire _Z1,_Z2,_Z3;

assign _Z1=~Z1;
initial begin
    Z1=0;
    g_bit=0;
    #2;
    forever begin
        g_bit=g_bit+1;
        if(g_bit>=5120)g_bit=0;
        Z1=1;
        #2;
        Z1=0;
        #8;
    end
end

assign _Z2=~Z2;
initial begin
    Z2=0;
    #2;#2;
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
    g_adr=0;
    #2;#2;
    forever begin
        g_adr=g_adr+1;
        if(g_adr>127)g_adr=0;
        #(32*10);
        Z3=g_adr[0];
        #(10);
        Z3=g_adr[1];
        #(10);
        Z3=g_adr[2];
        #(10);
        Z3=g_adr[3];
        #(10);
        Z3=g_adr[4];
        #(10);
        Z3=g_adr[5];
        #(10);
        Z3=g_adr[6];
        #10;
        Z3=g_adr==0;
        #10;
    end
end
reg _W2;
wire W1=_W2; 
initial begin
    _W2=0;
    #1000;
    _W2=1;
end

initial begin
    $dumpfile("Litton-tb.vcd");
    $dumpvars(0,Litton_tb);
    #(10*40*128*10)
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
    if(~CLR)begin
        Q=0;
        mQ=0;
    end
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
    if(~PRE)Q=1;
end
always @(posedge CLK) begin
    if(CLR&PRE)
        Q=D;
end

endmodule

/*585020  page 4.26*/
module B8_SR(input D, CP, output Q, _Q);

reg [7:0] SR=8'h00;

assign Q=SR[7];
assign _Q=~Q;

always @(posedge CP) begin
    SR={SR[6:0],D};
end

endmodule

module Drum_GS_32(input A, B ,Z1,W1,input [4:0]track,input [13:0]bit, output reg R1);

reg [0:5119] drum[0:31];
reg R0=0;
integer i; // Loop variable must be declared as an integer
initial R1=0;
initial begin
    for (i = 0; i < 32; i = i + 1) begin
        drum[i] = 5120'b0; 
    end
    //drum[31]=40'h00FEFF0000;
    //drum[31][5080:5119]=40'hFF0A010203;
    drum[31][5080:5119]=40'h5555555555;
end

initial begin
//    $readmemh("opus.mem", drum);
end

always @(posedge Z1)begin
    R1=R0;
    if(W1)begin
        if(A^B)
            drum[track][bit]=A;
    end
end
always @(negedge Z1) begin
    
    R0=drum[track][bit];
end

endmodule

module Drum_S(input A, B ,Z1,W1,input [13:0]bit, output R);

reg [0:5119] drum=0;
wire wbit=13'h1FFF&(bit+320);
assign R=drum[bit];
always @(posedge Z1)begin
    if(W1)begin
        if(A^B)
            drum[wbit]=A;
    end
end

endmodule