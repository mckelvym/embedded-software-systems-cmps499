/*
Mark McKelvy
CMPS499: Embedded Software Systems
HW3
	Problem 2. Writes either 0 or 1 to a pin every 100ms from ISR call to "functionX".
	Since the timer can only delay about 65ms without interrupt, need to split into two parts.
*/

// keil header
#include <reg52.h>

#define timer2_interrupt	5 // ISR # for timer 2 overflow

// setup to write to port 3 pin 4
sbit write_pin = P3^4;

// toggle between writing 0 or 1
int toggle = 0;

// Assumes clock is at 12Mhz with 12 osc cycles
void delay_50ms(){
    // setup timer for 16-bit
    TMOD &= 0xF0; // clear T0 bits for timer 0
    TMOD |= 0x01; // set T0 bits for timer 0 in 16-bit mode

    ET0 = 0; // turn off generating interrupts for timer 0

    // calculate values for high byte, low byte, and load them
    TH0 = 0x3C;
    TL0 = 0xB0;

    TF0 = 0; // clear the overflow bit for timer 0
    TR0 = 1; // set timer 0 to run

    while (TF0 == 0); // loop while timer has not overflowed

    TR0 = 0; // set timer 0 to not run
}

// Assumes clock is at 12Mhz with 12 osc cycles
void timer_init(){

	delay_50ms(); // initial delay of 50ms

	// load t2 control reg
	T2CON	= 0x04;

	// set init timer val
	TH2		= 0x3C;
	TL0		= 0xB0;

	// set reload capt.
	RCAP2H	= 0x3C;
	RCAP2L	= 0xB0;

	TF2		= 0; // clear overflow
	ET2 	= 1; // enable ISR to be generated when timer 2 overflows
	TR2 	= 1; // start timer 2
}

// dummy function to be called every 100ms by ISR
void functionX() interrupt timer2_interrupt {
	TR2 = 0; // stop timer 2

	// based upon toggle, will write either 1 or 0 to write pin
	if(toggle == 0){
		write_pin = 0;
		toggle = 1;
	}
	else if(toggle == 1){
		write_pin = 1;
		toggle = 0;
	}
	timer_init(); // restart to generate ISR after 100ms
}

void main(){

	EA = 1; // global enable interrupts
	timer_init(); // start timer that generates interrupts

	while(1); // loop forever
}
