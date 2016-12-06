;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Nov 23 2016) (Mac OS X ppc)
; This file was generated Thu Nov 24 10:53:32 2016
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f97j60

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _DisplayWORD
	global _DisplayString
	global _strlcpy
	global _current_time_string
	global _debug_display_time
	global _display_time
	global _display_state
	global _blink_time
	global _state2str
	global _current_hours
	global _current_minutes
	global _current_seconds
	global _high_isr
	global _main

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrget1
	extern __gptrput1
	extern __moduchar
	extern __divuchar
	extern _EBSTCONbits
	extern _MISTATbits
	extern _EFLOCONbits
	extern _MACON1bits
	extern _MACON2bits
	extern _MACON3bits
	extern _MACON4bits
	extern _MACLCON1bits
	extern _MACLCON2bits
	extern _MICONbits
	extern _MICMDbits
	extern _EWOLIEbits
	extern _EWOLIRbits
	extern _ERXFCONbits
	extern _EIEbits
	extern _ESTATbits
	extern _ECON2bits
	extern _EIRbits
	extern _EDATAbits
	extern _SSP2CON2bits
	extern _SSP2CON1bits
	extern _SSP2STATbits
	extern _ECCP2DELbits
	extern _ECCP2ASbits
	extern _ECCP3DELbits
	extern _ECCP3ASbits
	extern _RCSTA2bits
	extern _TXSTA2bits
	extern _CCP5CONbits
	extern _CCP4CONbits
	extern _T4CONbits
	extern _ECCP1DELbits
	extern _BAUDCON2bits
	extern _BAUDCTL2bits
	extern _BAUDCONbits
	extern _BAUDCON1bits
	extern _BAUDCTLbits
	extern _BAUDCTL1bits
	extern _PORTAbits
	extern _PORTBbits
	extern _PORTCbits
	extern _PORTDbits
	extern _PORTEbits
	extern _PORTFbits
	extern _PORTGbits
	extern _PORTHbits
	extern _PORTJbits
	extern _LATAbits
	extern _LATBbits
	extern _LATCbits
	extern _LATDbits
	extern _LATEbits
	extern _LATFbits
	extern _LATGbits
	extern _LATHbits
	extern _LATJbits
	extern _DDRAbits
	extern _TRISAbits
	extern _DDRBbits
	extern _TRISBbits
	extern _DDRCbits
	extern _TRISCbits
	extern _DDRDbits
	extern _TRISDbits
	extern _DDREbits
	extern _TRISEbits
	extern _DDRFbits
	extern _TRISFbits
	extern _DDRGbits
	extern _TRISGbits
	extern _DDRHbits
	extern _TRISHbits
	extern _DDRJbits
	extern _TRISJbits
	extern _OSCTUNEbits
	extern _MEMCONbits
	extern _PIE1bits
	extern _PIR1bits
	extern _IPR1bits
	extern _PIE2bits
	extern _PIR2bits
	extern _IPR2bits
	extern _PIE3bits
	extern _PIR3bits
	extern _IPR3bits
	extern _EECON1bits
	extern _RCSTAbits
	extern _RCSTA1bits
	extern _TXSTAbits
	extern _TXSTA1bits
	extern _PSPCONbits
	extern _T3CONbits
	extern _CMCONbits
	extern _CVRCONbits
	extern _ECCP1ASbits
	extern _CCP3CONbits
	extern _ECCP3CONbits
	extern _CCP2CONbits
	extern _ECCP2CONbits
	extern _CCP1CONbits
	extern _ECCP1CONbits
	extern _ADCON2bits
	extern _ADCON1bits
	extern _ADCON0bits
	extern _SSP1CON2bits
	extern _SSPCON2bits
	extern _SSP1CON1bits
	extern _SSPCON1bits
	extern _SSP1STATbits
	extern _SSPSTATbits
	extern _T2CONbits
	extern _T1CONbits
	extern _RCONbits
	extern _WDTCONbits
	extern _ECON1bits
	extern _OSCCONbits
	extern _T0CONbits
	extern _STATUSbits
	extern _INTCON3bits
	extern _INTCON2bits
	extern _INTCONbits
	extern _STKPTRbits
	extern _stdin
	extern _stdout
	extern _LCDText
	extern _MAADR5
	extern _MAADR6
	extern _MAADR3
	extern _MAADR4
	extern _MAADR1
	extern _MAADR2
	extern _EBSTSD
	extern _EBSTCON
	extern _EBSTCS
	extern _EBSTCSL
	extern _EBSTCSH
	extern _MISTAT
	extern _EFLOCON
	extern _EPAUS
	extern _EPAUSL
	extern _EPAUSH
	extern _MACON1
	extern _MACON2
	extern _MACON3
	extern _MACON4
	extern _MABBIPG
	extern _MAIPG
	extern _MAIPGL
	extern _MAIPGH
	extern _MACLCON1
	extern _MACLCON2
	extern _MAMXFL
	extern _MAMXFLL
	extern _MAMXFLH
	extern _MICON
	extern _MICMD
	extern _MIREGADR
	extern _MIWR
	extern _MIWRL
	extern _MIWRH
	extern _MIRD
	extern _MIRDL
	extern _MIRDH
	extern _EHT0
	extern _EHT1
	extern _EHT2
	extern _EHT3
	extern _EHT4
	extern _EHT5
	extern _EHT6
	extern _EHT7
	extern _EPMM0
	extern _EPMM1
	extern _EPMM2
	extern _EPMM3
	extern _EPMM4
	extern _EPMM5
	extern _EPMM6
	extern _EPMM7
	extern _EPMCS
	extern _EPMCSL
	extern _EPMCSH
	extern _EPMO
	extern _EPMOL
	extern _EPMOH
	extern _EWOLIE
	extern _EWOLIR
	extern _ERXFCON
	extern _EPKTCNT
	extern _EWRPT
	extern _EWRPTL
	extern _EWRPTH
	extern _ETXST
	extern _ETXSTL
	extern _ETXSTH
	extern _ETXND
	extern _ETXNDL
	extern _ETXNDH
	extern _ERXST
	extern _ERXSTL
	extern _ERXSTH
	extern _ERXND
	extern _ERXNDL
	extern _ERXNDH
	extern _ERXRDPT
	extern _ERXRDPTL
	extern _ERXRDPTH
	extern _ERXWRPT
	extern _ERXWRPTL
	extern _ERXWRPTH
	extern _EDMAST
	extern _EDMASTL
	extern _EDMASTH
	extern _EDMAND
	extern _EDMANDL
	extern _EDMANDH
	extern _EDMADST
	extern _EDMADSTL
	extern _EDMADSTH
	extern _EDMACS
	extern _EDMACSL
	extern _EDMACSH
	extern _EIE
	extern _ESTAT
	extern _ECON2
	extern _EIR
	extern _EDATA
	extern _SSP2CON2
	extern _SSP2CON1
	extern _SSP2STAT
	extern _SSP2ADD
	extern _SSP2BUF
	extern _ECCP2DEL
	extern _ECCP2AS
	extern _ECCP3DEL
	extern _ECCP3AS
	extern _RCSTA2
	extern _TXSTA2
	extern _TXREG2
	extern _RCREG2
	extern _SPBRG2
	extern _CCP5CON
	extern _CCPR5
	extern _CCPR5L
	extern _CCPR5H
	extern _CCP4CON
	extern _CCPR4
	extern _CCPR4L
	extern _CCPR4H
	extern _T4CON
	extern _PR4
	extern _TMR4
	extern _ECCP1DEL
	extern _ERDPT
	extern _ERDPTL
	extern _ERDPTH
	extern _BAUDCON2
	extern _BAUDCTL2
	extern _SPBRGH2
	extern _BAUDCON
	extern _BAUDCON1
	extern _BAUDCTL
	extern _BAUDCTL1
	extern _SPBRGH
	extern _SPBRGH1
	extern _PORTA
	extern _PORTB
	extern _PORTC
	extern _PORTD
	extern _PORTE
	extern _PORTF
	extern _PORTG
	extern _PORTH
	extern _PORTJ
	extern _LATA
	extern _LATB
	extern _LATC
	extern _LATD
	extern _LATE
	extern _LATF
	extern _LATG
	extern _LATH
	extern _LATJ
	extern _DDRA
	extern _TRISA
	extern _DDRB
	extern _TRISB
	extern _DDRC
	extern _TRISC
	extern _DDRD
	extern _TRISD
	extern _DDRE
	extern _TRISE
	extern _DDRF
	extern _TRISF
	extern _DDRG
	extern _TRISG
	extern _DDRH
	extern _TRISH
	extern _DDRJ
	extern _TRISJ
	extern _OSCTUNE
	extern _MEMCON
	extern _PIE1
	extern _PIR1
	extern _IPR1
	extern _PIE2
	extern _PIR2
	extern _IPR2
	extern _PIE3
	extern _PIR3
	extern _IPR3
	extern _EECON1
	extern _EECON2
	extern _RCSTA
	extern _RCSTA1
	extern _TXSTA
	extern _TXSTA1
	extern _TXREG
	extern _TXREG1
	extern _RCREG
	extern _RCREG1
	extern _SPBRG
	extern _SPBRG1
	extern _PSPCON
	extern _T3CON
	extern _TMR3L
	extern _TMR3H
	extern _CMCON
	extern _CVRCON
	extern _ECCP1AS
	extern _CCP3CON
	extern _ECCP3CON
	extern _CCPR3
	extern _CCPR3L
	extern _CCPR3H
	extern _CCP2CON
	extern _ECCP2CON
	extern _CCPR2
	extern _CCPR2L
	extern _CCPR2H
	extern _CCP1CON
	extern _ECCP1CON
	extern _CCPR1
	extern _CCPR1L
	extern _CCPR1H
	extern _ADCON2
	extern _ADCON1
	extern _ADCON0
	extern _ADRES
	extern _ADRESL
	extern _ADRESH
	extern _SSP1CON2
	extern _SSPCON2
	extern _SSP1CON1
	extern _SSPCON1
	extern _SSP1STAT
	extern _SSPSTAT
	extern _SSP1ADD
	extern _SSPADD
	extern _SSP1BUF
	extern _SSPBUF
	extern _T2CON
	extern _PR2
	extern _TMR2
	extern _T1CON
	extern _TMR1L
	extern _TMR1H
	extern _RCON
	extern _WDTCON
	extern _ECON1
	extern _OSCCON
	extern _T0CON
	extern _TMR0L
	extern _TMR0H
	extern _STATUS
	extern _FSR2L
	extern _FSR2H
	extern _PLUSW2
	extern _PREINC2
	extern _POSTDEC2
	extern _POSTINC2
	extern _INDF2
	extern _BSR
	extern _FSR1L
	extern _FSR1H
	extern _PLUSW1
	extern _PREINC1
	extern _POSTDEC1
	extern _POSTINC1
	extern _INDF1
	extern _WREG
	extern _FSR0L
	extern _FSR0H
	extern _PLUSW0
	extern _PREINC0
	extern _POSTDEC0
	extern _POSTINC0
	extern _INDF0
	extern _INTCON3
	extern _INTCON2
	extern _INTCON
	extern _PROD
	extern _PRODL
	extern _PRODH
	extern _TABLAT
	extern _TBLPTR
	extern _TBLPTRL
	extern _TBLPTRH
	extern _TBLPTRU
	extern _PC
	extern _PCL
	extern _PCLATH
	extern _PCLATU
	extern _STKPTR
	extern _TOS
	extern _TOSL
	extern _TOSH
	extern _TOSU
	extern _ultoa
	extern _strlen
	extern _LCDInit
	extern _LCDUpdate
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
BSR	equ	0xfe0
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
POSTINC0	equ	0xfee
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_state2str	db	LOW(__str_2), HIGH(__str_2), UPPER(__str_2), LOW(__str_3), HIGH(__str_3), UPPER(__str_3), LOW(__str_4), HIGH(__str_4), UPPER(__str_4), LOW(__str_5), HIGH(__str_5), UPPER(__str_5)
	db	LOW(__str_6), HIGH(__str_6), UPPER(__str_6), LOW(__str_7), HIGH(__str_7), UPPER(__str_7), LOW(__str_8), HIGH(__str_8), UPPER(__str_8), LOW(__str_9), HIGH(__str_9), UPPER(__str_9)
	db	LOW(__str_10), HIGH(__str_10), UPPER(__str_10), LOW(__str_11), HIGH(__str_11), UPPER(__str_11), LOW(__str_12), HIGH(__str_12), UPPER(__str_12), LOW(__str_13), HIGH(__str_13), UPPER(__str_13)
	db	LOW(__str_14), HIGH(__str_14), UPPER(__str_14), LOW(__str_15), HIGH(__str_15), UPPER(__str_15), LOW(__str_16), HIGH(__str_16), UPPER(__str_16), LOW(__str_17), HIGH(__str_17), UPPER(__str_17)
	db	LOW(__str_18), HIGH(__str_18), UPPER(__str_18)
_current_hours	db	0x00
_current_minutes	db	0x00
_current_seconds	db	0x00


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1
r0x08	res	1
r0x09	res	1
r0x0a	res	1
r0x0b	res	1
r0x0c	res	1
r0x0d	res	1
r0x0e	res	1
r0x0f	res	1
r0x10	res	1
r0x11	res	1
r0x12	res	1
r0x13	res	1
r0x14	res	1
r0x15	res	1

udata_clock_0	udata
_DisplayWORD_WDigit_1_1	res	6

udata_clock_1	udata
_current_time_string_string_1_1	res	16

;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_clock_ivec_0x1_high_isr	code	0X000008
ivec_0x1_high_isr:
	GOTO	_high_isr

; I code from now on!
; ; Starting pCode block
S_clock__main	code
_main:
;	.line	304; clock.c	LED0_TRIS = 0; //configure 1st led pin as output (yellow)
	BCF	_TRISJbits, 0
;	.line	305; clock.c	LED1_TRIS = 0; //configure 2nd led pin as output (red)
	BCF	_TRISJbits, 1
;	.line	306; clock.c	LED2_TRIS = 0; //configure 3rd led pin as output (red)
	BCF	_TRISJbits, 2
;	.line	308; clock.c	BUTTON0_TRIS = 1; //configure button0 as input
	BSF	_TRISBbits, 3
;	.line	309; clock.c	BUTTON1_TRIS = 1; //configure button1 as input
	BSF	_TRISBbits, 1
;	.line	339; clock.c	TMR0H=(0xFF00 & ticks_per_sec)>>8;
	MOVLW	0x5f
	MOVWF	_TMR0H
;	.line	340; clock.c	TMR0L=(0x00FF & ticks_per_sec);
	MOVLW	0x5e
	MOVWF	_TMR0L
;	.line	343; clock.c	T0CONbits.TMR0ON = 0; //stop timer
	BCF	_T0CONbits, 7
;	.line	344; clock.c	T0CONbits.T08BIT = 0;  //16bit
	BCF	_T0CONbits, 6
;	.line	345; clock.c	T0CONbits.T0CS = 0;   //Clock source = instruction cycle CLK
	BCF	_T0CONbits, 5
;	.line	346; clock.c	T0CONbits.T0SE = 0;   //Rising edge
	BCF	_T0CONbits, 4
;	.line	347; clock.c	T0CONbits.PSA = 0;    //Assign prescaler
	BCF	_T0CONbits, 3
;	.line	349; clock.c	T0CON |= 0x7;
	MOVLW	0x07
	IORWF	_T0CON, F
;	.line	354; clock.c	INTCONbits.GIE = 1;   //enable global interrupts
	BSF	_INTCONbits, 7
;	.line	355; clock.c	INTCONbits.TMR0IE=1;  //enable timer0 interrupts
	BSF	_INTCONbits, 5
;	.line	357; clock.c	INTCON2bits.TMR0IP=1; //TMR0 has high prio
	BSF	_INTCON2bits, 2
;	.line	362; clock.c	T0CONbits.TMR0ON = 1;  //Enable TMR0
	BSF	_T0CONbits, 7
;	.line	364; clock.c	LCDInit();
	CALL	_LCDInit
;	.line	365; clock.c	DelayMs(10);
	MOVLW	0x68
	MOVWF	r0x00
	MOVLW	0x42
	MOVWF	r0x01
	CLRF	r0x02
	CLRF	r0x03
_00229_DS_:
	MOVFF	r0x00, r0x04
	MOVFF	r0x01, r0x05
	MOVFF	r0x02, r0x06
	MOVFF	r0x03, r0x07
	MOVLW	0xff
	ADDWF	r0x00, F
	MOVLW	0xff
	ADDWFC	r0x01, F
	MOVLW	0xff
	ADDWFC	r0x02, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	MOVF	r0x04, W
	IORWF	r0x05, W
	IORWF	r0x06, W
	IORWF	r0x07, W
	BNZ	_00229_DS_
;	.line	366; clock.c	LED_PUT(0x00);
	MOVLW	0xf8
	ANDWF	_LATJ, F
_00248_DS_:
;	.line	372; clock.c	LED_PUT(0x02);
	MOVFF	_LATJ, r0x00
	MOVLW	0xf8
	ANDWF	r0x00, F
	MOVLW	0x02
	IORWF	r0x00, W
	MOVWF	_LATJ
;	.line	373; clock.c	DelayMs(100);
	MOVLW	0x10
	MOVWF	r0x00
	MOVLW	0x98
	MOVWF	r0x01
	MOVLW	0x02
	MOVWF	r0x02
	CLRF	r0x03
_00235_DS_:
	MOVFF	r0x00, r0x04
	MOVFF	r0x01, r0x05
	MOVFF	r0x02, r0x06
	MOVFF	r0x03, r0x07
	MOVLW	0xff
	ADDWF	r0x00, F
	MOVLW	0xff
	ADDWFC	r0x01, F
	MOVLW	0xff
	ADDWFC	r0x02, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	MOVF	r0x04, W
	IORWF	r0x05, W
	IORWF	r0x06, W
	IORWF	r0x07, W
	BNZ	_00235_DS_
;	.line	374; clock.c	LED_PUT(0x0);
	MOVLW	0xf8
	ANDWF	_LATJ, F
;	.line	375; clock.c	DelayMs(100);
	MOVLW	0x10
	MOVWF	r0x00
	MOVLW	0x98
	MOVWF	r0x01
	MOVLW	0x02
	MOVWF	r0x02
	CLRF	r0x03
_00241_DS_:
	MOVFF	r0x00, r0x04
	MOVFF	r0x01, r0x05
	MOVFF	r0x02, r0x06
	MOVFF	r0x03, r0x07
	MOVLW	0xff
	ADDWF	r0x00, F
	MOVLW	0xff
	ADDWFC	r0x01, F
	MOVLW	0xff
	ADDWFC	r0x02, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	MOVF	r0x04, W
	IORWF	r0x05, W
	IORWF	r0x06, W
	IORWF	r0x07, W
	BNZ	_00241_DS_
	BRA	_00248_DS_
	RETURN	

; ; Starting pCode block
S_clock__blink_time	code
_blink_time:
;	.line	284; clock.c	void blink_time(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
;	.line	286; clock.c	DisplayString(16,"");
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	287; clock.c	DelayMs(100);
	MOVLW	0x10
	MOVWF	r0x00
	MOVLW	0x98
	MOVWF	r0x01
	MOVLW	0x02
	MOVWF	r0x02
	CLRF	r0x03
_00218_DS_:
	MOVFF	r0x00, r0x04
	MOVFF	r0x01, r0x05
	MOVFF	r0x02, r0x06
	MOVFF	r0x03, r0x07
	MOVLW	0xff
	ADDWF	r0x00, F
	MOVLW	0xff
	ADDWFC	r0x01, F
	MOVLW	0xff
	ADDWFC	r0x02, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	MOVF	r0x04, W
	IORWF	r0x05, W
	IORWF	r0x06, W
	IORWF	r0x07, W
	BNZ	_00218_DS_
;	.line	288; clock.c	display_time();
	CALL	_display_time
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_clock__display_state	code
_display_state:
;	.line	277; clock.c	void display_state(FSM_STATE state)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	279; clock.c	DisplayString(0,"                ");
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
; ;multiply lit val:0x03 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	280; clock.c	DisplayString(0,state2str[state]);
	MOVF	r0x00, W
	MULLW	0x03
	MOVFF	PRODL, r0x00
	CLRF	r0x01
	MOVLW	LOW(_state2str)
	ADDWF	r0x00, F
	MOVLW	HIGH(_state2str)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	POSTINC0, r0x00
	MOVFF	POSTINC0, r0x01
	MOVFF	INDF0, r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_clock__display_time	code
_display_time:
;	.line	272; clock.c	void display_time(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	274; clock.c	DisplayString(16, current_time_string());
	CALL	_current_time_string
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_clock__debug_display_time	code
_debug_display_time:
;	.line	263; clock.c	void debug_display_time(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	265; clock.c	LED_PUT(0x00);
	MOVLW	0xf8
	ANDWF	_LATJ, F
;	.line	267; clock.c	display_time();
	CALL	_display_time
;	.line	268; clock.c	LED_PUT(0x01);
	MOVFF	_LATJ, r0x00
	MOVLW	0xf8
	ANDWF	r0x00, F
	MOVLW	0x01
	IORWF	r0x00, W
	MOVWF	_LATJ
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_clock__current_time_string	code
_current_time_string:
;	.line	224; clock.c	char* current_time_string(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	238; clock.c	string[1] += current_hours;
	CLRF	r0x00
_00183_DS_:
;	.line	228; clock.c	for (;i<8;i++)
	MOVLW	0x08
	SUBWF	r0x00, W
	BC	_00186_DS_
;	.line	229; clock.c	string[i] = '0';
	MOVLW	LOW(_current_time_string_string_1_1)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_current_time_string_string_1_1)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVLW	0x30
	MOVWF	INDF0
;	.line	228; clock.c	for (;i<8;i++)
	INCF	r0x00, F
	BRA	_00183_DS_
_00186_DS_:
;	.line	232; clock.c	if (current_hours > 9)
	MOVLW	0x0a
	BANKSEL	_current_hours
	SUBWF	_current_hours, W, B
	BNC	_00175_DS_
;	.line	234; clock.c	string[1] += current_hours % 10;
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVFF	_current_hours, POSTDEC1
	CALL	__moduchar
	MOVWF	r0x00
	MOVF	PREINC1, W
	MOVF	PREINC1, W
	BANKSEL	(_current_time_string_string_1_1 + 1)
	MOVF	(_current_time_string_string_1_1 + 1), W, B
	ADDWF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_current_time_string_string_1_1 + 1)
	MOVWF	(_current_time_string_string_1_1 + 1), B
;	.line	235; clock.c	string[0] += current_hours/10;
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVFF	_current_hours, POSTDEC1
	CALL	__divuchar
	MOVWF	r0x00
	MOVF	PREINC1, W
	MOVF	PREINC1, W
	BANKSEL	_current_time_string_string_1_1
	MOVF	_current_time_string_string_1_1, W, B
	ADDWF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	_current_time_string_string_1_1
	MOVWF	_current_time_string_string_1_1, B
	BRA	_00176_DS_
_00175_DS_:
;	.line	238; clock.c	string[1] += current_hours;
	MOVFF	_current_hours, r0x00
	BANKSEL	(_current_time_string_string_1_1 + 1)
	MOVF	(_current_time_string_string_1_1 + 1), W, B
	ADDWF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_current_time_string_string_1_1 + 1)
	MOVWF	(_current_time_string_string_1_1 + 1), B
_00176_DS_:
;	.line	240; clock.c	string[2] = ':';
	MOVLW	0x3a
	BANKSEL	(_current_time_string_string_1_1 + 2)
	MOVWF	(_current_time_string_string_1_1 + 2), B
;	.line	242; clock.c	if (current_minutes > 9)
	MOVLW	0x0a
	BANKSEL	_current_minutes
	SUBWF	_current_minutes, W, B
	BNC	_00178_DS_
;	.line	244; clock.c	string[4] += current_minutes % 10;
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVFF	_current_minutes, POSTDEC1
	CALL	__moduchar
	MOVWF	r0x00
	MOVF	PREINC1, W
	MOVF	PREINC1, W
	BANKSEL	(_current_time_string_string_1_1 + 4)
	MOVF	(_current_time_string_string_1_1 + 4), W, B
	ADDWF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_current_time_string_string_1_1 + 4)
	MOVWF	(_current_time_string_string_1_1 + 4), B
;	.line	245; clock.c	string[3] += current_minutes/10;
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVFF	_current_minutes, POSTDEC1
	CALL	__divuchar
	MOVWF	r0x00
	MOVF	PREINC1, W
	MOVF	PREINC1, W
	BANKSEL	(_current_time_string_string_1_1 + 3)
	MOVF	(_current_time_string_string_1_1 + 3), W, B
	ADDWF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_current_time_string_string_1_1 + 3)
	MOVWF	(_current_time_string_string_1_1 + 3), B
	BRA	_00179_DS_
_00178_DS_:
;	.line	248; clock.c	string[4] += current_minutes;
	MOVFF	_current_minutes, r0x00
	BANKSEL	(_current_time_string_string_1_1 + 4)
	MOVF	(_current_time_string_string_1_1 + 4), W, B
	ADDWF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_current_time_string_string_1_1 + 4)
	MOVWF	(_current_time_string_string_1_1 + 4), B
_00179_DS_:
;	.line	250; clock.c	string[5] = '.';
	MOVLW	0x2e
	BANKSEL	(_current_time_string_string_1_1 + 5)
	MOVWF	(_current_time_string_string_1_1 + 5), B
;	.line	252; clock.c	if (current_seconds > 9)
	MOVLW	0x0a
	BANKSEL	_current_seconds
	SUBWF	_current_seconds, W, B
	BNC	_00181_DS_
;	.line	254; clock.c	string[7] += current_seconds % 10;
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVFF	_current_seconds, POSTDEC1
	CALL	__moduchar
	MOVWF	r0x00
	MOVF	PREINC1, W
	MOVF	PREINC1, W
	BANKSEL	(_current_time_string_string_1_1 + 7)
	MOVF	(_current_time_string_string_1_1 + 7), W, B
	ADDWF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_current_time_string_string_1_1 + 7)
	MOVWF	(_current_time_string_string_1_1 + 7), B
;	.line	255; clock.c	string[6] += current_seconds/10;
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVFF	_current_seconds, POSTDEC1
	CALL	__divuchar
	MOVWF	r0x00
	MOVF	PREINC1, W
	MOVF	PREINC1, W
	BANKSEL	(_current_time_string_string_1_1 + 6)
	MOVF	(_current_time_string_string_1_1 + 6), W, B
	ADDWF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_current_time_string_string_1_1 + 6)
	MOVWF	(_current_time_string_string_1_1 + 6), B
	BRA	_00182_DS_
_00181_DS_:
;	.line	258; clock.c	string[7] += current_seconds;
	MOVFF	_current_seconds, r0x00
	BANKSEL	(_current_time_string_string_1_1 + 7)
	MOVF	(_current_time_string_string_1_1 + 7), W, B
	ADDWF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_current_time_string_string_1_1 + 7)
	MOVWF	(_current_time_string_string_1_1 + 7), B
_00182_DS_:
;	.line	260; clock.c	return string;
	MOVLW	HIGH(_current_time_string_string_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_current_time_string_string_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_clock__high_isr	code
_high_isr:
;	.line	203; clock.c	void high_isr (void) interrupt 1
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	205; clock.c	LED_PUT(0x01);
	MOVFF	_LATJ, r0x00
	MOVLW	0xf8
	ANDWF	r0x00, F
	MOVLW	0x01
	IORWF	r0x00, W
	MOVWF	_LATJ
;	.line	206; clock.c	if(INTCONbits.TMR0IF)  //If TMR0 interrupt
	BTFSS	_INTCONbits, 2
	BRA	_00169_DS_
	BANKSEL	_current_seconds
;	.line	208; clock.c	current_seconds++;
	INCF	_current_seconds, F, B
;	.line	209; clock.c	display_time();
	CALL	_display_time
;	.line	210; clock.c	INTCONbits.TMR0IF = 0;
	BCF	_INTCONbits, 2
_00169_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	MOVFF	PREINC1, WREG
	RETFIE	

; ; Starting pCode block
S_clock__strlcpy	code
_strlcpy:
;	.line	170; clock.c	strlcpy(char *dst, const char *src, size_t siz)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x14, POSTDEC1
	MOVFF	r0x15, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
;	.line	172; clock.c	char       *d = dst;
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
;	.line	173; clock.c	const char *s = src;
	MOVFF	r0x03, r0x0b
	MOVFF	r0x04, r0x0c
	MOVFF	r0x05, r0x0d
;	.line	174; clock.c	size_t      n = siz;
	MOVFF	r0x06, r0x0e
	MOVFF	r0x07, r0x0f
;	.line	177; clock.c	if (n != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BTFSC	STATUS, 2
	BRA	_00147_DS_
;	.line	179; clock.c	while (--n != 0)
	MOVFF	r0x03, r0x10
	MOVFF	r0x04, r0x11
	MOVFF	r0x05, r0x12
	MOVFF	r0x06, r0x13
	MOVFF	r0x07, r0x14
_00143_DS_:
	MOVLW	0xff
	ADDWF	r0x13, F
	BTFSS	STATUS, 0
	DECF	r0x14, F
	MOVF	r0x13, W
	IORWF	r0x14, W
	BZ	_00162_DS_
;	.line	181; clock.c	if ((*d++ = *s++) == '\0')
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget1
	MOVWF	r0x15
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
	BTFSC	STATUS, 0
	INCF	r0x12, F
	MOVFF	r0x15, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVF	r0x15, W
	BNZ	_00143_DS_
_00162_DS_:
;	.line	182; clock.c	break;
	MOVFF	r0x10, r0x0b
	MOVFF	r0x11, r0x0c
	MOVFF	r0x12, r0x0d
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
	MOVFF	r0x13, r0x0e
	MOVFF	r0x14, r0x0f
_00147_DS_:
;	.line	187; clock.c	if (n == 0)
	MOVF	r0x0e, W
	IORWF	r0x0f, W
	BNZ	_00154_DS_
;	.line	189; clock.c	if (siz != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00161_DS_
;	.line	190; clock.c	*d = '\0';          /* NUL-terminate dst */
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrput1
_00161_DS_:
;	.line	191; clock.c	while (*s++)
	MOVFF	r0x0b, r0x00
	MOVFF	r0x0c, r0x01
	MOVFF	r0x0d, r0x02
_00150_DS_:
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x06
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVF	r0x06, W
	BNZ	_00150_DS_
	MOVFF	r0x00, r0x0b
	MOVFF	r0x01, r0x0c
	MOVFF	r0x02, r0x0d
_00154_DS_:
;	.line	195; clock.c	return (s - src - 1);       /* count does not include NUL */
	MOVF	r0x03, W
	SUBWF	r0x0b, W
	MOVWF	r0x03
	MOVF	r0x04, W
	SUBWFB	r0x0c, W
	MOVWF	r0x04
	MOVLW	0xff
	ADDWF	r0x03, F
	BTFSS	STATUS, 0
	DECF	r0x04, F
	MOVFF	r0x04, PRODL
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x15
	MOVFF	PREINC1, r0x14
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_clock__DisplayString	code
_DisplayString:
;	.line	117; clock.c	void DisplayString(BYTE pos, char* text)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	119; clock.c	BYTE        l = strlen(text);/*number of actual chars in the string*/
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_strlen
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	120; clock.c	BYTE      max = 32 - pos;  /*available space on the lcd*/
	MOVF	r0x00, W
	SUBLW	0x20
	MOVWF	r0x05
;	.line	121; clock.c	char       *d = (char*)&LCDText[pos];
	CLRF	r0x06
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x06, F
	MOVF	r0x06, W
	MOVWF	r0x06
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x07
;	.line	123; clock.c	size_t      n = (l < max) ? l : max;
	MOVF	r0x05, W
	SUBWF	r0x04, W
	BNC	_00131_DS_
	MOVFF	r0x05, r0x04
_00131_DS_:
	CLRF	r0x05
;	.line	125; clock.c	if (n != 0)
	MOVF	r0x04, W
	IORWF	r0x05, W
	BZ	_00127_DS_
_00123_DS_:
;	.line	126; clock.c	while (n-- != 0)*d++ = *s++;
	MOVFF	r0x04, r0x08
	MOVFF	r0x05, r0x09
	MOVLW	0xff
	ADDWF	r0x04, F
	BTFSS	STATUS, 0
	DECF	r0x05, F
	MOVF	r0x08, W
	IORWF	r0x09, W
	BZ	_00127_DS_
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrget1
	MOVWF	r0x08
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	BRA	_00123_DS_
_00127_DS_:
;	.line	127; clock.c	LCDUpdate();
	CALL	_LCDUpdate
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_clock__DisplayWORD	code
_DisplayWORD:
;	.line	78; clock.c	void DisplayWORD(BYTE pos, WORD w) //WORD is a 16 bits unsigned
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	86; clock.c	ultoa(w, WDigit, radix);
	CLRF	r0x03
	CLRF	r0x04
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVLW	HIGH(_DisplayWORD_WDigit_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_DisplayWORD_WDigit_1_1)
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_ultoa
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	87; clock.c	for (j = 0; j < strlen((char*)WDigit); j++)
	CLRF	r0x01
_00107_DS_:
	MOVLW	HIGH(_DisplayWORD_WDigit_1_1)
	MOVWF	r0x03
	MOVLW	LOW(_DisplayWORD_WDigit_1_1)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_strlen
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	r0x01, r0x04
	CLRF	r0x05
	MOVF	r0x05, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x03, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00117_DS_
	MOVF	r0x02, W
	SUBWF	r0x04, W
_00117_DS_:
	BC	_00110_DS_
;	.line	89; clock.c	LCDText[LCDPos++] = WDigit[j];
	MOVFF	r0x00, r0x02
	INCF	r0x00, F
	CLRF	r0x03
	MOVLW	LOW(_LCDText)
	ADDWF	r0x02, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x03, F
	MOVLW	LOW(_DisplayWORD_WDigit_1_1)
	ADDWF	r0x01, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_DisplayWORD_WDigit_1_1)
	ADDWFC	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	INDF0, r0x04
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, INDF0
;	.line	87; clock.c	for (j = 0; j < strlen((char*)WDigit); j++)
	INCF	r0x01, F
	BRA	_00107_DS_
_00110_DS_:
;	.line	91; clock.c	if (LCDPos < 32u)
	MOVFF	r0x00, r0x01
	CLRF	r0x02
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00118_DS_
	MOVLW	0x20
	SUBWF	r0x01, W
_00118_DS_:
	BC	_00106_DS_
;	.line	92; clock.c	LCDText[LCDPos] = 0;
	CLRF	r0x01
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
_00106_DS_:
;	.line	93; clock.c	LCDUpdate();
	CALL	_LCDUpdate
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
__str_0:
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x00
; ; Starting pCode block
__str_1:
	DB	0x00
; ; Starting pCode block
__str_2:
	DB	0x53, 0x54, 0x41, 0x52, 0x54, 0x55, 0x50, 0x00
; ; Starting pCode block
__str_3:
	DB	0x57, 0x41, 0x49, 0x54, 0x5f, 0x46, 0x4f, 0x52, 0x5f, 0x52, 0x45, 0x4c
	DB	0x45, 0x41, 0x53, 0x45, 0x00
; ; Starting pCode block
__str_4:
	DB	0x57, 0x41, 0x49, 0x54, 0x5f, 0x48, 0x4f, 0x55, 0x52, 0x53, 0x00
; ; Starting pCode block
__str_5:
	DB	0x57, 0x41, 0x49, 0x54, 0x5f, 0x4d, 0x49, 0x4e, 0x53, 0x00
; ; Starting pCode block
__str_6:
	DB	0x57, 0x41, 0x49, 0x54, 0x5f, 0x53, 0x45, 0x43, 0x53, 0x00
; ; Starting pCode block
__str_7:
	DB	0x53, 0x45, 0x54, 0x5f, 0x54, 0x49, 0x4d, 0x45, 0x00
; ; Starting pCode block
__str_8:
	DB	0x49, 0x4e, 0x43, 0x5f, 0x48, 0x4f, 0x55, 0x52, 0x53, 0x00
; ; Starting pCode block
__str_9:
	DB	0x49, 0x4e, 0x43, 0x5f, 0x4d, 0x49, 0x4e, 0x53, 0x00
; ; Starting pCode block
__str_10:
	DB	0x49, 0x4e, 0x43, 0x5f, 0x53, 0x45, 0x43, 0x53, 0x00
; ; Starting pCode block
__str_11:
	DB	0x49, 0x4e, 0x43, 0x5f, 0x53, 0x45, 0x43, 0x53, 0x5f, 0x32, 0x00
; ; Starting pCode block
__str_12:
	DB	0x49, 0x4e, 0x43, 0x5f, 0x4d, 0x49, 0x4e, 0x53, 0x5f, 0x32, 0x00
; ; Starting pCode block
__str_13:
	DB	0x49, 0x4e, 0x43, 0x5f, 0x48, 0x4f, 0x55, 0x52, 0x53, 0x5f, 0x32, 0x00
; ; Starting pCode block
__str_14:
	DB	0x52, 0x45, 0x53, 0x45, 0x54, 0x00
; ; Starting pCode block
__str_15:
	DB	0x49, 0x4e, 0x43, 0x5f, 0x48, 0x4f, 0x55, 0x52, 0x53, 0x5f, 0x57, 0x41
	DB	0x49, 0x54, 0x00
; ; Starting pCode block
__str_16:
	DB	0x49, 0x4e, 0x43, 0x5f, 0x4d, 0x49, 0x4e, 0x53, 0x5f, 0x57, 0x41, 0x49
	DB	0x54, 0x00
; ; Starting pCode block
__str_17:
	DB	0x49, 0x4e, 0x43, 0x5f, 0x53, 0x45, 0x43, 0x53, 0x5f, 0x57, 0x41, 0x49
	DB	0x54, 0x00
; ; Starting pCode block
__str_18:
	DB	0x44, 0x45, 0x42, 0x4f, 0x55, 0x4e, 0x43, 0x45, 0x00


; Statistics:
; code size:	 2256 (0x08d0) bytes ( 1.72%)
;           	 1128 (0x0468) words
; udata size:	   22 (0x0016) bytes ( 0.57%)
; access size:	   22 (0x0016) bytes


	end
