;;  因為使用 Emacs，對於其他程式無法套用基本的快速鍵而感到不方便，後來想到 Auto Hot Key 這個聽說好久卻沒有嘗試過的神器，Google 找到了一些設定好的 Script，修改了一些符合我自己習慣的鍵位，大部分程式都可以享受 Emacs 快速鍵的方便了，真是感謝網路上高手們無私的分享！

;; 檔案是 Copy 下面的設定
;; https://github.com/usi3/emacs.ahk/blob/master/emacs.ahk
;; https://github.com/boblu/EmacsEverywhere

;; 設定下面的程式使用下面 AHK 的設定，本來不用設定此名單的，不過可能有些設定有誤，導致 Emacs 快速鍵有部分無法操作，只好把需要的加入白名單，避免 Emacs 無法使用。本來想要像模擬滑鼠一樣加入轉換的快速鍵，但是想到大部分情況不會變動，就不加了，反正在系統列圖示按右鍵可以很方便的暫停。

GroupAdd, editor, ahk_exe thunderbird.exe
GroupAdd, editor, ahk_exe notepad++.exe
GroupAdd, editor, ahk_exe notepad.exe
GroupAdd, editor, ahk_exe Q-Dir.exe
GroupAdd, editor, ahk_exe Skype.exe
GroupAdd, editor, ahk_class EVERYTHING
GroupAdd, editor, ahk_exe LINE.exe
GroupAdd, editor, ahk_exe soffice.bin
GroupAdd, editor, ahk_exe explorer.exe
GroupAdd, editor, ahk_exe mmex.exe
GroupAdd, editor, ahk_exe ApplicationFrameHost.exe  ;EDGE

#IfWinActive, ahk_group editor

;; =============================
;; 快速鍵總表
;; C-p	Previous line (move up)
;; C-n	Next line (move down)
;; C-f	Forward one character (move right) Note: conflicts with normal "find" shortcut
;; C-b	Back one character (move left) Note: conflicts with normal "bold" shortcut
;; M-f	Forward one word
;; M-b	Back one word
;; C-a	Start of line Note: conflicts with normal "Select all" shortcut
;; C-e	End of line
;; C-<	Start of page
;; C->	End of page

;; C-/	Undo 還原
;; C-d	Delete character after cursor
;; M-d	Delete word after cursor
;; C-h   刪除前一個字元
;; M-h  刪除前一個字
;; C-k	Kill line  在刪除遊標後面的字串
;; M-k   copy line 複製行
;; C-w	Cut region
;; M-w	Copy region
;; C-y	Paste (no kill ring, so don’t get full Emacs yank ability)

;; M-a  全選
;; C-r    搜尋

;; C-j   下一行並且縮排 
;; C-m   Return / Enter / 下一行
;; C-o   插入一行

;; C-g   ESC （取消）
;; C-q   Alt+F4（離開）

;; 模擬滑鼠 右邊的Win+W/S/A/D  => 上下左右，右邊的Win+Q/E => 左右鍵

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  移動   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 左右
; Ctrl+B - Character backward
^b::
  Send, {Left %numericPrefix% }
  ctrlXPrefix = 0
  numericPrefix = 1
  return

  ; Ctrl+F - Character forward
^f::
  Send, {Right %numericPrefix% }
  ctrlXPrefix = 0
  numericPrefix = 1
  return

; Alt+B - Word backward
!b::
  Send, ^{Left %numericPrefix% }
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; Alt+F - Word forward
!f::
  Send, ^{Right %numericPrefix% }
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; 上下
; Ctrl+P - Line up
^p::
  Send, {Up %numericPrefix% }
  ctrlXPrefix = 0
  numericPrefix = 1
  return
  
; Ctrl+N - Line down
^n::
  Send, {Down %numericPrefix% }
  ctrlXPrefix = 0
  numericPrefix = 1
  return
;^n:: SendAndClearNumericArg("{Down " . numericPrefix . "}", numericPrefix)

; 移動句首句尾
; Ctrl+A - Start of line
^a::
  Send, {Home}
  ctrlXPrefix = 0
  numericPrefix = 1
  return

; Ctrl+E - End of line
^e::
  Send, {End}
  ctrlXPrefix = 0
  numericPrefix = 1
  return

;; 文章最開頭/最結尾
; Shift+Alt+, - Start of document
+!,::
  Send, ^{Home}
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; Shift+Alt+. - End of document
+!.::
  Send, ^{End}
  numericPrefix = 1
  ctrlXPrefix = 0
  return
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  刪除  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

; Ctrl+D - Delete character forward
^d::
  Send, {Delete}
  ctrlXPrefix = 0
  numericPrefix = 1
  return

; Alt+D - Delete word forward
!d::
  Send, ^{Delete %numericPrefix% }
  numericPrefix = 1
  ctrlXPrefix = 0
  return
  
; Ctrl+H - Delete character backward
^h::
  Send, {Backspace}
  ctrlXPrefix = 0
  numericPrefix = 1
  return 

; Alt+H - Delete word backward
!h::
  Send, ^{Backspace %numericPrefix% }
  numericPrefix = 1
  ctrlXPrefix = 0
  return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   搜尋    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ctrl+R - Search 
^r::
{
  Send ^f
  global is_pre_spc = 0
  Return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 剪下/複製/貼上/還原     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ctrl+W - Cut
^w::
  Send, ^{x}
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; Alt+W - Copy
!w::
  Send, ^{c}
  numericPrefix = 1
  ctrlXPrefix = 0
  return

; Ctrl+Y - Paste
^y::
  Send, ^{v}
  numericPrefix = 1
  ctrlXPrefix = 0
  return
   
; Ctrl+/ - Undo
^/::
  Send, ^{z}
  numericPrefix = 1
  ctrlXPrefix = 0
  return 

;;;;;;;;;;;;;;;;;;;;;; 全選 ;;;;;;;;;;;;;;;;;;;;
!a::
Send, ^a ; select all text with 'control + a'
return


;;;;;;;;;;;;;;;;;;;;;; 複製行 刪除行 ;;;;;;;;;;;;;;;;;;;;


;;;;;;;; Ctrl+K - Kill Line
^k::
{
  Send {ShiftDown}{END}{SHIFTUP}
  Sleep 10 ;[ms] this value depends on your environment
  Send ^x
  global is_pre_spc = 0
  Return
}

;;;;;;;; Alt+K - Copy Line
!k::
Send {HOME}+{END}^c{END}


^j::  ; Ctrl+J - Next Line and Indent
newline_and_indent() 
{
	Send {Enter}{Tab}
	global is_pre_spc = 0
	Return
}


^m:: ; Ctrl+M - Next Line
  Send, {Return}
  ctrlXPrefix = 0
  numericPrefix = 1
  return

; Ctrl+O - Open line above
^o::
Send {HOME}+{Return}{Up}

;;;;;;;;;;;;;;;;;;;; 取消 / 離開  ;;;;;;;;;;;;;;;;;
^g::
{
Send {ESC}
global is_pre_spc = 0
Return
}

^q::
{
Send !{F4}
global is_pre_x = 0
Return
}

;;;;;;;;;;;;;;;;;;;; 模擬滑鼠 ;;;;;;;;;;;;;;;;;
;; 用視窗鍵當作快速鍵，Win+D 的回到桌面會被覆蓋
;;  #前面 < 代表左視窗鍵， >代表右視窗鍵
;; R 前面的數字代表速度，1 最快，100 最慢

;; Ins::Suspend  ;; 按下 insert 變換操作
;; >#w::MouseMove, 0, -20, 1, R  ;; 上
;; >#s::MouseMove, 0, 20, 1, R   ;;  下
;; >#a::MouseMove, -20, 0, 1, R  ;; 左
;; >#d::MouseMove, 20, 0, 1, R	;; 右
;; >#q::Send, {LButton}  ;; 左鍵
;; Return
;; >#e::Send, {RButton} ;;  右鍵
;; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 上一頁/下一頁
; Ctrl+V - Page down
;^v::
;  Send, {PgDn}
;  numericPrefix = 1
;  ctrlXPrefix = 0
;  return

; Alt+V - Page up
;!v::
;  Send, {PgUp}
;  numericPrefix = 1
;  ctrlXPrefix = 0
;  return



