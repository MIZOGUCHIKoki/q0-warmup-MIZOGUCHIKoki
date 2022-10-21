section .text
global  _start

_start:
  mov eax,  4 ; write システムコール番号
  mov ebx,  1 ; 出力先番号
  mov ecx,  msg ; 文字列の先頭番地
  mov edx,  msglen  ; 文字列のバイト数
  int 0x80

  mov eax,  1 ; exit システムコール番号
  mov ebx,  0 ; 終了コード
  int 0x80

msg:    db  "I'm fine.", 0x0a
msglen: equ $ - msg


