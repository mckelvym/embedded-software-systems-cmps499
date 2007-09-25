/*
 *Mark McKelvy
 *CMPS499: Embedded Software Systems
 *HW2 Problem 3
 *
 *Reads two byte strings from the input
 *and outputs the byte strings along with
 *their and, or, and xor operations.
 */
#include <stdio.h>

//outputs a byte to the screen and a newline after it
void output_byte (unsigned char byte)
{
		// 0000 0001
		unsigned char mask = 1;

		// shift one over 7 places, 1000 0000
		mask <<= 7;

		// gradually check each bit before shifting it off the end
		for(int i = 1; i <= 8; i++)
		{
				if((mask & byte) > 0)
				{
						printf ("1");
				}
				else
				{
						printf ("0");
				}
				byte <<= 1;
		}
		printf ("\n");
}

//takes a character array of size 8 and converts it to an unsigned char (byte)
unsigned char convert_char_array_to_byte (char array[])
{
		unsigned char retval = 0;
		unsigned char mask = 1;

		//check each element in the array
		for(int i = 0; i <= 7; i++)
		{
				if(array[i] == '1')
				{
						retval = (retval | mask);
				}
				if(i != 7)
				{
						retval <<= 1;
				}
		}
		return retval;
}

int main ()
{
		unsigned char x = 0xFE; // dummy value
		unsigned char y = 0x03; // dummy value
		char x_array[8];		// character array from input
		char y_array[8];		// character array from input
		char dummy;				// catch for newline

		// get x byte from user
		printf ("x = ");
		scanf ("%8c", &x_array);

		// get newline character and do nothing with it
		scanf ("%c", &dummy);

		// get y byte from user
		printf ("y = ");
		scanf ("%8c", &y_array);

		// convert the char arrays to byte strings
		x = convert_char_array_to_byte (x_array);
		y = convert_char_array_to_byte (y_array);

		// output x,y,x&y,x|y,x^y
		printf ("x:\t");
		output_byte (x);
		printf ("y:\t");
		output_byte (y);
		printf ("x&y:\t");
		output_byte (x&y);
		printf ("x|y:\t");
		output_byte (x|y);
		printf ("x^y:\t");
		output_byte (x^y);

		return 0;
}
