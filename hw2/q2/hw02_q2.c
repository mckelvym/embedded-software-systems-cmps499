/* 
Mark McKelvy
CMPS499: Embedded Software Systems
HW2 Problem 2
	Writes 3 different bytes to port 2 periodically, checks a read pin and 
	based upon if the read pin's value has changed since the last iteration
	writes a 0 or 1 to a write pin
*/

// keil header
#include <reg52.h>

// setup to read from port 2 pin 6
sbit read_pin = P2^6;
// setup to write to port 3 pin 4
sbit write_pin = P3^4;

// dummy delay loop for 100,000 iterations
void delay_unspecified(){
	unsigned int x,y;
	for(x = 0; x <= 1000; x++){
		for(y = 0; y <= 100; y++){
		}
	}
}

void main(){
	unsigned char byte1 = 0x08; // 0000 1000
	unsigned char byte2 = 0x40; // 0100 0000
	unsigned char byte3 = 0xFF; // 1111 1111
	int toggle = 0;				// toggle between byte values
	bit last_value = 0;			// last value of read pin
	bit current_value = 0;		// current value of read pin

	// go super loop!!
	while(1){
		// based upon toggle value will write byte 1,2, or 3 to port 2
		if(toggle == 0){
			P2 = byte1;
			toggle = 1;
		}
		else if(toggle == 1){
			P2 = byte2;
			toggle = 2;
		}
		else if(toggle == 2){
			P2 = byte3;
			toggle = 0;
		}

		// get current value of read pin
		current_value = read_pin;

		// if current value is same as last value write a 0 to write pin
		if(current_value == last_value){
			write_pin = 0;
		}
		// otherwise we'll write a 1 to it
		else{
			write_pin = 1;
		}
		// update what the last value of read pin was
		last_value = read_pin;

		// dummy delay
		delay_unspecified();
	}
}
