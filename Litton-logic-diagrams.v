/*still need connection*/
wire _K73,_K75,K92,K176;
wire L10,_L10,L20,_L20,L30,_L30,L50,_L50,L51,_L51,L53,_L53;
/*page 3.157 Figure 3.49*/
wire A1;
assign A1=~(
    ~(K43 & _L50)
    &
    ~(
        F9 & _K42
        &
        ~(
            ~(A6 & _F6 & K34)
            &
            ~(K40 & L53)
        )
    )
);
wire _A2;
assign _A2=~(C1 & A3);
wire A2;
assign A2=~_A2;

wire A3;
assign A3=~(M1 & S6 & _W2);

wire A4;
assign A4=~(_K42 & _C1);
wire _A4;
assign _A4=A4;

wire A5;
assign A5=~(_F8 & _F7 & M6);

/*page 3.158 Figure 3.50*/
wire _A6;
assign _A6=~(T39 & _F2);
wire A6;
assign A6=~_A6;

wire A7;
assign A7=~(
    ~(_L10 & _F1)
    |
    ~(_L30 & F1)
);

wire A8;
assign A8=~(A2 & F1);

wire A9;
assign A9= ~(~(F8 & M6));

wire A10;
assign A10=~(~(_F9 & _F10));

/*page 3.159 Figure 3.51*/

wire _A11;
assign _A11=~(F5 & F7 & M6);
wire A11;
assign A11=~_A11;

wire A12;
assign A12=~(C20 & K0 & _L20);

wire A13;
assign A13=~(C49 & K9 & Z3);

wire A14;
assign A14=~(
    C39 & _F14
    &
    ~(_A11 & _K9)
);

wire A15;
assign A15=~(K40 & A6);

wire A16;
assign A16=~(K50 & F21);

wire A17;
assign A17=~(K6 & C37 & L10);

wire _A18;
assign _A18=~(_F8 & F7);
wire A18;
assign A18=~_A18;

/*page 3.160 Figure 3.52*/

wire A19;
assign A19=~(~(C49 & F3));

wire _A20;
assign _A20=~(A37 & _F3);
wire A20;
assign A20=~_A20;

wire _A21;
assign _A21=~(F101 & _F2 & _F3);
wire A21;
assign A21=~_A21;

wire _A22;
assign _A22=~(A39 & _F3);
wire A22;
assign A22=~_A22;

wire A23;
assign A23=~(~(F101 & F2 & _F3));

wire A24;
assign A24=~(~(_A20 & A37));

wire A25;
assign A25=~(~(_A21 & F101 & _F2));

wire A26;
assign A26=~(~(_A22 & A39));

wire _A27;
assign _A27=~(F101 & F2 & F3);
wire A27;
assign A27=~_A27;

/*jumper selected for 1601*/
wire _A30;
assign _A30=~(_F9 & _F4);
wire _A31;
assign _A31=~(_F4 & F9);

/*page 3.161 Figure 3.53*/

wire _A32;
assign _A32=~(F104 & _F9);

wire _A33;
assign _A33=~(F104 & F9);

wire A35;
assign A35=~(_K41 & K13 & A36);

wire A36;
assign A36=~(K0 & F4 & _F1);

wire _A37;
assign _A37=~(_F1 & _F2);
wire A37;
assign A37=~_A37;

wire _A38;
assign _A38=~(_F1 & F2);
wire A38;
assign A38=~_A38;

wire _A39;
assign _A39=(_F1 & F2);
wire A39;
assign A39=~_A39;

/*page 3.162 Figure 3.54*/

wire C1,_C1;

wire tmp_J_M14;
assign tmp_J_M14=~(
    ~(C39 & M1 & S4)
    &
    A13 & A14
    &
    ~(
        ~(A18 & _F5 & _F3)
        &
        _K9 & C49 & M6
    )
);
wire tmp_K_M14;
assign tmp_K_M14=(
    C20 & T39
    &
    ~(_L20 & _F8 & _F7 & A38 & F3 & _F2 & _M1)
);

JK_MS_FF M14(tmp_J_M14,tmp_K_M14,Z1,1'b1,_W2,C1,_C1);

wire C101;
assign C101=~_C1;

/*page 3.163 Figure 3.55*/

wire tmp_J_M13;
assign tmp_J_M13=(
    C39
    &
    ~(
        ~(M1 & S3)
        &
        ~(K9 & F14 & Z3)
        &
        ~(
            M6 & _K9
            &
            ~(A14 & F11)
        )
    )
);

wire tmp_K_M13;
assign tmp_K_M13=(
    _T7 & T4
    &
    ~(
        A13 & _C1
        &
        ~(
            C40
            &
            ~(
                _M1
                &
                ~(_F8 & _F7 & _F9)
            )
        )
    )
);

wire C2,_C2;
JK_MS_FF M13(tmp_J_M13,tmp_K_M13,Z1,1'b1,_W2,C2,_C2);

/*page 3.164 Figure 3.56*/

wire _C20;
assign _C20=~(C1 & _C2);
wire C20=~_C20;

wire _C30;
assign _C30=~(_C1 & _C2);
wire C30;
assign C30=~_C30;
wire C130=~_C30;

wire _C37;
assign _C37=~(C30 & T7);
wire C37;
assign C37=_C37;

/*page 3.165 Figure 3.57*/

wire _C39;
assign _C39=~(C30 & T39);
wire C39;
assign C39=~_C39;

wire _C40;
assign _C40=~(_C1 & C2);
wire C40;
assign C40=~_C40;

wire _C49;
assign _C49=~(_C1 & C2);
wire C49;
assign C49=~_C49;

/*page 3.166 Figure 3.58*/

wire tmp_J_M64;
assign tmp_J_M64=(
    F2
    &
    ~(
        _A4
        &
        ~(K35 & _C1 & T39 & Z3)
    )
);

wire tmp_K_M64;
assign tmp_K_M64=(
    _F2
    &
    ~(_A4 & K37)
);
wire F1,_F1;
JK_MS_FF M64(tmp_J_M64,tmp_K_M64,Z1,_S20,_S21,F1,_F1);
wire F101;
assign F101=~_F1;
wire _F101;
assign _F101=~F1;

wire tmp_J_M63_1;
assign tmp_J_M63_1=~(
    K37 & _S22
    &
    ~(A4 & F3)
);

wire tmp_K_M63_1;
assign tmp_K_M63_1=~(
    K37
    &
    ~(A4 & _F3)
);

wire F2,_F2;
DL_JK_MS_FF M63_1(tmp_J_M63_1,tmp_K_M63_1,Z1,_S20,F2,_F2);

/*page 3.167 Figure 3.59*/

wire tmp_J_M63_2;
assign tmp_J_M63_2=~(
    _S23
    &
    ~(
        ~(C101 & F4)
        |
        ~(K22 & F101)
    )
    &
    ~(
        _F2 & Z2 & _T4 & _T7 & K34
        &
        ~(F6 & F4 & _F9)
    )
);

wire tmp_K_M63_2;
assign tmp_K_M63_2=~(
    ~(K34 & T7 & L20)
    &
    ~(
        ~(K22 & _F101)
        |
        ~(C101 & _F104)
    )
);

wire F3,_F3;
DL_JK_MS_FF M63_2(tmp_J_M63_2,tmp_K_M63_2,Z1,_S20,F3,_F3);

/*page 3.168 Figure 3.60*/

wire F4,_F4;
JK_MS_FF M62((C101 & F5),(C101 & _F5),Z1,_S20,_S24,F4,_F4);

wire _F104;
assign _F104=~F4;
wire F104;
assign F104=~_F4;

wire F5,_F5;
JK_MS_FF M61((C1 & F106),~((K87 & F106)|(_C1 & A38)),Z1,_S20,_S25,F5,_F5);

/*page 3.169 Figure 3.61*/

wire tmp_J_M60;
assign tmp_J_M60=(
    F7
    &
    ~(
        (K87 & _C1)
        |
        (_C1 & F5)
    )
);

wire F6,_F6;
JK_MS_FF M60(tmp_J_M60,(C1 & _F7),Z1,_S20,_S26,F6,_F6);

wire F7,_F7;
JK_MS_FF M59((C1 & F8),(C1 & _F8),Z1,_S20,_S27,F7,_F7);

wire tmp_JK_M58;
assign tmp_JK_M58=~(
    (A2 & L20)
    |
    (_A2 & L10)
);

wire F8,_F8;
JK_MS_FF M58((C1 & ~tmp_JK_M58),(C1 & tmp_JK_M58),Z1,_S20,_S28,F8,_F8);

/*page 3.170 Figure 3.62*/

wire tmp_J_M97_1;
assign tmp_J_M97_1=~(
    A8 & A15
    &
    ~(K42 & L53 & _A6)
);

wire tmp_K_M97_1;
assign tmp_K_M97_1=~(
    A15
    &
    ~(
        (
            K42
            &
            ~(L53 & _A6)
        )
        |
        (A2 & _F101)
        |
        (K35 & C30 & _F6 & _F14)
    )
);

wire F9,_F9;
DL_JK_MS_FF M97_1(tmp_J_M97_1,tmp_K_M97_1,Z1,1'b1,F9,_F9);

/*page 3.171 Figure 3.63*/

wire tmp_J_M97_2;
assign tmp_J_M97_2=~(
    A16 & A17
    &
    ~(
        (K40 & L53)
        |
        (K41 & L50)
        |
        (
            A9 & C30
            &
            ~(A37 & _F3 & _F104)
        )
        |
        (A2 & F101 & T4)
    )
);

wire tmp_K_M97_2;
assign tmp_K_M97_2=~(
    A16 & A17
    &
    ~(
        (K40 & _L53)
        |
        (K41 & _L50)
        |
        (A2 & _T4)
        |
        (M6 & _F8 & C30 & _A11)
    )
);

wire F10,_F10;
DL_JK_MS_FF M97_2(tmp_J_M97_2,tmp_K_M97_2,Z1,1'b1,F10,_F10);

/*page 3.172 Figure 3.64*/

wire tmp_J_M112_1;
assign tmp_J_M112_1=~(
    ~(K6 & C40 & F3)
    &
    ~(K5 & F9 & C40)
    &
    ~(
        (
            K22
            &
            ~(
                (_F101 & _Z3)
                |
                (F101 & Z3)
            )
        )
        |
        (K34 & F10)
        |
        (
            C37 & F8
            &
            ~(_F10 & T4)
        )
        |
        ~(
            (_L20 & _Z3)
            |
            (L20 & Z3)
        )
    )
);

/*page 3.173 Figure 3.65*/

wire tmp_K_M112_1;
assign tmp_K_M112_1=~(
    ~(_T4 & _T7 & C30)
    &
    ~(K34 & _F10)
);

wire F11,_F11;
DL_JK_MS_FF M112_1(tmp_J_M112_1,tmp_K_M112_1,Z1,1'b1,F11,_F11);

wire F12,_F12;
JK_MS_FF M105((K50 & C49 & A10),(A19 & _F104 & K7),Z1,1'b1,1'b1,F12,_F12);

/*page 3.174 Figure 3.66*/

wire tmp_M;
assign tmp_M=~(
    ~(K6 & _F2 & K176)
    &
    ~(
        (K9 & K92)
        |
        (
            K5
            &
            ~(
                (_F9 & _K75)
                |
                (F9 & _K73)
            )
        )
    )
);

wire tmp_C;
assign tmp_C=~(
    (
        F104
        &
        ~(L10 & L30)
    )
    |
    (
        _F104
        &
        ~(
            (F3 & _F12)
            |
            (F101 & L10)
            |
            (F2 & _L10 & C49)
        )
    )
);

/*page 3.175 Figure 3.67*/

wire tmp_D;
assign tmp_D=~(
    _S30
    &
    ~(
        (tmp_M & C37)
        |
        (tmp_C & K7)
        |
        (
            _L51
            &
            ~(
                ~(_L50 & C40 & A35)
                &
                ~(
                    L50
                    &
                    ~(_K2 & _K40)
                )
            )
        )
        |
        (K35 & C39)
        |
        (K2 & _F104 & _L53)
        |
        (
            _F11 & C39 & _K9
            &
            ~(K13 & _K28)
        )
    )
);

/*page 3.176 Figure 3.68*/

wire tmp_E;
assign tmp_E=~(
    _S29
    &
    ~(
        M6
        &
        ~(
            (
                T39
                &
                ~(
                    C30 & _F8 & _T7
                    &
                    ~(_F5 & _K9)
                )
            )
            |
            (
                T39
                &
                ~(K34 & _F6 & F3 & A7)
            )
        )
    )
    &
    ~(
        C40 & L51
        &
        ~(
            ~(L50 & A35)
            &
            ~(
                _L50 & F104
                &
                ~(_K2 & _K28 & _K34)
            )
        )
    )
);

/*page 3.177 Figure 3.69*/

wire F14,_F14;
DL_JK_MS_FF M112_2(tmp_E,tmp_D,Z1,_W2,F14,_F14);

wire F15,_F15;
JK_MS_FF M126((K6& C49),(C20 & T39),Z1,1'b1,1'b1,F15,_F15);

/*page 3.178 Figure 3.70*/

wire tmp_D_M131_1;
assign tmp_D_M131_1=~(
    (_K6 & _K50)
    |
    (_C40 & _K50)
    |
    (_F4 & _L10)
    |
    (
        F4
        &
        ~(L20 & K6)
    )
);

wire F20,_F20;
DL_D_FF M131_1(tmp_D_M131_1,Z1,1'b1,1'b1,F20,_F20);

wire F28,_F28;
DL_D_FF M131_2(_F20,_Z4,1'b1,~(K51 & Ib107),F28,_F28);

wire F27,_F27;
JK_MS_FF M127(F28,_F28,Z4,1'b1,~(K51 & Ib106),F27,_F27);

/*page 3.179 Figure 3.71*/

wire F26,_F26;
DL_D_FF M130_1(_F27,Z4,1'b1,~(K51 & Ib105),F26,_F26);

wire F25,_F25;
DL_D_FF M130_2(_F26,Z4,1'b1,~(K51 & Ib104),F25,_F25);

wire F24,_F24;
DL_D_FF M129_1(_F25,Z4,1'b1,~(K51 & Ib103),F24,_F24);

wire F23,_F23;
DL_D_FF M129_2(_F24,Z4,1'b1,~(K51 & Ib102),F23,_F23);

wire F22,_F22;
DL_D_FF M128_1(_F23,Z4,1'b1,~(K51 & Ib101),F22,_F22);

wire F21,_F21;
DL_D_FF M128_2(_F22,Z4,1'b1,~(K51 & Ib108),F21,_F21);

/*page 3.181 Figure 3.73*/

wire K0;
assign K0=~(~(A5 & _F5 & _F6));

wire _K1;
assign _K1=~(A5 & _F5 & F6 & C40);
wire K1;
assign K1=~_K1;

wire _K2;
assign _K2=~(A6 & _F5 & F6 & C40);
wire K2;
assign K2=~_K2;

/*page 3.182 Figure 3.74*/

wire _K5;
assign _K5=~(A18 & A11 & _F6);
wire K5;
assign K5=~_K5;

wire _K6;
assign _K6=~(A18 & A11 & F6);
wire K6;
assign K6=~_K6;

wire K7;
assign K7=~(~(A5 & A38 & C40));

wire _K9;
assign _K9=~(K28 & F1 & F3);
wire K9;
assign K9=~_K9;

wire K13;
assign K13=~(A9 & A38);

wire _K14;
assign _K14=~(A9 & _A38 & F7);
wire K14;
assign K14=~_K14;

/*page 3.183 Figure 3.75*/

wire _K22;
assign _K22=~(
    A5 & C37 & _T4
    &
    ~(
        _F6
        &
        ~(F4 & F5)
    )
);
wire K22;
assign K22=~_K22;

wire _K27;
assign _K27=~(K0 & _F2 & F3 & F4);
wire K27;
assign K27=~_K27;

wire _K28;
assign _K28=~(K0 & F2 & F4);
wire K28;
assign K28=~_K28;

wire _K34;
assign _K34=~(K35 & C40 & _A39);
wire K34;
assign K34=~_K34;

/*page 3.184 Figure 3.76*/

wire _K35;
assign _K35=~(A18 & _F5 & M6);
wire K35;
assign K35=~_K35;

wire K37;
assign K37=~(K35 & C49 & F1);

wire _K40;
assign _K40=~(K34 & F6 & F4);
wire K40;
assign K40=~_K40;

wire _K41;
assign _K41=~(K42 & F6);
wire K41;
assign K41=~_K41;

wire _K42;
assign _K42=~(K34 & _F4);
wire K42;
assign K42=~_K42;

/*page 3.185 Figure 3.77*/

wire _K43;
assign _K43=~(
    F4 & K34
    &
    ~(F6 & F9)
);
wire K43;
assign K43=~_K43;

wire K46;
assign K46=~(~(A9 & F5 & F6 & _F7));

wire _K50;
assign _K50=~(K5 & C40);
wire K50;
assign K50=~_K50;

wire _K51;
assign _K51=~(K5 & C39 & F14);
wire K51;
assign K51=~_K51;



/*page 3.201 Figure 3.92*/

wire _M1;
assign _M1=~(M5 & _M6);
wire M1;
assign M1=~_M1;

wire tmp_K_M11;
assign tmp_K_M11=(
    _T7 & T4
    &
    ~(
        A12
        &
        ~(_C20 & _C40)
        &
        ~(M6 & C30 & S3)
    )
);

wire M5,_M5;
JK_MS_FF M11((_M6 & C30 & S2),tmp_K_M11,Z1,1'b1,_W2,M5,_M5);

wire tmp_J_M12;
assign tmp_J_M12=(
    _C1 & T39
    &
    ~(
        _C2
        &
        ~(M5 & S1)
    )
);
wire tmp_K_M12;
assign tmp_K_M12=(
    T39 & C20
    &
    ~(M5 & A12)
);

wire M6,_M6;
JK_MS_FF M12(tmp_J_M12,tmp_K_M12,Z1,_W2,1'b1,M6,_M6);


/*page 3.207 Figure 3.98*/

wire Z4;
assign Z4=~(
    ~(
        _K51 & _F15 & Z1
        &
        ~(_C2 & _T7 & _Z2)
    )
);
wire _Z4;
assign _Z4=~Z4;
