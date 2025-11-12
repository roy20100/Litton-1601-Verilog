`timescale 100ns/100ns

module Litton_tb;
`include "Litton-logic-diagrams.v"

reg S1,S2,S3,S4,S6,_S20,_S21,_S22,_S23,_S24,_S25,_S26,_S27,_S28,_S29,_S30;
initial begin
    {S1,S2,S3,S4,S6,_S20,_S21,_S22,_S23,_S24,_S25,_S26,_S27,_S28,_S29,_S30}=16'h0FFF;
    {S1,S2,S3,S4,S6}=5'b01000;//null position
    // #20000
    // _S20=0;
    // #1000
    // _S20=1;
    // #10000
    // _S22=0;
    // #1000
    // _S22=1;
    #20000;
    {S1,S2,S3,S4,S6}=5'b00100;//step position
    #100000;
    //{S1,S2,S3,S4}=4'b0100;//TCR
    // #10000;
    // {S1,S2,S3,S4}=4'b0001;
    // #10000;
    // {S1,S2,S3,S4}=4'b0100;//32
    // #10000;
    // {S1,S2,S3,S4}=4'b0001;
    // #10000;
    // {S1,S2,S3,S4}=4'b0100;//24
    // #10000;
    // {S1,S2,S3,S4}=4'b0001;
    // #10000;
    // {S1,S2,S3,S4}=4'b0100;//16
    // #10000;
    // {S1,S2,S3,S4}=4'b0001;
    // #10000;
    // {S1,S2,S3,S4}=4'b0100;//8
    // #10000;
    // {S1,S2,S3,S4}=4'b0001;
    // #10000;
    // {S1,S2,S3,S4}=4'b0100;//0
    // #10000;
    // {S1,S2,S3,S4}=4'b0001;
    // #10000;
    // S6=1;
    // {S1,S2,S3,S4}=4'b0100;//LCR
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
assign dbg_I={M159.SR,M158.SR,M157.SR,M156.SR,M155.SR};
assign dbg_A={M154.SR,M153.SR,M152.SR,M151.SR,M150.SR};

reg [39:0]dbg_A_TS,dbg_I_TS;
always @(negedge T39) begin
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
        Z3=0;
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


always @(*) begin
    if(~CLR)mQ=0;
    else if(~PRE)mQ=1;
    else begin
        if(CLK) begin
            if(J&K)mQ=~Q;
            else if(J)mQ=1;
            else if(K)mQ=0;
            else mQ=mQ;
        end
    end
end
always @(*) begin
    if(~CLR)Q=0;
    else if(~PRE)Q=1;
    else if(~CLK) Q=mQ;
    else Q=Q;
end
assign _Q=~Q;

endmodule

/*585018  page 4.22*/
module DL_JK_MS_FF(input J, K, CLK, CLR, output Q, _Q);

reg Q=0;
reg mQ=0;

assign _Q=~Q;
always @(*) begin
    if(~CLR) mQ=0;
    else begin
        if(CLK) begin
            if(J&K)mQ=~Q;
            else if(J)mQ=1;
            else if(K)mQ=0;
            else mQ=mQ;
        end
    end
end
always @(*) begin
    if(~CLR) Q=0;
    else if(~CLK)Q=mQ;
    else Q=Q;
end
assign _Q=~Q;

endmodule

/*585019  page 4.24*/
module DL_D_FF(input D, CLK, CLR, PRE, output Q, _Q);

reg Q=0;

always @(posedge CLK, negedge CLR, negedge PRE) begin
    if(~CLR)Q=0;
    else if(~PRE)Q=1;
    else Q=D;
end
assign _Q=~Q;

endmodule

/*585020  page 4.26*/
module B8_SR(input D, CP, output Q, _Q);

reg [7:0] SR=8'h00;

always @(posedge CP) begin
    SR={D,SR[7:1]};
end
assign Q=SR[0];
assign _Q=~Q;

endmodule

module Drum_GS_32(input A, B ,Z1,W1,input [4:0]track,input [13:0]c_bit, output reg R1);

reg [5119:0] drum[0:31];
reg R0=0;
integer i; // Loop variable must be declared as an integer
initial R1=0;
initial begin
    for (i = 0; i < 32; i = i + 1) begin
        drum[i] = 5120'b0; 
    end
    //drum[31]=40'h00FEFF0000;
    //drum[31][5080:5119]=40'hFF0A010203;
    drum[31][5119:5080]=40'h5555555555;
end

initial begin
//    $readmemh("opus.mem", drum);
end

always @(posedge Z1)begin
    R1=R0;
    if(W1)begin
        if(A^B)
            drum[track][c_bit]=A;
    end
end
always @(negedge Z1) begin
    
    R0=drum[track][c_bit];
end

endmodule

module Drum_S(input A, B ,Z1,W1,input [13:0]c_bit, output R);

reg [0:5119] drum=0;
wire wbit=13'h1FFF&(c_bit+320);
assign R=drum[c_bit];
always @(posedge Z1)begin
    if(W1)begin
        if(A^B)
            drum[wbit]=A;
    end
end

endmodule