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

    TMR0H = 0xFF;     // Reset timer values
    TMR0L = LOW;
    INTCONbits.TMR0IE = 1;  // Enable TMR0 interrupts
    INTCONbits.TMR0IF = 0;  // Reset TMR0 flag
  }
}

void main(void)
{

}