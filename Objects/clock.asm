;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Nov 15 2016) (Mac OS X ppc)
; This file was generated Tue Dec  6 13:14:12 2016
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f97j60

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _DisplayString
	global _DisplayTop
	global _current_time_string
	global _display_time
	global _display_state
	global _change_time
	global _setup
	global _init_Time
	global _state2str
	global _current_time
	global _alarm_time
	global _alarm_triggered
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
	extern _strlen
	extern _LCDInit
	extern _LCDUpdate
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCL	equ	0xff9
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
_state2str	db	LOW(__str_9), HIGH(__str_9), UPPER(__str_9), LOW(__str_10), HIGH(__str_10), UPPER(__str_10), LOW(__str_11), HIGH(__str_11), UPPER(__str_11), LOW(__str_12), HIGH(__str_12), UPPER(__str_12)
	db	LOW(__str_13), HIGH(__str_13), UPPER(__str_13)
_alarm_triggered	db	0x00
_high_isr_ticks_1_1	db	0x00
_high_isr_led_data_1_1	db	0x00
_high_isr_led_on_time_1_1	db	0x00


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

udata_clock_0	udata
_current_time	res	3

udata_clock_1	udata
_alarm_time	res	3

udata_clock_2	udata
_current_time_string_string_1_1	res	12

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
;	.line	255; clock.c	unsigned char hms = 0;
	CLRF	r0x00
;	.line	256; clock.c	FSM_STATE state = STARTUP, previous_state = STARTUP;
	CLRF	r0x01
	CLRF	r0x02
;	.line	257; clock.c	enum Mode mode = SET;
	MOVLW	0x02
	MOVWF	r0x03
;	.line	258; clock.c	setup();
	CALL	_setup
_00403_DS_:
;	.line	263; clock.c	display_time(mode);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_display_time
	INCF	FSR1L, F
	BANKSEL	_alarm_triggered
;	.line	264; clock.c	if(alarm_triggered)
	MOVF	_alarm_triggered, W, B
	BZ	_00352_DS_
;	.line	266; clock.c	DisplayTop("WAKE UP!");
	MOVLW	UPPER(__str_6)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_6)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_6)
	MOVWF	POSTDEC1
	CALL	_DisplayTop
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	267; clock.c	state = INC_TIME;
	MOVLW	0x03
	MOVWF	r0x01
_00352_DS_:
;	.line	270; clock.c	switch(state)
	MOVLW	0x05
	SUBWF	r0x01, W
	BTFSC	STATUS, 0
	BRA	_00400_DS_
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	CLRF	r0x05
	RLCF	r0x01, W
	RLCF	r0x05, F
	RLCF	WREG, W
	RLCF	r0x05, F
	ANDLW	0xfc
	MOVWF	r0x04
	MOVLW	UPPER(_00431_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00431_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00431_DS_)
	ADDWF	r0x04, F
	MOVF	r0x05, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x04, W
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVWF	PCL
_00431_DS_:
	GOTO	_00353_DS_
	GOTO	_00354_DS_
	GOTO	_00363_DS_
	GOTO	_00367_DS_
	GOTO	_00381_DS_
_00353_DS_:
;	.line	273; clock.c	init_Time(&current_time,0,0,0);
	MOVLW	HIGH(_current_time)
	MOVWF	r0x05
	MOVLW	LOW(_current_time)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_init_Time
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	274; clock.c	init_Time(&alarm_time,0,0,0);
	MOVLW	HIGH(_alarm_time)
	MOVWF	r0x05
	MOVLW	LOW(_alarm_time)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_init_Time
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	276; clock.c	hms = 1;
	MOVLW	0x01
	MOVWF	r0x00
;	.line	277; clock.c	previous_state = STARTUP;
	CLRF	r0x02
;	.line	278; clock.c	state = SET_TIME;
	MOVLW	0x02
	MOVWF	r0x01
;	.line	279; clock.c	break;
	BRA	_00403_DS_
_00354_DS_:
;	.line	282; clock.c	if (BUTTON0_IO == 1u && BUTTON1_IO == 1u)
	CLRF	r0x04
	BTFSC	_PORTBbits, 3
	INCF	r0x04, F
	CLRF	r0x05
	MOVF	r0x04, W
	XORLW	0x01
	BNZ	_00432_DS_
	MOVF	r0x05, W
	BZ	_00433_DS_
_00432_DS_:
	BRA	_00356_DS_
_00433_DS_:
	CLRF	r0x04
	BTFSC	_PORTBbits, 1
	INCF	r0x04, F
	CLRF	r0x05
	MOVF	r0x04, W
	XORLW	0x01
	BNZ	_00434_DS_
	MOVF	r0x05, W
	BZ	_00435_DS_
_00434_DS_:
	BRA	_00356_DS_
_00435_DS_:
;	.line	284; clock.c	hms++;
	INCF	r0x00, F
;	.line	285; clock.c	state = SET_TIME;
	MOVLW	0x02
	MOVWF	r0x01
_00356_DS_:
;	.line	287; clock.c	if(hms > 3)
	MOVLW	0x04
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00403_DS_
;	.line	289; clock.c	hms = 0;
	CLRF	r0x00
;	.line	290; clock.c	if(previous_state == STARTUP)
	MOVF	r0x02, W
	BNZ	_00359_DS_
;	.line	292; clock.c	mode = ALARM;
	MOVLW	0x01
	MOVWF	r0x03
;	.line	293; clock.c	hms++;
	MOVLW	0x01
	MOVWF	r0x00
	BRA	_00360_DS_
_00359_DS_:
;	.line	297; clock.c	state = INC_TIME;
	MOVLW	0x03
	MOVWF	r0x01
;	.line	298; clock.c	mode = CURRENT;
	CLRF	r0x03
;	.line	299; clock.c	INTCONbits.TMR0IE=1;  //enable timer0 interrupts
	BSF	_INTCONbits, 5
_00360_DS_:
;	.line	301; clock.c	previous_state = WAIT_FOR_RELEASE;    
	MOVLW	0x01
	MOVWF	r0x02
;	.line	303; clock.c	break;
	BRA	_00403_DS_
_00363_DS_:
;	.line	306; clock.c	INTCONbits.TMR0IE = (mode == SET? 0: 1);  //disable timer0 interrupts when setting time
	CLRF	r0x04
	MOVF	r0x03, W
	XORLW	0x02
	BNZ	_00438_DS_
	INCF	r0x04, F
_00438_DS_:
	MOVF	r0x04, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x04
	RLCF	r0x04, F
	MOVF	r0x04, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_INTCONbits, W
	ANDLW	0xdf
	IORWF	PRODH, W
	MOVWF	_INTCONbits
;	.line	308; clock.c	change_time(hms,mode);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_change_time
	MOVLW	0x02
	ADDWF	FSR1L, F
;	.line	310; clock.c	if (BUTTON0_IO == 0u && BUTTON1_IO == 0u)
	BTFSC	_PORTBbits, 3
	BRA	_00403_DS_
	BTFSC	_PORTBbits, 1
	BRA	_00403_DS_
;	.line	311; clock.c	state = WAIT_FOR_RELEASE;
	MOVLW	0x01
	MOVWF	r0x01
;	.line	313; clock.c	break;
	BRA	_00403_DS_
_00367_DS_:
;	.line	317; clock.c	if(current_time.seconds >= 60)
	MOVLW	0x3c
	BANKSEL	(_current_time + 2)
	SUBWF	(_current_time + 2), W, B
	BNC	_00373_DS_
	BANKSEL	(_current_time + 2)
;	.line	319; clock.c	current_time.seconds=0;
	CLRF	(_current_time + 2), B
	BANKSEL	(_current_time + 1)
;	.line	320; clock.c	if(++current_time.minutes >= 60)
	INCF	(_current_time + 1), W, B
	MOVWF	r0x04
	MOVF	r0x04, W
	BANKSEL	(_current_time + 1)
	MOVWF	(_current_time + 1), B
	MOVLW	0x3c
	SUBWF	r0x04, W
	BNC	_00373_DS_
	BANKSEL	(_current_time + 1)
;	.line	322; clock.c	current_time.minutes=0;
	CLRF	(_current_time + 1), B
	BANKSEL	_current_time
;	.line	323; clock.c	if(++current_time.hours >= 24)
	INCF	_current_time, W, B
	MOVWF	r0x04
	MOVF	r0x04, W
	BANKSEL	_current_time
	MOVWF	_current_time, B
	MOVLW	0x18
	SUBWF	r0x04, W
	BNC	_00373_DS_
;	.line	324; clock.c	init_Time(&current_time,0,0,0);
	MOVLW	HIGH(_current_time)
	MOVWF	r0x05
	MOVLW	LOW(_current_time)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_init_Time
	MOVLW	0x06
	ADDWF	FSR1L, F
_00373_DS_:
	BANKSEL	_alarm_triggered
;	.line	328; clock.c	if(!alarm_triggered)
	MOVF	_alarm_triggered, W, B
	BTFSS	STATUS, 2
	BRA	_00403_DS_
;	.line	330; clock.c	if (previous_state == CHOICE || (BUTTON0_IO == 0u && BUTTON1_IO == 0u))
	MOVF	r0x02, W
	XORLW	0x04
	BZ	_00374_DS_
	BTFSC	_PORTBbits, 3
	BRA	_00375_DS_
	BTFSC	_PORTBbits, 1
	BRA	_00375_DS_
_00374_DS_:
;	.line	332; clock.c	previous_state = state;
	MOVFF	r0x01, r0x02
;	.line	333; clock.c	state = CHOICE;
	MOVLW	0x04
	MOVWF	r0x01
	BRA	_00403_DS_
_00375_DS_:
;	.line	336; clock.c	DisplayTop("Have a nice day!");
	MOVLW	UPPER(__str_7)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_7)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_7)
	MOVWF	POSTDEC1
	CALL	_DisplayTop
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	339; clock.c	break;
	BRA	_00403_DS_
_00381_DS_:
;	.line	342; clock.c	previous_state = CHOICE;
	MOVLW	0x04
	MOVWF	r0x02
;	.line	343; clock.c	DisplayTop("^Alarm  vCurrent");
	MOVLW	UPPER(__str_8)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_8)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_8)
	MOVWF	POSTDEC1
	CALL	_DisplayTop
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	345; clock.c	if (BUTTON0_IO == 0u && BUTTON1_IO == 1u)
	BTFSC	_PORTBbits, 3
	BRA	_00386_DS_
	CLRF	r0x04
	BTFSC	_PORTBbits, 1
	INCF	r0x04, F
	CLRF	r0x05
	MOVF	r0x04, W
	XORLW	0x01
	BNZ	_00444_DS_
	MOVF	r0x05, W
	BZ	_00445_DS_
_00444_DS_:
	BRA	_00386_DS_
_00445_DS_:
;	.line	346; clock.c	mode = SET;
	MOVLW	0x02
	MOVWF	r0x03
	BRA	_00391_DS_
_00386_DS_:
;	.line	347; clock.c	else if(BUTTON0_IO == 1u && BUTTON1_IO == 0u)
	CLRF	r0x04
	BTFSC	_PORTBbits, 3
	INCF	r0x04, F
	CLRF	r0x05
	MOVF	r0x04, W
	XORLW	0x01
	BNZ	_00446_DS_
	MOVF	r0x05, W
	BZ	_00447_DS_
_00446_DS_:
	BRA	_00391_DS_
_00447_DS_:
	BTFSC	_PORTBbits, 1
	BRA	_00391_DS_
;	.line	348; clock.c	mode = ALARM;
	MOVLW	0x01
	MOVWF	r0x03
_00391_DS_:
;	.line	350; clock.c	while ((BUTTON0_IO == 0u || BUTTON1_IO == 0u) && current_time.seconds != 60); //wait for release
	BTFSS	_PORTBbits, 3
	BRA	_00390_DS_
	BTFSC	_PORTBbits, 1
	BRA	_00393_DS_
_00390_DS_:
	BANKSEL	(_current_time + 2)
	MOVF	(_current_time + 2), W, B
	XORLW	0x3c
	BNZ	_00391_DS_
_00393_DS_:
	BANKSEL	(_current_time + 2)
;	.line	352; clock.c	if(current_time.seconds == 60)
	MOVF	(_current_time + 2), W, B
	XORLW	0x3c
	BNZ	_00398_DS_
;	.line	353; clock.c	state = INC_TIME;
	MOVLW	0x03
	MOVWF	r0x01
	BRA	_00403_DS_
_00398_DS_:
;	.line	354; clock.c	else if(mode == SET || mode == ALARM)
	MOVF	r0x03, W
	XORLW	0x02
	BZ	_00394_DS_
	MOVF	r0x03, W
	XORLW	0x01
	BZ	_00394_DS_
	BRA	_00403_DS_
_00394_DS_:
;	.line	355; clock.c	state = WAIT_FOR_RELEASE;
	MOVLW	0x01
	MOVWF	r0x01
;	.line	357; clock.c	break;
	BRA	_00403_DS_
_00400_DS_:
;	.line	360; clock.c	state = STARTUP;
	CLRF	r0x01
;	.line	362; clock.c	} //end switch
	BRA	_00403_DS_
	RETURN	

; ; Starting pCode block
S_clock__init_Time	code
_init_Time:
;	.line	246; clock.c	void init_Time(struct Time* time, unsigned char hours, unsigned char minutes, unsigned char seconds)
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
;	.line	248; clock.c	time->hours = hours;
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	249; clock.c	time->minutes = minutes;
	MOVF	r0x00, W
	ADDLW	0x01
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
;	.line	250; clock.c	time->seconds = seconds;
	MOVLW	0x02
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
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
S_clock__setup	code
_setup:
;	.line	214; clock.c	void setup(void)
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
;	.line	216; clock.c	LED0_TRIS = 0; //configure 1st led pin as output (yellow)
	BCF	_TRISJbits, 0
;	.line	217; clock.c	LED1_TRIS = 0; //configure 2nd led pin as output (red)
	BCF	_TRISJbits, 1
;	.line	218; clock.c	LED2_TRIS = 0; //configure 3rd led pin as output (red)
	BCF	_TRISJbits, 2
;	.line	220; clock.c	BUTTON0_TRIS = 1; //configure button0 as input
	BSF	_TRISBbits, 3
;	.line	221; clock.c	BUTTON1_TRIS = 1; //configure button1 as input
	BSF	_TRISBbits, 1
;	.line	224; clock.c	TMR0H=HIGH;
	MOVLW	0x9e
	MOVWF	_TMR0H
;	.line	225; clock.c	TMR0L=LOW;
	MOVLW	0x57
	MOVWF	_TMR0L
;	.line	226; clock.c	T0CONbits.TMR0ON = 0; //stop timer
	BCF	_T0CONbits, 7
;	.line	227; clock.c	T0CONbits.T08BIT = 0;  //16bit
	BCF	_T0CONbits, 6
;	.line	228; clock.c	T0CONbits.T0CS = 0;   //Clock source = instruction cycle CLK
	BCF	_T0CONbits, 5
;	.line	229; clock.c	T0CONbits.T0SE = 0;   //Rising edge
	BCF	_T0CONbits, 4
;	.line	230; clock.c	T0CONbits.PSA = 1;    //No prescaler
	BSF	_T0CONbits, 3
;	.line	233; clock.c	INTCONbits.GIE = 1;   //enable global interrupts
	BSF	_INTCONbits, 7
;	.line	234; clock.c	INTCONbits.TMR0IE=0;  //enable timer0 interrupts
	BCF	_INTCONbits, 5
;	.line	235; clock.c	INTCON2bits.TMR0IP=1; //TMR0 has high prio
	BSF	_INTCON2bits, 2
;	.line	237; clock.c	LCDInit();
	CALL	_LCDInit
;	.line	238; clock.c	DelayMs(10);
	MOVLW	0x68
	MOVWF	r0x00
	MOVLW	0x42
	MOVWF	r0x01
	CLRF	r0x02
	CLRF	r0x03
_00335_DS_:
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
	BNZ	_00335_DS_
;	.line	239; clock.c	LED_PUT(0x00);
	MOVLW	0xf8
	ANDWF	_LATJ, F
;	.line	241; clock.c	T0CONbits.TMR0ON = 1;  //Enable TMR0
	BSF	_T0CONbits, 7
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
S_clock__change_time	code
_change_time:
;	.line	176; clock.c	void change_time(unsigned char hms, enum Mode mode)
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
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	178; clock.c	struct Time *time = (mode == ALARM? &alarm_time: &current_time);
	MOVF	r0x01, W
	XORLW	0x01
	BNZ	_00308_DS_
	CLRF	r0x01
	INCF	r0x01, F
	BRA	_00309_DS_
_00308_DS_:
	CLRF	r0x01
_00309_DS_:
	MOVF	r0x01, W
	BZ	_00266_DS_
	MOVLW	LOW(_alarm_time)
	MOVWF	r0x02
	MOVLW	HIGH(_alarm_time)
	MOVWF	r0x03
	BRA	_00267_DS_
_00266_DS_:
	MOVLW	LOW(_current_time)
	MOVWF	r0x02
	MOVLW	HIGH(_current_time)
	MOVWF	r0x03
_00267_DS_:
	MOVF	r0x03, W
	MOVWF	r0x03
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
;	.line	180; clock.c	DelayMs(20);  //arbitrary delay
	MOVLW	0xd0
	MOVWF	r0x05
	MOVLW	0x84
	MOVWF	r0x06
	CLRF	r0x07
	CLRF	r0x08
_00220_DS_:
	MOVFF	r0x05, r0x09
	MOVFF	r0x06, r0x0a
	MOVFF	r0x07, r0x0b
	MOVFF	r0x08, r0x0c
	MOVLW	0xff
	ADDWF	r0x05, F
	MOVLW	0xff
	ADDWFC	r0x06, F
	MOVLW	0xff
	ADDWFC	r0x07, F
	MOVLW	0xff
	ADDWFC	r0x08, F
	MOVF	r0x09, W
	IORWF	r0x0a, W
	IORWF	r0x0b, W
	IORWF	r0x0c, W
	BNZ	_00220_DS_
;	.line	181; clock.c	if(hms==1)
	MOVF	r0x00, W
	XORLW	0x01
	BZ	_00311_DS_
	BRA	_00262_DS_
_00311_DS_:
;	.line	183; clock.c	if(mode != ALARM) DisplayTop("Set current hrs");
	MOVF	r0x01, W
	BNZ	_00227_DS_
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	CALL	_DisplayTop
	MOVLW	0x03
	ADDWF	FSR1L, F
	BRA	_00228_DS_
_00227_DS_:
;	.line	184; clock.c	else  DisplayTop("Set alarm hours");
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	CALL	_DisplayTop
	MOVLW	0x03
	ADDWF	FSR1L, F
_00228_DS_:
;	.line	186; clock.c	if(BUTTON0_IO == 0u && BUTTON1_IO == 1u)
	BTFSC	_PORTBbits, 3
	BRA	_00233_DS_
	CLRF	r0x05
	BTFSC	_PORTBbits, 1
	INCF	r0x05, F
	CLRF	r0x06
	MOVF	r0x05, W
	XORLW	0x01
	BNZ	_00312_DS_
	MOVF	r0x06, W
	BZ	_00313_DS_
_00312_DS_:
	BRA	_00233_DS_
_00313_DS_:
;	.line	187; clock.c	time->hours = (time->hours > 0? time->hours-1:23);
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrget1
	MOVWF	r0x05
	MOVF	r0x05, W
	BZ	_00268_DS_
	DECF	r0x05, F
	BRA	_00269_DS_
_00268_DS_:
	MOVLW	0x17
	MOVWF	r0x05
_00269_DS_:
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrput1
	BRA	_00264_DS_
_00233_DS_:
;	.line	188; clock.c	else if(BUTTON0_IO == 1u && BUTTON1_IO == 0u)
	CLRF	r0x05
	BTFSC	_PORTBbits, 3
	INCF	r0x05, F
	CLRF	r0x06
	MOVF	r0x05, W
	XORLW	0x01
	BNZ	_00314_DS_
	MOVF	r0x06, W
	BZ	_00315_DS_
_00314_DS_:
	BRA	_00264_DS_
_00315_DS_:
	BTFSC	_PORTBbits, 1
	BRA	_00264_DS_
;	.line	189; clock.c	time->hours = (time->hours < 23? time->hours+1:0);
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrget1
	MOVWF	r0x05
	MOVLW	0x17
	SUBWF	r0x05, W
	BC	_00270_DS_
	INCF	r0x05, F
	BRA	_00271_DS_
_00270_DS_:
	CLRF	r0x05
_00271_DS_:
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrput1
	BRA	_00264_DS_
_00262_DS_:
;	.line	191; clock.c	else if(hms==2)
	MOVF	r0x00, W
	XORLW	0x02
	BZ	_00318_DS_
	BRA	_00259_DS_
_00318_DS_:
;	.line	193; clock.c	if(mode != ALARM) DisplayTop("Set current mins");
	MOVF	r0x01, W
	BNZ	_00237_DS_
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	CALL	_DisplayTop
	MOVLW	0x03
	ADDWF	FSR1L, F
	BRA	_00238_DS_
_00237_DS_:
;	.line	194; clock.c	else  DisplayTop("Set alarm mins");
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	CALL	_DisplayTop
	MOVLW	0x03
	ADDWF	FSR1L, F
_00238_DS_:
;	.line	196; clock.c	if(BUTTON0_IO == 0u && BUTTON1_IO == 1u)
	BTFSC	_PORTBbits, 3
	BRA	_00243_DS_
	CLRF	r0x05
	BTFSC	_PORTBbits, 1
	INCF	r0x05, F
	CLRF	r0x06
	MOVF	r0x05, W
	XORLW	0x01
	BNZ	_00319_DS_
	MOVF	r0x06, W
	BZ	_00320_DS_
_00319_DS_:
	BRA	_00243_DS_
_00320_DS_:
;	.line	197; clock.c	time->minutes = (time->minutes > 0? time->minutes-1:59);
	MOVF	r0x02, W
	ADDLW	0x01
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget1
	MOVWF	r0x08
	MOVF	r0x08, W
	BZ	_00272_DS_
	DECF	r0x08, F
	BRA	_00273_DS_
_00272_DS_:
	MOVLW	0x3b
	MOVWF	r0x08
_00273_DS_:
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	BRA	_00264_DS_
_00243_DS_:
;	.line	198; clock.c	else if(BUTTON0_IO == 1u && BUTTON1_IO == 0u)
	CLRF	r0x05
	BTFSC	_PORTBbits, 3
	INCF	r0x05, F
	CLRF	r0x06
	MOVF	r0x05, W
	XORLW	0x01
	BNZ	_00321_DS_
	MOVF	r0x06, W
	BZ	_00322_DS_
_00321_DS_:
	BRA	_00264_DS_
_00322_DS_:
	BTFSC	_PORTBbits, 1
	BRA	_00264_DS_
;	.line	199; clock.c	time->minutes = (time->minutes < 59? time->minutes+1:0);
	MOVF	r0x02, W
	ADDLW	0x01
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget1
	MOVWF	r0x08
	MOVLW	0x3b
	SUBWF	r0x08, W
	BC	_00274_DS_
	INCF	r0x08, F
	BRA	_00275_DS_
_00274_DS_:
	CLRF	r0x08
_00275_DS_:
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	BRA	_00264_DS_
_00259_DS_:
;	.line	201; clock.c	else if(hms==3)
	MOVF	r0x00, W
	XORLW	0x03
	BZ	_00325_DS_
	BRA	_00264_DS_
_00325_DS_:
;	.line	203; clock.c	if(mode != ALARM) DisplayTop("Set current secs");
	MOVF	r0x01, W
	BNZ	_00247_DS_
	MOVLW	UPPER(__str_4)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_4)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_4)
	MOVWF	POSTDEC1
	CALL	_DisplayTop
	MOVLW	0x03
	ADDWF	FSR1L, F
	BRA	_00248_DS_
_00247_DS_:
;	.line	204; clock.c	else  DisplayTop("Set alarm secs");
	MOVLW	UPPER(__str_5)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_5)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_5)
	MOVWF	POSTDEC1
	CALL	_DisplayTop
	MOVLW	0x03
	ADDWF	FSR1L, F
_00248_DS_:
;	.line	206; clock.c	if(BUTTON0_IO == 0u && BUTTON1_IO == 1u)
	BTFSC	_PORTBbits, 3
	BRA	_00253_DS_
	CLRF	r0x00
	BTFSC	_PORTBbits, 1
	INCF	r0x00, F
	CLRF	r0x01
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00326_DS_
	MOVF	r0x01, W
	BZ	_00327_DS_
_00326_DS_:
	BRA	_00253_DS_
_00327_DS_:
;	.line	207; clock.c	time->seconds = (time->seconds > 0? time->seconds-1:59);
	MOVF	r0x02, W
	ADDLW	0x02
	MOVWF	r0x00
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x05
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x06
	MOVF	r0x06, W
	BZ	_00276_DS_
	DECF	r0x06, F
	BRA	_00277_DS_
_00276_DS_:
	MOVLW	0x3b
	MOVWF	r0x06
_00277_DS_:
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
	BRA	_00264_DS_
_00253_DS_:
;	.line	208; clock.c	else if(BUTTON0_IO == 1u && BUTTON1_IO == 0u)
	CLRF	r0x00
	BTFSC	_PORTBbits, 3
	INCF	r0x00, F
	CLRF	r0x01
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00328_DS_
	MOVF	r0x01, W
	BZ	_00329_DS_
_00328_DS_:
	BRA	_00264_DS_
_00329_DS_:
	BTFSC	_PORTBbits, 1
	BRA	_00264_DS_
;	.line	209; clock.c	time->seconds = (time->seconds < 59? time->seconds+1:0);
	MOVF	r0x02, W
	ADDLW	0x02
	MOVWF	r0x02
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x01
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x00
	MOVFF	r0x02, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	CALL	__gptrget1
	MOVWF	r0x03
	MOVLW	0x3b
	SUBWF	r0x03, W
	BC	_00278_DS_
	INCF	r0x03, F
	BRA	_00279_DS_
_00278_DS_:
	CLRF	r0x03
_00279_DS_:
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x02, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	CALL	__gptrput1
_00264_DS_:
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
S_clock__display_state	code
_display_state:
;	.line	170; clock.c	void display_state(FSM_STATE state)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
; ;multiply lit val:0x03 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
;	.line	172; clock.c	DisplayTop(state2str[state]);
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
	CALL	_DisplayTop
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_clock__display_time	code
_display_time:
;	.line	164; clock.c	void display_time(enum Mode mode)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	166; clock.c	DisplayString(20, current_time_string(mode));
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_current_time_string
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	INCF	FSR1L, F
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x14
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
S_clock__current_time_string	code
_current_time_string:
;	.line	144; clock.c	char* current_time_string(enum Mode mode)
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
;	.line	148; clock.c	struct Time* time = (mode == ALARM? &alarm_time : &current_time);
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00197_DS_
	MOVLW	LOW(_alarm_time)
	MOVWF	r0x00
	MOVLW	HIGH(_alarm_time)
	MOVWF	r0x01
	BRA	_00198_DS_
_00197_DS_:
	MOVLW	LOW(_current_time)
	MOVWF	r0x00
	MOVLW	HIGH(_current_time)
	MOVWF	r0x01
_00198_DS_:
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
;	.line	150; clock.c	string[0] = (time->hours/10) + '0';
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVFF	r0x03, POSTDEC1
	CALL	__divuchar
	MOVWF	r0x04
	MOVF	PREINC1, W
	MOVF	PREINC1, W
	MOVLW	0x30
	ADDWF	r0x04, F
	MOVF	r0x04, W
	BANKSEL	_current_time_string_string_1_1
	MOVWF	_current_time_string_string_1_1, B
;	.line	151; clock.c	string[1] = (time->hours % 10) + '0';
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVFF	r0x03, POSTDEC1
	CALL	__moduchar
	MOVWF	r0x03
	MOVF	PREINC1, W
	MOVF	PREINC1, W
	MOVLW	0x30
	ADDWF	r0x03, F
	MOVF	r0x03, W
	BANKSEL	(_current_time_string_string_1_1 + 1)
	MOVWF	(_current_time_string_string_1_1 + 1), B
;	.line	152; clock.c	string[2] = ':';
	MOVLW	0x3a
	BANKSEL	(_current_time_string_string_1_1 + 2)
	MOVWF	(_current_time_string_string_1_1 + 2), B
;	.line	153; clock.c	string[3] = (time->minutes/10) + '0';
	MOVF	r0x00, W
	ADDLW	0x01
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x03
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVFF	r0x03, POSTDEC1
	CALL	__divuchar
	MOVWF	r0x04
	MOVF	PREINC1, W
	MOVF	PREINC1, W
	MOVLW	0x30
	ADDWF	r0x04, F
	MOVF	r0x04, W
	BANKSEL	(_current_time_string_string_1_1 + 3)
	MOVWF	(_current_time_string_string_1_1 + 3), B
;	.line	154; clock.c	string[4] = (time->minutes % 10) + '0';
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVFF	r0x03, POSTDEC1
	CALL	__moduchar
	MOVWF	r0x03
	MOVF	PREINC1, W
	MOVF	PREINC1, W
	MOVLW	0x30
	ADDWF	r0x03, F
	MOVF	r0x03, W
	BANKSEL	(_current_time_string_string_1_1 + 4)
	MOVWF	(_current_time_string_string_1_1 + 4), B
;	.line	155; clock.c	string[5] = '.';
	MOVLW	0x2e
	BANKSEL	(_current_time_string_string_1_1 + 5)
	MOVWF	(_current_time_string_string_1_1 + 5), B
;	.line	156; clock.c	string[6] = (time->seconds/10) + '0';
	MOVLW	0x02
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x00
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVFF	r0x00, POSTDEC1
	CALL	__divuchar
	MOVWF	r0x01
	MOVF	PREINC1, W
	MOVF	PREINC1, W
	MOVLW	0x30
	ADDWF	r0x01, F
	MOVF	r0x01, W
	BANKSEL	(_current_time_string_string_1_1 + 6)
	MOVWF	(_current_time_string_string_1_1 + 6), B
;	.line	157; clock.c	string[7] = (time->seconds % 10) + '0';
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVFF	r0x00, POSTDEC1
	CALL	__moduchar
	MOVWF	r0x00
	MOVF	PREINC1, W
	MOVF	PREINC1, W
	MOVLW	0x30
	ADDWF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_current_time_string_string_1_1 + 7)
	MOVWF	(_current_time_string_string_1_1 + 7), B
	MOVLW	0x08
	MOVWF	r0x00
_00191_DS_:
;	.line	158; clock.c	for(;i<12;i++) string[i] = ' ';
	MOVLW	0x0c
	SUBWF	r0x00, W
	BC	_00194_DS_
	MOVLW	LOW(_current_time_string_string_1_1)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_current_time_string_string_1_1)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVLW	0x20
	MOVWF	INDF0
	INCF	r0x00, F
	BRA	_00191_DS_
_00194_DS_:
;	.line	160; clock.c	return string;
	MOVLW	HIGH(_current_time_string_string_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_current_time_string_string_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_clock__high_isr	code
_high_isr:
;	.line	101; clock.c	void high_isr (void) interrupt 1
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
;	.line	107; clock.c	if(INTCONbits.TMR0IF)  //If TMR0 flag is set
	BTFSS	_INTCONbits, 2
	BRA	_00163_DS_
;	.line	109; clock.c	INTCONbits.TMR0IE = 0;  // Disable TMR0 interrupts
	BCF	_INTCONbits, 5
	BANKSEL	_high_isr_ticks_1_1
;	.line	111; clock.c	if ((++ticks % 125 == 0) && alarm_triggered)
	INCF	_high_isr_ticks_1_1, F, B
	MOVLW	0x7d
	MOVWF	POSTDEC1
	MOVFF	_high_isr_ticks_1_1, POSTDEC1
	CALL	__moduchar
	MOVWF	r0x00
	MOVF	PREINC1, W
	MOVF	PREINC1, W
	MOVF	r0x00, W
	BNZ	_00151_DS_
	BANKSEL	_alarm_triggered
	MOVF	_alarm_triggered, W, B
	BZ	_00151_DS_
;	.line	113; clock.c	if(led_on_time++ < 60)
	MOVFF	_high_isr_led_on_time_1_1, r0x00
	BANKSEL	_high_isr_led_on_time_1_1
	INCF	_high_isr_led_on_time_1_1, F, B
	MOVLW	0x3c
	SUBWF	r0x00, W
	BC	_00148_DS_
;	.line	114; clock.c	led_data ^= 2;
	MOVLW	0x02
	BANKSEL	_high_isr_led_data_1_1
	XORWF	_high_isr_led_data_1_1, F, B
	BRA	_00149_DS_
_00148_DS_:
	BANKSEL	_high_isr_led_data_1_1
;	.line	117; clock.c	led_data = 0;
	CLRF	_high_isr_led_data_1_1, B
	BANKSEL	_high_isr_led_on_time_1_1
;	.line	118; clock.c	led_on_time = 0;
	CLRF	_high_isr_led_on_time_1_1, B
	BANKSEL	_alarm_triggered
;	.line	119; clock.c	alarm_triggered = 0;
	CLRF	_alarm_triggered, B
_00149_DS_:
;	.line	121; clock.c	LED_PUT(led_data);
	MOVFF	_LATJ, r0x00
	MOVLW	0xf8
	ANDWF	r0x00, F
	MOVLW	0x07
	BANKSEL	_high_isr_led_data_1_1
	ANDWF	_high_isr_led_data_1_1, W, B
	MOVWF	r0x01
	MOVF	r0x01, W
	IORWF	r0x00, W
	MOVWF	_LATJ
_00151_DS_:
	BANKSEL	_high_isr_ticks_1_1
;	.line	125; clock.c	if (ticks == 250)
	MOVF	_high_isr_ticks_1_1, W, B
	XORLW	0xfa
	BNZ	_00160_DS_
;	.line	127; clock.c	current_time.seconds++;
	MOVFF	(_current_time + 2), r0x00
	INCF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_current_time + 2)
	MOVWF	(_current_time + 2), B
	BANKSEL	_high_isr_ticks_1_1
;	.line	128; clock.c	ticks = 0;
	CLRF	_high_isr_ticks_1_1, B
	BANKSEL	_alarm_triggered
;	.line	129; clock.c	if (!alarm_triggered)
	MOVF	_alarm_triggered, W, B
	BNZ	_00160_DS_
	BANKSEL	_current_time
;	.line	131; clock.c	if((current_time.hours == alarm_time.hours) && (current_time.minutes == alarm_time.minutes) && (current_time.seconds == alarm_time.seconds))
	MOVF	_current_time, W, B
	BANKSEL	_alarm_time
	XORWF	_alarm_time, W, B
	BNZ	_00160_DS_
_00182_DS_:
	BANKSEL	(_current_time + 1)
	MOVF	(_current_time + 1), W, B
	BANKSEL	(_alarm_time + 1)
	XORWF	(_alarm_time + 1), W, B
	BNZ	_00160_DS_
_00184_DS_:
	BANKSEL	(_current_time + 2)
	MOVF	(_current_time + 2), W, B
	BANKSEL	(_alarm_time + 2)
	XORWF	(_alarm_time + 2), W, B
	BNZ	_00160_DS_
;	.line	132; clock.c	alarm_triggered = 1;
	MOVLW	0x01
	BANKSEL	_alarm_triggered
	MOVWF	_alarm_triggered, B
_00160_DS_:
;	.line	136; clock.c	INTCONbits.TMR0IF = 0;  // Reset TMR0 flag
	BCF	_INTCONbits, 2
;	.line	137; clock.c	INTCONbits.TMR0IE = 1;  // Re-enable TMR0 interrupts
	BSF	_INTCONbits, 5
;	.line	138; clock.c	TMR0H=HIGH;             // Set TMR0 values
	MOVLW	0x9e
	MOVWF	_TMR0H
;	.line	139; clock.c	TMR0L=LOW; 
	MOVLW	0x57
	MOVWF	_TMR0L
_00163_DS_:
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
S_clock__DisplayTop	code
_DisplayTop:
;	.line	82; clock.c	void DisplayTop(char* text)
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
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	84; clock.c	BYTE        l = strlen(text);/*number of actual chars in the string*/
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_strlen
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	85; clock.c	char       *d = (char*)&LCDText[0];
	MOVLW	HIGH(_LCDText)
	MOVWF	r0x05
	MOVLW	LOW(_LCDText)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
;	.line	87; clock.c	size_t      n = (l < 16) ? l : 16;
	MOVLW	0x10
	SUBWF	r0x03, W
	BNC	_00134_DS_
	MOVLW	0x10
	MOVWF	r0x03
_00134_DS_:
	CLRF	r0x07
;	.line	89; clock.c	unsigned char i = 16-n;
	MOVF	r0x03, W
	MOVWF	r0x08
	MOVF	r0x08, W
	SUBLW	0x10
	MOVWF	r0x08
;	.line	90; clock.c	if (n != 0)
	MOVF	r0x03, W
	IORWF	r0x07, W
	BTFSC	STATUS, 2
	BRA	_00130_DS_
_00123_DS_:
;	.line	92; clock.c	while (n-- != 0)*d++ = *s++;
	MOVFF	r0x03, r0x09
	MOVFF	r0x07, r0x0a
	MOVLW	0xff
	ADDWF	r0x03, F
	BTFSS	STATUS, 0
	DECF	r0x07, F
	MOVF	r0x09, W
	IORWF	r0x0a, W
	BZ	_00139_DS_
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x09
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
	INCF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BRA	_00123_DS_
_00139_DS_:
;	.line	93; clock.c	while (i-- != 0)*d++ = ' ';
	MOVFF	r0x04, r0x00
	MOVFF	r0x05, r0x01
	MOVFF	r0x06, r0x02
	MOVFF	r0x08, r0x03
_00126_DS_:
	MOVFF	r0x03, r0x04
	DECF	r0x03, F
	MOVF	r0x04, W
	BZ	_00130_DS_
	MOVLW	0x20
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	BRA	_00126_DS_
_00130_DS_:
;	.line	95; clock.c	LCDUpdate();
	CALL	_LCDUpdate
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
;	.line	67; clock.c	void DisplayString(BYTE pos, char* text)
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
;	.line	69; clock.c	BYTE        l = strlen(text);/*number of actual chars in the string*/
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
;	.line	70; clock.c	BYTE      max = 32 - pos;  /*available space on the lcd*/
	MOVF	r0x00, W
	SUBLW	0x20
	MOVWF	r0x05
;	.line	71; clock.c	char       *d = (char*)&LCDText[pos];
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
;	.line	73; clock.c	size_t      n = (l < max) ? l : max;
	MOVF	r0x05, W
	SUBWF	r0x04, W
	BNC	_00113_DS_
	MOVFF	r0x05, r0x04
_00113_DS_:
	CLRF	r0x05
;	.line	75; clock.c	if (n != 0)
	MOVF	r0x04, W
	IORWF	r0x05, W
	BZ	_00109_DS_
_00105_DS_:
;	.line	76; clock.c	while (n-- != 0)*d++ = *s++;
	MOVFF	r0x04, r0x08
	MOVFF	r0x05, r0x09
	MOVLW	0xff
	ADDWF	r0x04, F
	BTFSS	STATUS, 0
	DECF	r0x05, F
	MOVF	r0x08, W
	IORWF	r0x09, W
	BZ	_00109_DS_
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
	BRA	_00105_DS_
_00109_DS_:
;	.line	77; clock.c	LCDUpdate();
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
__str_0:
	DB	0x53, 0x65, 0x74, 0x20, 0x63, 0x75, 0x72, 0x72, 0x65, 0x6e, 0x74, 0x20
	DB	0x68, 0x72, 0x73, 0x00
; ; Starting pCode block
__str_1:
	DB	0x53, 0x65, 0x74, 0x20, 0x61, 0x6c, 0x61, 0x72, 0x6d, 0x20, 0x68, 0x6f
	DB	0x75, 0x72, 0x73, 0x00
; ; Starting pCode block
__str_2:
	DB	0x53, 0x65, 0x74, 0x20, 0x63, 0x75, 0x72, 0x72, 0x65, 0x6e, 0x74, 0x20
	DB	0x6d, 0x69, 0x6e, 0x73, 0x00
; ; Starting pCode block
__str_3:
	DB	0x53, 0x65, 0x74, 0x20, 0x61, 0x6c, 0x61, 0x72, 0x6d, 0x20, 0x6d, 0x69
	DB	0x6e, 0x73, 0x00
; ; Starting pCode block
__str_4:
	DB	0x53, 0x65, 0x74, 0x20, 0x63, 0x75, 0x72, 0x72, 0x65, 0x6e, 0x74, 0x20
	DB	0x73, 0x65, 0x63, 0x73, 0x00
; ; Starting pCode block
__str_5:
	DB	0x53, 0x65, 0x74, 0x20, 0x61, 0x6c, 0x61, 0x72, 0x6d, 0x20, 0x73, 0x65
	DB	0x63, 0x73, 0x00
; ; Starting pCode block
__str_6:
	DB	0x57, 0x41, 0x4b, 0x45, 0x20, 0x55, 0x50, 0x21, 0x00
; ; Starting pCode block
__str_7:
	DB	0x48, 0x61, 0x76, 0x65, 0x20, 0x61, 0x20, 0x6e, 0x69, 0x63, 0x65, 0x20
	DB	0x64, 0x61, 0x79, 0x21, 0x00
; ; Starting pCode block
__str_8:
	DB	0x5e, 0x41, 0x6c, 0x61, 0x72, 0x6d, 0x20, 0x20, 0x76, 0x43, 0x75, 0x72
	DB	0x72, 0x65, 0x6e, 0x74, 0x00
; ; Starting pCode block
__str_9:
	DB	0x53, 0x54, 0x41, 0x52, 0x54, 0x55, 0x50, 0x00
; ; Starting pCode block
__str_10:
	DB	0x57, 0x41, 0x49, 0x54, 0x5f, 0x46, 0x4f, 0x52, 0x5f, 0x52, 0x45, 0x4c
	DB	0x45, 0x41, 0x53, 0x45, 0x00
; ; Starting pCode block
__str_11:
	DB	0x53, 0x45, 0x54, 0x5f, 0x54, 0x49, 0x4d, 0x45, 0x00
; ; Starting pCode block
__str_12:
	DB	0x49, 0x4e, 0x43, 0x5f, 0x54, 0x49, 0x4d, 0x45, 0x00
; ; Starting pCode block
__str_13:
	DB	0x43, 0x48, 0x4f, 0x49, 0x43, 0x45, 0x00


; Statistics:
; code size:	 3480 (0x0d98) bytes ( 2.66%)
;           	 1740 (0x06cc) words
; udata size:	   18 (0x0012) bytes ( 0.47%)
; access size:	   13 (0x000d) bytes


	end
