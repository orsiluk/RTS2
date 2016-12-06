#define __18F97J60
#define __SDCC__
#define THIS_INCLUDES_THE_MAIN_FUNCTION
#include "Include/HardwareProfile.h"

#include <string.h>
#include <stdlib.h>

#include "Include/LCDBlocking.h"
#include "Include/TCPIP_Stack/Delay.h"
//#include "Include/share.h"

#define DIVISOR 250
#define LOW (0xFFFF - DIVISOR) & 0xFF

unsigned int ticks;

void high_isr (void) interrupt 1
{
  if (INTCONbits.TMR0IF)
  {
    INTCONbits.TMR0IE = 0;  // Disable TMR0 interrupts

    ticks = (ticks == 0xFFFF)? 0 : ticks + 1; //Increase ticks (Ring)

    TMR0H = 0xFF;           // Reset timer values
    TMR0L = LOW;
    INTCONbits.TMR0IE = 1;  // Enable TMR0 interrupts
    INTCONbits.TMR0IF = 0;  // Reset TMR0 flag
  }
}

void StartupInit(void)
{
  // TMR0 SETUP
  TMR0H = 0xFF;
  TMR0L = LOW;
  T0CONbits.TMR0ON = 1; //start timer
  T0CONbits.T08BIT = 0;  //16bit
  T0CONbits.T0CS = 0;   //Clock source = instruction cycle CLK
  T0CONbits.T0SE = 0;   //Rising edge
  T0CONbits.PSA = 1;    //No prescaler

  //  INTERRUPT CONFIG
  INTCONbits.GIE = 1;   //enable global interrupts
  INTCONbits.TMR0IE=1;  //enable timer0 interrupts
  INTCON2bits.TMR0IP=1; //TMR0 has high prio

  LED0_TRIS = 0; //configure 1st led pin as output (yellow)
  LED1_TRIS = 0; //configure 2nd led pin as output (red)
  LED2_TRIS = 0; //configure 3rd led pin as output (red)
}

void delay10us(unsigned int multiplier)
{
  unsigned int start = ticks, duration = 0;
  while(duration <= multiplier)
    duration = (ticks < start)? 0xFFFF - start + ticks : ticks - start;
}

void main(void)
{
  unsigned char led_data = 0;
  //unsigned int start, duration = 0;
  LED_PUT(led_data);

  StartupInit();
  //ticks = 0;

  while(1)
  {
    /*
    start = ticks;
    while(ticks - start <= 4000);
    led_data ^= 2;
    LED_PUT(led_data);
    ticks = 0;
    */

    /*
    start = ticks;
    while(duration <= 4000)
    {
      if(ticks < start)
        duration = 0xFFFF - start + ticks;
      else
        duration = ticks - start;
    }
    duration = 0;
    start = 0;
    */

    delay10us(4000);

    led_data ^= 1;
    LED_PUT(led_data);
  }
}