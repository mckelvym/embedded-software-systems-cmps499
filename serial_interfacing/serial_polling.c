/*************************************************************************
* serial.c - A demonstration of how to access the serial port on an
*  8051 using C code.  To avoid using interrupts, this example polls
*  the interrupt flags in the serial port to know when the serial port
*  is ready.
*/

/* included headers */

#include <reg51.h>	/* register names */

/*
 * function declarations - Here the functions in our code are declared.
 *  In C, this is only necessary if the actual implementation of the
 *  function is performed in a separate file or after any function that
 *  calls it in its own file.  In this program, these functions will
 *  all be implemented within this file.  However, for asthetics,
 *  functions will be implemented in order of highest-level to lowest.
 *  By nature, this creates a scenario where the functions will be
 *  called by code placed above the actual implementation, so the
 *  functions must first be declared here.
 */

char getCharacter (void);	/* read a character from the serial port */
void sendCharacter (char);	/* write a character to the serial port */

/* functions */

/*************************************************************************
* main - Program entry point.  This program will simply receive characters
*  from the serial port, then send them back.
*
* INPUT: N/A
* RETURNS: N/A
*/

main()
{
	char	chr;	/* variable to hold characters in */

	/* Before the serial port may be used, it must be configured. */

	/*
	 * The serial controll register configures the method of operation
	 * for the serial port.  The value used below is 0x50 (or 50h in
	 * 8051 lingo), referring to the bits within the SCON register,
	 * this does the following:
	 *  MODE = 010 (8-bit UART serial buffer, no stop bit - this is typical)
	 *  REN = 1 (enabled receiving)
	 *  TB8, RB8 = 00 (unused in this mode)
	 *  RI,TI = 00 (start the interupt flags as ready to receive and send)
	 */

	SCON = 0x50;		/* mode 1, 8-bit uart, enable receiver */

	/*
	 * Because a standard serial port transmits no clocking signal, both
	 * ends of the serial connection must agree on a clock frequency,
	 * which is then generated internally at each end.  For this example,
	 * a baud rate of 2400 bits per second will be used.  The timer must be
	 * configured accordingly.
	 * The formula for determining the reload value based on desired baud
	 * rate and clock frequency is:
	 *  TH1 = 256 - clock frequency (in Hz) / (384 * baud rate)
 	 * For 2400bps and a 11.02Mhz clock:
	 *  TH1 = 256 - 11,020,000 / (384 * 2400) = 255 = 0xFE
	 */

	TMOD = 0x20;		/* timer 1, mode 2, 8-bit reload */
	TH1  = 0xFE;		/* reload value for 2400 baud */

	/* Setting TR1 will start the timer, and serial communications */

	TR1  = 1;

	/*
	 * Set the Transmit Interrupt flag to send the the character in
	 * the serial buffer, clearing it for use by the program.
	 */

	TI   = 1;

	/*
	 * Now the program is ready to send and receive data on the serial
	 * port. Because it is going to do this indefinitely (until the
	 * device is effectively turned off), the rest of the program will
	 * be in an infinite while() loop.
	 */

	 while (1==1)
	 {

	 	/* read the next character from the serial port */

	 	chr = getCharacter ();

		/* send it back to the original sender */

		sendCharacter (chr);
	 }
}

/*************************************************************************
* getCharacter - Waits for a new character to arrive in the serial port,
*  then reads it.
*
* INPUT: N/A
* RETURNS: newly received character
*/

char getCharacter (void)
{
	char chr;	/* variable to hold the new character */

	/*
	 * Wait until the serial port signals a new character has arrived.
	 * It does so by setting the Received interrupt flag, RI, which
	 * this routine loops on until it is set to 1.  This is known
	 * as polling.
     */

	while (RI != 1) {;}

	/* now read the value in the serial buffer into the local variable */

	chr = SBUF;

	/*
	 * Once the character is read, the serial port must be told that it is
	 * free to receive a new character.  This is done by clearing the
	 * Received Interrupt flag.
	 */

	RI = 0;

	/* the character is then returned to the calling function. */

	return(chr);
}

/*************************************************************************
* sendCharacter - Waits until the serial port is ready to send a new
*  character, then sends it.
*
* INPUT:
*	chr - The character to send
*
* RETURNS: N/A
*/

void sendCharacter
(
    char	chr	/* character to send */
)
{
	/*
	 * Because of the way terminal programs for serial ports work, we want
	 * to replace carriage returns with line feeds.
	 */

	if (chr == '\r') chr = '\n';

	/*
	 * Wait until the serial port signals the previous character has
	 * been sent. It does so by setting the Transmit interrupt flag, TI,
	 * which this routine loops on until it is set to 1.
     */

	while (TI != 1) {;}

	/*
	 * Clear the Transmit Interrupt flag to prepare the serial port
	 * to send a new character.
	 */

	TI = 0;

	/* Write the character into the serial port buffer register, SBUF */

	SBUF = chr;

	/*
	 * The serial port hardware takes over from here, and the program
	 * may continue with other operations.
	 */

	return;
}

