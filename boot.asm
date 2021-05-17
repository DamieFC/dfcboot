; boot.asm
; Bootloader for Platypus OS, adapted from Babystep tutorials on OSDev.org using BIOS.

mov ax, 0x07c0
	mov ds, ax

	mov si, msg
	cld
ch_loop:lodsb
	or al, al ; zero=end or str
	jz hang   ; get out
	mov ah, 0x0E
	mov bh, 0
	int 0x10
	jmp ch_loop

hang:
	jmp hang

msg   db 'Platypus OS BIOS booted!', 13, 10, 0
	times 512-($-$$) db 0 ; I changed it from 510 to 512
	db 0x55
	db 0xAA