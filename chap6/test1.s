section .text
global  _start

_start:
  mov eax,  4 ; write $B%7%9%F%`%3!<%kHV9f(B
  mov ebx,  1 ; $B=PNO@hHV9f(B
  mov ecx,  msg ; $BJ8;zNs$N@hF,HVCO(B
  mov edx,  msglen  ; $BJ8;zNs$N%P%$%H?t(B
  int 0x80

  mov eax,  1 ; exit $B%7%9%F%`%3!<%kHV9f(B
  mov ebx,  0 ; $B=*N;%3!<%I(B
  int 0x80

msg:    db  "I'm fine.", 0x0a
msglen: equ $ - msg


