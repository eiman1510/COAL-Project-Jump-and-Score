[org 0x0100]
jmp Intro


;---------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------


min_leftleg: dw 61270
min_rightleg: dw 61283
min_head: dw 54230
brickyes: dw 0
score : dw 00
time1: dw 00
time2:dw 00
blue_time: dw 0
oldisr: dd 0
oldtimer: dd 0
 msg1:dw 'JUMP AND SCORE'
 roll1:dw 'EIMAN ASIF 22L-6865'
 roll2:dw 'SHAHER BANO 22L-6957'
 msg2: dw 'CATCH THE CHERRIES TO EARN POINTS'
 msg3: dw'MAKE SURE TO JUMP ON THE BRICK'
 msg4: dw'BEAWARE OF THE BLUE BRICK'
 msg5: dw'(They might disappear)'
 msg6:dw'BEST OF LUCKK'
 msg7:dw 'PRESS ENTER TO START THE GAME'
 cnfrm: dw'CONFIRM  EXIT?'
endkey: dw 0
gamepause: dw 0
 
 
 ;--------------------------------------------------------------------------------------
 ;-------------------- active only in the intro screen---------------------------------

 
 ;-------------------- the minion on the intro screen---------------------------------------
 start_min:
MOV Ax,40h
 MOV BX,0A000H ;
MOV ES,BX ;
mov bx,320*116
add bx,284
mov cx,72
mov dx,88
s_m1:
mov byte[es:bx],0eh
add bx,1
loop s_m1
add bx,320-72
mov cx,72
sub dx,1
jne s_m1
mov bx,320*116
add bx,284
add bx,16
sub bx,320*16
mov cx,40
mov dx,8
s_m2:
mov byte[es:bx],0eh
add bx,1
loop s_m2
add bx,320-40
mov cx,40
sub dx,1
jne s_m2
sub bx,8
mov cx,56
mov dx,8
s_m3:
mov byte[es:bx],0eh
add bx,1
loop s_m3
add bx,320-56
mov cx,56
sub dx,1
jne s_m3

add bx,8
mov cx,16
mov dx,8
mov si,2
mov di,2
s_m4:
mov byte[es:bx],17h
add bx,1
loop s_m4
add bx,320-16
mov cx,16
sub dx,1
jne s_m4
sub bx,320*8
add bx,24
mov cx,16
mov dx,8
sub si,1
jne s_m4
sub bx,48
add bx,320*24
mov cx,16
mov dx,8
mov si,2
sub di,1
jne s_m4

mov bx,320*124
add bx,284
mov cx,72
mov dx,16
s_m6:
mov byte[es:bx],00h
add bx,1
loop s_m6
add bx,320-72
mov cx,72
sub dx,1
jne s_m6

mov bx,320*124
add bx,292
mov cx,56
mov dx,16
s_m5:
mov byte[es:bx],17h
add bx,1
loop s_m5
add bx,320-56
mov cx,56
sub dx,1
jne s_m5

mov bx,320*124
add bx,284+16
mov cx,16
mov dx,16
mov si,2
s_m7:
mov byte[es:bx],0fh
add bx,1
loop s_m7
add bx,320-16
mov cx,16
sub dx,1
jne s_m7
sub bx,320*16
add bx,24
mov cx,16
mov dx,16
sub si,1
jne s_m7


mov bx,320*132
add bx,284+16+8
mov cx,8
mov dx,8
mov si,2
s_m8:
mov byte[es:bx],00h
add bx,1
loop s_m8
add bx,320-8
mov cx,8
sub dx,1
jne s_m8
sub bx,320*8
add bx,16
mov cx,8
mov dx,8
sub si,1
jne s_m8


mov bx,320*156
add bx,284+16
mov cx,40
mov dx,16

s_m9:
mov byte[es:bx],00h
add bx,1
loop s_m9
add bx,320-40
mov cx,40
sub dx,1
jne s_m9

sub bx,320*8
add bx,8
mov si,22
mov cx,si
mov dx,8
mov di,2
s_m10:
mov byte[es:bx],0ch
add bx,1
loop s_m10
add bx,320
sub bx,si
mov cx,si
sub dx,1
jne s_m10
add bx,8
sub si,8
mov cx,si
mov dx,8
sub di,1
jne s_m10

sub bx,320*8
sub bx,40
mov cx,8
mov dx,8
mov di,2
s_m11:
mov byte[es:bx],09h
add bx,1
loop s_m11
add bx,320-8
mov cx,8
sub dx,1
jne s_m11
sub bx,320*8
add bx,64
mov cx,8
mov dx,8
sub di,1
jne s_m11

add bx,320*8
sub bx,64+56
mov cx,56
mov dx,8
s_m12:
mov byte[es:bx],09h
add bx,1
loop s_m12
add bx,320-56
mov cx,56
sub dx,1
jne s_m12

add bx,8
mov cx,40
mov dx,12
s_m13:
mov byte[es:bx],09h
add bx,1
loop s_m13
add bx,320-40
mov cx,40
sub dx,1
jne s_m13


ret

;---------------------------print roll numbers and instrcutions using bios interrupt--------------------------


text_printing:
mov ah, 0x13 ; service 13 - print string 
 mov al, 1 ; subservice 01 – update cursor 
 mov bh, 0 ; output on page 0 
 mov bl, 3 ; normal attrib 
 mov dx, 0x020E ; row 10 column 3 
 mov cx, 14 ; length of string 
 push cs 
 pop es ; segment of string 
 mov bp, msg1 ; offset of string 
 int 0x10
 
 mov ah, 0x13 ; service 13 - print string 
 mov al, 1 ; subservice 01 – update cursor 
 mov bh, 0 ; output on page 0 
 mov bl, 5 ; normal attrib 
 mov dx, 0x040C ; row 10 column 3 
 mov cx, 19 ; length of string 
 push cs 
 pop es ; segment of string 
 mov bp, roll1 ; offset of string 
 int 0x10
 
  mov ah, 0x13 ; service 13 - print string 
 mov al, 1 ; subservice 01 – update cursor 
 mov bh, 0 ; output on page 0 
 mov bl, 5 ; normal attrib 
 mov dx, 0x060B ; row 10 column 3 
 mov cx, 20 ; length of string 
 push cs 
 pop es ; segment of string 
 mov bp, roll2 ; offset of string 
 int 0x10
 
  mov ah, 0x13 ; service 13 - print string 
 mov al, 1 ; subservice 01 – update cursor 
 mov bh, 0 ; output on page 0 
 mov bl, 4 ; normal attrib 
 mov dx, 0x0805 ; row 10 column 3 
 mov cx, 33 ; length of string 
 push cs 
 pop es ; segment of string 
 mov bp, msg2 ; offset of string 
 int 0x10
 
 mov ah, 0x13 ; service 13 - print string 
 mov al, 1 ; subservice 01 – update cursor 
 mov bh, 0 ; output on page 0 
 mov bl, 6 ; normal attrib 
 mov dx, 0x0A06 ; row 10 column 3 
 mov cx, 30 ; length of string 
 push cs 
 pop es ; segment of string 
 mov bp, msg3 ; offset of string 
 int 0x10
 
 mov ah, 0x13 ; service 13 - print string 
 mov al, 1 ; subservice 01 – update cursor 
 mov bh, 0 ; output on page 0 
 mov bl, 1 ; normal attrib 
 mov dx, 0x0C07 ; row 10 column 3 
 mov cx, 25 ; length of string 
 push cs 
 pop es ; segment of string 
 mov bp, msg4 ; offset of string 
 int 0x10
 
 mov ah, 0x13 ; service 13 - print string 
 mov al, 1 ; subservice 01 – update cursor 
 mov bh, 0 ; output on page 0 
 mov bl, 1 ; normal attrib 
 mov dx, 0x0D09 ; row 10 column 3 
 mov cx, 22 ; length of string 
 push cs 
 pop es ; segment of string 
 mov bp, msg5 ; offset of string 
 int 0x10
 
 mov ah, 0x13 ; service 13 - print string 
 mov al, 1 ; subservice 01 – update cursor 
 mov bh, 0 ; output on page 0 
 mov bl, 2 ; normal attrib 
 mov dx, 0x0F0D ; row 10 column 3 
 mov cx, 13 ; length of string 
 push cs 
 pop es ; segment of string 
 mov bp, msg6 ; offset of string 
 int 0x10
 
  mov ah, 0x13 ; service 13 - print string 
 mov al, 1 ; subservice 01 – update cursor 
 mov bh, 0 ; output on page 0 
 mov bl, 7 ; normal attrib 
 mov dx, 0x1306 ; row 10 column 3 
 mov cx, 29 ; length of string 
 push cs 
 pop es ; segment of string 
 mov bp, msg7 ; offset of string 
 int 0x10
ret
;--------------------------------------------------------------------------------------
;---------------------------------the INTRO SCREEN---------------------------------

Intro:
MOV AX,0013H
 INT 10H
 call start_min
 call text_printing
chck1:
in al, 0x60

cmp al, 0x9c
je main

jmp chck1


;--------------------------------------------------------------------------------------
;----------------------the loading screen ------------------------------------

eye:
MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX
push bp
mov bp,sp
pusha
mov bx,[bp+4]
mov si,2
mov cx,4*5
mov dx,5
x4:
mov byte[es:bx],17h
add bx,1
loop x4
add bx,320-20
mov cx,20
sub dx,1
jne x4
mov cx,20
mov dx,5
add bx,30*320
sub si,1
jne x4
sub bx,65*320
add bx,5
mov dx,5
mov cx,10
mov si,2
x5:
mov byte[es:bx],0fh
add bx,1
loop x5
mov cx,10
add bx,320-10
sub dx,1
jne x5
add bx,320*20
mov cx,10
mov dx,5
sub si,1
jne x5

sub bx,50*320
sub bx,10
mov dx,5
mov cx,10
mov si,2
mov ax,2
x6:
mov byte[es:bx],17h
add bx,1
loop x6
mov cx,10
add bx,320-10
sub dx,1
jne x6
sub bx,320*5
add bx,20
mov cx,10
mov dx,5
sub si,1
jne x6
sub bx,40
add bx,320*25
mov cx,10
mov dx,5
mov si,2
sub ax,1
jne x6

sub bx,320*45
add bx,5
mov dx,5
mov cx,5
mov si,2
mov ax,2
x7:
mov byte[es:bx],0fh
add bx,1
loop x7
mov cx,5
add bx,320-5
sub dx,1
jne x7
sub bx,320*5
add bx,15
mov cx,5
mov dx,5
sub si,1
jne x7
sub bx,30
add bx,320*15
mov cx,5
mov dx,5
mov si,2
sub ax,1
jne x7

sub bx,320*30
sub bx,10
mov dx,5
mov cx,10
mov si,2
mov ax,2
x8:
mov byte[es:bx],17h
add bx,1
loop x8
mov cx,10
add bx,320-10
sub dx,1
jne x8
sub bx,320*5
add bx,30
mov cx,10
mov dx,5
sub si,1
jne x8
sub bx,60
add bx,320*15
mov cx,10
mov dx,5
mov si,2
sub ax,1
jne x8


sub bx,320*25
mov cx,5
mov dx,10
mov di,2
x9:
mov byte[es:bx],17h
add bx,1
loop x9
add bx,320-5
mov cx,5
sub dx,1
jne x9
sub bx,320*10
add bx,35
mov cx,5
mov dx,10
sub di,1
jne x9

sub bx,65
mov cx,5
mov dx,10
mov di,2
x10:
mov byte[es:bx],0fh
add bx,1
loop x10
add bx,320-5
mov cx,5
sub dx,1
jne x10
sub bx,320*10
add bx,25
mov cx,5
mov dx,10
sub di,1
jne x10

sub bx,45
mov cx,20
mov dx,10
x11:
mov byte[es:bx],00h
add bx,1
loop x11
add bx,320-20
mov cx,20
sub dx,1
jne x11

sub bx,320*15
add bx,5
mov dx,5
mov cx,10
mov si,2
x12:
mov byte[es:bx],00h
add bx,1
loop x12
add bx,320-10
mov cx,10
sub dx,1
jne x12
add bx,320*10
mov cx,10
mov dx,5
sub si,1
jne x12

sub bx,320*25
mov cx,5
mov dx,5
x13:
mov byte[es:bx],0fh
add bx,1
loop x13
add bx,320-5
mov cx,5
sub dx,1
jne x13
popa
pop bp
ret 2

;############-----------------------------#################################


min_body:

MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX
push bp
mov bp,sp
pusha
mov bx,[bp+4]
mov cx,55
mov dx,60
y1:
mov byte[es:bx],0eh
add bx,1
loop y1
add bx,320-55
mov cx,55
sub dx,1
jne y1

mov bx,[bp+4]
add bx,320*5
sub bx,5
mov cx,5
mov dx,50
mov si,2
y2:
mov byte[es:bx],0eh
add bx,1
loop y2
add bx,320-5
mov cx,5
sub dx,1
jne y2
sub bx,320*50
add bx,60
mov cx,5
mov dx,50
sub si,1
jne y2

mov bx,[bp+4]
add bx,320*55
sub bx,5
mov dx,5
mov cx,5
y8:
mov byte[es:bx],2bh
add bx,1
loop y8
add bx,320-5
mov cx,5
sub dx,1
jne y8

add bx,5
mov dx,5
mov cx,55
y9:
mov byte[es:bx],2bh
add bx,1
loop y9
add bx,320-55
mov cx,55
sub dx,1
jne y9
popa
pop bp
ret 2

minOne:
MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX
mov bx,320*10
add bx,95
push bx
call min_body


mov di,320*35
add di,90
mov cx,13*5
mov dx,10
m_o1:
mov byte[es:di],00h
add di,1
loop m_o1
add di,320-65
mov cx,65
sub dx,1
jne m_o1

mov cx,60
mov dx,5
m_o2:
mov byte[es:di],2bh
add di,1
loop m_o2
add di,320-60
mov cx,60
sub dx,1
jne m_o2

sub di,320*10
add di,60
mov cx,5
mov dx,5
m_o3:
mov byte[es:di],2bh
add di,1
loop m_o3
add di,320-5
mov cx,5
sub dx,1
jne m_o3

sub di,320*15
mov cx,5
mov dx,5
m_o4:
mov byte[es:di],00h
add di,1
loop m_o4
add di,320-5
mov cx,5
sub dx,1
jne m_o4

mov di,320*60
add di,105
mov cx,35
mov dx,5
m_o5:
mov byte[es:di],00h
add di,1
loop m_o5
add di,320-35
mov cx,35
sub dx,1
jne m_o5


mov ax,320*15
add ax,110
push ax
call eye
ret 2

minTwo:
MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX
mov bx,320*10
add bx,180
push bx
call min_body

mov di,320*40
add di,175
mov cx,65
mov dx,10
m_t1:
mov byte[es:di],2bh
add di,1
loop m_t1
add di,320-65
mov cx,65
sub dx,1
jne m_t1

mov di,320*45
add di,205
mov cx,5
mov dx,5
m_t2:
mov byte[es:di],0eh
add di,1
loop m_t2
add di,320-5
mov cx,5
sub dx,1
jne m_t2

add di,320*5
mov cx,5
mov dx,5
m_t3:
mov byte[es:di],00h
add di,1
loop m_t3
add di,320-5
mov cx,5
sub dx,1
jne m_t3

mov ax,320*10
add ax,180
push ax
call eye
mov dx,320*10
add dx,215
push dx
call eye

ret 4

minThree:
MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX
mov bx,320*120
add bx,95
push bx
call min_body

mov di,320*130
add di,125
mov cx,25
mov dx,10
m_th1:
mov byte[es:di],00h
add di,1
loop m_th1
add di,320-25
mov cx,25
sub dx,1
jne m_th1

mov cx,25
mov dx,5
m_th2:
mov byte[es:di],2bh
add di,1
loop m_th2
add di,320-25
mov cx,25
sub dx,1
jne m_th2

add di,25
sub di,320*10
mov cx,5
mov dx,10
m_th3:
mov byte[es:di],00h
add di,1
loop m_th3
add di,320-5
mov cx,5
sub dx,1
jne m_th3

mov cx,5
mov dx,5
m_th4:
mov byte[es:di],2bh
add di,1
loop m_th4
add di,320-5
mov cx,5
sub dx,1
jne m_th4

sub di,320*5
sub di,30
mov cx,5
mov dx,5
m_th5:
mov byte[es:di],2bh
add di,1
loop m_th5
add di,320-5
mov cx,5
sub dx,1
jne m_th5

sub di,5
mov cx,5
mov dx,5
m_th6:
mov byte[es:di],2bh
add di,1
loop m_th6
add di,320-5
mov cx,5
sub dx,1
jne m_th6

sub di,20
mov cx,20
mov dx,5
m_th7:
mov byte[es:di],2bh
add di,1
loop m_th7
add di,320-20
mov cx,20
sub dx,1
jne m_th7

sub di,5
sub di,320*10
mov cx,5
mov dx,5
m_th8:
mov byte[es:di],2bh
add di,1
loop m_th8
add di,320-5
mov cx,5
sub dx,1
jne m_th8

add di,320*5
add di,50
mov cx,5
mov dx,5
m_th9:
mov byte[es:di],00h
add di,1
loop m_th9
add di,320-5
mov cx,5
sub dx,1
jne m_th9

mov cx,30
mov dx,5
m_th10:
mov byte[es:di],00h
sub di,1
loop m_th10
add di,320+30
mov cx,30
sub dx,1
jne m_th10

mov ax,320*115
add ax,95
push ax
call eye


ret 2

minFour:
MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX
mov bx,320*120
add bx,180
push bx
call min_body

mov di,320*130
add di,175
mov cx,5
mov dx,10
mf1:
mov byte[es:di],00h
add di,1
loop mf1
add di,320-5
mov cx,5
sub dx,1
jne mf1

mov cx,5
mov dx,5
mf2:
mov byte[es:di],2bh
add di,1
loop mf2
add di,320-5
mov cx,5
sub dx,1
jne mf2

sub di,320*10
add di,5
mov dx,10
mov cx,25
mf3:
mov byte[es:di],00h
add di,1
loop mf3
add di,320-25
mov cx,25
sub dx,1
jne mf3

mov dx,5
mov cx,25
mf4:
mov byte[es:di],2bh
add di,1
loop mf4
add di,320-25
mov cx,25
sub dx,1
jne mf4

add di,25
mov dx,5
mov cx,5
mf5:
mov byte[es:di],2bh
add di,1
loop mf5
add di,320-5
mov cx,5
sub dx,1
jne mf5

add di,5
mov dx,5
mov cx,5
mf6:
mov byte[es:di],2bh
add di,1
loop mf6
add di,320-5
mov cx,5
sub dx,1
jne mf6

add di,5
mov dx,5
mov cx,20
mf7:
mov byte[es:di],2bh
add di,1
loop mf7
add di,320-20
mov cx,20
sub dx,1
jne mf7

sub di,320*10
add di,20
mov dx,5
mov cx,5
mf8:
mov byte[es:di],2bh
add di,1
loop mf8
add di,320-5
mov cx,5
sub dx,1
jne mf8

sub di,320*5
sub di,50
mov dx,5
mov cx,5
mf9:
mov byte[es:di],00h
add di,1
loop mf9
add di,320-5
mov cx,5
sub dx,1
jne mf9

add di,5
mov dx,5
mov cx,5
mf10:
mov byte[es:di],00h
add di,1
loop mf10
add di,320-5
mov cx,5
sub dx,1
jne mf10

add di,5
mov dx,5
mov cx,15
mf11:
mov byte[es:di],00h
add di,1
loop mf11
add di,320-15
mov cx,15
sub dx,1
jne mf11



mov ax,320*120
add ax,215
push ax
call eye


ret 2

;---------------------------------------------------------------------------------------

;---------------- THE LOADING---------------------------------
;------------------------------------------------------------------------------------

loading:
 MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX

mov bx,320*95
add bx,115
mov cx,10
mov dx,100
load1:
mov byte[es:bx],0eh
add bx,320
loop load1
call delay
sub bx,320*10
add bx,1
mov cx,10
sub dx,1
jne load1

ret
;---------------------WRITNG THE WORLD "LOADING"--------------------------------------------

WritingLoad:
 mov ah,02h
mov bh,0
mov dh,87
mov dl,70
int 10h
mov ah,0x09
mov al,'L'
mov bx,0xf
mov cx,1
int 0x10

 mov ah,02h
mov bh,0
mov dh,87
mov dl,72
int 10h
mov ah,0x09
mov al,'O'
mov bx,0xf
mov cx,1
int 0x10

 mov ah,02h
mov bh,0
mov dh,87
mov dl,74
int 10h
mov ah,0x09
mov al,'A'
mov bx,0xf
mov cx,1
int 0x10

 mov ah,02h
mov bh,0
mov dh,87
mov dl,76
int 10h
mov ah,0x09
mov al,'D'
mov bx,0xf
mov cx,1
int 0x10

 mov ah,02h
mov bh,0
mov dh,87
mov dl,78
int 10h
mov ah,0x09
mov al,'I'
mov bx,0xf
mov cx,1
int 0x10

 mov ah,02h
mov bh,0
mov dh,87
mov dl,80
int 10h
mov ah,0x09
mov al,'N'
mov bx,0xf
mov cx,1
int 0x10

 mov ah,02h
mov bh,0
mov dh,87
mov dl,82
int 10h
mov ah,0x09
mov al,'G'
mov bx,0xf
mov cx,1
int 0x10

;####----------------------------


ret
;------------------------ the loading screen----------------------------------
main:
MOV AX,0013H
 INT 10H

call minOne
call minTwo
call minThree
call minFour
call WritingLoad
call loading
call countdown


ret
;----------------------------------------------------------------------------------------
;--------------------------end of 1st intro screen--------------------------
;-----------------------------------------------------------------------------------------
;---------------------- the countdoewn--------------------------------------

one:
MOV Ax,40h
 MOV BX,0A000H ;
MOV ES,BX ;

mov bx,320*75
add bx,155
mov cx,10
mov dx,26*2
one1:
mov byte[es:bx],00h
add bx,1
loop one1
add bx,320-10
mov cx,10
sub dx,1
jne one1

sub bx,10
mov cx,30
mov dx,10
one2:
mov byte[es:bx],00h
add bx,1
loop one2
add bx,320-30
mov cx,30
sub dx,1
jne one2

mov bx,320*75
add bx,155
add bx,320*2
sub bx,2
mov cx,2
mov dx,25*2
one3:
mov byte[es:bx],00h
add bx,1
loop one3
add bx,320-2
mov cx,2
sub dx,1
jne one3

mov bx,320*75
add bx,155
add bx,320*4
sub bx,4
mov cx,2
mov dx,7*2
one4:
mov byte[es:bx],00h
add bx,1
loop one4
add bx,320-2
mov cx,2
sub dx,1
jne one4

mov bx,320*75
add bx,155
add bx,320*6
sub bx,6
mov cx,2
mov dx,6*2
one5:
mov byte[es:bx],00h
add bx,1
loop one5
add bx,320-2
mov cx,2
sub dx,1
jne one5

mov bx,320*75
add bx,155
add bx,320*8
sub bx,10
mov cx,4
mov dx,5*2
one6:
mov byte[es:bx],00h
add bx,1
loop one6
add bx,320-4
mov cx,4
sub dx,1
jne one6

mov bx,320*75
add bx,155
add bx,320*10
sub bx,12
mov cx,2
mov dx,4*2
one7:
mov byte[es:bx],00h
add bx,1
loop one7
add bx,320-2
mov cx,2
sub dx,1
jne one7

ret

two:
MOV Ax,40h
 MOV BX,0A000H ;
MOV ES,BX ;

mov bx,320*75
add bx,155
mov cx,20
mov dx,8
two1:
mov byte[es:bx],00h
add bx,1
loop two1
mov cx,20
add bx,320-20
sub dx,1
jne two1

mov bx,320*75
add bx,155
add bx,320*2
sub bx,4
mov cx,26
mov dx,2
two2:
mov byte[es:bx],00h
add bx,1
loop two2
mov cx,26
add bx,320-26
sub dx,1
jne two2

mov bx,320*75
add bx,155
add bx,320*4
sub bx,6
mov cx,30
mov dx,2
two3:
mov byte[es:bx],00h
add bx,1
loop two3
mov cx,30
add bx,320-30
sub dx,1
jne two3

sub bx,4
mov cx,36
mov dx,4
two4:
mov byte[es:bx],00h
add bx,1
loop two4
mov cx,36
add bx,320-36
sub dx,1
jne two4

sub bx,2
mov cx,14
mov dx,4
two5:
mov byte[es:bx],00h
add bx,1
loop two5
mov cx,14
add bx,320-14
sub dx,1
jne two5

mov cx,12
mov dx,4
two6:
mov byte[es:bx],00h
add bx,1
loop two6
mov cx,12
add bx,320-12
sub dx,1
jne two6

mov cx,10
mov dx,2
two7:
mov byte[es:bx],00h
add bx,1
loop two7
mov cx,10
add bx,320-10
sub dx,1
jne two7

add bx,2
mov cx,6
mov dx,2
two8:
mov byte[es:bx],00h
add bx,1
loop two8
mov cx,6
add bx,320-6
sub dx,1
jne two8


mov bx,320*75
add bx,155
add bx,320*5
add bx,14
mov cx,12
mov dx,18
two9:
mov byte[es:bx],00h
add bx,1
loop two9
mov cx,12
add bx,320-12
sub dx,1
jne two9

sub bx,2
mov cx,12
mov dx,4
two10:
mov byte[es:bx],00h
add bx,1
loop two10
mov cx,12
add bx,320-12
sub dx,1
jne two10

sub bx,2
mov cx,12
mov dx,2
mov si,8
two11:
mov byte[es:bx],00h
add bx,1
loop two11
mov cx,12
add bx,320-12
sub dx,1
jne two11
sub bx,2
mov dx,2
mov cx,12
sub si,1
jne two11

mov ax,17*2
sub bx,2
mov cx,ax
mov dx,2
mov si,3
two12:
mov byte[es:bx],00h
add bx,1
loop two12
mov cx,ax
add bx,320
sub bx,cx
sub dx,1
jne two12
sub bx,2
mov dx,2
add ax,2
mov cx,ax
sub si,1
jne two12

add bx,2
mov cx,38
mov dx,4
two13:
mov byte[es:bx],00h
add bx,1
loop two13
mov cx,38
add bx,320-38
sub dx,1
jne two13

add bx,2
mov cx,34
mov dx,2
two14:
mov byte[es:bx],00h
add bx,1
loop two14
mov cx,34
add bx,320-34
sub dx,1
jne two14

ret

three:
MOV Ax,40h
 MOV BX,0A000H ;
MOV ES,BX ;

mov bx,320*75
add bx,155
mov ax,12*2
mov cx,ax
mov dx,2
mov si,4
three1:
mov byte[es:bx],00h
add bx,1
loop three1
mov cx,ax
add bx,320
sub bx,cx
sub dx,1
jne three1
sub bx,2
mov dx,2
add ax,4
mov cx,ax
sub si,1
jne three1

mov cx,ax
mov dx,8
three2:
mov byte[es:bx],00h
add bx,1
loop three2
mov cx,ax
add bx,320
sub bx,cx
sub dx,1
jne three2

add bx,2
sub ax,2
mov cx,ax
mov dx,2
three3:
mov byte[es:bx],00h
add bx,1
loop three3
mov cx,ax
add bx,320
sub bx,cx
sub dx,1
jne three3

mov bx,320*75
add bx,155

add bx,320*12
add bx,22
mov cx,10
mov dx,40

three4:
mov byte[es:bx],00h
add bx,1
loop three4
add bx,320-10
mov cx,10
sub dx,1
jne three4

sub bx,28
mov cx,38
mov dx,6
three5:
mov byte[es:bx],00h
add bx,1
loop three5
mov cx,38
add bx,320-38
sub dx,1
jne three5

add bx,2
mov cx,34
mov dx,2
three6:
mov byte[es:bx],00h
add bx,1
loop three6
mov cx,34
add bx,320-34
sub dx,1
jne three6

mov ax,17*2
mov cx,ax
mov dx,2
mov si,4
three7:
mov byte[es:bx],00h
add bx,1
loop three7
mov cx,ax
add bx,320
sub bx,cx
sub dx,1
jne three7
add bx,2
mov dx,2
sub ax,4
mov cx,ax
sub si,1
jne three7


mov bx,320*75
add bx,157
add bx,320*28
mov cx,30
mov dx,5
three8:
mov byte[es:bx],00h
add bx,1
loop three8
mov cx,30
add bx,320-30
sub dx,1
jne three8

sub bx,2
mov cx,32
mov dx,4
three9:
mov byte[es:bx],00h
add bx,1
loop three9
mov cx,32
add bx,320-32
sub dx,1
jne three9

add bx,2
mov cx,30
mov dx,5
three10:
mov byte[es:bx],00h
add bx,1
loop three10
mov cx,30
add bx,320-30
sub dx,1
jne three10




ret

Longdelay:     push cx
mov cx, 0xFFFF
loopd9: loop loopd9
mov cx, 0xFFFF
loopd10: loop loopd10
mov cx, 0xFFFF
mov cx, 0xFFFF
loopd3: loop loopd3
mov cx, 0xFFFF
loopd4: loop loopd4
mov cx, 0xFFFF
mov cx, 0xFFFF
loopd5: loop loopd5
mov cx, 0xFFFF
loopd7: loop loopd7
mov cx, 0xFFFF
mov cx, 0xFFFF
loopd6: loop loopd6
mov cx, 0xFFFF
loopd8: loop loopd8
mov cx, 0xFFFF

pop cx
ret

countdown:
call upperpart
call extra_roads
 call jumpin_minion
 call upper_scenery
 call gun_minion
 call bricks
call three
call Longdelay
call Longdelay
call Longdelay
call Longdelay
call upperpart
call extra_roads
 call jumpin_minion
 call upper_scenery
 call gun_minion
 call bricks
call two
call Longdelay
call Longdelay
call Longdelay
call Longdelay
call upperpart
call extra_roads
 call jumpin_minion
 call upper_scenery
 call gun_minion
 call bricks
call one
call Longdelay
call Longdelay
call Longdelay
call Longdelay
call start
ret
;---------------------------------end of countdown------------------------------------------


;------------------exit check screen--------------------------------------------------
;--------------------ask the user to confim the exit---------------------------

cnfrm_Exit_scr:
MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX

 mov ah, 0x13 ; service 13 - print string 
 mov al, 1 ; subservice 01 – update cursor 
 mov bh, 0 ; output on page 0 
 mov bl, 7 ; normal attrib 
 mov dx, 0x070E ; row 10 column 3 
 mov cx, 14 ; length of string 
 push cs 
 pop es ; segment of string 
 mov bp, cnfrm ; offset of string 
 int 0x10
;----------------------------------------------
 mov ah,02h
mov bh,0
mov dh,87
mov dl,78
int 10h
mov ah,0x09
mov al,'Y'
mov bx,0xf
mov cx,1
int 0x10
 mov ah,02h
mov bh,0
mov dh,87
mov dl,79
int 10h
mov ah,0x09
mov al,'e'
mov bx,0xf
mov cx,1
int 0x10
 mov ah,02h
mov bh,0
mov dh,87
mov dl,80
int 10h
mov ah,0x09
mov al,'s'
mov bx,0xf
mov cx,1
int 0x10
 mov ah,02h
mov bh,0
mov dh,87
mov dl,82
int 10h
mov ah,0x09
mov al,'('
mov bx,0xf
mov cx,1
int 0x10
 mov ah,02h
mov bh,0
mov dh,87
mov dl,83
int 10h
mov ah,0x09
mov al,'Y'
mov bx,0xf
mov cx,1
int 0x10
 mov ah,02h
mov bh,0
mov dh,87
mov dl,84
int 10h
mov ah,0x09
mov al,')'
mov bx,0xf
mov cx,1
int 0x10

 mov ah,02h
mov bh,0
mov dh,89
mov dl,78
int 10h
mov ah,0x09
mov al,'N'
mov bx,0xf
mov cx,1
int 0x10
 mov ah,02h
mov bh,0
mov dh,89
mov dl,79
int 10h
mov ah,0x09
mov al,'o'
mov bx,0xf
mov cx,1
int 0x10
 mov ah,02h
mov bh,0
mov dh,89
mov dl,81
int 10h
mov ah,0x09
mov al,'('
mov bx,0xf
mov cx,1
int 0x10
 mov ah,02h
mov bh,0
mov dh,89
mov dl,82
int 10h
mov ah,0x09
mov al,'N'
mov bx,0xf
mov cx,1
int 0x10
 mov ah,02h
mov bh,0
mov dh,89
mov dl,83
int 10h
mov ah,0x09
mov al,')'
mov bx,0xf
mov cx,1
int 0x10

ret

;------------------------------------------------------------------------------------------------------------
;---------------------kbisr for the yes of no of the exit check--------------------------------------
;----------------------only called in the Confirmation_check------------------------------------------------
	



;-------------------------------------------------------------------------------------

Confirmation_check:
call end_block
call end_minnion
call cnfrm_Exit_scr

chck:
mov ax,0
int 0x16

cmp al, 'y'
jne ncheck
mov word [cs:endkey],1
jmp exitescche
ncheck:
cmp al, 'n'
je resume
jmp chck

resume: 

mov word [cs:gamepause],0
call PrintStartScreen
exitescche:
ret
;---------------------------------end of confirmation part------------------------------------------
;------------------------------------------start of background--------

upperpart:
MOV Ax,40h
 MOV BX,0A000H ;
MOV ES,BX ;
mov bx,0
mov cx,320*56
l:
mov word[es:bx],66h
add bx,1
loop l

mov cx,320*51
ll:
mov word[es:bx],1dh
add bx,1
loop ll

mov cx,320*93
lll:
mov word[es:bx],67h
add bx,1
loop lll


ret

; ------------------------- BACKGROUND COLOURS--------------------------------------

;---------------------------THE UPPER PORTION WITH BUILDINGS---------------

upper_scenery:

MOV Ax,40h
 MOV BX,0A000H ;
MOV ES,BX ;
mov bx,320*20
mov cx,20
mov si,36
l1:
mov word[es:bx],00h
add bx,1
loop l1
mov cx,20
add bx,320-20
sub si,1
jne l1

sub bx,(320*32)
mov dx,5
add bx,3
mov cx,6
mov si,4

l2:
mov word[es:bx],1dh
add bx,1
loop l2
mov cx,6
add bx,320-6
sub si,1
jne l2

add bx,320*2
mov cx,6
mov si,4
sub dx,1
jne l2

sub bx,320*30
add bx,6
mov dx,5
add bx,3
mov cx,6
mov si,4

l3:
mov word[es:bx],1dh
add bx,1
loop l3
mov cx,6
add bx,320-6
sub si,1
jne l3

add bx,320*2
mov cx,6
mov si,4
sub dx,1
jne l3

add bx,12
sub bx,(320*42)
mov cx,40
mov si,44
l4:
mov word[es:bx],71h
add bx,1
loop l4
mov cx,40
add bx,320-40
sub si,1
jne l4

mov ax,3
sub bx,(320*41)
mov dx,3
add bx,3
mov cx,10
mov si,12

l5:
mov byte[es:bx],5ch
add bx,1
loop l5
add bx,320-10
mov cx,10
sub si,1
jne l5

add bx,320
add bx,320
mov cx,10
mov si,12
sub dx,1
jne l5

add bx,10
sub bx,(320*42)
mov dx,3
add bx,3
mov cx,10
mov si,12
mov dx,3
sub ax,1
jne l5

add bx,(320*3)
add bx,2
mov byte[es:bx],00h

mov cx,35
mov si,38
l6:
mov word[es:bx],69h
add bx,1
loop l6
mov cx,35
add bx,320-35
sub si,1
jne l6

mov ax,3
sub bx,(320*38)
mov dx,3
add bx,3
mov cx,38
mov si,9

l7:
mov byte[es:bx],67h
add bx,320
loop l7

mov cx,38
sub bx,320*38
add bx,4
sub si,1
jne l7

sub bx,(320*12)
sub bx,2
mov cx,10
mov si,50
l8:
mov byte[es:bx],6eh
add bx,1
loop l8
mov cx,10
add bx,320-10
sub si,1
jne l8

sub bx,(320*47)
add bx,2
mov dx,3
mov cx,6
mov si,10

l9:
mov byte[es:bx],5ah
add bx,1
loop l9
mov cx,6
add bx,320-6
sub si,1
jne l9
add bx,(320*4)
mov cx,6
mov si,10
sub dx,1
jne l9

sub bx,(320*31)
add bx,10


mov cx,20
mov si,36
l10:
mov word[es:bx],04h
add bx,1
loop l10
mov cx,20
add bx,320-20
sub si,1
jne l10

sub bx,(320*32)
mov dx,5
add bx,3
mov cx,6
mov si,4

l11:
mov word[es:bx],1dh
add bx,1
loop l11
mov cx,6
add bx,320-6
sub si,1
jne l11

add bx,320*2
mov cx,6
mov si,4
sub dx,1
jne l11

sub bx,320*30
add bx,6
mov dx,5
add bx,3
mov cx,6
mov si,4

l12:
mov word[es:bx],1dh
add bx,1
loop l12
mov cx,6
add bx,320-6
sub si,1
jne l12

add bx,320*2
mov cx,6
mov si,4
sub dx,1
jne l12

add bx,12
sub bx,(320*42)
mov cx,40
mov si,44
l13:
mov byte[es:bx],0dh
add bx,1
loop l13
mov cx,40
add bx,320-40
sub si,1
jne l13

mov ax,3
sub bx,(320*41)
mov dx,3
add bx,3
mov cx,10
mov si,12

l14:
mov byte[es:bx],5ch
add bx,1
loop l14
add bx,320-10
mov cx,10
sub si,1
jne l14

add bx,320
add bx,320
mov cx,10
mov si,12
sub dx,1
jne l14

add bx,10
sub bx,(320*42)
mov dx,3
add bx,3
mov cx,10
mov si,12
mov dx,3
sub ax,1
jne l14

add bx,(320*3)
add bx,2
mov byte[es:bx],00h

mov cx,35
mov si,38
l15:
mov word[es:bx],28h
add bx,1
loop l15
mov cx,35
add bx,320-35
sub si,1
jne l15

mov ax,3
sub bx,(320*38)
mov dx,3
add bx,3
mov cx,38
mov si,9

l16:
mov byte[es:bx],99h
add bx,320
loop l16

mov cx,38
sub bx,320*38
add bx,4
sub si,1
jne l16

sub bx,(320*12)
sub bx,2
mov cx,10
mov si,50
l17:
mov byte[es:bx],7ah
add bx,1
loop l17
mov cx,10
add bx,320-10
sub si,1
jne l17

sub bx,(320*47)
add bx,2
mov dx,3
mov cx,6
mov si,10

l18:
mov byte[es:bx],5ah
add bx,1
loop l18
mov cx,6
add bx,320-6
sub si,1
jne l18
add bx,(320*4)
mov cx,6
mov si,10
sub dx,1
jne l18

sub bx,(320*31)
add bx,10


mov cx,20
mov si,36
l19:
mov word[es:bx],23h
add bx,1
loop l19
mov cx,20
add bx,320-20
sub si,1
jne l19

sub bx,(320*32)
mov dx,5
add bx,3
mov cx,6
mov si,4

l20:
mov word[es:bx],1dh
add bx,1
loop l20
mov cx,6
add bx,320-6
sub si,1
jne l20

add bx,320*2
mov cx,6
mov si,4
sub dx,1
jne l20

sub bx,320*30
add bx,6
mov dx,5
add bx,3
mov cx,6
mov si,4

l21:
mov word[es:bx],1dh
add bx,1
loop l21
mov cx,6
add bx,320-6
sub si,1
jne l21

add bx,320*2
mov cx,6
mov si,4
sub dx,1
jne l21

add bx,12
sub bx,(320*42)
mov cx,40
mov si,44

l22:
mov byte[es:bx],4fh
add bx,1
loop l22
mov cx,40
add bx,320-40
sub si,1
jne l22

mov ax,3
sub bx,(320*41)
mov dx,3
add bx,3
mov cx,10
mov si,12

l23:
mov byte[es:bx],5ch
add bx,1
loop l23
add bx,320-10
mov cx,10
sub si,1
jne l23

add bx,320
add bx,320
mov cx,10
mov si,12
sub dx,1
jne l23

add bx,10
sub bx,(320*42)
mov dx,3
add bx,3
mov cx,10
mov si,12
mov dx,3
sub ax,1
jne l23

sub bx,(320*9)
add bx,2
mov cx,10
mov si,50
l24:
mov byte[es:bx],03h
add bx,1
loop l24
mov cx,10
add bx,320-10
sub si,1
jne l24

sub bx,(320*47)
add bx,2
mov dx,3
mov cx,6
mov si,10

l25:
mov byte[es:bx],5ah
add bx,1
loop l25
mov cx,6
add bx,320-6
sub si,1
jne l25
add bx,(320*4)
mov cx,6
mov si,10
sub dx,1
jne l25

ret

;------------------------END OF BUILDINGS---------------------------------------

; --------------------------- SIDE OF ROADS FOR MIDDLE PART----------------------

extra_roads:

MOV Ax,40h
 MOV BX,0A000H ;
MOV ES,BX ;

mov bx,320*56
mov cx,4
mov si,4
mov dx,40
mov al,00h
c1:
mov byte[es:bx],al
add bx,1
loop c1
add bx,320-4
mov cx,4
sub si,1
jne c1
sub bx,(320*4)
add bx,8
mov si,4
mov cx,4
sub dx,1

jne c1

mov bx,320*56
add bx,4
mov cx,4
mov si,4
mov dx,40
mov al,0eh
c2:
mov byte[es:bx],al
add bx,1
loop c2
add bx,320-4
mov cx,4
sub si,1
jne c2
sub bx,(320*4)
add bx,8
mov si,4
mov cx,4
sub dx,1

jne c2



mov bx,320*102
mov cx,4
mov si,4
mov dx,40
mov al,00h
c3:
mov byte[es:bx],al
add bx,1
loop c3
add bx,320-4
mov cx,4
sub si,1
jne c3
sub bx,(320*4)
add bx,8
mov si,4
mov cx,4
sub dx,1

jne c3


mov bx,320*102
add bx,4
mov cx,4
mov si,4
mov dx,40
mov al,0eh
c4:
mov byte[es:bx],al
add bx,1
loop c4
add bx,320-4
mov cx,4
sub si,1
jne c4
sub bx,(320*4)
add bx,8
mov si,4
mov cx,4
sub dx,1

jne c4

mov bx,320*82
add bx,20
mov cx,30
mov dx,6
mov ax,6
c5:
mov byte[es:bx],00h
add bx,1
loop c5
add bx,320-30
mov cx,30
sub dx,1
jne c5
sub bx,320*6
add bx,50
mov cx,30
mov dx,6
sub ax,1
jne c5



ret

;-------------------------- end of the extra roads graphics---------------------------------

;------------------------ the minnion with the gun----------------------------------------

gun_minion:
MOV Ax,40h
 MOV BX,0A000H ;
MOV ES,BX ;
mov bx,320*62
add bx,250

add bx,320+26
mov cx,12
mov si,2
lp1:
mov byte[es:bx],0eh
add bx,1
loop lp1

add bx,320-12
mov cx,12
sub si,1
jne lp1
sub bx,2
mov cx,2
mov si,2


lp2:         ;single block look
mov byte[es:bx],0eh
add bx,1
loop lp2
add bx,320-2
mov cx,2
sub si,1
jne lp2

sub bx,320*2
add bx,2
mov cx,4
mov si,2
lp3:
mov byte[es:bx],0fh
add bx,1
loop lp3
add bx,320-4
mov cx,4
sub si,1
jne lp3

sub bx,320*2
add bx,2
mov cx,12
mov si,2
lp4:
mov byte[es:bx],0eh
add bx,1
loop lp4
add bx,320-12
mov cx,12
sub si,1
jne lp4

sub bx,8
mov cx,2
mov si,2
lp5:
mov byte[es:bx],0eh
add bx,1
loop lp5
add bx,320-2
mov cx,2
sub si,1
jne lp5

sub bx,320*2
add bx,2
mov cx,8
mov si,2
lp6:
mov byte[es:bx],0fh
add bx,1
loop lp6
add bx,320-8
mov cx,8
sub si,1
jne lp6

sub bx,320*2
add bx,8
mov cx,10
mov si,2
lp7:
mov byte[es:bx],0eh
add bx,1
loop lp7
add bx,320-10
mov cx,10
sub si,1
jne lp7

sub bx,26
mov cx,2
mov si,2

lp8:         ;single block look
mov byte[es:bx],1ah
add bx,1
loop lp8
add bx,320-2
mov cx,2
sub si,1
jne lp8

sub bx,320*2
add bx,16
mov cx,4
mov si,4
lp9:
mov byte[es:bx],0fh
add bx,1
loop lp9
add bx,320-4
mov cx,4
sub si,1
jne lp9

sub bx,320*4
add bx,4
mov cx,4
mov si,4
lp10:
mov byte[es:bx],00h
add bx,1
loop lp10
add bx,320-4
mov cx,4
sub si,1
jne lp10

sub bx,320*4
add bx,4
mov cx,4
mov si,4
lp11:
mov byte[es:bx],0fh
add bx,1
loop lp11
add bx,320-4
mov cx,4
sub si,1
jne lp11

sub bx,320*4
add bx,4
mov cx,8
mov si,4
lp12:
mov byte[es:bx],00h
add bx,1
loop lp12
add bx,320-8
mov cx,8
sub si,1
jne lp12

sub bx,320*2
sub bx,23
mov cx,10
mov si,6

lp13:
mov byte[es:bx],00h
add bx,1
loop lp13
add bx,320-10
mov cx,10
sub si,1
jne lp13

sub bx,320*6
sub bx,6
mov cx,6
mov si,6

lp14:
mov byte[es:bx],1ah
add bx,1
loop lp14
add bx,320-6
mov cx,6
sub si,1
jne lp14

sub bx,320*6
sub bx,2
mov cx,2
mov si,6
lp15:
mov byte[es:bx],29h
add bx,1
loop lp15
add bx,320-2
mov cx,2
sub si,1
jne lp15

sub bx,320*4
sub bx,2
mov cx,2
mov si,2
lp16:
mov byte[es:bx],29h
add bx,1
loop lp16
add bx,320-2
mov cx,2
sub si,1
jne lp16

add bx,320*2
add bx,4
mov cx,2
mov si,2


lp17:         ;single block look
mov byte[es:bx],1ah
add bx,1
loop lp17
add bx,320-2
mov cx,2
sub si,1
jne lp17
sub bx,(320*6)
add bx,16
mov cx,2
mov si,2
lp18:
mov byte[es:bx],0eh
add bx,1
loop lp18
add bx,320-2
mov cx,2
sub si,1
jne lp18
mov cx,8
sub bx,(320*2)
add bx,2
mov si,2
lp19:
mov byte[es:bx],0fh
add bx,1
loop lp19
add bx,320-8
mov cx,8
sub si,1
jne lp19
mov cx,10
sub bx,(320*2)
add bx,8
mov si,2
lp20:
mov byte[es:bx],0eh
add bx,1
loop lp20
add bx,320-10
mov cx,10
sub si,1
jne lp20

mov cx,4
sub bx,10

mov si,2
lp21:
mov byte[es:bx],0eh
add bx,1
loop lp21
add bx,320-4
mov cx,4
sub si,1
jne lp21

mov cx,4
sub bx,(320*2)
add bx,4
mov si,2
lp22:
mov byte[es:bx],0fh
add bx,1
loop lp22
add bx,320-4
mov cx,4
sub si,1
jne lp22

mov cx,12
sub bx,(320*2)
add bx,4
mov si,2
lp23:
mov byte[es:bx],0eh
add bx,1
loop lp23
add bx,320-12
mov cx,12
sub si,1
jne lp23

sub bx,18
mov cx,4
mov si,2
lp24:
mov byte[es:bx],1ah
add bx,1
loop lp24
add bx,320-4
mov cx,4
sub si,1
jne lp24

sub bx,(320*2)
add bx,8
mov cx,2
mov si,2
lp25:
mov byte[es:bx],1ah
add bx,1
loop lp25
add bx,320-2
mov cx,2
sub si,1
jne lp25

sub bx,(320*2)
add bx,2
mov cx,10
mov si,2
lp26:
mov byte[es:bx],0eh
add bx,1
loop lp26
add bx,320-10
mov cx,10
sub si,1
jne lp26
 sub bx,(320*2)
 add bx,10
 mov si,2
 mov cx,2
 lp27:
 mov byte[es:bx],00h
 add bx,1
 loop lp27
 mov cx,2
 add bx,320-2
 sub si,1
 jne lp27
 
 sub bx,(320*2)
 add bx,2
 mov si,2
 mov cx,8
 lp28:
 mov byte[es:bx],0eh
 add bx,1
 loop lp28
 mov cx,8
 add bx,320-8
 sub si,1
 jne lp28

sub bx,22
mov cx,2
mov si,2
lp29:
mov byte[es:bx],1ah
 add bx,1
 loop lp29
 mov cx,2
 add bx,320-2
 sub si,1
 jne lp29
 
 sub bx,320*2
 add bx,2
 mov cx,2
mov si,6
lp30:
mov byte[es:bx],06h
 add bx,1
 loop lp30
 mov cx,2
 add bx,320-2
 sub si,1
 jne lp30
 
 sub bx,(320*6)
 add bx,4
 mov cx,4
 mov si,2
 lp31:
 mov byte[es:bx],00h
 add bx,1
 loop lp31
 mov cx,4
 add bx,320-4
 sub si,1
 jne lp31
 
 sub bx,320*2
 add bx,4
 mov cx,4
 mov si,2
 lp32:
 mov byte[es:bx],0eh
 add bx,1
 loop lp32
 mov cx,4
 add bx,320-4
 sub si,1
 jne lp32
 
  sub bx,320*2
 add bx,4
 mov cx,6
 mov si,2
 lp33:
 mov byte[es:bx],00h
 add bx,1
 loop lp33
 mov cx,6
 add bx,320-6
 sub si,1
 jne lp33
 
 sub bx,320*2
 add bx,6
 mov cx,6
 mov si,2
 lp34:
 mov byte[es:bx],0eh
 add bx,1
 loop lp34
 mov cx,6
 add bx,320-6
 sub si,1
 jne lp34
 
  sub bx,320*2
 add bx,6
 mov cx,4
 mov si,2
 lp35:
 mov byte[es:bx],09h
 add bx,1
 loop lp35
 mov cx,4
 add bx,320-4
 sub si,1
 jne lp35
 sub bx,18
 mov cx,2
 mov si,2
 lp36:
 mov byte[es:bx],00h
 add bx,1
 loop lp36
 mov cx,2
 add bx,320-2
 sub si,1
 jne lp36
 
 sub bx,320*2
 add bx,2
 mov cx,2
 mov si,2
 lp37:
 mov byte[es:bx],09h
 add bx,1
 loop lp37
 mov cx,2
 add bx,320-2
 sub si,1
 jne lp37
 
 sub bx,320*2
 add bx,2
 mov cx,10
 mov si,2
 lp38:
 mov byte[es:bx],0eh
 add bx,1
 loop lp38
 mov cx,10
 add bx,320-10
 sub si,1
 jne lp38
 
 sub bx,320*2
 add bx,10
 mov cx,4
 mov si,2
 lp39:
 mov byte[es:bx],09h
 add bx,1
 loop lp39
 mov cx,4
 add bx,320-4
 sub si,1
 jne lp39
 
  sub bx,320*2
 add bx,4
 mov cx,4
 mov si,2
 lp40:
 mov byte[es:bx],0eh
 add bx,1
 loop lp40
 mov cx,4
 add bx,320-4
 sub si,1
 jne lp40
 
 sub bx,22
 mov cx,4
 mov si,2
 lp41:
 mov byte[es:bx],00h
 add bx,1
 loop lp41
 mov cx,4
 add bx,320-4
 sub si,1
 jne lp41
 
 sub bx,(320*2)
 add bx,6
 mov cx,2
 mov si,2
 lp42:
  mov byte[es:bx],0eh
 add bx,1
 loop lp42
 mov cx,2
 add bx,320-2
 sub si,1
 jne lp42
 
 sub bx,(320*2)
 add bx,2
 mov cx,10
 mov si,2
 lp43:
  mov byte[es:bx],09h
 add bx,1
 loop lp43
 mov cx,10
 add bx,320-10
 sub si,1
 jne lp43
 
 
 sub bx,(320*2)
 add bx,10
 mov cx,8
 mov si,2
 lp44:
  mov byte[es:bx],0eh
 add bx,1
 loop lp44
 mov cx,8
 add bx,320-8
 sub si,1
 jne lp44
 
 
 sub bx,18
 mov cx,2
 mov si,2
 lp45:
  mov byte[es:bx],00h
 add bx,1
 loop lp45
 mov cx,2
 add bx,320-2
 sub si,1
 jne lp45
 
  sub bx,320*2
  add bx,2
 mov cx,24
 mov si,2
 lp46:
  mov byte[es:bx],0eh
 add bx,1
 loop lp46
 mov cx,24
 add bx,320-24
 sub si,1
 jne lp46
 
  add bx,4
 mov cx,20
 mov si,4
 lp47:
  mov byte[es:bx],09h
 add bx,1
 loop lp47
 mov cx,20
 add bx,320-20
 sub si,1
 jne lp47
 
   add bx,2
 mov cx,16
 mov si,2
 lp48:
  mov byte[es:bx],09h
 add bx,1
 loop lp48
 mov cx,16
 add bx,320-16
 sub si,1
 jne lp48
 
  add bx,2
 mov cx,4
 mov si,4
 lp49:
  mov byte[es:bx],00h
 add bx,1
 loop lp49
 mov cx,4
 add bx,320-4
 sub si,1
 jne lp49
 
 sub bx,320*2
 sub bx,2
  mov cx,2
 mov si,2
 lp50:
  mov byte[es:bx],00h
 add bx,1
 loop lp50
 mov cx,2
 add bx,320-2
 sub si,1
 jne lp50
 
 sub bx,320*4
 add bx,10
 mov cx,4
 mov si,4
 lp51:
  mov byte[es:bx],00h
 add bx,1
 loop lp51
 mov cx,4
 add bx,320-4
 sub si,1
 jne lp51
 
 sub bx,320*2
 sub bx,2
  mov cx,2
 mov si,2
 lp52:
  mov byte[es:bx],00h
 add bx,1
 loop lp52
 mov cx,2
 add bx,320-2
 sub si,1
 jne lp52
 
 ret
 ;---------------------------END OF GUN MINNION-------------
 
 ;----------------------------- the jump of the minnion with clearing the screen after jump -------------------
 ;-------------------------------called before scrolling the screen to show the jump-----------------------
 jumpminnion:
MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX
mov bx,320*191
add bx,60
mov si,320*155
add si,60
mov cx,200
mov dx,22
move1:
mov ah,byte[es:bx]
mov byte[es:si],ah
add bx,1
add si,1
loop move1
sub bx,320+200
sub si,320+200
mov cx,200
sub dx,1
jne move1



clearing:
mov bx,320*191
add bx,60
mov cx,200
mov dx,22
move2:
mov byte[es:bx],67h
add bx,1
loop move2
sub bx,320+200
mov cx,200
sub dx,1
jne move2


ret

;-----------------------------------the minnion that will perform the jump----------------------------------

 jumpin_minion:
 MOV Ax,40h
 MOV BX,0A000H ;
MOV ES,BX ;
mov bx,54550

MOV cx,14
mov si,2
a1:
 mov byte[es:bx],0eh
 add bx,1
 loop a1
 add bx,320-14
 mov cx,14
 sub si,1
 jne a1
 
 sub bx,2 ;single block code
 MOV cx,2
mov si,2
a2:
 mov byte[es:bx],0eh
 add bx,1
 loop a2
 add bx,320-2
 mov cx,2
 sub si,1
 jne a2
 
 sub bx,(320*2)
 add bx,2
 MOV cx,14
mov si,2
a3:
 mov byte[es:bx],1ah
 add bx,1
 loop a3
 add bx,320-14
 mov cx,14
 sub si,1
 jne a3
 
  sub bx,(320*2)
 add bx,16
 
 sub bx,2 ;single block code
 MOV cx,2
mov si,2
a4:
 mov byte[es:bx],0eh
 add bx,1
 loop a4
 add bx,320-2
 mov cx,2
 sub si,1
 jne a4
 
 ;add bx,320
 sub bx,16
 
 mov cx,2
 mov si,4
 a5:
 mov byte[es:bx],00h
 add bx,1
 loop a5
 mov cx,2
 add bx,320-2
 sub si,1
 jne a5
 
 sub bx,320*4
 add bx,2
  mov cx,2
 mov si,6
 a6:
 mov byte[es:bx],1ah
 add bx,1
 loop a6
 mov cx,2
 add bx,320-2
 sub si,1
 jne a6
 
 sub bx,320*6
  add bx,2 ;single block code
 MOV cx,2
mov si,2
a7:
 mov byte[es:bx],00h
 add bx,1
 loop a7
 add bx,320-2
 mov cx,2
 sub si,1
 jne a7
 
  MOV cx,4
mov si,2
a8:
 mov byte[es:bx],0fh
 add bx,1
 loop a8
 add bx,320-4
 mov cx,4
 sub si,1
 jne a8
 
 sub bx,320*4
 add bx,2
   MOV cx,2
mov si,2
a9:
 mov byte[es:bx],0fh
 add bx,1
 loop a9
 add bx,320-2
 mov cx,2
 sub si,1
 jne a9
 
  sub bx,320*2
 add bx,2
  mov cx,2
 mov si,6
 a10:
 mov byte[es:bx],1ah
 add bx,1
 loop a10
 mov cx,2
 add bx,320-2
 sub si,1
 jne a10
 
 sub bx,320*6
  add bx,2 ;single block code
 MOV cx,2
mov si,2
a11:
 mov byte[es:bx],00h
 add bx,1
 loop a11
 add bx,320-2
 mov cx,2
 sub si,1
 jne a11
 
  MOV cx,4
mov si,2
a12:
 mov byte[es:bx],0fh
 add bx,1
 loop a12
 add bx,320-4
 mov cx,4
 sub si,1
 jne a12
 
 sub bx,320*4
 add bx,2
   MOV cx,2
mov si,2
a13:
 mov byte[es:bx],0fh
 add bx,1
 loop a13
 add bx,320-2
 mov cx,2
 sub si,1
 jne a13
 
  sub bx,320*2
 add bx,2
  mov cx,2
 mov si,6
 a14:
 mov byte[es:bx],1ah
 add bx,1
 loop a14
 mov cx,2
 add bx,320-2
 sub si,1
 jne a14
 
 sub bx,320*6
 add bx,2
 mov cx,2
 mov si,4
  a15:
 mov byte[es:bx],00h
 add bx,1
 loop a15
 mov cx,2
 add bx,320-2
 sub si,1
 jne a15
 
 MOV cx,2
mov si,2
a17:
 mov byte[es:bx],0eh
 add bx,1
 loop a17
 add bx,320-2
 mov cx,2
 sub si,1
 jne a17
 
 sub bx,320
 sub bx,2
 mov cx,12
 mov si,2
a18:
 mov byte[es:bx],1ah
 sub bx,1
 loop a18
  sub bx,320-12
 mov cx,12
 sub si,1
 jne a18
 
  add bx,320
  sub bx,16
  add bx,2 ;single block code
 MOV cx,2
mov si,2
a19:
 mov byte[es:bx],0eh
 add bx,1
 loop a19
 add bx,320-2
 mov cx,2
 sub si,1
 jne a19
 
 sub bx,6
  add bx,2 ;single block code
 MOV cx,4
mov si,2
a20:
 mov byte[es:bx],00h
 add bx,1
 loop a20
 add bx,320-4
 mov cx,4
 sub si,1
 jne a20
 
 sub bx,320*2
 add bx,4
 mov cx,18
 mov si,2
 a21:
  mov byte[es:bx],0eh
 add bx,1
 loop a21
 add bx,320-18
 mov cx,18
 sub si,1
 jne a21
 
 sub bx,2
 mov cx,2
 mov si,4
 a22:
  mov byte[es:bx],0eh
 add bx,1
 loop a22
 add bx,320-2
 mov cx,2
 sub si,1
 jne a22
 
 sub bx,320*4
 add bx,2
 mov cx,2
 mov si,2
  a23:
  mov byte[es:bx],09h
 add bx,1
 loop a23
 add bx,320-2
 mov cx,2
 sub si,1
 jne a23
 
  sub bx,320*2
 add bx,2
 mov cx,4
 mov si,2
  a24:
  mov byte[es:bx],0eh
 add bx,1
 loop a24
 add bx,320-4
 mov cx,4
 sub si,1
 jne a24
 
 sub bx,320*2
 add bx,4
 mov cx,4
 mov si,2
  a25:
  mov byte[es:bx],00h
 add bx,1
 loop a25
 add bx,320-4
 mov cx,4
 sub si,1
 jne a25
 
  sub bx,320*2
 add bx,4
 mov cx,6
 mov si,2
  a26:
  mov byte[es:bx],0eh
 add bx,1
 loop a26
 add bx,320-6
 mov cx,6
 sub si,1
 jne a26
 
   sub bx,320*2
 add bx,6
 mov cx,2
 mov si,2
  a27:
  mov byte[es:bx],09h
 add bx,1
 loop a27
 add bx,320-2
 mov cx,2
 sub si,1
 jne a27
 
   ; sub bx,320*2
 sub bx,18
 mov cx,4
 mov si,2
  a28:
  mov byte[es:bx],0eh
 add bx,1
 loop a28
 add bx,320-4
 mov cx,4
 sub si,1
 jne a28
 
 sub bx,320*2
 add bx,4
 mov cx,4
 mov si,2
  a29:
  mov byte[es:bx],09h
 add bx,1
 loop a29
 add bx,320-4
 mov cx,4
 sub si,1
 jne a29
 
  sub bx,320*2
 add bx,4
 mov cx,6
 mov si,2
  a30:
  mov byte[es:bx],0eh
 add bx,1
 loop a30
 add bx,320-6
 mov cx,6
 sub si,1
 jne a30
 
 sub bx,320*2
 add bx,6
 mov cx,4
 mov si,2
  a31:
  mov byte[es:bx],09h
 add bx,1
 loop a31
 add bx,320-4
 mov cx,4
 sub si,1
 jne a31
 
  sub bx,320*2
 add bx,4
 mov cx,4
 mov si,2
  a33:
  mov byte[es:bx],0eh
 add bx,1
 loop a33
 add bx,320-4
 mov cx,4
 sub si,1
 jne a33
 
 sub bx,16
 mov cx,18
 mov si,2
 a34:
 mov byte[es:bx],09h
 add bx,1
 loop a34
 add bx,320-18
 mov cx,18
 sub si,1
 jne a34
 
 sub bx,320*4
 add bx,18
             ;single block code
 MOV cx,2
mov si,2
a35:
 mov byte[es:bx],0eh
 add bx,1
 loop a35
 add bx,320-2
 mov cx,2
 sub si,1
 jne a35
 
  MOV cx,4
mov si,2
a36:
 mov byte[es:bx],00h
 add bx,1
 loop a36
 add bx,320-4
 mov cx,4
 sub si,1
 jne a36
 
 sub bx,14
   MOV cx,4
mov si,4
a37:
 mov byte[es:bx],00h
 add bx,1
 loop a37
 add bx,320-4
 mov cx,4
 sub si,1
 jne a37
 
 sub bx,320*2
 sub bx,2
    MOV cx,2
mov si,2
a38:
 mov byte[es:bx],00h
 add bx,1
 loop a38
 add bx,320-2
 mov cx,2
 sub si,1
 jne a38
 
 sub bx,320*4
 add bx,8
    MOV cx,4
mov si,4
a39:
 mov byte[es:bx],00h
 add bx,1
 loop a39
 add bx,320-4
 mov cx,4
 sub si,1
 jne a39
 
 sub bx,320*2
 add bx,4
     MOV cx,2
mov si,2
a40:
 mov byte[es:bx],00h
 add bx,1
 loop a40
 add bx,320-2
 mov cx,2
 sub si,1
 jne a40
 
 ret
 ;---------------------END OF jumpin_minion------------------
 ;------------------------the formation of jumps STARTS here--------------------------------------
 
 bricks:
 
 MOV Ax,40h
 MOV BX,0A000H ;
MOV ES,BX
mov bx,320*192
add bx,120

mov cx,70
mov si,2
b1:
mov byte[es:bx],3fh
add bx,1
loop b1
add bx,320-70
mov cx,70
sub si,1
jne b1

mov cx,17
b2:
mov byte[es:bx],5bh
mov byte[es:bx+1],3fh
mov byte[es:bx+2],3fh
mov byte[es:bx+3],5bh
add bx,4
loop b2
mov byte[es:bx],5bh
mov byte[es:bx+1],3fh

add bx,320
sub bx,66
mov cx,66
mov si,2
b3:
mov byte[es:bx],5bh
add bx,1
loop b3
add bx,320-66
mov cx,66
sub si,1
jne b3


sub bx,320*41
mov cx,70
mov si,2
b4:
mov byte[es:bx],2ah
add bx,1
loop b4
add bx,320-70
mov cx,70
sub si,1
jne b4

mov cx,17
b5:
mov byte[es:bx],5bh
mov byte[es:bx+1],2ah
mov byte[es:bx+2],2ah
mov byte[es:bx+3],5bh
add bx,4
loop b5
mov byte[es:bx],5bh
mov byte[es:bx+1],2ah

add bx,320
sub bx,66
mov cx,66
mov si,2
b6:
mov byte[es:bx],5bh
add bx,1
loop b6
add bx,320-66
mov cx,66
sub si,1
jne b6


sub bx,320*41
mov cx,70
mov si,2
b7:
mov byte[es:bx],20h
add bx,1
loop b7
add bx,320-70
mov cx,70
sub si,1
jne b7

mov cx,17
b8:
mov byte[es:bx],5bh
mov byte[es:bx+1],20h
mov byte[es:bx+2],20h
mov byte[es:bx+3],5bh
add bx,4
loop b8
mov byte[es:bx],5bh
mov byte[es:bx+1],20h

add bx,320
sub bx,66
mov cx,66
mov si,2
b9:
mov byte[es:bx],5bh
add bx,1
loop b9
add bx,320-66
mov cx,66
sub si,1
jne b9


ret
;-------------------END OF bricks----------------------------

;---------------- the minion that ends the game---------------------

end_block:
MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX

mov bx,320*45+60
mov cx,200
mov dx,2
blk1:
mov byte[es:bx],0x00
add bx,1
loop blk1
mov cx,200
add bx, 320-200
sub dx,1
jne blk1
add bx,3
mov cx,194
mov dx,2
blk2:
mov byte[es:bx],0x0f
add bx,1
loop blk2
mov cx,194
add bx, 320-194
sub dx,1
jne blk2

add bx,3
mov cx,188
mov dx,2
blk3:
mov byte[es:bx],0x00
add bx,1
loop blk3
mov cx,188
add bx, 320-188
sub dx,1
jne blk3
;--------------------

mov bx,320*45+60
mov cx,3
mov si,120
blk4:
mov byte[es:bx],0x00
add bx,1
loop blk4
add bx,320-3
mov cx,3
sub si,1
jne blk4  

sub bx,320*117
add bx,3
mov cx,3
mov si,114
blk5:
mov byte[es:bx],0x0f
add bx,1
loop blk5
add bx,320-3
mov cx,3
sub si,1
jne blk5  

sub bx,320*113
add bx,3
mov cx,3
mov si,111
blk6:
mov byte[es:bx],0x00
add bx,1
loop blk6
add bx,320-3
mov cx,3
sub si,1
jne blk6  

sub bx,320
mov cx,188
mov dx,2
blk7:
mov byte[es:bx],0x00
add bx,1
loop blk7
mov cx,188
add bx, 320-188
sub dx,1
jne blk7

sub bx,3
mov cx,194
mov dx,2
blk8:
mov byte[es:bx],0x0f
add bx,1
loop blk8
mov cx,194
add bx, 320-194
sub dx,1
jne blk8

sub bx,3
mov cx,200
mov dx,2
blk9:
mov byte[es:bx],0x00
add bx,1
loop blk9
mov cx,200
add bx, 320-200
sub dx,1
jne blk9

sub bx,320
add bx,197
mov cx,3
mov si,120
blk10:
mov byte[es:bx],0x00
add bx,1
loop blk10
sub bx,320+3
mov cx,3
sub si,1
jne blk10

sub bx,3
add bx,320*3
mov cx,3
mov si,114
blk11:
mov byte[es:bx],0x0f
add bx,1
loop blk11
add bx,320-3
mov cx,3
sub si,1
jne blk11  

sub bx,3
sub bx,320*3
mov cx,3
mov si,110
blk12:
mov byte[es:bx],0x00
add bx,1
loop blk12
sub bx,320+3
mov cx,3
sub si,1
jne blk12  

mov bx,320*45+60
add bx,9
add bx,320*6
mov cx,182
mov si,108
blk13:
mov byte[es:bx],5ah
add bx,1
loop blk13
mov cx,182
add bx,320-182
sub si,1
jne blk13

ret

;-------------------- end of end-block------------------------------------------------

;--------------------- start of ending text-----------------------------------------

end_msg_and_score:

;------------------- game over
push bp
mov bp, sp
pusha

mov ah,02h
mov bh,0
mov dh,83
mov dl,151
int 10h
mov ah,0x09
mov al,'G'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,83
mov dl,152
int 10h
mov ah,0x09
mov al,'A'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,83
mov dl,153
int 10h
mov ah,0x09
mov al,'M'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,83
mov dl,154
int 10h
mov ah,0x09
mov al,'E'
mov bx,0xf
mov cx,1
int 0x10


mov ah,02h
mov bh,0
mov dh,83
mov dl,157
int 10h
mov ah,0x09
mov al,'O'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,83
mov dl,158
int 10h
mov ah,0x09
mov al,'V'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,83
mov dl,159
int 10h
mov ah,0x09
mov al,'E'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,83
mov dl,160
int 10h
mov ah,0x09
mov al,'R'
mov bx,0xf
mov cx,1
int 0x10

;-------------score-----

mov ah,02h
mov bh,0
mov dh,85
mov dl,82
int 10h
mov ah,0x09
mov al,'Y'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,85
mov dl,83
int 10h
mov ah,0x09
mov al,'O'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,85
mov dl,84
int 10h
mov ah,0x09
mov al,'U'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,86
mov dl,160
int 10h
mov ah,0x09
mov al,'S'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,86
mov dl,161
int 10h
mov ah,0x09
mov al,'C'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,86
mov dl,162
int 10h
mov ah,0x09
mov al,'O'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,86
mov dl,163
int 10h
mov ah,0x09
mov al,'R'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,86
mov dl,164
int 10h
mov ah,0x09
mov al,'E'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,86
mov dl,165
int 10h
mov ah,0x09
mov al,'D'
mov bx,0xf
mov cx,1
int 0x10

;------------ ------------

mov ah,02h
mov bh,0
mov dh,87
mov dl,244
int 10h

mov al,[bp + 4]
mov ah,0
mov bl,10
div bl
add al,'0'
add ah,'0'
mov dx,ax

mov ah,0x09
mov al,dh
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
;mov dx, 0
mov dh,87
mov dl,243
int 10h

mov al,[bp + 4]
mov ah,0
mov bl,10
div bl
add al,'0'
add ah,'0'
mov dx,ax

mov ah,0x09
mov al,dl
mov bx,0xf
mov cx,1
int 0x10

; mov ah,02h
; mov bh,0
; mov dh,90
; mov dl,240
; int 10h
; mov ah,0x09
; mov al,''
; mov bx,0xf
; mov cx,1
; int 0x10


popa
pop bp
ret 2

;----------------------------- end of this display of score and end-----------------------------

end_minnion:
 MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX
mov bx,320*71+100

mov cx,28
mov si,4
em1:
mov byte[es:bx],00h
add bx,1
loop em1
add bx,320-28
mov cx,28
sub si,1
jne em1

sub bx,4
mov cx,4
mov si,4
em2:
mov byte[es:bx],00h
add bx,1
loop em2
add bx,320-4
mov cx,4
sub si,1
jne em2

sub bx,320*4
add bx,4
mov cx,28
mov si,4
em3:
mov byte[es:bx],0eh
add bx,1
loop em3
add bx,320-28
mov cx,28
sub si,1
jne em3

sub bx,320*4
add bx,32
sub bx,4
mov cx,4
mov si,4
em4:
mov byte[es:bx],00h
add bx,1
loop em4
add bx,320-4
mov cx,4
sub si,1
jne em4

sub bx,36
mov cx,4
mov si,15*4
em5:
mov byte[es:bx],00h
add bx,1
loop em5
add bx,320-4
mov cx,4
sub si,1
jne em5

sub bx,320*60
add bx,4
mov cx,16
mov si,4
em6:
mov byte[es:bx],0eh
add bx,1
loop em6
add bx,320-16
mov cx,16
sub si,1
jne em6

sub bx,320*4
add bx,16
mov cx,12
mov si,4
em7:
mov byte[es:bx],07h
add bx,1
loop em7
add bx,320-12
mov cx,12
sub si,1
jne em7

sub bx,320*4
add bx,12
mov cx,8
mov si,4
em8:
mov byte[es:bx],0eh
add bx,1
loop em8
add bx,320-8
mov cx,8
sub si,1
jne em8

sub bx,320*4
add bx,8
mov cx,4
mov si,60
em9:
mov byte[es:bx],00h
add bx,1
loop em9
add bx,320-4
mov cx,4
sub si,1
jne em9

sub bx,320*56
sub bx,4*9
mov cx,12
mov si,4
em10:
mov byte[es:bx],0eh
add bx,1
loop em10
add bx,320-12
mov cx,12
sub si,1
jne em10

sub bx,320*4
add bx,12
mov cx,4
mov si,4
em11:
mov byte[es:bx],07h
add bx,1
loop em11
add bx,320-4
mov cx,4
sub si,1
jne em11

sub bx,320*4
add bx,4
mov cx,4
mov si,4
em12:
mov byte[es:bx],0fh
add bx,1
loop em12
add bx,320-4
mov cx,4
sub si,1
jne em12

sub bx,320*4
add bx,4
mov cx,8
mov si,4
em13:
mov byte[es:bx],00h
add bx,1
loop em13
add bx,320-8
mov cx,8
sub si,1
jne em13

sub bx,320*4
add bx,8
mov cx,4
mov si,4
em14:
mov byte[es:bx],07h
add bx,1
loop em14
add bx,320-4
mov cx,4
sub si,1
jne em14

sub bx,320*4
add bx,4
mov cx,4
mov si,4
em15:
mov byte[es:bx],0eh
add bx,1
loop em15
add bx,320-4
mov cx,4
sub si,1
jne em15

mov cx,4
mov si,12
em16:
mov byte[es:bx],07h
add bx,1
loop em16
add bx,320-4
mov cx,4
sub si,1
jne em16

sub bx,320*12
sub bx,32
mov cx,8
mov si,4
em17:
mov byte[es:bx],0eh
add bx,1
loop em17
add bx,320-8
mov cx,8
sub si,1
jne em17

sub bx,320*4
add bx,8
mov cx,4
mov si,12
em18:
mov byte[es:bx],07h
add bx,1
loop em18
add bx,320-4
mov cx,4
sub si,1
jne em18

sub bx,320*12
add bx,4
mov cx,8
mov si,8
em19:
mov byte[es:bx],0fh
add bx,1
loop em19
add bx,320-8
mov cx,8
sub si,1
jne em19

mov cx,20
mov si,4
em20:
mov byte[es:bx],0fh
add bx,1
loop em20
add bx,320-20
mov cx,20
sub si,1
jne em20

sub bx,320*8
add bx,8
mov cx,12
mov si,4
em21:
mov byte[es:bx],00h
add bx,1
loop em21
add bx,320-12
mov cx,12
sub si,1
jne em21

sub bx,320*8
mov cx,4
mov si,4
em22:
mov byte[es:bx],00h
add bx,1
loop em22
add bx,320-4
mov cx,4
sub si,1
jne em22

sub bx,320*4
add bx,4
mov cx,4
mov si,4
em23:
mov byte[es:bx],0fh
add bx,1
loop em23
add bx,320-4
mov cx,4
sub si,1
jne em23

sub bx,320*4
add bx,4
mov cx,4
mov si,4
em24:
mov byte[es:bx],00h
add bx,1
loop em24
add bx,320-4
mov cx,4
sub si,1
jne em24

sub bx,4*7
mov cx,8
mov si,4
em25:
mov byte[es:bx],00h
add bx,1
loop em25
add bx,320-8
mov cx,8
sub si,1
jne em25

mov cx,8
mov si,20
em26:
mov byte[es:bx],0eh
add bx,1
loop em26
add bx,320-8
mov cx,8
sub si,1
jne em26

sub bx,320*16
add bx,8
mov cx,4
mov si,4
em27:
mov byte[es:bx],0eh
add bx,1
loop em27
add bx,320-4
mov cx,4
sub si,1
jne em27

sub bx,320*4
add bx,4
mov cx,4
mov si,4
em28:
mov byte[es:bx],07h
add bx,1
loop em28
add bx,320-4
mov cx,4
sub si,1
jne em28

sub bx,320*4
add bx,4
mov cx,12
mov si,4
em29:
mov byte[es:bx],0fh
add bx,1
loop em29
add bx,320-12
mov cx,12
sub si,1
jne em29

sub bx,320*4
add bx,12
mov cx,4
mov si,4
em30:
mov byte[es:bx],07h
add bx,1
loop em30
add bx,320-4
mov cx,4
sub si,1
jne em30

sub bx,320*4
add bx,4
mov cx,4
mov si,4
em31:
mov byte[es:bx],0eh
add bx,1
loop em31
add bx,320-4
mov cx,4
sub si,1
jne em31

sub bx,24
mov cx,8
mov si,4
em32:
mov byte[es:bx],0eh
add bx,1
loop em32
add bx,320-8
mov cx,8
sub si,1
jne em32

sub bx,320*4
add bx,8
mov cx,12
mov si,4
em33:
mov byte[es:bx],07h
add bx,1
loop em33
add bx,320-12
mov cx,12
sub si,1
jne em33

sub bx,320*4
add bx,12
mov cx,8
mov si,4
em34:
mov byte[es:bx],0eh
add bx,1
loop em34
add bx,320-8
mov cx,8
sub si,1
jne em34

sub bx,20
mov cx,4
mov si,4
em35:
mov byte[es:bx],0eh
add bx,1
loop em35
add bx,320-4
mov cx,4
sub si,1
jne em35

sub bx,320*4
add bx,4
mov cx,20
mov si,4
em36:
mov byte[es:bx],00h
add bx,1
loop em36
add bx,320-20
mov cx,20
sub si,1
jne em36

sub bx,320*4
add bx,20
mov cx,4
mov si,4
em37:
mov byte[es:bx],0eh
add bx,1
loop em37
add bx,320-4
mov cx,4
sub si,1
jne em37

sub bx,24
mov cx,4
mov si,4
em38:
mov byte[es:bx],0eh
add bx,1
loop em38
add bx,320-4
mov cx,4
sub si,1
jne em38

sub bx,320*4
add bx,4
mov cx,4
mov si,4
em39:
mov byte[es:bx],00h
add bx,1
loop em39
add bx,320-4
mov cx,4
sub si,1
jne em39

sub bx,320*4
add bx,4
mov cx,4
mov si,4
em40:
mov byte[es:bx],0fh
add bx,1
loop em40
add bx,320-4
mov cx,4
sub si,1
jne em40

sub bx,320*4
add bx,4
mov cx,8
mov si,4
em41:
mov byte[es:bx],28h
add bx,1
loop em41
add bx,320-8
mov cx,8
sub si,1
jne em41

sub bx,320*4
add bx,8
mov cx,4
mov si,4
em42:
mov byte[es:bx],00h
add bx,1
loop em42
add bx,320-4
mov cx,4
sub si,1
jne em42

sub bx,320*4
add bx,4
mov cx,4
mov si,8
em43:
mov byte[es:bx],09h
add bx,1
loop em43
add bx,320-4
mov cx,4
sub si,1
jne em43

sub bx,320*4
sub bx,4
mov cx,4
mov si,4
em44:
mov byte[es:bx],0eh
add bx,1
loop em44
add bx,320-4
mov cx,4
sub si,1
jne em44

sub bx,320*4
sub bx,12
mov cx,12
mov si,4
em45:
mov byte[es:bx],00h
add bx,1
loop em45
add bx,320-12
mov cx,12
sub si,1
jne em45

sub bx,320*4
sub bx,12
mov cx,12
mov si,4
em46:
mov byte[es:bx],0eh
add bx,1
loop em46
add bx,320-12
mov cx,12
sub si,1
jne em46

sub bx,320*4
sub bx,4
mov cx,4
mov si,4
em47:
mov byte[es:bx],09h
add bx,1
loop em47
add bx,320-4
mov cx,4
sub si,1
jne em47

mov cx,4
mov si,8
em48:
mov byte[es:bx],0eh
add bx,1
loop em48
add bx,320-4
mov cx,4
sub si,1
jne em48

sub bx,320*8
add bx,4
mov cx,28
mov si,8
em49:
mov byte[es:bx],09h
add bx,1
loop em49
add bx,320-28
mov cx,28
sub si,1
jne em49

sub bx,320*8
add bx,28
mov cx,4
mov si,8
em50:
mov byte[es:bx],0eh
add bx,1
loop em50
add bx,320-4
mov cx,4
sub si,1
jne em50

sub bx,320*4
sub bx,24
mov cx,20
mov si,4
em51:
mov byte[es:bx],00h
add bx,1
loop em51
add bx,320-20
mov cx,20
sub si,1
jne em51

sub bx,8
mov cx,36
mov si,12
em52:
mov byte[es:bx],09h
add bx,1
loop em52
add bx,320-36
mov cx,36
sub si,1
jne em52

mov cx,36
mov si,4
em53:
mov byte[es:bx],00h
add bx,1
loop em53
add bx,320-36
mov cx,36
sub si,1
jne em53

sub bx,320*16
add bx,8
mov cx,4
mov si,4
em54:
mov byte[es:bx],00h
add bx,1
loop em54
add bx,320-4
mov cx,4
sub si,1
jne em54

add bx,4
mov cx,12
mov si,4
em55:
mov byte[es:bx],00h
add bx,1
loop em55
add bx,320-12
mov cx,12
sub si,1
jne em55

add bx,12
sub bx,320*8
mov cx,4
mov si,4
em56:
mov byte[es:bx],00h
add bx,1
loop em56
add bx,320-4
mov cx,4
sub si,1
jne em56

add bx,320*12
sub bx,24
mov si,12
mov dx,2
mov cx,12
em57:
mov byte[es:bx],00h
add bx,1
loop em57
add bx,320-12
mov cx,12
sub si,1
jne em57
add bx,24
sub bx,320*12
mov cx,12
mov si,12
sub dx,1
jne em57

sub bx,44
;sub bx,320*12
mov dx,2
mov cx,4
mov si,4
em58:
mov byte[es:bx],09h
add bx,1
loop em58
add bx,320-4
mov cx,4
sub si,1
jne em58
sub bx,320*4
add bx,24
mov cx,4
mov si,4
sub dx,1
jne em58

sub bx,12
sub bx,320*48
mov cx,8
mov si,4
em59:
mov byte[es:bx],00h
add bx,1
loop em59
add bx,320-8
mov cx,8
sub si,1
jne em59

mov cx,4
mov dx,2
mov si,8
em60:
mov byte[es:bx],00h
add bx,1
loop em60
add bx,320-4
mov cx,4
sub si,1
jne em60
sub bx,320*8
add bx,8
mov cx,4
mov si,8
sub dx,1
jne em60

sub bx,12
mov cx,4
mov si,8
em61:
mov byte[es:bx],0eh
add bx,1
loop em61
add bx,320-4
mov cx,4
sub si,1
jne em61

mov cx,4
mov si,8
em62:
mov byte[es:bx],00h
add bx,1
loop em62
add bx,320-4
mov cx,4
sub si,1
jne em62

sub bx,320*8
sub bx,4
mov cx,4
mov si,8
em63:
mov byte[es:bx],0eh
add bx,1
loop em63
add bx,320-4
mov cx,4
sub si,1
jne em63

mov cx,4
mov si,4
em64:
mov byte[es:bx],00h
add bx,1
loop em64
add bx,320-4
mov cx,4
sub si,1
jne em64

sub bx,320*24
add bx,8
mov cx,4
mov si,4
em65:
mov byte[es:bx],0eh
add bx,1
loop em65
add bx,320-4
mov cx,4
sub si,1
jne em65

sub bx,320*8
mov cx,4
mov si,4
em66:
mov byte[es:bx],00h
add bx,1
loop em66
add bx,320-4
mov cx,4
sub si,1
jne em66

sub bx,320*12
mov cx,4
mov si,8
em67:
mov byte[es:bx],0eh
add bx,1
loop em67
add bx,320-4
mov cx,4
sub si,1
jne em67

sub bx,320*12
mov cx,4
mov si,4
em68:
mov byte[es:bx],00h
add bx,1
loop em68
add bx,320-4
mov cx,4
sub si,1
jne em68

sub bx,4
mov cx,4
mov si,8
em69:
mov byte[es:bx],00h
add bx,1
loop em69
add bx,320-4
mov cx,4
sub si,1
jne em69

add bx,320*12
add bx,8
mov si,32
mov cx,4
em70:
mov byte[es:bx],00h
add bx,1
loop em70
sub bx,320+4
mov cx,4
sub si,1
jne em70

mov si,4
mov cx,4
em71:
mov byte[es:bx],5ch
add bx,1
loop em71
sub bx,320+4
mov cx,4
sub si,1
jne em71

mov si,4
mov cx,4
em72:
mov byte[es:bx],00h
add bx,1
loop em72
sub bx,320+4
mov cx,4
sub si,1
jne em72

sub bx,4
add bx,320
mov si,8
mov cx,4
em73:
mov byte[es:bx],00h
add bx,1
loop em73
add bx,320-4
mov cx,4
sub si,1
jne em73

add bx,8
mov si,8
mov cx,4
em74:
mov byte[es:bx],5ch
add bx,1
loop em74
add bx,320-4
mov cx,4
sub si,1
jne em74

sub bx,320*12
mov si,4
mov cx,4
em75:
mov byte[es:bx],00h
add bx,1
loop em75
add bx,320-4
mov cx,4
sub si,1
jne em75

add bx,4
mov si,24
mov cx,4
em76:
mov byte[es:bx],00h
add bx,1
loop em76
add bx,320-4
mov cx,4
sub si,1
jne em76

sub bx,320
sub bx,4
mov si,12
mov cx,4
em77:
mov byte[es:bx],0eh
add bx,1
loop em77
sub bx,320+4
mov cx,4
sub si,1
jne em77

mov cx,12
mov si,4
em78:
mov byte[es:bx],00h
add bx,1
loop em78
sub bx,320+12
mov cx,12
sub si,1
jne em78

add bx,8
add bx,320*4
mov cx,4
mov si,4
em79:
mov byte[es:bx],0eh
add bx,1
loop em79
add bx,320-4
mov cx,4
sub si,1
jne em79

mov cx,4
mov si,4
em80:
mov byte[es:bx],00h
add bx,1
loop em80
add bx,320-4
mov cx,4
sub si,1
jne em80

sub bx,320*8
add bx,4
mov cx,4
mov si,8
em81:
mov byte[es:bx],00h
add bx,1
loop em81
add bx,320-4
mov cx,4
sub si,1
jne em81

sub bx,12
add bx,320*4
mov cx,4
mov si,4
em82:
mov byte[es:bx],00h
add bx,1
loop em82
add bx,320-4
mov cx,4
sub si,1
jne em82

sub bx,16*4
add bx,320*20
mov cx,4
mov si,4
em83:
mov byte[es:bx],00h
add bx,1
loop em83
add bx,320-4
mov cx,4
sub si,1
jne em83

mov cx,4
mov si,4
em84:
mov byte[es:bx],0eh
add bx,1
loop em84
add bx,320-4
mov cx,4
sub si,1
jne em84

mov cx,4
mov si,8
em85:
mov byte[es:bx],00h
add bx,1
loop em85
add bx,320-4
mov cx,4
sub si,1
jne em85

sub bx,320

mov cx,4
mov si,8
em86:
mov byte[es:bx],0eh
sub bx,1
loop em86
sub bx,320-4
mov cx,4
sub si,1
jne em86

mov cx,4
mov si,4
em87:
mov byte[es:bx],00h
sub bx,1
loop em87
sub bx,320-4
mov cx,4
sub si,1
jne em87

sub bx,7
add bx,320*5
mov cx,4
mov si,8
em88:
mov byte[es:bx],00h
add bx,1
loop em88
add bx,320-4
mov cx,4
sub si,1
jne em88

mov cx,8
mov si,8
em89:
mov byte[es:bx],00h
add bx,1
loop em89
add bx,320-8
mov cx,8
sub si,1
jne em89


ret

;-----------------RANDOM BRICK FORMATION STARTS HERE -----------------------
randombrick:
 MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX

rdtsc
xor dx,dx
mov cx,3
div cx
 mov bx,320*119
 add bx,50
 cmp dx,1
je pinkbrick
jbe orangebrick
jae bluebrick

pinkbrick:
add bx,65
mov ax,3fh
jmp formbrick1

orangebrick:
add bx,100
mov ax,2ah
jmp formbrick1

bluebrick:
mov ax,20h
add bx,85
jmp formbrick1



formbrick1:
mov cx,70
mov si,2
fb1:
mov byte[es:bx],al
add bx,1
loop fb1
add bx,320-70
mov cx,70
sub si,1
jne fb1

mov cx,17
fb2:
mov byte[es:bx],5bh
mov byte[es:bx+1],al
mov byte[es:bx+2],al
mov byte[es:bx+3],5bh
add bx,4
loop fb2
mov byte[es:bx],5bh
mov byte[es:bx+1],al

add bx,320
sub bx,66
mov cx,66
mov si,2
fb3:
mov byte[es:bx],5bh
add bx,1
loop fb3
add bx,320-66
mov cx,66
sub si,1
jne fb3

ret

; --------------------------- END OF RANDOM BRICK---------------------------------

;------------------- brick PlayAnimation---------------------------------


left1:

pusha

 MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX

mov bx, 320*120
mov cx,320
blue1:
cmp byte[es:bx],20h
je skip
add bx,1
loop blue1

mov bx,320*119
add bx,0
mov si,bx
add si,1
mov di,7
mov cx,320
brick1_left:
mov dl,byte[es:si]
mov byte[es:bx],dl
add bx,1
add si,1
loop brick1_left
add bx,320-320
mov cx,320
mov si,bx
add si,1
sub di,1
jne brick1_left

popa 
ret

skip:
popa 
ret

left3:

pusha

 MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX

mov bx, 320*192
mov cx,320
blue2:
cmp byte[es:bx],20h
je skip1
add bx,1
loop blue2

mov bx,320*170
 add bx,0
mov si,bx
add si,1
mov di,30
mov cx,320
brick3_left:
mov dl,byte[es:si]
mov byte[es:bx],dl
add bx,1
add si,1
loop brick3_left
add bx,320-320
mov cx,320
mov si,bx
add si,1
sub di,1
jne brick3_left
sub word[cs:min_leftleg],1
sub word[cs:min_rightleg],1
sub word[cs:min_head],1


popa 
ret

skip1:
popa 
ret

right2:

pusha

 MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX

mov bx, 320*156
mov cx,320
blue3:
cmp byte[es:bx],20h
je skip2
add bx,1
loop blue3

mov bx,154*320
add bx,310
mov si,bx
sub si,1
mov di,7
mov cx,320
brick2_right:
mov dl,byte[es:si]
mov byte[es:bx],dl
sub bx,1
sub si,1
loop brick2_right
add bx,320+320
mov cx,320
mov si,bx
sub si,1
sub di,1
jne brick2_right



popa 
ret

skip2:
popa 
ret

brickmovement11:
call left1
call right2
call left3
ret

right1:

pusha

 MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX

mov bx, 320*120
mov cx,320
blue4:
cmp byte[es:bx],20h
je skip3
add bx,1
loop blue4

mov bx,320*118
add bx,310
mov si,bx
sub si,1
mov di,7
mov cx,320
brick1_right:
mov dl,byte[es:si]
mov byte[es:bx],dl
sub bx,1
sub si,1
loop brick1_right
add bx,320+320
mov cx,320
mov si,bx
sub si,1
sub di,1
jne brick1_right

popa 
ret

skip3:
popa 
ret

right3:

pusha

 MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX

mov bx, 320*192
mov cx,320
blue5:
cmp byte[es:bx],20h
je skip4
add bx,1
loop blue5

mov bx,320*170
 add bx,310
mov si,bx
sub si,1
mov di,30
mov cx,320
brick3_right:
mov dl,byte[es:si]
mov byte[es:bx],dl
sub bx,1
sub si,1
loop brick3_right
add bx,320+320
mov cx,320
mov si,bx
sub si,1
sub di,1
jne brick3_right
add word[cs:min_rightleg],1
add word[cs:min_leftleg],1
add word[cs:min_head],1


popa 
ret

skip4:
popa 
ret

left2:

pusha

 MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX

mov bx, 320*156
mov cx,320
blue6:
cmp byte[es:bx],20h
je skip5
add bx,1
loop blue6

mov bx,154*320
add bx,0
mov si,bx
add si,1
mov di,7
mov cx,320
brick2_left:
mov dl,byte[es:si]
mov byte[es:bx],dl
add bx,1
add si,1
loop brick2_left
add bx,320-320
mov cx,320
mov si,bx
add si,1
sub di,1
jne brick2_left

popa 
ret

skip5:
popa 
ret

brickmovement22:
call right1
call left2
call right3
ret

brickmovement1:

cmp word [cs:endkey],0
jne skipanimation3
cmp word [cs:gamepause],0
jne skipanimation3
cmp word[cs:score],10
jbe bm1

cmp word[cs:score],20
jbe bm2

cmp word[cs:score],21
jae bm3

bm1:
call brickmovement11
ret

bm2:
call brickmovement11
call brickmovement11

ret

bm3:
call brickmovement11
call brickmovement11
call brickmovement11

skipanimation3:
ret

brickmovement2:

cmp word [cs:endkey],0
jne skipanimation2
cmp word [cs:gamepause],0
jne skipanimation2
cmp word[cs:score],10
jbe bm11

cmp word[cs:score],20
jbe bm21

cmp word[cs:score],21
jae bm31

bm11:
call brickmovement22
ret

bm21:
call brickmovement22
call brickmovement22

ret

bm31:
call brickmovement22
call brickmovement22
call brickmovement22

skipanimation2:
ret











;----------------------- THE SCROLLING DOWN OF BRICKS----------------------------

scrolldown:
push bp
mov bp,sp
push ax
push cx
push si
push di
push es
push ds
push bx

 MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX
mov ds,BX

call apple_bound_check
call delay
call jumpminnion
call brick_bound_check
cmp word[cs:brickyes],1
je niklo

std
mov bx,36
loop24:
mov di,320*199
mov si,320*198
mov dx,80
loop23:
mov cx,319
rep movsb
sub dx,1
jnz loop23
sub bx,1
jnz loop24
cld
call delay
;
call randombrick
call randomapplepos
mov word[cs:blue_time],00

pop bx
pop ds
pop es
pop di
pop si
pop cx
pop ax
pop bp

ret

niklo:
pop bx
pop ds
pop es
pop di
pop si
pop cx
pop ax
pop bp
mov word [cs:endkey],1
ret




;------------------------------END OF SCROLL DOWN----------------------------
 
 movement1:

 MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX
mov bx,319
mov al,[es:bx]
mov si,bx
sub si,1
mov di,56
mov cx,319
cli
loop1:
mov dl,[es:si]
mov byte[es:bx],dl
sub bx,1
sub si,1
loop loop1
mov byte[es:bx],al
add bx,319+320
mov al,[es:bx]
mov si,bx
sub si,1
mov cx,319
sub di,1
jne loop1
sti
ret

movement2:
 MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX
mov bx,320*56
mov al,[es:bx]
mov si,bx
add si,1
mov cx,319
mov di,51
cli
loop2:
mov dl,[es:si]
mov byte[es:bx],dl
add bx,1
add si,1
loop loop2
mov byte[es:bx],al
add bx,1
mov al,[es:bx]
mov si,bx
add si,1
mov cx,319
sub di,1
jne loop2

sti
ret

PlayAnimation:
cmp word [cs:endkey],0
jne skipanimation
cmp word [cs:gamepause],0
jne skipanimation
call movement1
call movement2
skipanimation:
ret
;--------------------END OF ANIMATION MOVEMENT-----------------------

randomapplepos:

MOV Ax,40h
 MOV BX,0A000H
MOV ES,BX


rdtsc
xor dx,dx
mov cx,3
div cx
xor ax,ax
cmp dx,1
je add4
jb add5
ja add6



add4:
ret

add5:
mov ax,70
jmp apcall1

add6:
mov ax,120
jmp apcall1

apcall1:
add ax,320*127+60
push ax
call apple
pop ax
ret   

apple:
push bp
mov bp,sp
pusha
MOV ax,40h
 MOV bx,0A000H
MOV es,bx
mov bx,[bp+4]
; mov bx,100
; add bx,320*127+60

mov cx,7
ap1:
mov byte[es:bx],04h
add bx,1
loop ap1
add bx,319-7
mov cx,9
ap2:
mov byte[es:bx],04h
add bx,1
loop ap2
add bx,320-9
mov cx,8
ap3:
mov byte[es:bx],04h
add bx,1
loop ap3
add bx,320-8
mov cx,9
ap4:
mov byte[es:bx],04h
add bx,1
loop ap4
add bx,320-8
mov dx,2
mov cx,7
ap5:
mov byte[es:bx],04h
add bx,1
loop ap5
add bx,320-7
mov cx,7
sub dx,1
jne ap5

add bx,1
mov cx,2
mov dx,2
ap6:
mov byte[es:bx],04h
add bx,1
loop ap6
add bx,1
mov cx,2
sub dx,1
jne ap6

popa
pop bp
ret

; ------------------- end of apple ------------------------------

; --------------boundary check for bricks while jump ----------------------

brick_bound_check:
MOV ax,40h
 MOV bx,0A000H
MOV es,bx
xor ax,ax
mov bx,[cs:min_leftleg]
sub bx,10880
mov al,[es:bx]
cmp al,67h
je next1
ret
next1:
xor ax,ax
mov bx,[cs:min_rightleg]
sub bx,10880
mov al,[es:bx]
cmp al,67h
je incr
ret

incr:mov word[cs:brickyes],1
ret
;--------------------- end of boundary check--------------------------

;---------------------check if the minnion eat the apple or not----------------

apple_bound_check:
pusha
MOV ax,40h
MOV bx,0A000H
MOV es,bx
MOV bx,[cs:min_head]
sub bx,320*3
mov cx,11

checking:
mov al,[es:bx]
cmp al,04h
je adding
add bx,1
loop checking
popa
ret

adding:
add word[cs:score],1
popa
ret 


;------------------ end of eating check--------------------

;------------------ score display----------------------------

displayScore:
         

 ; printing the word SCORE
 mov ah,02h
mov bh,0
mov dh,90
mov dl,92
int 10h
                mov ah,0x09
mov al,':'
mov bx,0xf
mov cx,1
int 0x10
 
 mov ah,02h
mov bh,0
mov dh,90
mov dl,91
int 10h
                mov ah,0x09
mov al,'e'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,90
mov dl,90
int 10h
                mov ah,0x09
mov al,'r'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,90
mov dl,89
int 10h
                mov ah,0x09
mov al,'o'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,90
mov dl,88
int 10h
                mov ah,0x09
mov al,'c'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,90
mov dl,87
int 10h
                mov ah,0x09
mov al,'S'
mov bx,0xf
mov cx,1
int 0x10



; ----- word score ended --------------

mov ah,02h
mov bh,0
mov dh,90
mov dl,94
int 10h

mov al,[score]
mov ah,0
mov bl,10
div bl
add al,'0'
add ah,'0'
mov dx,ax

mov ah,0x09
mov al,dh
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
;mov dx, 0
mov dh,90
mov dl,93
int 10h

mov al,[score]
mov ah,0
mov bl,10
div bl
add al,'0'
add ah,'0'
mov dx,ax

mov ah,0x09
mov al,dl
mov bx,0xf
mov cx,1
int 0x10


ret


;-------------------End of score---------------------------------

;---------------start of timer -----------------------------

displayTime:

mov ah,02h
mov bh,0
mov dh,90
mov dl,57
int 10h

mov al,[time1]
mov ah,0
mov bl,10
div bl
add al,'0'
add ah,'0'
mov dx,ax

mov ah,0x09
mov al,dh
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
;mov dx, 0
mov dh,90
mov dl,56
int 10h

mov al,[time1]
mov ah,0
mov bl,10
div bl
add al,'0'
add ah,'0'
mov dx,ax

mov ah,0x09
mov al,dl
mov bx,0xf
mov cx,1
int 0x10

 mov ah,02h
mov bh,0
mov dh,90
mov dl,58
int 10h
                mov ah,0x09
mov al,':'
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
mov dh,90
mov dl,60
int 10h

mov al,[time2]
mov ah,0
mov bl,10
div bl
add al,'0'
add ah,'0'
mov dx,ax

mov ah,0x09
mov al,dh
mov bx,0xf
mov cx,1
int 0x10

mov ah,02h
mov bh,0
;mov dx, 0
mov dh,90
mov dl,59
int 10h

mov al,[time2]
mov ah,0
mov bl,10
div bl
add al,'0'
add ah,'0'
mov dx,ax

mov ah,0x09
mov al,dl
mov bx,0xf
mov cx,1
int 0x10

ret

;------------------------- end of time ----------------------------------
;-------------------------the blue brick check--------------------------------------

checkblue:
 MOV ax,40h
 MOV bx,0A000H
MOV es,bx

mov bx,[cs:min_leftleg]
add bx,320
cmp byte[es:bx],20h
je nextcheck
jne nextcompare

nextcompare:

mov bx,[cs:min_rightleg]
add bx,320
cmp byte[es:bx],20h
je nextcheck
jne update

nextcheck:
add word[cs:blue_time],1
cmp word[cs:blue_time],90
je Termination
ret

update:
mov word[cs:blue_time],0
ret
;----------------------------------------------------------------------------
Termination:
call delay
mov bx,320*192
mov cx,320
mov dx,20
BlueTer:
mov byte[es:bx],67h
add bx,1
loop BlueTer
mov cx,320
sub dx,1
jne BlueTer

call delay
call delay
call delay
call delay
call delay
call delay
call delay
call delay

mov word [cs:endkey],1
ret



;------------------------end of check for termination at blue brick------------------------------
;------------------the main timer ---------------------------------

TheTimer:
pusha

call checkblue
add word[cs:time1],1
cmp word[cs:time1],18
je increment

mov al, 0x20
out 0x20, al
;jmp far [cs:oldtimer]

popa
iret
increment:
	mov al,0x20
	out 0x20, al
mov word[cs:time1],0
add word[cs:time2],1
call displayTime	
	
    popa
	iret

;-------------------------kbisr------------------------

kbisr: push ax
push es

 MOV ax,40h
 MOV bx,0A000H
MOV es,bx


in al, 0x60 ; read a char from keyboard port, scancode

cmp al, 0x48
jne nextcmp ; leave interrupt routine
call scrolldown ; no, try next comparison
call displayScore

nextcmp:
cmp al,0x1
jne nomatch
;mov al, 0x20
;out 0x20, al ; send EOI to PIC
pop es
pop ax
mov al, 0x20
out 0x20, al
call Confirmation_check
mov al, 0x20
out 0x20, al
jmp far [cs:oldisr]

nomatch:
;mov al, 0x20
;out 0x20, al ; send EOI to PIC
pop es
pop ax
mov al, 0x20
out 0x20, al
iret
;iret

;--------------------------------------END OF kbisr-------------------------------------------------

;-------------------------delay function: give a pause --------------------------------

delay:     push cx
mov cx, 0xFFFF
loopd1: loop loopd1
mov cx, 0xFFFF
loopd2: loop loopd2
mov cx, 0xFFFF

pop cx
ret
;----------------------- the delay FUNCTION------------------------
;----------------------termination screen-------------------

GameTermination:
xor ax,AX
mov es,ax
cli
mov ax,[oldisr]
mov word [es:9*4],ax
mov ax,[oldisr+2]
mov word [es:9*4+2],ax

mov ax,[oldtimer]
mov word [es:8*4],ax
mov ax,[oldtimer+2]
mov word [es:8*4+2],ax
sti

call end_block
push word[cs:score] 
call end_msg_and_score
call end_minnion
 
call Longdelay
call Longdelay
call Longdelay
call Longdelay

Mov ah,0
Mov al,0x03
Int 0x10
ret 
 
 ;-----------------------------end of termination screen-------------
;-----------------------------------------THE PRINT SCREEN FUNCTION------------------------

PrintStartScreen:
pusha
call upperpart
 call extra_roads
 call jumpin_minion
 call upper_scenery
 call gun_minion
 call bricks
 call randomapplepos
 call displayScore
 call displayTime
 popa
 
 ret
 
 
;--------------------START OF MAIN FUNCTION-------------------------------------
start:
MOV AX,0013H
 INT 10H

 call PrintStartScreen
xor ax, ax
mov es, ax ; es=0, point es to IVT base
		mov ax, [es:9*4]
		mov [oldisr], ax ; save offset of old routine
		mov ax, [es:9*4+2]
		mov [oldisr+2], ax ; save segment of old routine
		
		mov ax,[es:8*4]
		mov word [oldtimer],ax
		mov ax,[es:8*4+2]
		mov word [oldtimer+2],ax


cli ; disable interrupts

mov word [es:9*4], kbisr ; store offset at n*4....... csabc:kbisr
mov [es:9*4+2], cs ; store segment at n*4+2

 mov word [es:8*4], TheTimer; store offset at n*4
 mov [es:8*4+2], cs ; store segment at n*4+2
 sti ; enable interrupts

; mov dx, start ; end of resident portion
		; add dx, 15 ; round up to next para
		; mov cl, 4
		; shr dx, cl ; number of paras..../2^4

 loopp:

cmp word[cs:endkey],0
jne exit
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1

call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2

call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1
call PlayAnimation
call brickmovement1

call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
call PlayAnimation
call brickmovement2
 
 jmp loopp



exit:

call GameTermination
mov ax,0x4c00
int 0x21
