  ;; 123を終了コードとして出力するあまり意味のないプログラム
  section   .text
  global    _start
_start:
  mov   eax, 1    ; システムコール番号
  mov   ebx, 123  ; 終了コード
  int   0x80      ; exitシステムコール
