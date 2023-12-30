# Embedded Software Systems (CMPS 499) Special Topics Class Projects

## About

Class projects for Embedded Software Systems (CMPS 499), a special topics class, in the Fall of 2007, using C, Verilog, and Small Device C Compiler.

## Bitwise Operators

Build:

```bash
$ make
c++    -c -o bitwise_operators.o bitwise_operators.C
g++ -o bitwise_operators bitwise_operators.o -I/usr/include -L/usr/lib 
```

Run:

```bash
$ ./bitwise_operators
x                                  11111110
1s complement of x [~x]            00000001
Bitwise AND [x & 0x0f]             00001110
Bitwise OR [x | 0x0f]              11111111
Bitwise XOR [x ^ 0x0f]             11110001
Left shift, 1 place [x <<= 1]      11111100
Right shift, 4 place [x >>= 4]     00001111


MS byte of unsigned int y          00001010
LS byte of unsigned int y          00001011
```
