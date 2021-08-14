;This is a template with the most typical sections of an assembly-language program
;This program keeps an LED turned on while the PIC is biased
;The LED is attached to the pin 0 of PORTB
;The instruction set is used with a=0 (Access RAM)
;******************Header Files******************************
    list	    p=18f4550        ; list directive to define processor
    #include    "p18f4550.inc"

;****************Variables Definition*********************************
    TEMP		EQU	0x22			;Reservamos 22 localidades de memoria
    CONSTANT		MASK b'00001111'		;Mascara que delimitara los bits mas significativos
;****************Main code*****************************
			ORG     0x000             	;reset vector
  			GOTO    MAIN              	;go to the main routine

INITIALIZE:
			CLRF	TRISD,	0		;Puerto D como salidas
			SETF	TRISB,	0		;Puerto B como entradas
			RETURN				;end of initialization subroutine

MAIN:
			CALL 	INITIALIZE

BASE:
			MOVF	PORTB, 0		;PORTB es movido a WREG
			ANDLW	MASK			;
			MOVWF	TEMP			;
			CALL	DECODER			;
			MOVWF	PORTD			;
			GOTO 	BASE			;infinite loop

DECODER:
			ADDWF	PCL,1			;
			RETLW	0x00			;
			RETLW	0x01			;
			RETLW	0x02			;
			RETLW	0x03			;
			RETLW	0x04			;
			RETLW	0x05			;
			RETLW	0x06			;
			RETLW	0x07			;
			RETLW	0x08			;
			RETLW	0x09			;
			RETLW	0x0A			;
			RETLW	0x0B			;
			RETLW	0x0C			;
			RETLW	0x0D			;
			RETLW	0x0E			;
			RETLW	0x0F			;
			
			END                       	;end of the main program


