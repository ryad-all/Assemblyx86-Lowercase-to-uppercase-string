;Ryad alla - 40227731
section .data
phrase db 'juMping JAck flaSh #1',10, 0
space db '  '
section .text
        global _start
_start:
        
        mov eax,4       ; The system call for write (sys_write)
        mov ebx,1       ; File descriptor 1 - standard output
        mov ecx,phrase  ; Put the address of the string in ecx
        mov edx,22      ; Put number of characters to write in edx
                        ; string contains 13 characters in total
        int 80h         ; Call the interrupt routine which
                        ; performs the display of the characters
 
        mov esi, 0      ; clear the souce index pointer which gets the offset ;address within the memory
        mov ecx, 21     ;go through the 21 characters of the pharase
        mov edx, phrase ; move base offset address of the message in ebp
        

; loop through the string

_ryad:  mov al, [edx+esi] ; fetch character in data segment and store in                               ;accumulator
        cmp al, 0;
        je _exit        ; if al contains 0x00, it means we reached the end of                 ;string and stops the loop
        cmp al, 'a'     ; compare al with 0x61 which is the 'a' in ascii table
        jl next         ; if its lower than 61 it means no need to convert the              ;character and loop through next element
        cmp al, 'z'     ; compare al with 0x7A which is the 'z' in ascii table
        jg next         ; if it is
lowercase: sub al, 32   ; if the jumps dont execute, it will switch to                             ; uppercase
           mov [edx+esi], al ; write upper case in memory
next:   inc esi; next character
        jmp _ryad ; next element
        
        

_exit:
         
        mov eax,4       ; The system call for write (sys_write)
        mov ebx,1       ; File descriptor 1 - standard output
        mov ecx,phrase  ; Put the address of the string in ecx
        mov edx,22      ; Put number of characters to write in edx
                        ; string contains 13 characters in total
        int 80h         ; Call the interrupt routine which
                        ; performs the display of the characters
