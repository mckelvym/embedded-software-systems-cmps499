/* 
Mark McKelvy
CMPS499: Embedded Software Systems
HW3
	Problem 1. Writes either 0 or 1 to a pin every 100ms by calling "functionX".
*/

// keil header
#include <reg52.h>

// setup to write to port 3 pin 4
sbit write_pin = P3^4;

// toggle between writing 0 or 1
int toggle = 0;				

// Assumes clock is at 12Mhz with 12 osc cycles
void delay_50ms(){
	// setup timer for 16-bit
	TMOD &= 0xF0; // clear T0 bits for timer 0
	TMOD |= 0x01; // set T0 bits for timer 0 in 16-bit mode

	ET0 = 0; // turn off interrupts

	// calculate values for high byte, low byte, and load them
	TH0 = 0x3C;
	TL0 = 0xB0;
	
	TF0 = 0; // clear the overflow bit for timer 0
	TR0 = 1; // set timer 0 to run

	while (TF0 == 0); // loop while timer has not overflowed

	TR0 = 0; // set timer 0 to not run
}

// dummy function to be called every 100ms
void functionX(){
	// based upon toggle value will write byte 1,2, or 3 to port 2
	if(toggle == 0){
		write_pin = 0;
		toggle = 1;
	}
	else if(toggle == 1){
		write_pin = 1;
		toggle = 0;
	}
}

void main(){

	// go super loop!!
	while(1){
		delay_50ms();
		delay_50ms();
		
		functionX();	
	}
}
