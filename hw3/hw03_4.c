/* 
Mark McKelvy
CMPS499: Embedded Software Systems
HW3
	Problem 4. Controls the traffic lights at the intersection of two one-way streets.
	The street lights are denoted by L1 and L2. L1 is the busy one way street. L2 is not
	as busy. There should be time for pedestrians to also cross the street.

	The following are the states.

	State	Description
	1		L1 is Red. L2 is Red. Pedestrians may cross. 15 seconds.
	2		L1 is Green. L2 is Red. 30 seconds.
	3		L1 is Yellow. L2 is Red. 5 seconds.
	4		L1 is Red. L2 is Red. Short window to ensure traffic stop. 2 seconds.
	5		L1 is Red. L2 is Green. 20 seconds.
	6		L1 is Red. L2 is Yellow. 4 seconds.
	7		L1 is Red. L2 is Red. Short window to ensure traffic stop. 2 seconds.
*/
usb://HP/Photosmart%20C4100%20series?serial=MY68GF12WY04J7
// keil header
#include <reg52.h>

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

// delay software in hardware for 1 second
void delay_1s(){
	int i;
	for(i = 1; i <= 20; i++){
		delay_50ms();
	}
}

void init(){
	// do any init functions here
}

void main(){
/*
	State	Description
	1		L1 is Red. L2 is Red. Pedestrians may cross. 15 seconds.
	2		L1 is Green. L2 is Red. 30 seconds.
	3		L1 is Yellow. L2 is Red. 5 seconds.
	4		L1 is Red. L2 is Red. Short window to ensure traffic stop. 2 seconds.
	5		L1 is Red. L2 is Green. 20 seconds.
	6		L1 is Red. L2 is Yellow. 4 seconds.
	7		L1 is Red. L2 is Red. Short window to ensure traffic stop. 2 seconds.

	A single byte is sufficient to control the status of the two lights.
	Assume the following conventions for the byte: 7 6 5 4 3 2 1 0.
	Bits 0-3 control L1.
	Bits 4-7 control L2.
	Treat each light as its own separate unit. For each light, the following applies:
	
	A value of "0" is off all lights, debugging use only.
	A value of "1" is green light.
	A value of "2" is yellow light.
	A value of "3" is red light.
	A value of "4" is corresponding signal for pedestrians to cross, with red light.
*/

	// these values correspond light states
	unsigned char state_values[] = {0x44, // L1 is Red. L2 is Red. Pedestrians may cross.
									0x13, // L1 is Green. L2 is Red.
									0x23, // L1 is Yellow. L2 is Red.
									0x33, // L1 is Red. L2 is Red.
									0x31, // L1 is Red. L2 is Green.
									0x32, // L1 is Red. L2 is Yellow.
									0x33};// L1 is Red. L2 is Red.

	// amount of time in each state
	int state_delays[] = {15, 30, 5, 2, 20, 4, 2};

	int total_states = 7;
	int count = 0;
	int delay_count = 0;

	init();
	while(1){			
		P2 = state_values[count];
		for(delay_count = 0; delay_count < state_delays[count]; delay_count++){
			delay_1s();	
		}
		count++;
		if(count == total_states){
 			count = 0;
		}
	}
}
