  section .text
  global  _start
_start
  mov eax,  data1
  mov ebx,  data1
  mov ecx,  ndata
  add ebx,  ecx
  sub ebx,  4
loop0:
  cmp ecx,  0
  je  endp
  
  mov edi,  [eax]
  mov esi,  [ebx]

endp:
  mov eax,  1
  int 0x80

  section .data
data1 dd 1,2,3,4,5
ndata equ ($ - data1)/4
