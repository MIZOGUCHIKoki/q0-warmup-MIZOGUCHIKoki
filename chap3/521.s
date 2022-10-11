  ;5以上21以下の整数の和を計算する．
  section .text
  global  _start

_start:
  mov   ebx, 5    ; sum
  mov   ecx, 1    ; i

loop0:
  add   ebx, ecx  ; ebx = ebx + ecx
  inc   ecx       ; i++
  cmp   ecx, 21   ; ecx compare 21 
  jle   loop0     ; Jump if Less or Equal (ecx <= 10)

  mov   eax, 1    
  int   0x80
