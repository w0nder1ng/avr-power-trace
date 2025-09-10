; blink program
#include <avr/io.h>
.section .data
.section .bss

.section .text
.org 0x00

; gnu assembler macros are different than standard avr
; most of the example code I saw use low/high, setting these makes replicating code easier
#define low lo8
#define high hi8

; ldi r16, 0x0
; ldi r17, (1<<PB5)

ldi r23, 0xf0
ldi r24, 0x0
loop:
    rcall delay_1s

    ldi r16, (1<<PB5)
    out _SFR_IO_ADDR (PORTB), r16

    rcall run_1000

    ldi r16, 0x0
    out _SFR_IO_ADDR (PORTB), r16

    rcall delay_1s
    rjmp loop

delay_1s:
    ldi r20, 1 ; about 1 second delay
    ; ldi r20, 20 ; about 0.5 second delay
    delay1: ldi r21, 250
    delay2: ldi r22, 250
    delay3: dec r22
    nop
    brne delay3
    dec r21
    brne delay2
    dec r20
    brne delay1
    ret


run_1000:
    ldi r24, low(1000)
    ldi r25, high(1000)
    
    run_1000_loop:
        add r23, r24
        sbiw r24, 1
        brne run_1000_loop
    ret