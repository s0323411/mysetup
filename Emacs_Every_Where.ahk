;;  �]?�ϥ� Emacs�A����L�{���L�k�M�ΰ򥻪��ֳt��ӷP�줣��K�A��ӷQ�� Auto Hot Key �o��ť���n�[�o�S�����չL�������AGoogle ���F�@�ǳ]�w�n�� Script�A�ק�F�@�ǲŦX�ڦۤv�ߺD�����A�j�����{�����i�H�ɨ� Emacs �ֳt�䪺��K�F�A�u�O�P�º����W����̵L�p�����ɡI

;; �ɮ׬O Copy �U�����]�w
;; https://github.com/usi3/emacs.ahk/blob/master/emacs.ahk
;; https://github.com/boblu/EmacsEverywhere

;; �]�w�U�����{���ϥΤU�� AHK ���]�w�A���Ӥ��γ]�w���W�檺�A���L�i�঳�ǳ]�w���~�A�ɭP Emacs �ֳt�䦳�����L�k�ާ@�A�u�n��ݭn���[�J�զW��A�קK Emacs �L�k�ϥΡC���ӷQ�n�������ƹ��@�˥[�J�ഫ���ֳt��A���O�Q��j�������p���|�ܰʡA�N���[�F�A�ϥ��b�t�ΦC�ϥܫ��k��i�H�ܤ�K���Ȱ��C

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
;; �ֳt���`��
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

;; C-/	Undo �٭�
;; C-d	Delete character after cursor
;; M-d	Delete word after cursor
;; C-h   �R���e�@�Ӧr��
;; M-h  �R���e�@�Ӧr
;; C-k	Kill line  �b�R���C�Ы᭱���r��
;; M-k   copy line �ƻs��
;; C-w	Cut region
;; M-w	Copy region
;; C-y	Paste (no kill ring, so don��t get full Emacs yank ability)

;; M-a  ����
;; C-r    �j�M

;; C-j   �U�@��åB�Y�� 
;; C-m   Return / Enter / �U�@��
;; C-o   ���J�@��

;; C-g   ESC �]�����^
;; C-q   Alt+F4�]���}�^

;; �����ƹ� �k�䪺Win+W/S/A/D  => �W�U���k�A�k�䪺Win+Q/E => ���k��

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  ����   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ���k
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

; �W�U
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

; ���ʥy���y��
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

;; �峹�̶}�Y/�̵���
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
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  �R��  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   �j�M    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ctrl+R - Search 
^r::
{
  Send ^f
  global is_pre_spc = 0
  Return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; �ŤU/�ƻs/�K�W/�٭�     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;;;;;;;;; ���� ;;;;;;;;;;;;;;;;;;;;
!a::
Send, ^a ; select all text with 'control + a'
return


;;;;;;;;;;;;;;;;;;;;;; �ƻs�� �R���� ;;;;;;;;;;;;;;;;;;;;


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

;;;;;;;;;;;;;;;;;;;; ���� / ���}  ;;;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;;;;;;; �����ƹ� ;;;;;;;;;;;;;;;;;
; Marcus Friday
;; �ε������@�ֳt��AWin+D ���^��ୱ�|�Q�л\
;;  #�e�� < �N��������A >�N��k������
;; R �e�����Ʀr�N��t�סA1 �̧֡A100 �̺C

;; Ins::Suspend  ;; ���U insert �ܴ��ާ@
;; >#w::MouseMove, 0, -20, 1, R  ;; �W
;; >#s::MouseMove, 0, 20, 1, R   ;;  �U
;; >#a::MouseMove, -20, 0, 1, R  ;; ��
;; >#d::MouseMove, 20, 0, 1, R	;; �k
;; >#q::Send, {LButton}  ;; ����
;; Return
;; >#e::Send, {RButton} ;;  �k��
;; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; �W�@��/�U�@��
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



