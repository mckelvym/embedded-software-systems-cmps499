/* 
Mark McKelvy
CMPS499: Embedded Software Systems
HW3
	Problem 3. Cycles through 4 states for a child's toy, spending a certain amount of time in each state.
*/

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
	// states for the toy
	unsigned char state_values[] = {0x01, 0x02, 0x04, 0x08};

	// amount of time in each state
	int state_delays[] = {5, 2, 3, 5};

	int total_states = 4;
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
