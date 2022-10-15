  section .text
  global  _start

_start:
  mov ecx,  ndata1  ; data1.length
  mov esi,  data1   ; data1

check:
  cmp ecx,  0
  je  block0
  dec ecx
  cmp [esi],  dword 255
  jg  endp

  add esi,  4
  jmp check

block0:
  mov edi,  data2   ; data2

  cmp ecx,  0
  je  maxblock
  dec ecx       ; ecx--
  
  mov eax,  [esi]   ; eax = data1[i]
  mov ebx,  4

  mul ebx           ; data1[i] * 4 = edx eax
  mov edx,  0
  
  add edi,  eax
  add [edi],  dword 1 ; data2[data[i]]++
  add esi,  4
  jmp block0

   
maxblock:
  mov eax,  data2
  mov ecx,  ndata2
  mov ebx,  0        ; 最瀕値
  loop0:
    cmp ecx,  0
    je  searchblock

    cmp [eax],  ebx   ; data2[i] >= max
    jg true
    ; False
    dec ecx
    add eax,  4
    jmp loop0

    true:
      mov ebx,  [eax] ; max = data2[i]
      dec ecx
      add eax,  4
      jmp loop0

searchblock:
  mov eax,  data2
  mov ecx,  ndata2
  mov edx,  ebx     ; max
  mov ebx,  0       ; value
  loop1:
    cmp ecx,  0
    je  endp
    
    cmp [eax],  edx  ; data2 == max
    je  endp

    inc ebx
    add eax,  4
    dec ecx 
    jmp loop1
    

endp:
  mov eax,  1
  int 0x80

  section .data
data1:  dd    3,1,4,5,9,2000000000
ndata1: equ   ($ - data1)/4  
data2:  times 256 dd 0      
ndata2: equ   ($ - data2)/4
