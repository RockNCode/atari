    PROCESSOR 6502

    include "vcs.h"
    include "macro.h"

    SEG code

    org $F000       ; rom origin
START:
    CLEAN_START     ; Macro to safely clear the memory
LOOP:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Set background luminanosity to yellow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDA #$1E        ; Load accumulator with yellow color
    STA COLUBK      ; Store A to BG address
    JMP LOOP       ; Repeat unconditionally

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill rom size to 4kb
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ORG $FFFC
    .word START
    .word START

