unsigned int dez, uni, x, leitura_AD, contagem=0, trava=0;
unsigned char Texto [] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};
char cnt;

display_dezena ()
{
 PORTC.RC4 = 1;
 dez = (x/10);
 PORTD = Texto[dez];
 delay_ms(5);
 PORTC.RC4 = 0;
 PORTD = 0;
 }

display_unidade ()
{
 PORTC.RC5 = 1;
 uni = (x%10);
 PORTD = Texto[uni];
 delay_ms(10);
 PORTC.RC5 = 0;
 PORTD = 0;
}

void interrupt() 
{
if(INTCON.TMR0IF==1)
 {
 TMR0 = 6;
 PORTC.RC7 = ~PORTC.RC7;
 INTCON.TMR0IF = 0;
 }
 
 if (INTCON.INTF==1 && trava==0)
 {
 INTCON.TMR0IE=~INTCON.TMR0IE;
 PORTD.RC7 = 0;
 trava=1;
 delay_us(500);
 INTCON.INTF = 0;
 }
 else
 {
 trava=0;
 delay_us(500);
 }
}


void main ()
{
     INTCON.GIE=1;
     INTCON.PEIE=0;
     INTCON.INTE=1;
     INTCON.INTF=0;
     TRISB.RB0=1; //CONFIGURA RB0 COMO ENTRADA
     PORTB.RB0=1; //NÍVEL 1 PARA PULL-UP
     TRISD=0;
     PORTD=0;
     TRISC=0;
     PORTC=0;
     TRISA.RA0=1;
     INTCON.TMR0IE = 0; //Habilita interrupção do TMR0.
     TMR0 = 6; // TIMER0 inicia com o valor 0.
     OPTION_REG = 0b10000001; // Modo Temporizador, prescaler 1:4. Tempo =0,5us * 4 * (256-3) = 0,5ms


     while (1)
     {

          leitura_AD = adc_read (0);
          x = (leitura_AD/2.048);

         if (x >= 0 && x < 24)
         {
          PORTC=0;
          PORTC.RC0 = 1;
          INTCON.TMR0IE=0;
         }
         else
         {

            if (x >= 25 && x <= 28)
            {
              PORTC=0;
              PORTC.RC1 = 1;
              INTCON.TMR0IE=0;
            }
         else
         {

            if (x >= 29 && x <= 31)
            {
              PORTC=0;
              PORTC.RC2 = 1;
              INTCON.TMR0IE=0;
            }
           else
           {

            if (x > 31 && x <=100)
            {
              PORTC=0;
              PORTC.RC3 = 1;
              INTCON.TMR0IE = 1;
            }
            else
            {
            INTCON.TMR0IE=0;
            }
          }
         }

        }
     for (cnt=0; cnt<5; cnt++)
            {
              display_dezena ();
              display_unidade ();
            }
     }
}