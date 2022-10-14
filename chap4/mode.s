  section .text
  global  _start

_start:
    mov eax, data1    ; data1[iw]
    mov ebx, data2    ; data2[jw]
    mov ecx, ndata1   ; data1.length
    mov edx, 0        ; iw
    mov esi, ndata2   ; data2.length

loop0:
    mov edi, 0        ; jw = 0
    loop01:
        cmp [eax], edi  ; data1[iw] == jw
        je loop011
        jmp loop012
        loop011:
            add [ebx], dword 1  ; data2[jw]++
        loop012:
            inc edi             ; jw++
            add ebx, 4          ; data2[jw++]
            cmp esi, edi        ; data2.length > jw
            jg loop01           ; not break
    inc edx       ; iw++
    add eax, 4    ; data1[iw++]
    cmp ecx, edx  ; data1.length <= iw
    jle block1

block1:
    mov edx,  0   ;iw
    mov edi,  0   ;max
    mov eax,  data2 ; data2[iw]

    loop1:
        cmp edi,  [eax] ; max <= data2[iw]
        jg  loop11
        mov edi,  [eax] ; max = data2[iw]
        loop11:
            cmp edi, esi; iw <= data2.length
            jle endp
        inc edx
        add eax, 4
        jmp loop1
endp:
    mov ebx,  edi
    mov eax,  1
    int 0x80

  section .data
data1:  dd    3, 1, 4, 5, 9, 2
ndata1: equ   ($ - data1)/4  
data2:  times 256 dd 0      
ndata2: equ   ($ - data2)/4
