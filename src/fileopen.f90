   SUBROUTINE FILEOPEN(FNAME)
      USE IFWIN; USE KERNEL32; USE IFPORT
      IMPLICIT NONE

      CHARACTER(*) FNAME
      INTEGER(HANDLE) SELF
      CHARACTER(256) PATH
      
!     Declare structure used to pass and receive attributes

      TYPE(T_OPENFILENAME) OFN

!     Declare filter specification.  This is a concatenation of pairs of null-terminated strings.
!     The first string in each pair is the file type name, the second is a semicolon-separated list
!     of file types for the given name.  The list ends with a trailing null-terminated empty string.
 
      CHARACTER(LEN=*),PARAMETER :: FILTER_SPEC = &
        "Saved games"C//"*.SAV"C// &
        "All Files"C//"*.*"C//""C

   !  DECLARE STRING VARIABLE TO RETURN THE FILE SPECIFICATION.

      CHARACTER(LEN=256) :: FILE_SPEC = ""C
      CHARACTER(LEN=256) :: DIR_SPEC = ""C

      INTEGER(4) STATUS,ILEN,LPATH
      
      LOGICAL EX,L; SAVE L; IF (L) RETURN
      
      SELF = GETMODULEHANDLE(NULL)! GET HANDLE TO SELF
      LPATH = GETMODULEFILENAME (SELF, PATH, LEN(PATH))! GET PATH OF SELF
      LPATH=SCAN(PATH(1:LPATH),'\',.TRUE.)
      PATH=PATH(1:LPATH)//'Saved games\'
      LPATH=LPATH+12
      INQUIRE (DIRECTORY=PATH,EXIST=EX)
      IF (.NOT.EX) EX=MAKEDIRQQ(PATH)    
      
      L=.TRUE.
      CALL ZEROMEMORY(LOC(OFN),SIZEOF(OFN))
      DIR_SPEC=PATH(1:LPATH)//""C
      OFN%LSTRUCTSIZE = SIZEOF(OFN)
      OFN%HWNDOWNER = NULL  ! YOU MAY WANT TO SET THESE FOR
      OFN%HINSTANCE = NULL  ! NON-CONSOLE APPLICATIONS
      OFN%LPSTRFILTER = LOC(FILTER_SPEC)
      OFN%LPSTRCUSTOMFILTER = NULL
      OFN%NMAXCUSTFILTER = 0
      OFN%NFILTERINDEX = 1 ! SPECIFIES INITIAL FILTER VALUE
      OFN%LPSTRFILE = LOC(FILE_SPEC)
      OFN%NMAXFILE = 128
      OFN%NMAXFILETITLE = 0
      OFN%LPSTRINITIALDIR = LOC(DIR_SPEC)  ! USE WINDOWS DEFAULT DIRECTORY IF NULL
      OFN%LPSTRTITLE = LOC("Saved games"C)
      OFN%FLAGS = OFN_PATHMUSTEXIST+OFN_CREATEPROMPT+OFN_HIDEREADONLY
      OFN%LPSTRDEFEXT = LOC("TXT"C)
      OFN%LPFNHOOK = NULL
      OFN%LPTEMPLATENAME = NULL

!     CALL GETOPENFILENAME AND CHECK STATUS

      STATUS = GETOPENFILENAME(OFN)
      IF (STATUS .EQ. 0) THEN
        FNAME=' '
      ELSE
        ! GET LENGTH OF FILE_SPEC BY LOOKING FOR TRAILING NUL
        ILEN = INDEX(FILE_SPEC,CHAR(0))
        FNAME=FILE_SPEC(1:ILEN-1)
      END IF
      L=.FALSE.
      END