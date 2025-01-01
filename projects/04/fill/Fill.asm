// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed,
// the screen should be cleared.

//// Replace this comment with your code.

// fを押すと黒く塗りつぶす
// eを押すと白く塗りつぶす

// 定数定義
@101
D=A
@e_key
M=D

@102
D=A
@f_key
M=D

@8192
D=A
@num_pixels
M=D

(MAIN_LOOP)
    // キーボード入力をチェック
    @KBD
    D=M
    @f_key
    D=D-M
    @BLACK
    D;JEQ
    
    @KBD
    D=M
    @e_key
    D=D-M
    @WHITE
    D;JEQ

    @MAIN_LOOP
    0;JMP
    

(BLACK)
    @i
    M=0
    (BLACK_LOOP)
        @i
        D=M
        @num_pixels
        D=D-M
        @MAIN_LOOP
        D;JEQ
        @SCREEN
        D=A
        @i
        A=D+M
        M=-1
        @i
        M=M+1
        @BLACK_LOOP
        0;JMP

(WHITE)
    @i
    M=0
    (WHITE_LOOP)
        @i
        D=M
        @num_pixels
        D=D-M
        @MAIN_LOOP
        D;JEQ
        @SCREEN
        D=A
        @i
        A=D+M
        M=0
        @i
        M=M+1
        @WHITE_LOOP
        0;JMP

