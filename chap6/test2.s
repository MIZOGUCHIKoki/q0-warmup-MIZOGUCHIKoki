  ;; "9876543210"を出力
ndigit: equ 10    ; 出力する桁数

  section .text
  global  _start
_start:
  mov ecx,  buf + ndigit  ; 作業領域の末尾の次の番地
  mov edx,  ndigit        ; ループ回数
  mov al,   '0'           ; 文字0

  ; 領域 buf に "9876543210" を書き込む
loop0:
  dec ecx                 ; 次の書き込み先
  mov [ecx],  al          ; 作業領域に1文字書き込む
  inc al                  ; 次の文字を定義
  dec edx                 ; 残りの文字数
  jnz loop0               ; 残りの文字数 > 0 -> loop0

  mov eax,  4             ; write システムコール番号
  mov ebx,  1             ; 出力先番号（1=標準出力）
  mov edx,  ndigit + 1    ; 改行を含めた長さ
  int 0x80
  mov eax,  1
  mov ebx,  0
  int 0x80

  section .data
buf:  times ndigit  db  0 ; ndigitバイト領域
      db  0x0a            ; 改行
