       IDENTIFICATION DIVISION.
       PROGRAM-ID. USE-RENAMES.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01 WS-DESCRIPTION.

           05 WS-NUMS.
               10 WS-NUM1  PIC 9(2) VALUE  11.
               10 WS-NUM2  PIC 9(2) VALUE  22.

           05 WS-CHARS.
               10 WS-CHAR1 PIC X(2) VALUE 'XX'.
               10 WS-CHAR2 PIC X(2) VALUE 'YY'.

      *This line groups a range of variables together into a new 
      *paragraph named WS-ONENUMANDBOTHCHARS, ignoring the parent
      *paragraph names that the variables belong to.
       66 WS-ONENUMANDBOTHCHARS RENAMES WS-NUM2 THRU WS-CHAR2.
      *The whole COBOL philosophy seems to be where you have lists of
      *data items that are grouped together under paragraph names.
      *So when you use RENAMES, you are just performing a regrouping of
      *items where you can just ignore all the parent paragraph names
      *and create a new paragraph name that groups items across
      *paragraph boundaries.
      *To the best of my understanding, that is all that RENAMES does.

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

       PERFORM DISPLAY-NUMSANDCHARS.
       PERFORM DISPLAY-PARAGRAPHS.

       PERFORM CHANGE-NUMSANDCHARS.

       PERFORM DISPLAY-NUMSANDCHARS.
       PERFORM DISPLAY-PARAGRAPHS.
       
       GOBACK.

       DISPLAY-NUMSANDCHARS.
           DISPLAY "WS-NUM1:  " WS-NUM1.
           DISPLAY "WS-NUM2:  " WS-NUM2.
           DISPLAY " ".

           DISPLAY "WS-CHAR1: " WS-CHAR1.
           DISPLAY "WS-CHAR2: " WS-CHAR2.
           DISPLAY " ".

       DISPLAY-PARAGRAPHS.
           DISPLAY "WS-NUMS:  " WS-NUMS.
           DISPLAY "WS-CHARS: " WS-CHARS.
           DISPLAY "WS-ONENUMANDBOTHCHARS: " WS-ONENUMANDBOTHCHARS.
           DISPLAY " ".

       CHANGE-NUMSANDCHARS.
           MOVE 33 TO WS-NUM1.
           MOVE 44 TO WS-NUM2.

           MOVE 'ZZ' TO WS-CHAR1.
           MOVE 'AA' TO WS-CHAR2.

       DISPLAY-SOMEOTHERSHIT.
           DISPLAY "EMP-DEPT-INFO: " EMP-DEPT-INFO.

           DISPLAY "DEPT-NAME: " DEPT-NAME.

       GOBACK.

