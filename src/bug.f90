   SUBROUTINE BUG(MSG)
      USE IFQWIN
      
      INTEGER I
      CHARACTER(LEN=*) MSG

      I=MESSAGEBOXQQ(MSG//' 'C,'FATAL ERROR'C,MB$ICONSTOP)
      STOP
      END