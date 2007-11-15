/*************************************************************************
* int.c - A demonstration of how to write interrupt-driven code for an
*  8051 using the Keil C compiler.  The same techniques may work in other
*  8051 C compilers with little or no modifcation.  This program will
*  combine the functionality of both basic.c and serial.c to allow serial
*  communications to be entirely in the background, driven by the serial
*  interrupt.  This allows the main() function to count on Port 0 without
*  being aware of any ongoing serial communication.
*/

/* included headers */

#include <reg51.h>

/* function declarations */

char getCharacter (void);	/* read a character from the serial port */
void sendCharacter (char);	/* write a character to the serial port */

/*
 * Interrupt handlers:
 *  Here the code for the interrupt handler will be placed.  In this
 *  example, a handler for the serial interrupt will be written.
 *  Examination of the 8051 specs will show that the serial interrupt is
 *  interrupt 4.  A single interrupt is generated for both transmit and
 *  receive interrupts, so determination of the exact cause (and proper
 *  response) must be made within the handler itself.
 *  To write an interrupt handler in Keil, the function must be declared
 *  void, with no parameters.  In addition, the function specification
 *  must be followed by a specification of the interrupt source it is
 *  attached to.  The &quot;using&quot; attribute specifies which register bank
 *  to use for the interrupt handler.
 */

void serial_int (void) interrupt 4
{
	static char	chr = '\0';	/* character buffer */

	/*
	 * The interrupt was generated, but it is still unknown why.  First,
	 * check the RI flag to see if it was because a new character was
	 * received.
	 */

	if (RI == 1)	/* it was a receive interrupt */
	{
		chr = SBUF;	/* read the character into our local buffer */
		RI = 0;		/* clear the received interrupt flag */
		TI = 1;		/* signal that there's a new character to send */
	}
	else if (TI == 1)	/* otherwise, assume it was a transmit interrupt */
	{
		TI = 0;	/* clear the transmit interrupt flag */
		if (chr != '\0')	/* if there's something in the local buffer... */
		{
			if (chr == '\r') chr = '\n';	/* convert <CR> to <LF> */
			SBUF = chr;		/* put the character into the transmit buffer */
			chr = '\0';
		}
	}
}

/* functions */

/*************************************************************************
* main - Program entry point.  This program sets up the timers and
*  interrupts, then simply receives characters from the serial port and
*  sends them back.  Notice that nowhere in the main function is Port 0
*  incremented, nor does it call any other function that may do so.
*  main() is free to do solely serial communications.  Port 0 is handled
*  entirely by the interrupt handler (aside from initialization).
*
* INPUT: N/A
* RETURNS: N/A
*/

main()
{
	/* Before the serial port may be used, it must be configured. */

	/* Set up Timer 0 for the serial port */

	SCON = 0x50;	/* mode 1, 8-bit uart, enable receiver */
	TMOD = 0x20;	/* timer 1, mode 2, 8-bit reload */
	TH1  = 0xFE;	/* reload value for 2400 baud */
	ET0  = 0;		/* we don't want this timer to make interrupts */
	TR1  = 1;		/* start the timer */
	TI   = 1;		/* clear the buffer */

	/*
	 * The compiler automatically installs the interrupt handler, so
	 * all that needs to be done to use it is enable interrupts.  First,
	 * speficially enable the serial interrupt, then enable interrupts.
	 */

	ES   = 1;		/* allow serial interrupts */
	EA   = 1;		/* enable interrupts */

	/* initialize Port 0 to 0, as in basic.c */

    P0 = 0;

	/*
	 * Loop forever, increasing Port 0.  Again, note nothing is done
	 * with the serial port in this loop.  Yet simulations will show
	 * that the software is perfectly capable of maintaining serial
	 * communications while this counting proceeds.
	 */

	while (1==1)
    {
		unsigned int	i;
		for (i = 0; i < 60000; i++) {;}	/* delay */
		P0 = P0 + 1;	/* increment Port 0 */
	}
}
