        ; 123を終了コードとして出力するあまり意味のないプログラム
        section .text
        global  _start
_start:
        mov     ebx, 123        
        add     ebx, 45         
        sub     ebx, 67
        add     ebx, 8
        sub     ebx, 9
        mov     eax, 1          ;システムコール
        int     0x80            ;exitシステムコール
