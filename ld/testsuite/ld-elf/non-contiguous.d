#name: non-contiguous
#source: non-contiguous.s
#as: -mlittle-endian
#ld: --enable-non-contiguous-regions -T non-contiguous.ld -EL
#objdump: -rdsh
#xfail: [is_generic]
# These targets do not support -mlittle-endian
#skip: avr* hppa* m68hc* metag* nios2*

.*:     file format .*

Sections:
Idx Name          Size      VMA  *     LMA  *     File off  Algn
  0 \.raml         0000000c  0*1fff0000  0*1fff0000  .*  2\*\*0
                  CONTENTS, ALLOC, LOAD, DATA
  1 \.ramu         00000014  0*20000000  0*1fff000c  .*  2\*\*0
                  CONTENTS, ALLOC, LOAD, DATA
  2 \.ramz         0000003c  0*20040000  0*20000014  .*  2\*\*0
                  CONTENTS, ALLOC, LOAD, DATA


Contents of section .raml:
 1fff0000 01000000 02000000 03000000           ............    
Contents of section .ramu:
 20000000 04000000 05000000 06000000 07000000  ................
 20000010 08000000                             ....            
Contents of section .ramz:
 20040000 09090909 09090909 09090909 09090909  ................
 20040010 09090909 09090909 09090909 09090909  ................
 20040020 09090909 09090909 09090909 09090909  ................
 20040030 09090909 09090909 09090909           ............    
