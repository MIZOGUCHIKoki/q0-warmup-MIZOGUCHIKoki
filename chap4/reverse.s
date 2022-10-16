  section .text
  global  _start

_start:
  mov eax,  data1
  mov ecx,  ndata
  mov edx,  data2

loop:
  cmp ecx,  0
  je  setdatap
  
  mov edi,  [eax]
  mov [edx + (ecx - 1)*4],  eax   ; data2[ndata-i] = data1[i]
  dec ecx
  add eax,  4
  jmp loop

setdatap:
  mov ecx,  ndata
setdata:
  cmp ecx,  0
  jnp endp
  dec ecx

  mov esi,      [edx]
  mov eax,      esi
  jmp setdata

endp:
  mov eax,  1
  mov ebx,  0
  int 0x80
  

  section .data
data1:  dd    3,1,4,1,5,9,2
ndata:  equ   ($ -data1)/4
data2:  times ndata dd 0
