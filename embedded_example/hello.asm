;--------------------------------------------------------
; File Created by SDCC : FreeWare ANSI-C Compiler
; Version 2.6.0 #4309 (Nov 10 2006)
; This file generated Tue Aug 28 23:22:35 2007
;--------------------------------------------------------
	.module hello
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _LED_pin
	.globl _CP_RL2
	.globl _C_T2
	.globl _TR2
	.globl _EXEN2
	.globl _TCLK
	.globl _RCLK
	.globl _EXF2
	.globl _TF2
	.globl _T2
	.globl _T2EX
	.globl _RI
	.globl _TI
	.globl _RB8
	.globl _TB8
	.globl _REN
	.globl _SM2
	.globl _SM1
	.globl _SM0
	.globl _RXD
	.globl _TXD
	.globl _INT0
	.globl _INT1
	.globl _T0
	.globl _T1
	.globl _WR
	.globl _RD
	.globl _PX0
	.globl _PT0
	.globl _PX1
	.globl _PT1
	.globl _PS
	.globl _PT2
	.globl _EX0
	.globl _ET0
	.globl _EX1
	.globl _ET1
	.globl _ES
	.globl _ET2
	.globl _EA
	.globl _IT0
	.globl _IE0
	.globl _IT1
	.globl _IE1
	.globl _TR0
	.globl _TF0
	.globl _TR1
	.globl _TF1
	.globl _P
	.globl _OV
	.globl _RS0
	.globl _RS1
	.globl _F0
	.globl _AC
	.globl _CY
	.globl _TH2
	.globl _TL2
	.globl _RCAP2H
	.globl _RCAP2L
	.globl _T2CON
	.globl _SBUF
	.globl _SCON
	.globl _IP
	.globl _IE
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _P3
	.globl _P2
	.globl _P1
	.globl _P0
	.globl _LED_state_G
	.globl _LED_FLASH_Init
	.globl _LED_FLASH_Change_State
	.globl _DELAY_LOOP_Wait
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (DATA)
_P0::
	.ds 1
_P1::
	.ds 1
_P2::
	.ds 1
_P3::
	.ds 1
_PSW::
	.ds 1
_ACC::
	.ds 1
_B::
	.ds 1
_SP::
	.ds 1
_DPL::
	.ds 1
_DPH::
	.ds 1
_PCON::
	.ds 1
_TCON::
	.ds 1
_TMOD::
	.ds 1
_TL0::
	.ds 1
_TL1::
	.ds 1
_TH0::
	.ds 1
_TH1::
	.ds 1
_IE::
	.ds 1
_IP::
	.ds 1
_SCON::
	.ds 1
_SBUF::
	.ds 1
_T2CON::
	.ds 1
_RCAP2L::
	.ds 1
_RCAP2H::
	.ds 1
_TL2::
	.ds 1
_TH2::
	.ds 1
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (DATA)
_CY::
	.ds 1
_AC::
	.ds 1
_F0::
	.ds 1
_RS1::
	.ds 1
_RS0::
	.ds 1
_OV::
	.ds 1
_P::
	.ds 1
_TF1::
	.ds 1
_TR1::
	.ds 1
_TF0::
	.ds 1
_TR0::
	.ds 1
_IE1::
	.ds 1
_IT1::
	.ds 1
_IE0::
	.ds 1
_IT0::
	.ds 1
_EA::
	.ds 1
_ET2::
	.ds 1
_ES::
	.ds 1
_ET1::
	.ds 1
_EX1::
	.ds 1
_ET0::
	.ds 1
_EX0::
	.ds 1
_PT2::
	.ds 1
_PS::
	.ds 1
_PT1::
	.ds 1
_PX1::
	.ds 1
_PT0::
	.ds 1
_PX0::
	.ds 1
_RD::
	.ds 1
_WR::
	.ds 1
_T1::
	.ds 1
_T0::
	.ds 1
_INT1::
	.ds 1
_INT0::
	.ds 1
_TXD::
	.ds 1
_RXD::
	.ds 1
_SM0::
	.ds 1
_SM1::
	.ds 1
_SM2::
	.ds 1
_REN::
	.ds 1
_TB8::
	.ds 1
_RB8::
	.ds 1
_TI::
	.ds 1
_RI::
	.ds 1
_T2EX::
	.ds 1
_T2::
	.ds 1
_TF2::
	.ds 1
_EXF2::
	.ds 1
_RCLK::
	.ds 1
_TCLK::
	.ds 1
_EXEN2::
	.ds 1
_TR2::
	.ds 1
_C_T2::
	.ds 1
_CP_RL2::
	.ds 1
_LED_pin::
	.ds 1
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG	(DATA)
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_LED_state_G::
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	hello.C:10: 
;	genAssign
	mov	_P0,#0x80
;	hello.C:11: void LED_FLASH_Init (void);
;	genAssign
	mov	_P1,#0x90
;	hello.C:12: void LED_FLASH_Change_State (void);
;	genAssign
	mov	_P2,#0xA0
;	hello.C:13: void DELAY_LOOP_Wait (const unsigned int);
;	genAssign
	mov	_P3,#0xB0
;	hello.C:14: 
;	genAssign
	mov	_PSW,#0xD0
;	hello.C:15: void main (void)
;	genAssign
	mov	_ACC,#0xE0
;	hello.C:16: {
;	genAssign
	mov	_B,#0xF0
;	hello.C:17: LED_FLASH_Init ();
;	genAssign
	mov	_SP,#0x81
;	hello.C:18: 
;	genAssign
	mov	_DPL,#0x82
;	hello.C:19: while(1)
;	genAssign
	mov	_DPH,#0x83
;	hello.C:20: {
;	genAssign
	mov	_PCON,#0x87
;	hello.C:21: // Change LED state (OFF to ON, or vice versa)
;	genAssign
	mov	_TCON,#0x88
;	hello.C:22: LED_FLASH_Change_State ();
;	genAssign
	mov	_TMOD,#0x89
;	hello.C:23: DELAY_LOOP_Wait (1000);
;	genAssign
	mov	_TL0,#0x8A
;	hello.C:24: }
;	genAssign
	mov	_TL1,#0x8B
;	hello.C:25: }
;	genAssign
	mov	_TH0,#0x8C
;	hello.C:26: 
;	genAssign
	mov	_TH1,#0x8D
;	hello.C:27: void LED_FLASH_Init (void)
;	genAssign
	mov	_IE,#0xA8
;	hello.C:28: {
;	genAssign
	mov	_IP,#0xB8
;	hello.C:29: LED_state_G = 0;
;	genAssign
	mov	_SCON,#0x98
;	hello.C:30: }
;	genAssign
	mov	_SBUF,#0x99
;	hello.C:33: {
;	genAssign
	mov	_T2CON,#0xC8
;	hello.C:34: if(LED_state_G==1)
;	genAssign
	mov	_RCAP2L,#0xCA
;	hello.C:35: {
;	genAssign
	mov	_RCAP2H,#0xCB
;	hello.C:36: LED_state_G = 0;
;	genAssign
	mov	_TL2,#0xCC
;	hello.C:37: LED_pin = 0;
;	genAssign
	mov	_TH2,#0xCD
;	/usr/include/sdcc/REG52.H:42: sbit CY    = PSW^7;
;	genXor
	setb	c
	mov	a,#0x07
	xrl	a,_PSW
	jnz	00130$
	clr	c
00130$:
	mov	_CY,c
;	/usr/include/sdcc/REG52.H:43: sbit AC    = PSW^6;
;	genXor
	setb	c
	mov	a,#0x06
	xrl	a,_PSW
	jnz	00132$
	clr	c
00132$:
	mov	_AC,c
;	/usr/include/sdcc/REG52.H:44: sbit F0    = PSW^5;
;	genXor
	setb	c
	mov	a,#0x05
	xrl	a,_PSW
	jnz	00134$
	clr	c
00134$:
	mov	_F0,c
;	/usr/include/sdcc/REG52.H:45: sbit RS1   = PSW^4;
;	genXor
	setb	c
	mov	a,#0x04
	xrl	a,_PSW
	jnz	00136$
	clr	c
00136$:
	mov	_RS1,c
;	/usr/include/sdcc/REG52.H:46: sbit RS0   = PSW^3;
;	genXor
	setb	c
	mov	a,#0x03
	xrl	a,_PSW
	jnz	00138$
	clr	c
00138$:
	mov	_RS0,c
;	/usr/include/sdcc/REG52.H:47: sbit OV    = PSW^2;
;	genXor
	setb	c
	mov	a,#0x02
	xrl	a,_PSW
	jnz	00140$
	clr	c
00140$:
	mov	_OV,c
;	/usr/include/sdcc/REG52.H:48: sbit P     = PSW^0; //8052 only
;	genAssign
	mov	a,_PSW
	add	a,#0xff
	mov	_P,c
;	/usr/include/sdcc/REG52.H:51: sbit TF1   = TCON^7;
;	genXor
	setb	c
	mov	a,#0x07
	xrl	a,_TCON
	jnz	00143$
	clr	c
00143$:
	mov	_TF1,c
;	/usr/include/sdcc/REG52.H:52: sbit TR1   = TCON^6;
;	genXor
	setb	c
	mov	a,#0x06
	xrl	a,_TCON
	jnz	00145$
	clr	c
00145$:
	mov	_TR1,c
;	/usr/include/sdcc/REG52.H:53: sbit TF0   = TCON^5;
;	genXor
	setb	c
	mov	a,#0x05
	xrl	a,_TCON
	jnz	00147$
	clr	c
00147$:
	mov	_TF0,c
;	/usr/include/sdcc/REG52.H:54: sbit TR0   = TCON^4;
;	genXor
	setb	c
	mov	a,#0x04
	xrl	a,_TCON
	jnz	00149$
	clr	c
00149$:
	mov	_TR0,c
;	/usr/include/sdcc/REG52.H:55: sbit IE1   = TCON^3;
;	genXor
	setb	c
	mov	a,#0x03
	xrl	a,_TCON
	jnz	00151$
	clr	c
00151$:
	mov	_IE1,c
;	/usr/include/sdcc/REG52.H:56: sbit IT1   = TCON^2;
;	genXor
	setb	c
	mov	a,#0x02
	xrl	a,_TCON
	jnz	00153$
	clr	c
00153$:
	mov	_IT1,c
;	/usr/include/sdcc/REG52.H:57: sbit IE0   = TCON^1;
;	genXor
	setb	c
	mov	a,#0x01
	xrl	a,_TCON
	jnz	00155$
	clr	c
00155$:
	mov	_IE0,c
;	/usr/include/sdcc/REG52.H:58: sbit IT0   = TCON^0;
;	genAssign
	mov	a,_TCON
	add	a,#0xff
	mov	_IT0,c
;	/usr/include/sdcc/REG52.H:61: sbit EA    = IE^7;
;	genXor
	setb	c
	mov	a,#0x07
	xrl	a,_IE
	jnz	00158$
	clr	c
00158$:
	mov	_EA,c
;	/usr/include/sdcc/REG52.H:62: sbit ET2   = IE^5; //8052 only
;	genXor
	setb	c
	mov	a,#0x05
	xrl	a,_IE
	jnz	00160$
	clr	c
00160$:
	mov	_ET2,c
;	/usr/include/sdcc/REG52.H:63: sbit ES    = IE^4;
;	genXor
	setb	c
	mov	a,#0x04
	xrl	a,_IE
	jnz	00162$
	clr	c
00162$:
	mov	_ES,c
;	/usr/include/sdcc/REG52.H:64: sbit ET1   = IE^3;
;	genXor
	setb	c
	mov	a,#0x03
	xrl	a,_IE
	jnz	00164$
	clr	c
00164$:
	mov	_ET1,c
;	/usr/include/sdcc/REG52.H:65: sbit EX1   = IE^2;
;	genXor
	setb	c
	mov	a,#0x02
	xrl	a,_IE
	jnz	00166$
	clr	c
00166$:
	mov	_EX1,c
;	/usr/include/sdcc/REG52.H:66: sbit ET0   = IE^1;
;	genXor
	setb	c
	mov	a,#0x01
	xrl	a,_IE
	jnz	00168$
	clr	c
00168$:
	mov	_ET0,c
;	/usr/include/sdcc/REG52.H:67: sbit EX0   = IE^0;
;	genAssign
	mov	a,_IE
	add	a,#0xff
	mov	_EX0,c
;	/usr/include/sdcc/REG52.H:70: sbit PT2   = IP^5;
;	genXor
	setb	c
	mov	a,#0x05
	xrl	a,_IP
	jnz	00171$
	clr	c
00171$:
	mov	_PT2,c
;	/usr/include/sdcc/REG52.H:71: sbit PS    = IP^4;
;	genXor
	setb	c
	mov	a,#0x04
	xrl	a,_IP
	jnz	00173$
	clr	c
00173$:
	mov	_PS,c
;	/usr/include/sdcc/REG52.H:72: sbit PT1   = IP^3;
;	genXor
	setb	c
	mov	a,#0x03
	xrl	a,_IP
	jnz	00175$
	clr	c
00175$:
	mov	_PT1,c
;	/usr/include/sdcc/REG52.H:73: sbit PX1   = IP^2;
;	genXor
	setb	c
	mov	a,#0x02
	xrl	a,_IP
	jnz	00177$
	clr	c
00177$:
	mov	_PX1,c
;	/usr/include/sdcc/REG52.H:74: sbit PT0   = IP^1;
;	genXor
	setb	c
	mov	a,#0x01
	xrl	a,_IP
	jnz	00179$
	clr	c
00179$:
	mov	_PT0,c
;	/usr/include/sdcc/REG52.H:75: sbit PX0   = IP^0;
;	genAssign
	mov	a,_IP
	add	a,#0xff
	mov	_PX0,c
;	/usr/include/sdcc/REG52.H:78: sbit RD    = P3^7;
;	genXor
	setb	c
	mov	a,#0x07
	xrl	a,_P3
	jnz	00182$
	clr	c
00182$:
	mov	_RD,c
;	/usr/include/sdcc/REG52.H:79: sbit WR    = P3^6;
;	genXor
	setb	c
	mov	a,#0x06
	xrl	a,_P3
	jnz	00184$
	clr	c
00184$:
	mov	_WR,c
;	/usr/include/sdcc/REG52.H:80: sbit T1    = P3^5;
;	genXor
	setb	c
	mov	a,#0x05
	xrl	a,_P3
	jnz	00186$
	clr	c
00186$:
	mov	_T1,c
;	/usr/include/sdcc/REG52.H:81: sbit T0    = P3^4;
;	genXor
	setb	c
	mov	a,#0x04
	xrl	a,_P3
	jnz	00188$
	clr	c
00188$:
	mov	_T0,c
;	/usr/include/sdcc/REG52.H:82: sbit INT1  = P3^3;
;	genXor
	setb	c
	mov	a,#0x03
	xrl	a,_P3
	jnz	00190$
	clr	c
00190$:
	mov	_INT1,c
;	/usr/include/sdcc/REG52.H:83: sbit INT0  = P3^2;
;	genXor
	setb	c
	mov	a,#0x02
	xrl	a,_P3
	jnz	00192$
	clr	c
00192$:
	mov	_INT0,c
;	/usr/include/sdcc/REG52.H:84: sbit TXD   = P3^1;
;	genXor
	setb	c
	mov	a,#0x01
	xrl	a,_P3
	jnz	00194$
	clr	c
00194$:
	mov	_TXD,c
;	/usr/include/sdcc/REG52.H:85: sbit RXD   = P3^0;
;	genAssign
	mov	a,_P3
	add	a,#0xff
	mov	_RXD,c
;	/usr/include/sdcc/REG52.H:88: sbit SM0   = SCON^7;
;	genXor
	setb	c
	mov	a,#0x07
	xrl	a,_SCON
	jnz	00197$
	clr	c
00197$:
	mov	_SM0,c
;	/usr/include/sdcc/REG52.H:89: sbit SM1   = SCON^6;
;	genXor
	setb	c
	mov	a,#0x06
	xrl	a,_SCON
	jnz	00199$
	clr	c
00199$:
	mov	_SM1,c
;	/usr/include/sdcc/REG52.H:90: sbit SM2   = SCON^5;
;	genXor
	setb	c
	mov	a,#0x05
	xrl	a,_SCON
	jnz	00201$
	clr	c
00201$:
	mov	_SM2,c
;	/usr/include/sdcc/REG52.H:91: sbit REN   = SCON^4;
;	genXor
	setb	c
	mov	a,#0x04
	xrl	a,_SCON
	jnz	00203$
	clr	c
00203$:
	mov	_REN,c
;	/usr/include/sdcc/REG52.H:92: sbit TB8   = SCON^3;
;	genXor
	setb	c
	mov	a,#0x03
	xrl	a,_SCON
	jnz	00205$
	clr	c
00205$:
	mov	_TB8,c
;	/usr/include/sdcc/REG52.H:93: sbit RB8   = SCON^2;
;	genXor
	setb	c
	mov	a,#0x02
	xrl	a,_SCON
	jnz	00207$
	clr	c
00207$:
	mov	_RB8,c
;	/usr/include/sdcc/REG52.H:94: sbit TI    = SCON^1;
;	genXor
	setb	c
	mov	a,#0x01
	xrl	a,_SCON
	jnz	00209$
	clr	c
00209$:
	mov	_TI,c
;	/usr/include/sdcc/REG52.H:95: sbit RI    = SCON^0;
;	genAssign
	mov	a,_SCON
	add	a,#0xff
	mov	_RI,c
;	/usr/include/sdcc/REG52.H:98: sbit T2EX  = P1^1; // 8052 only
;	genXor
	setb	c
	mov	a,#0x01
	xrl	a,_P1
	jnz	00212$
	clr	c
00212$:
	mov	_T2EX,c
;	/usr/include/sdcc/REG52.H:99: sbit T2    = P1^0; // 8052 only
;	genAssign
	mov	a,_P1
	add	a,#0xff
	mov	_T2,c
;	/usr/include/sdcc/REG52.H:102: sbit TF2    = T2CON^7;
;	genXor
	setb	c
	mov	a,#0x07
	xrl	a,_T2CON
	jnz	00215$
	clr	c
00215$:
	mov	_TF2,c
;	/usr/include/sdcc/REG52.H:103: sbit EXF2   = T2CON^6;
;	genXor
	setb	c
	mov	a,#0x06
	xrl	a,_T2CON
	jnz	00217$
	clr	c
00217$:
	mov	_EXF2,c
;	/usr/include/sdcc/REG52.H:104: sbit RCLK   = T2CON^5;
;	genXor
	setb	c
	mov	a,#0x05
	xrl	a,_T2CON
	jnz	00219$
	clr	c
00219$:
	mov	_RCLK,c
;	/usr/include/sdcc/REG52.H:105: sbit TCLK   = T2CON^4;
;	genXor
	setb	c
	mov	a,#0x04
	xrl	a,_T2CON
	jnz	00221$
	clr	c
00221$:
	mov	_TCLK,c
;	/usr/include/sdcc/REG52.H:106: sbit EXEN2  = T2CON^3;
;	genXor
	setb	c
	mov	a,#0x03
	xrl	a,_T2CON
	jnz	00223$
	clr	c
00223$:
	mov	_EXEN2,c
;	/usr/include/sdcc/REG52.H:107: sbit TR2    = T2CON^2;
;	genXor
	setb	c
	mov	a,#0x02
	xrl	a,_T2CON
	jnz	00225$
	clr	c
00225$:
	mov	_TR2,c
;	/usr/include/sdcc/REG52.H:108: sbit C_T2   = T2CON^1;
;	genXor
	setb	c
	mov	a,#0x01
	xrl	a,_T2CON
	jnz	00227$
	clr	c
00227$:
	mov	_C_T2,c
;	/usr/include/sdcc/REG52.H:109: sbit CP_RL2 = T2CON^0;
;	genAssign
	mov	a,_T2CON
	add	a,#0xff
	mov	_CP_RL2,c
;	hello.C:5: sbit LED_pin = P1^5;
;	genXor
	setb	c
	mov	a,#0x05
	xrl	a,_P1
	jnz	00230$
	clr	c
00230$:
	mov	_LED_pin,c
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area CSEG    (CODE)
__sdcc_program_startup:
	lcall	_main
;	return from main will lock up
	sjmp .
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	hello.C:15: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
;	hello.C:17: LED_FLASH_Init ();
;	genCall
	lcall	_LED_FLASH_Init
;	hello.C:19: while(1)
00102$:
;	hello.C:22: LED_FLASH_Change_State ();
;	genCall
	lcall	_LED_FLASH_Change_State
;	hello.C:23: DELAY_LOOP_Wait (1000);
;	genCall
;	Peephole 182.b	used 16 bit load of dptr
	mov	dptr,#0x03E8
	lcall	_DELAY_LOOP_Wait
;	Peephole 112.b	changed ljmp to sjmp
	sjmp	00102$
;	Peephole 259.a	removed redundant label 00104$ and ret
;
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_FLASH_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	hello.C:27: void LED_FLASH_Init (void)
;	-----------------------------------------
;	 function LED_FLASH_Init
;	-----------------------------------------
_LED_FLASH_Init:
;	hello.C:29: LED_state_G = 0;
;	genAssign
	clr	_LED_state_G
;	Peephole 300	removed redundant label 00101$
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_FLASH_Change_State'
;------------------------------------------------------------
;------------------------------------------------------------
;	hello.C:32: void LED_FLASH_Change_State (void)
;	-----------------------------------------
;	 function LED_FLASH_Change_State
;	-----------------------------------------
_LED_FLASH_Change_State:
;	genIfx
;	genIfxJump
;	Peephole 108.d	removed ljmp by inverse jump logic
;	hello.C:36: LED_state_G = 0;
;	genAssign
;	Peephole 250.a	using atomic test and clear
	jbc	_LED_state_G,00107$
	sjmp	00102$
00107$:
;	hello.C:37: LED_pin = 0;
;	genAssign
	clr	_LED_pin
;	Peephole 112.b	changed ljmp to sjmp
;	Peephole 251.b	replaced sjmp to ret with ret
	ret
00102$:
;	hello.C:41: LED_state_G = 1;
;	genAssign
	setb	_LED_state_G
;	hello.C:42: LED_pin = 1;
;	genAssign
	setb	_LED_pin
;	Peephole 300	removed redundant label 00104$
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'DELAY_LOOP_Wait'
;------------------------------------------------------------
;DELAY                     Allocated to registers r2 r3 
;x                         Allocated to registers r4 r5 
;y                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	hello.C:47: void DELAY_LOOP_Wait (const unsigned int DELAY)
;	-----------------------------------------
;	 function DELAY_LOOP_Wait
;	-----------------------------------------
_DELAY_LOOP_Wait:
;	genReceive
	mov	r2,dpl
	mov	r3,dph
;	hello.C:51: for(x = 0; x <= DELAY; x++)
;	genAssign
	mov	r4,#0x00
	mov	r5,#0x00
00104$:
;	genCmpGt
;	genCmp
	clr	c
	mov	a,r2
	subb	a,r4
	mov	a,r3
	subb	a,r5
;	genIfxJump
;	Peephole 112.b	changed ljmp to sjmp
;	Peephole 160.a	removed sjmp by inverse jump logic
	jc	00108$
;	Peephole 300	removed redundant label 00116$
;	hello.C:53: for(y = 0; y <= 120; y++);
;	genAssign
	mov	r6,#0x79
	mov	r7,#0x00
00103$:
;	genMinus
;	genMinusDec
	dec	r6
	cjne	r6,#0xff,00117$
	dec	r7
00117$:
;	genIfx
	mov	a,r6
	orl	a,r7
;	genIfxJump
;	Peephole 108.b	removed ljmp by inverse jump logic
	jnz	00103$
;	Peephole 300	removed redundant label 00118$
;	hello.C:51: for(x = 0; x <= DELAY; x++)
;	genPlus
;     genPlusIncr
;	tail increment optimized (range 7)
	inc	r4
	cjne	r4,#0x00,00104$
	inc	r5
;	Peephole 112.b	changed ljmp to sjmp
	sjmp	00104$
00108$:
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
