;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Nov 15 2016) (Mac OS X ppc)
; This file was generated Tue Dec  6 13:20:19 2016
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f97j60

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _LCDInit
	global _LCDUpdate
	global _LCDErase
	global _LCDText
	global _ticks
	global _high_isr

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
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
	extern _AN0String
	extern _AppConfig
	extern _activeUDPSocket
	extern _UDPSocketInfo
	extern _UDPTxCount
	extern _UDPRxCount
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
	extern _memset
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
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


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

udata_LCDBlocking_0	udata
_ticks	res	2

udata_LCDBlocking_1	udata
_LCDText	res	33

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_LCDBlocking_ivec_0x1_high_isr	code	0X000008
ivec_0x1_high_isr:
	GOTO	_high_isr

; I code from now on!
; ; Starting pCode block
S_LCDBlocking__LCDErase	code
_LCDErase:
;	.line	444; TCPIP_Stack/LCDBlocking.c	void LCDErase(void)
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
;	.line	447; TCPIP_Stack/LCDBlocking.c	LCDWrite(0, 0x01);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_LCDWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	448; TCPIP_Stack/LCDBlocking.c	DelayMs(2);
	MOVLW	0x48
	MOVWF	r0x00
	MOVLW	0x0d
	MOVWF	r0x01
	CLRF	r0x02
	CLRF	r0x03
_00310_DS_:
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
	BNZ	_00310_DS_
;	.line	451; TCPIP_Stack/LCDBlocking.c	memset(LCDText, ' ', 32);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x20
	MOVWF	POSTDEC1
	MOVLW	0x20
	MOVWF	POSTDEC1
	MOVLW	HIGH(_LCDText)
	MOVWF	POSTDEC1
	MOVLW	LOW(_LCDText)
	MOVWF	POSTDEC1
	CALL	_memset
	MOVLW	0x05
	ADDWF	FSR1L, F
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
S_LCDBlocking__LCDUpdate	code
_LCDUpdate:
;	.line	384; TCPIP_Stack/LCDBlocking.c	void LCDUpdate(void)
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
;	.line	389; TCPIP_Stack/LCDBlocking.c	LCDWrite(0, 0x02);
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_LCDWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	390; TCPIP_Stack/LCDBlocking.c	DelayMs(2);
	MOVLW	0x48
	MOVWF	r0x00
	MOVLW	0x0d
	MOVWF	r0x01
	CLRF	r0x02
	CLRF	r0x03
_00230_DS_:
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
	BNZ	_00230_DS_
;	.line	393; TCPIP_Stack/LCDBlocking.c	for(i = 0; i < 16u; i++)
	CLRF	r0x00
_00262_DS_:
	MOVFF	r0x00, r0x01
	CLRF	r0x02
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00302_DS_
	MOVLW	0x10
	SUBWF	r0x01, W
_00302_DS_:
	BTFSC	STATUS, 0
	BRA	_00265_DS_
;	.line	397; TCPIP_Stack/LCDBlocking.c	if(LCDText[i] == 0u)
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x01
	MOVF	r0x01, W
	BNZ	_00237_DS_
;	.line	399; TCPIP_Stack/LCDBlocking.c	for(j=i; j < 16u; j++)
	MOVFF	r0x00, r0x01
_00258_DS_:
	MOVFF	r0x01, r0x02
	CLRF	r0x03
	MOVLW	0x00
	SUBWF	r0x03, W
	BNZ	_00303_DS_
	MOVLW	0x10
	SUBWF	r0x02, W
_00303_DS_:
	BC	_00237_DS_
;	.line	401; TCPIP_Stack/LCDBlocking.c	LCDText[j] = ' ';
	MOVLW	LOW(_LCDText)
	ADDWF	r0x01, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x20
	MOVWF	INDF0
;	.line	399; TCPIP_Stack/LCDBlocking.c	for(j=i; j < 16u; j++)
	INCF	r0x01, F
	BRA	_00258_DS_
_00237_DS_:
;	.line	404; TCPIP_Stack/LCDBlocking.c	LCDWrite(1, LCDText[i]);
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_LCDWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	405; TCPIP_Stack/LCDBlocking.c	Delay10us(5);
	MOVLW	0x55
	MOVWF	r0x01
	CLRF	r0x02
	CLRF	r0x03
	CLRF	r0x04
_00238_DS_:
	MOVFF	r0x01, r0x05
	MOVFF	r0x02, r0x06
	MOVFF	r0x03, r0x07
	MOVFF	r0x04, r0x08
	MOVLW	0xff
	ADDWF	r0x01, F
	MOVLW	0xff
	ADDWFC	r0x02, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	MOVLW	0xff
	ADDWFC	r0x04, F
	MOVF	r0x05, W
	IORWF	r0x06, W
	IORWF	r0x07, W
	IORWF	r0x08, W
	BNZ	_00238_DS_
;	.line	393; TCPIP_Stack/LCDBlocking.c	for(i = 0; i < 16u; i++)
	INCF	r0x00, F
	BRA	_00262_DS_
_00265_DS_:
;	.line	409; TCPIP_Stack/LCDBlocking.c	LCDWrite(0, 0xC0);
	MOVLW	0xc0
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_LCDWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	410; TCPIP_Stack/LCDBlocking.c	Delay10us(5);
	MOVLW	0x55
	MOVWF	r0x00
	CLRF	r0x01
	CLRF	r0x02
	CLRF	r0x03
_00244_DS_:
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
	BNZ	_00244_DS_
;	.line	413; TCPIP_Stack/LCDBlocking.c	for(i = 16; i < 32u; i++)
	MOVLW	0x10
	MOVWF	r0x00
_00270_DS_:
	MOVFF	r0x00, r0x01
	CLRF	r0x02
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00304_DS_
	MOVLW	0x20
	SUBWF	r0x01, W
_00304_DS_:
	BTFSC	STATUS, 0
	BRA	_00274_DS_
;	.line	417; TCPIP_Stack/LCDBlocking.c	if(LCDText[i] == 0u)
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x01
	MOVF	r0x01, W
	BNZ	_00251_DS_
;	.line	419; TCPIP_Stack/LCDBlocking.c	for(j=i; j < 32u; j++)
	MOVFF	r0x00, r0x01
_00266_DS_:
	MOVFF	r0x01, r0x02
	CLRF	r0x03
	MOVLW	0x00
	SUBWF	r0x03, W
	BNZ	_00305_DS_
	MOVLW	0x20
	SUBWF	r0x02, W
_00305_DS_:
	BC	_00251_DS_
;	.line	421; TCPIP_Stack/LCDBlocking.c	LCDText[j] = ' ';
	MOVLW	LOW(_LCDText)
	ADDWF	r0x01, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x20
	MOVWF	INDF0
;	.line	419; TCPIP_Stack/LCDBlocking.c	for(j=i; j < 32u; j++)
	INCF	r0x01, F
	BRA	_00266_DS_
_00251_DS_:
;	.line	424; TCPIP_Stack/LCDBlocking.c	LCDWrite(1, LCDText[i]);
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_LCDWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	425; TCPIP_Stack/LCDBlocking.c	Delay10us(5);
	MOVLW	0x55
	MOVWF	r0x01
	CLRF	r0x02
	CLRF	r0x03
	CLRF	r0x04
_00252_DS_:
	MOVFF	r0x01, r0x05
	MOVFF	r0x02, r0x06
	MOVFF	r0x03, r0x07
	MOVFF	r0x04, r0x08
	MOVLW	0xff
	ADDWF	r0x01, F
	MOVLW	0xff
	ADDWFC	r0x02, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	MOVLW	0xff
	ADDWFC	r0x04, F
	MOVF	r0x05, W
	IORWF	r0x06, W
	IORWF	r0x07, W
	IORWF	r0x08, W
	BNZ	_00252_DS_
;	.line	413; TCPIP_Stack/LCDBlocking.c	for(i = 16; i < 32u; i++)
	INCF	r0x00, F
	BRA	_00270_DS_
_00274_DS_:
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
S_LCDBlocking__LCDInit	code
_LCDInit:
;	.line	243; TCPIP_Stack/LCDBlocking.c	void LCDInit(void)
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
	BANKSEL	_ticks
;	.line	247; TCPIP_Stack/LCDBlocking.c	ticks = 0;
	CLRF	_ticks, B
	BANKSEL	(_ticks + 1)
	CLRF	(_ticks + 1), B
;	.line	249; TCPIP_Stack/LCDBlocking.c	memset(LCDText, ' ', sizeof(LCDText)-1);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x20
	MOVWF	POSTDEC1
	MOVLW	0x20
	MOVWF	POSTDEC1
	MOVLW	HIGH(_LCDText)
	MOVWF	POSTDEC1
	MOVLW	LOW(_LCDText)
	MOVWF	POSTDEC1
	CALL	_memset
	MOVLW	0x05
	ADDWF	FSR1L, F
	BANKSEL	(_LCDText + 32)
;	.line	250; TCPIP_Stack/LCDBlocking.c	LCDText[sizeof(LCDText)-1] = 0;
	CLRF	(_LCDText + 32), B
;	.line	253; TCPIP_Stack/LCDBlocking.c	LCD_E_IO = 0;
	BCF	_LATHbits, 0
;	.line	254; TCPIP_Stack/LCDBlocking.c	LCD_RD_WR_IO = 0;
	BCF	_LATHbits, 1
;	.line	257; TCPIP_Stack/LCDBlocking.c	TMR0H = 0xFF;
	MOVLW	0xff
	MOVWF	_TMR0H
;	.line	258; TCPIP_Stack/LCDBlocking.c	TMR0L = LOW;
	MOVLW	0x05
	MOVWF	_TMR0L
;	.line	259; TCPIP_Stack/LCDBlocking.c	T0CONbits.TMR0ON = 0; //stop timer
	BCF	_T0CONbits, 7
;	.line	260; TCPIP_Stack/LCDBlocking.c	T0CONbits.T08BIT = 0;  //16bit
	BCF	_T0CONbits, 6
;	.line	261; TCPIP_Stack/LCDBlocking.c	T0CONbits.T0CS = 0;   //Clock source = instruction cycle CLK
	BCF	_T0CONbits, 5
;	.line	262; TCPIP_Stack/LCDBlocking.c	T0CONbits.T0SE = 0;   //Rising edge
	BCF	_T0CONbits, 4
;	.line	263; TCPIP_Stack/LCDBlocking.c	T0CONbits.PSA = 1;    //No prescaler
	BSF	_T0CONbits, 3
;	.line	266; TCPIP_Stack/LCDBlocking.c	INTCONbits.GIE = 1;   //enable global interrupts
	BSF	_INTCONbits, 7
;	.line	267; TCPIP_Stack/LCDBlocking.c	INTCONbits.TMR0IE=0;  //enable timer0 interrupts
	BCF	_INTCONbits, 5
;	.line	268; TCPIP_Stack/LCDBlocking.c	INTCON2bits.TMR0IP=1; //TMR0 has high prio
	BSF	_INTCON2bits, 2
;	.line	272; TCPIP_Stack/LCDBlocking.c	LCD_DATA_TRIS = 0x00;
	CLRF	_TRISE
;	.line	285; TCPIP_Stack/LCDBlocking.c	LCD_RD_WR_TRIS = 0;
	BCF	_TRISHbits, 1
;	.line	286; TCPIP_Stack/LCDBlocking.c	LCD_RS_TRIS = 0;
	BCF	_TRISHbits, 2
;	.line	287; TCPIP_Stack/LCDBlocking.c	LCD_E_TRIS = 0;
	BCF	_TRISHbits, 0
;	.line	300; TCPIP_Stack/LCDBlocking.c	LCD_RS_IO = 0;
	BCF	_LATHbits, 2
;	.line	302; TCPIP_Stack/LCDBlocking.c	LCD_DATA_IO = 0x03;
	MOVLW	0x03
	MOVWF	_LATE
	nop 
	nop 
;	.line	317; TCPIP_Stack/LCDBlocking.c	for(i = 0; i < 3u; i++)
	CLRF	r0x00
_00199_DS_:
	MOVFF	r0x00, r0x01
	CLRF	r0x02
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00225_DS_
	MOVLW	0x03
	SUBWF	r0x01, W
_00225_DS_:
	BC	_00202_DS_
;	.line	319; TCPIP_Stack/LCDBlocking.c	LCD_E_IO = 1;
	BSF	_LATHbits, 0
;	.line	320; TCPIP_Stack/LCDBlocking.c	Delay10us(1);			// Wait E Pulse width time (min 230ns)
	MOVLW	0x11
	MOVWF	r0x01
	CLRF	r0x02
	CLRF	r0x03
	CLRF	r0x04
_00163_DS_:
	MOVFF	r0x01, r0x05
	MOVFF	r0x02, r0x06
	MOVFF	r0x03, r0x07
	MOVFF	r0x04, r0x08
	MOVLW	0xff
	ADDWF	r0x01, F
	MOVLW	0xff
	ADDWFC	r0x02, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	MOVLW	0xff
	ADDWFC	r0x04, F
	MOVF	r0x05, W
	IORWF	r0x06, W
	IORWF	r0x07, W
	IORWF	r0x08, W
	BNZ	_00163_DS_
;	.line	321; TCPIP_Stack/LCDBlocking.c	LCD_E_IO = 0;
	BCF	_LATHbits, 0
;	.line	322; TCPIP_Stack/LCDBlocking.c	DelayMs(2);
	MOVLW	0x48
	MOVWF	r0x01
	MOVLW	0x0d
	MOVWF	r0x02
	CLRF	r0x03
	CLRF	r0x04
_00169_DS_:
	MOVFF	r0x01, r0x05
	MOVFF	r0x02, r0x06
	MOVFF	r0x03, r0x07
	MOVFF	r0x04, r0x08
	MOVLW	0xff
	ADDWF	r0x01, F
	MOVLW	0xff
	ADDWFC	r0x02, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	MOVLW	0xff
	ADDWFC	r0x04, F
	MOVF	r0x05, W
	IORWF	r0x06, W
	IORWF	r0x07, W
	IORWF	r0x08, W
	BNZ	_00169_DS_
;	.line	317; TCPIP_Stack/LCDBlocking.c	for(i = 0; i < 3u; i++)
	INCF	r0x00, F
	BRA	_00199_DS_
_00202_DS_:
;	.line	347; TCPIP_Stack/LCDBlocking.c	LCDWrite(0, 0x38);
	MOVLW	0x38
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_LCDWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	349; TCPIP_Stack/LCDBlocking.c	Delay10us(5);
	MOVLW	0x55
	MOVWF	r0x00
	CLRF	r0x01
	CLRF	r0x02
	CLRF	r0x03
_00175_DS_:
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
	BNZ	_00175_DS_
;	.line	352; TCPIP_Stack/LCDBlocking.c	LCDWrite(0, 0x06);	// Increment after each write, do not shift
	MOVLW	0x06
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_LCDWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	353; TCPIP_Stack/LCDBlocking.c	Delay10us(5);
	MOVLW	0x55
	MOVWF	r0x00
	CLRF	r0x01
	CLRF	r0x02
	CLRF	r0x03
_00181_DS_:
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
	BNZ	_00181_DS_
;	.line	356; TCPIP_Stack/LCDBlocking.c	LCDWrite(0, 0x0C);		// Turn display on, no cusor, no cursor blink
	MOVLW	0x0c
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_LCDWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	357; TCPIP_Stack/LCDBlocking.c	Delay10us(5);
	MOVLW	0x55
	MOVWF	r0x00
	CLRF	r0x01
	CLRF	r0x02
	CLRF	r0x03
_00187_DS_:
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
	BNZ	_00187_DS_
;	.line	360; TCPIP_Stack/LCDBlocking.c	LCDWrite(0, 0x01);	
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_LCDWrite
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	361; TCPIP_Stack/LCDBlocking.c	DelayMs(2);
	MOVLW	0x48
	MOVWF	r0x00
	MOVLW	0x0d
	MOVWF	r0x01
	CLRF	r0x02
	CLRF	r0x03
_00193_DS_:
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
	BNZ	_00193_DS_
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
S_LCDBlocking__high_isr	code
_high_isr:
;	.line	196; TCPIP_Stack/LCDBlocking.c	void high_isr (void) interrupt 1
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
	MOVFF	r0x01, POSTDEC1
;	.line	198; TCPIP_Stack/LCDBlocking.c	if (INTCONbits.TMR0IF)
	BTFSS	_INTCONbits, 2
	BRA	_00145_DS_
;	.line	200; TCPIP_Stack/LCDBlocking.c	INTCONbits.TMR0IE = 0;  // Disable TMR0 interrupts
	BCF	_INTCONbits, 5
	BANKSEL	_ticks
;	.line	202; TCPIP_Stack/LCDBlocking.c	ticks = (ticks == 0xFFFF)? 0 : ticks + 1;	//Increase ticks (Ring)
	MOVF	_ticks, W, B
	XORLW	0xff
	BNZ	_00151_DS_
	BANKSEL	(_ticks + 1)
	MOVF	(_ticks + 1), W, B
	XORLW	0xff
	BZ	_00152_DS_
_00151_DS_:
	BRA	_00147_DS_
_00152_DS_:
	CLRF	r0x00
	CLRF	r0x01
	BRA	_00148_DS_
_00147_DS_:
	BANKSEL	_ticks
	MOVF	_ticks, W, B
	ADDLW	0x01
	MOVWF	r0x00
	MOVLW	0x00
	BANKSEL	(_ticks + 1)
	ADDWFC	(_ticks + 1), W, B
	MOVWF	r0x01
_00148_DS_:
	MOVFF	r0x00, _ticks
	MOVFF	r0x01, (_ticks + 1)
;	.line	204; TCPIP_Stack/LCDBlocking.c	TMR0H = 0xFF;			// Reset timer values
	MOVLW	0xff
	MOVWF	_TMR0H
;	.line	205; TCPIP_Stack/LCDBlocking.c	TMR0L = LOW;
	MOVLW	0x05
	MOVWF	_TMR0L
;	.line	206; TCPIP_Stack/LCDBlocking.c	INTCONbits.TMR0IE = 1;  // Enable TMR0 interrupts
	BSF	_INTCONbits, 5
;	.line	207; TCPIP_Stack/LCDBlocking.c	INTCONbits.TMR0IF = 0;  // Reset TMR0 flag
	BCF	_INTCONbits, 2
_00145_DS_:
	MOVFF	PREINC1, r0x01
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
S_LCDBlocking__LCDWrite	code
_LCDWrite:
;	.line	97; TCPIP_Stack/LCDBlocking.c	static void LCDWrite(BYTE RS, BYTE Data)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	100; TCPIP_Stack/LCDBlocking.c	LCD_DATA_TRIS = 0x00;
	CLRF	_TRISE
;	.line	113; TCPIP_Stack/LCDBlocking.c	LCD_RS_TRIS = 0;
	BCF	_TRISHbits, 2
;	.line	114; TCPIP_Stack/LCDBlocking.c	LCD_RD_WR_TRIS = 0;
	BCF	_TRISHbits, 1
;	.line	115; TCPIP_Stack/LCDBlocking.c	LCD_RD_WR_IO = 0;
	BCF	_LATHbits, 1
;	.line	116; TCPIP_Stack/LCDBlocking.c	LCD_RS_IO = RS;
	MOVF	r0x00, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATHbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_LATHbits
;	.line	143; TCPIP_Stack/LCDBlocking.c	LCD_DATA_IO = Data;
	MOVFF	r0x01, _LATE
	nop 
	nop 
;	.line	158; TCPIP_Stack/LCDBlocking.c	LCD_E_IO = 1;
	BSF	_LATHbits, 0
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
	nop 
;	.line	168; TCPIP_Stack/LCDBlocking.c	LCD_E_IO = 0;
	BCF	_LATHbits, 0
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	



; Statistics:
; code size:	 1642 (0x066a) bytes ( 1.25%)
;           	  821 (0x0335) words
; udata size:	   35 (0x0023) bytes ( 0.91%)
; access size:	    9 (0x0009) bytes


	end
