
; ------- messages

M_HEAD1
        defb 'TS-BIOS Setup Utility', 0
M_HEAD2
        defb 'Build date: '
        dec8 date 4      ; day (1-31)
        defb  '.'
        dec8 date 5      ; month (1-12)
        defb  '.20'
        dec8 date 6      ; year (0-99)
        defb  ' '
        dec8 date 3      ; hour (0-23)
        defb  ':'
        dec8 date 2      ; minute (0-59)
        defb  ':'
        dec8 date 1      ; second (0-59)
        defb 0

M_HLP   defb 'Arrows - move,  Enter - change option,  F12 - exit', 0


; ------- errors

ERR_ME
        defb 'System Meditation:', 0
ERR_MEZ
        defb 'Press SS + Reset to change start-up options', 0
ERR_ME0
        defb 'UNKNOWN ERROR!', 0
ERR_ME1
		defb 'Boot-Device NOT READY!', 0
ERR_ME2
        defb 'FAT32 NOT FOUND!', 0
ERR_ME3
		defb 'boot.$c NOT FOUND!', 0


; ------- tabs
; -- options tab
OPTTAB0
        defw h'0707     ; X, Y coord of box
        defw h'0F20     ; X, Y size of box
        defw h'0A0A     ; X, Y coord of list top
        defw h'080C     ; X, Y coord of header text
        defb h'8C       ; attrs
        defb 10          ; number of options
        defb 'Select NVRAM options:', 0

		defw OPT_CFQ, SEL_CFQ   ; address of option desc, address of option choices
		defw OPT_CCH, SEL_ONF
		defw OPT_80L, SEL_ONF
		defw OPT_B1T, SEL_BOT
		defw OPT_B1B, SEL_BTB
		defw OPT_B2T, SEL_BOT
		defw OPT_B2B, SEL_BTB
		defw OPT_B1D, SEL_BDV
		defw OPT_ZPL, SEL_ZPL
		defw OPT_NGR, SEL_ONF

; -- option text
; byte - number of choices
; byte - address in NVRAM
; string - option
OPT_CFQ    defb 4, low(cfrq), 'CPU Speed, MHz:', 0
OPT_CCH    defb 2, low(cach), 'CPU Cache:', 0
OPT_80L    defb 3, low(l128), '128k Lock:', 0
OPT_B1T    defb 5, low(b1to), 'Reset to:', 0
OPT_B1B    defb 4, low(b1tb), '  bank:', 0
OPT_B2T    defb 5, low(b2to), 'CS Reset to:', 0
OPT_B2B    defb 4, low(b2tb), '  bank:', 0
OPT_B1D    defb 4, low(bdev), 'Boot Device:', 0
OPT_ZPL    defb 6, low(zpal), 'ZX Palette:', 0
OPT_NGR    defb 2, low(nres), 'NGS Reset:', 0

; -- choices
; string - choice
SEL_CFQ
		defb '       3.5', 0
        defb '         7', 0
		defb '        14', 0
		defb 'overclk 14', 0

SEL_BOT
		defb '   ROM #00', 0
		defb '   ROM #04', 0
		defb '   RAM #'
        hex8 vrompage
        defb 0
		defb 'BD boot.$c', 0
		defb 'BD sys.rom', 0

SEL_BTB
        defb '    TR-DOS', 0
		defb '  Basic 48', 0
		defb ' Basic 128', 0
		defb '       SYS', 0

SEL_BDV
        defb 'SD Z-contr', 0
        defb 'HDD Master', 0
        defb ' HDD Slave', 0
        defb '    RS-232', 0

SEL_ONF
        defb ' OFF', 0
		defb '  ON', 0
		defb 'Auto', 0

SEL_ZPL
        defb 'Default', 0   ; 0
		defb 'B.black', 0   ; 1
		defb '   Pale', 0   ; 2
		defb '   Dark', 0   ; 3
		defb 'Grayscl', 0   ; 4
		defb ' Custom', 0   ; 5


; -- palette
pal_bb               ; bright black
        defw h'0000
        defw h'0010
        defw h'4000
        defw h'4010
        defw h'0200
        defw h'0210
        defw h'4200
        defw h'4210
        defw h'2108
        defw h'0018
        defw h'6000
        defw h'6018
        defw h'0300
        defw h'0318
        defw h'6300
        defw h'6318

pal_puls             ; pulsar
        defw h'0000
        defw h'0010
        defw h'4000
        defw h'4010
        defw h'0200
        defw h'0210
        defw h'4200
        defw h'4210
        defw h'0000
        defw h'0018
        defw h'6000
        defw h'6018
        defw h'0300
        defw h'0318
        defw h'6300
        defw h'6318

pal_dark              ; dark
        defw b'000000000000000
        defw b'000000000001000
        defw b'010000000000000
        defw b'010000000001000
        defw b'000000100000000
        defw b'000000100001000
        defw b'010000100000000
        defw b'010000100001000
        defw b'000000000000000
        defw b'000000000010000
        defw b'100000000000000
        defw b'100000000010000
        defw b'000001000000000
        defw b'000001000010000
        defw b'100001000000000
        defw b'100001000010000


pal_pale              ; pale
        defw b'010000100001000
        defw b'010000100010000
        defw b'100000100001000
        defw b'100000100010000
        defw b'010001000001000
        defw b'010001000010000
        defw b'100001000001000
        defw b'100001000010000
        defw b'010000100001000
        defw b'010000100011000
        defw b'110000100001000
        defw b'110000100011000
        defw b'010001100001000
        defw b'010001100011000
        defw b'110001100001000
        defw b'110001100011000

pal_gsc               ; grayscale
        defw 0  << 10 + 0  << 5 + 0
        defw 3  << 10 + 3  << 5 + 3
        defw 6  << 10 + 6  << 5 + 6
        defw 9  << 10 + 9  << 5 + 9
        defw 12 << 10 + 12 << 5 + 12
        defw 16 << 10 + 16 << 5 + 16
        defw 19 << 10 + 19 << 5 + 19
        defw 22 << 10 + 22 << 5 + 22
        defw 0  << 10 + 0  << 5 + 0
        defw 4  << 10 + 4  << 5 + 4
        defw 8  << 10 + 8  << 5 + 8
        defw 11 << 10 + 11 << 5 + 11
        defw 14 << 10 + 14 << 5 + 14
        defw 17 << 10 + 17 << 5 + 17
        defw 20 << 10 + 20 << 5 + 20
        defw 24 << 10 + 24 << 5 + 24

pal_64c
        defw h'0000
        defw h'0008
        defw h'0010
        defw h'0018
        defw h'2000
        defw h'2008
        defw h'2010
        defw h'2018
        defw h'4000
        defw h'4008
        defw h'4010
        defw h'4018
        defw h'6000
        defw h'6008
        defw h'6010
        defw h'6018
        defw h'0100
        defw h'0108
        defw h'0110
        defw h'0118
        defw h'2100
        defw h'2108
        defw h'2110
        defw h'2118
        defw h'4100
        defw h'4108
        defw h'4110
        defw h'4118
        defw h'6100
        defw h'6108
        defw h'6110
        defw h'6118
        defw h'0200
        defw h'0208
        defw h'0210
        defw h'0218
        defw h'2200
        defw h'2208
        defw h'2210
        defw h'2218
        defw h'4200
        defw h'4208
        defw h'4210
        defw h'4218
        defw h'6200
        defw h'6208
        defw h'6210
        defw h'6218
        defw h'0300
        defw h'0308
        defw h'0310
        defw h'0318
        defw h'2300
        defw h'2308
        defw h'2310
        defw h'2318
        defw h'4300
        defw h'4308
        defw h'4310
        defw h'4318
        defw h'6300
        defw h'6308
        defw h'6310
        defw h'6318

keys_norm
        defb 0, 'zxcvasdfgqwert1234509876poiuy', 13, 'lkjh ', 14, 'mnb'
keys_caps
        defb 0, 'ZXCVASDFGQWERT', 7, 6, 4, 5, 8, 12, 15, 9, 11, 10, 'POIUY', 13, 'LKJH ', 14, 'MNB'
keys_symb
        defb 0, ':`?/~|\\{}   <>!@#$%_)(', 39, '&', 34, '; ][', 13, '=+-^ ', 14, '.,*'

font8
#include "866_code.asm"

rslsys
#include "rslsys.asm"

sysvars
#include "sysvars.asm"
