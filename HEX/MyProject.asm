
_display_dezena:

;MyProject.c,5 :: 		display_dezena ()
;MyProject.c,7 :: 		PORTC.RC4 = 1;
	BSF        PORTC+0, 4
;MyProject.c,8 :: 		dez = (x/10);
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      _dez+0
	MOVF       R0+1, 0
	MOVWF      _dez+1
;MyProject.c,9 :: 		PORTD = Texto[dez];
	MOVF       R0+0, 0
	ADDLW      _Texto+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;MyProject.c,10 :: 		delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_display_dezena0:
	DECFSZ     R13+0, 1
	GOTO       L_display_dezena0
	DECFSZ     R12+0, 1
	GOTO       L_display_dezena0
	NOP
	NOP
;MyProject.c,11 :: 		PORTC.RC4 = 0;
	BCF        PORTC+0, 4
;MyProject.c,12 :: 		PORTD = 0;
	CLRF       PORTD+0
;MyProject.c,13 :: 		}
L_end_display_dezena:
	RETURN
; end of _display_dezena

_display_unidade:

;MyProject.c,15 :: 		display_unidade ()
;MyProject.c,17 :: 		PORTC.RC5 = 1;
	BSF        PORTC+0, 5
;MyProject.c,18 :: 		uni = (x%10);
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _uni+0
	MOVF       R0+1, 0
	MOVWF      _uni+1
;MyProject.c,19 :: 		PORTD = Texto[uni];
	MOVF       R0+0, 0
	ADDLW      _Texto+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;MyProject.c,20 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_display_unidade1:
	DECFSZ     R13+0, 1
	GOTO       L_display_unidade1
	DECFSZ     R12+0, 1
	GOTO       L_display_unidade1
	NOP
;MyProject.c,21 :: 		PORTC.RC5 = 0;
	BCF        PORTC+0, 5
;MyProject.c,22 :: 		PORTD = 0;
	CLRF       PORTD+0
;MyProject.c,23 :: 		}
L_end_display_unidade:
	RETURN
; end of _display_unidade

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,25 :: 		void interrupt()
;MyProject.c,27 :: 		if(INTCON.TMR0IF==1)
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt2
;MyProject.c,29 :: 		TMR0 = 6;
	MOVLW      6
	MOVWF      TMR0+0
;MyProject.c,30 :: 		PORTC.RC7 = ~PORTC.RC7;
	MOVLW      128
	XORWF      PORTC+0, 1
;MyProject.c,31 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;MyProject.c,32 :: 		}
L_interrupt2:
;MyProject.c,34 :: 		if (INTCON.INTF==1 && trava==0)
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt5
	MOVLW      0
	XORWF      _trava+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt39
	MOVLW      0
	XORWF      _trava+0, 0
L__interrupt39:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt5
L__interrupt30:
;MyProject.c,36 :: 		INTCON.TMR0IE=~INTCON.TMR0IE;
	MOVLW      32
	XORWF      INTCON+0, 1
;MyProject.c,37 :: 		PORTD.RC7 = 0;
	BCF        PORTD+0, 7
;MyProject.c,38 :: 		trava=1;
	MOVLW      1
	MOVWF      _trava+0
	MOVLW      0
	MOVWF      _trava+1
;MyProject.c,39 :: 		delay_us(500);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_interrupt6:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt6
	DECFSZ     R12+0, 1
	GOTO       L_interrupt6
;MyProject.c,40 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;MyProject.c,41 :: 		}
	GOTO       L_interrupt7
L_interrupt5:
;MyProject.c,44 :: 		trava=0;
	CLRF       _trava+0
	CLRF       _trava+1
;MyProject.c,45 :: 		delay_us(500);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_interrupt8:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt8
	DECFSZ     R12+0, 1
	GOTO       L_interrupt8
;MyProject.c,46 :: 		}
L_interrupt7:
;MyProject.c,47 :: 		}
L_end_interrupt:
L__interrupt38:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;MyProject.c,50 :: 		void main ()
;MyProject.c,52 :: 		INTCON.GIE=1;
	BSF        INTCON+0, 7
;MyProject.c,53 :: 		INTCON.PEIE=0;
	BCF        INTCON+0, 6
;MyProject.c,54 :: 		INTCON.INTE=1;
	BSF        INTCON+0, 4
;MyProject.c,55 :: 		INTCON.INTF=0;
	BCF        INTCON+0, 1
;MyProject.c,56 :: 		TRISB.RB0=1; //CONFIGURA RB0 COMO ENTRADA
	BSF        TRISB+0, 0
;MyProject.c,57 :: 		PORTB.RB0=1; //NÍVEL 1 PARA PULL-UP
	BSF        PORTB+0, 0
;MyProject.c,58 :: 		TRISD=0;
	CLRF       TRISD+0
;MyProject.c,59 :: 		PORTD=0;
	CLRF       PORTD+0
;MyProject.c,60 :: 		TRISC=0;
	CLRF       TRISC+0
;MyProject.c,61 :: 		PORTC=0;
	CLRF       PORTC+0
;MyProject.c,62 :: 		TRISA.RA0=1;
	BSF        TRISA+0, 0
;MyProject.c,63 :: 		INTCON.TMR0IE = 0; //Habilita interrupção do TMR0.
	BCF        INTCON+0, 5
;MyProject.c,64 :: 		TMR0 = 6; // TIMER0 inicia com o valor 0.
	MOVLW      6
	MOVWF      TMR0+0
;MyProject.c,65 :: 		OPTION_REG = 0b10000001; // Modo Temporizador, prescaler 1:4. Tempo =0,5us * 4 * (256-3) = 0,5ms
	MOVLW      129
	MOVWF      OPTION_REG+0
;MyProject.c,68 :: 		while (1)
L_main9:
;MyProject.c,71 :: 		leitura_AD = adc_read (0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _leitura_AD+0
	MOVF       R0+1, 0
	MOVWF      _leitura_AD+1
;MyProject.c,72 :: 		x = (leitura_AD/2.048);
	CALL       _word2double+0
	MOVLW      111
	MOVWF      R4+0
	MOVLW      18
	MOVWF      R4+1
	MOVLW      3
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _double2word+0
	MOVF       R0+0, 0
	MOVWF      _x+0
	MOVF       R0+1, 0
	MOVWF      _x+1
;MyProject.c,74 :: 		if (x >= 0 && x < 24)
	MOVLW      0
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main41
	MOVLW      0
	SUBWF      R0+0, 0
L__main41:
	BTFSS      STATUS+0, 0
	GOTO       L_main13
	MOVLW      0
	SUBWF      _x+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main42
	MOVLW      24
	SUBWF      _x+0, 0
L__main42:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
L__main34:
;MyProject.c,76 :: 		PORTC=0;
	CLRF       PORTC+0
;MyProject.c,77 :: 		PORTC.RC0 = 1;
	BSF        PORTC+0, 0
;MyProject.c,78 :: 		INTCON.TMR0IE=0;
	BCF        INTCON+0, 5
;MyProject.c,79 :: 		}
	GOTO       L_main14
L_main13:
;MyProject.c,83 :: 		if (x >= 25 && x <= 28)
	MOVLW      0
	SUBWF      _x+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main43
	MOVLW      25
	SUBWF      _x+0, 0
L__main43:
	BTFSS      STATUS+0, 0
	GOTO       L_main17
	MOVF       _x+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVF       _x+0, 0
	SUBLW      28
L__main44:
	BTFSS      STATUS+0, 0
	GOTO       L_main17
L__main33:
;MyProject.c,85 :: 		PORTC=0;
	CLRF       PORTC+0
;MyProject.c,86 :: 		PORTC.RC1 = 1;
	BSF        PORTC+0, 1
;MyProject.c,87 :: 		INTCON.TMR0IE=0;
	BCF        INTCON+0, 5
;MyProject.c,88 :: 		}
	GOTO       L_main18
L_main17:
;MyProject.c,92 :: 		if (x >= 29 && x <= 31)
	MOVLW      0
	SUBWF      _x+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main45
	MOVLW      29
	SUBWF      _x+0, 0
L__main45:
	BTFSS      STATUS+0, 0
	GOTO       L_main21
	MOVF       _x+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVF       _x+0, 0
	SUBLW      31
L__main46:
	BTFSS      STATUS+0, 0
	GOTO       L_main21
L__main32:
;MyProject.c,94 :: 		PORTC=0;
	CLRF       PORTC+0
;MyProject.c,95 :: 		PORTC.RC2 = 1;
	BSF        PORTC+0, 2
;MyProject.c,96 :: 		INTCON.TMR0IE=0;
	BCF        INTCON+0, 5
;MyProject.c,97 :: 		}
	GOTO       L_main22
L_main21:
;MyProject.c,101 :: 		if (x > 31 && x <=100)
	MOVF       _x+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVF       _x+0, 0
	SUBLW      31
L__main47:
	BTFSC      STATUS+0, 0
	GOTO       L_main25
	MOVF       _x+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVF       _x+0, 0
	SUBLW      100
L__main48:
	BTFSS      STATUS+0, 0
	GOTO       L_main25
L__main31:
;MyProject.c,103 :: 		PORTC=0;
	CLRF       PORTC+0
;MyProject.c,104 :: 		PORTC.RC3 = 1;
	BSF        PORTC+0, 3
;MyProject.c,105 :: 		INTCON.TMR0IE = 1;
	BSF        INTCON+0, 5
;MyProject.c,106 :: 		}
	GOTO       L_main26
L_main25:
;MyProject.c,109 :: 		INTCON.TMR0IE=0;
	BCF        INTCON+0, 5
;MyProject.c,110 :: 		}
L_main26:
;MyProject.c,111 :: 		}
L_main22:
;MyProject.c,112 :: 		}
L_main18:
;MyProject.c,114 :: 		}
L_main14:
;MyProject.c,115 :: 		for (cnt=0; cnt<5; cnt++)
	CLRF       _cnt+0
L_main27:
	MOVLW      5
	SUBWF      _cnt+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main28
;MyProject.c,117 :: 		display_dezena ();
	CALL       _display_dezena+0
;MyProject.c,118 :: 		display_unidade ();
	CALL       _display_unidade+0
;MyProject.c,115 :: 		for (cnt=0; cnt<5; cnt++)
	INCF       _cnt+0, 1
;MyProject.c,119 :: 		}
	GOTO       L_main27
L_main28:
;MyProject.c,120 :: 		}
	GOTO       L_main9
;MyProject.c,121 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
