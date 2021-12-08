    PROCESSOR 6502
    
    SEG code
    ORG $F000   ; Define the code origin at addess $F000

Start:          ; alias to address $F000
    SEI         ; Disable interrupts
    CLD         ; Disable the BCD decimal math mode
    LDX #$FF    ; Loads x register with #$FF
    TXS         ; Transfers the x register to the stack pointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear page zero region of memory ($00 to $FF)
; Meanining the RAM and TIA registers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    LDA #0      ; A = 0
    LDX #$FF    ; X = #$FF

MemLoop:
    STA $0,X    ; Store the value of A at memory address $0 + X
    DEX         ; X--
    BNE MemLoop ; if x != 0 go to MemLoop (z flag is set)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill the ROM size to 4kb
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ORG $FFFC   ; Set origin to the end of cartdridge
    .word Start ; Reset vector at FFFC
    .word Start ; Interrupt vector at FFFE (unused in the VCS)