#name: non-contiguous
#source: non-contiguous.s
#as: -mlittle-endian
#ld: --enable-non-contiguous-regions -T non-contiguous.ld -EL
#objdump: -rdtsh
#xfail: [is_generic]

.*:     file format .*

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.raml         0000000c  1fff0000  1fff0000  00010000  2\*\*0
                  CONTENTS, ALLOC, LOAD, DATA
  1 \.ramu         00000014  20000000  1fff000c  00020000  2\*\*0
                  CONTENTS, ALLOC, LOAD, DATA
  2 \.ramz         0000003c  20040000  20000014  00030000  2\*\*0
                  CONTENTS, ALLOC, LOAD, DATA
SYMBOL TABLE:
1fff0000 l    d  .raml	00000000 .raml
20000000 l    d  .ramu	00000000 .ramu
20040000 l    d  .ramz	00000000 .ramz
00000000 l    df \*ABS\*	00000000 .*/non-contiguous.o
00000002 l       \*ABS\*	00000000 ALIGN
1fff000c g       .raml	00000000 _raml_end
2004003c g       .ramz	00000000 _ramz_end
20000000 g       .ramu	00000000 _rmau_start
1fff0000 g       .raml	00000000 _rmal_start
20000014 g       .ramu	00000000 _ramu_end
20040000 g       .ramz	00000000 _rmaz_start


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
