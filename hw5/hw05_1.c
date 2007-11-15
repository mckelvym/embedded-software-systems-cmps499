/*
Mark McKelvy
CMPS499: Embedded Software Systems
HW5
	Problem 1.
	Controller for mini-toy helicopter.	Human presses "geaux". Helicopter flies to 10ft height.
	Circles in 5ft radius for 5minutes. Circles in 4ft radius for 4minutes.	Circles in 2ft radius for 3minutes.
	User may press "come home" button, so it must complete current circle, come back to point P, then descends.
	When helicoper is sent a command, it sends back "got-you" signal.

	In a final version, it should be coded that the come home pin going high generates external interrupt signal.
	Also the geaux pin should be wired to external device.
*/

// keil header
#include <reg52.h>

#define ext_interrupt 0 // ISR # for external interrupt, "come home" button

sbit ack_pin = P1^7; // pin to acknowledge control signal from user.
sbit geaux_pin = P1^2; // signal for helicopter to go
//int geaux_pin = 0; // for debugging purposes we'll use an int not pin.

/* State descriptions:
	0. Powerup state / ready state. (instant)
	1. Ascend to 10ft. (4s)
	2. Circle in 5ft radius (300s)
	3. Circle in 4ft radius (240s)
	4. Circle in 2ft radius (180s)
	5. Descend to ground. (5s)
	6. Powerdown state. (1s)
	7. User interrupt state, return to center. (3s to return to center)
*/
const int num_states = 8;
const unsigned char state[] = {0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x7F};
int current_state;

const int state_delays[] = {-1, 4, 300, 240, 180, 5, 1, 3}; // time to spend in each state
//const int state_delays[] = {10,10,10,10,10,10,10,10};

// radius from ctr point for each state
const unsigned char hover_radius[] = {0x00, 0x00, 0x05, 0x04, 0x02, 0x00, 0x00, 0xFE};

int interrupt_count; // #of interrupts received so far

void delay_50ms(); // delays hardware 50ms
void delay_1s();   // delays hardware 1s
void user_input(); // simulate user input
void update_status(); // puts status on correct ports/pins
void interrupt_handler(); // take care of interrupt signals
void init(); // initialization steps

void main(){

	init();
	while(current_state != -1){
		update_status();

		if(current_state == 0){
			geaux_pin = 1; // set geaux pin for "read mode"
		}
		// if in startup state, wait until user presses geaux button
		while(current_state == 0 && geaux_pin != 1);

		current_state++;

		if(current_state == (num_states - 1)){ // reached last state w/o interruption
			current_state = -1;
		}
	}
}

// initializations
void init(){
	current_state = 0; // powerup state, wait for geaux signal
	interrupt_count = 0; // #interrupts received
	EA = 1; // globally enable interrupts
	ack_pin = 0; // clear ack pin
	update_status(); // set status on ports
//	user_input(); // generate false user input
}

// handles the "come home" signal from user.
// sends acknowledge signal
// goes into state to return to center position
// then descends and lands, powers off
// all other interrupts past the first one are ignored
void interrupt_handler() interrupt ext_interrupt{
	if(interrupt_count == 0){ // only handle first interrupt generated
		ack_pin = 1; // send acknowledge
		current_state = (num_states - 1); // go to return mode.
		update_status(); // safely return to center point
		current_state = (num_states - 3); // begin landing sequence
	}
	interrupt_count++;
}

// status is sent to ports about state and radius from center
void update_status(){
	int delay_count;

	if(current_state != -1){ // if not in poweroff state
		P2 = state[current_state]; // output state
		P3 = hover_radius[current_state]; // output desired hover radius
		for(delay_count = 0; delay_count < state_delays[current_state]; delay_count++){
			delay_1s(); // stay in current state for some time.
		}
	}
	else{ // toy is off now
		P2 = 0x00; // clear status
		P3 = 0x00; // clear status
	}
}

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

// Assumes clock is at 12Mhz with 12 osc cycles
/*
void user_input(){
    // load t2 control reg
    T2CON   = 0x04;

    // set init timer val
    TH2     = 0x3C;
    TL0     = 0xB0;

    // set reload capt.
    RCAP2H  = 0x3C;
    RCAP2L  = 0xB0;

    TF2     = 0; // clear overflow
    ET2     = 1; // enable ISR to be generated when timer 2 overflows
    TR2     = 1; // start timer 2
}
*/
