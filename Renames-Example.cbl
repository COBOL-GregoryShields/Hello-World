       IDENTIFICATION DIVISION.
       PROGRAM-ID. CBLRNAME.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 WS-DESCRIPTION.
               05 WS-NUM.
                   10 WS-NUM1  PIC 9(2) VALUE 11.
                   10 WS-NUM2  PIC 9(2) VALUE 22.
               05 WS-CHAR.
                   10 WS-CHAR1 PIC X(2) VALUE 'XX'.
                   10 WS-CHAR2 PIC X(2) VALUE 'YY'.
           66 WS-RENAME RENAMES WS-NUM2 THRU WS-CHAR2.

           01  EMPL-DEPT-RECORD.
               05  EMP-DETAILS.
                   10  EMP-NAME      PIC X(15) VALUE 'John'.
                   10  EMP-SALARY    PIC 9(06) VALUE 10000.
               05  DEPT-DETAILS.
                   10  DEPT-NAME     PIC X(10) VALUE 'Cosmetics'.
                   10  DEPT-MANAGER  PIC X(15) VALUE 'Joan'.
                   10  DEPT-LOCATION PIC X(10) VALUE 'Floor 1'.
      *    Group EMP-NAME, EMP-SALARY, and DEPT-NAME together.
           66 EMP-DEPT-INFO RENAMES EMP-NAME THRU DEPT-NAME.

       PROCEDURE DIVISION.
       DISPLAY "WS-RENAME: " WS-RENAME.
       DISPLAY "EMP-DEPT-INFO: " EMP-DEPT-INFO.
       DISPLAY "DEPT-NAME: " DEPT-NAME.
       GOBACK.

