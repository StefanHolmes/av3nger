   * = * "Text"

score_advance_table:
   //     *  S  C  O  R  E  _  A  D  V  A  N  C  E  _  T  A  B  L  E  *  
   .byte 5,12  // x,y of where to start drawing
   .byte !end+ - score_advance_table   // Length of string
   .byte 40,18,02,14,17,04,38,00,03,21,00,13,02,04,38,19,00,01,11,04,40
!end:


credit_table:
   //     <  1  _  O  R  _  2  _  P  L  A  Y  E  R  S  >  _  _
   .byte 36,27,38,14,17,38,28,38,15,11,00,24,04,17,18,37,38,38
   //     *  1  _  P  L  A  Y  E  R  _  _  1  _  C  O  I  N  _
   .byte 40,21,38,15,11,00,24,04,17,38,38,27,38,02,14,08,13,38
   //     *  2  _  P  L  A  Y  E  R  S  _  2  _  C  O  I  N  S
   .byte 40,28,38,15,11,00,24,04,17,18,38,28,38,02,14,08,13,18

alien_score_table:
   //     =  ?  _  M  Y  S  T  E  R  Y
   .byte 39,42,38,12,24,18,19,04,17,24
   //     =  3  0  _  P  O  I  N  T  S
   .byte 39,29,26,38,15,14,08,13,19,18
   //     =  2  0  _  P  O  I  N  T  S
   .byte 39,28,26,38,15,14,08,13,19,18
   //     =  1  0  _  P  O  I  N  T  S
   .byte 39,27,26,38,15,14,08,13,19,18

space_invaders:
   //     S  P  A  C  E  _  I  N  V  A  D  E  R  S
   .byte 18,15,00,02,04,38,08,13,21,00,03,04,17,18