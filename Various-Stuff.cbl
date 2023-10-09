      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
      *-----------------------------------------------------------------
       PROGRAM-ID. Various-Stuff.
       AUTHOR.     Gregory Shields.
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       ENVIRONMENT DIVISION.
      *-----------------------------------------------------------------
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
       SELECT person
       ASSIGN TO 
           'person.dat'.
      *    ORGANIZATION IS SEQUENTIAL
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       DATA DIVISION.
      *-----------------------------------------------------------------
       FILE SECTION.

       FD person
           RECORD CONTAINS 40 CHARACTERS
           data RECORD IS fs-record.
      * Can I comment out the 'record contains' line above?

      *01 fs-record PIC x(40).
      * Instead of the above where the entire record is one string,
      * let's break it into fields.
       01 fs-record.
           05 fs-first-name PIC x(10).
           05 fs-last-name  PIC x(10).
           05 fs-salary     PIC 9(8)v99.
           05 FILLER        PIC x(10).

      *-----------------------------------------------------------------
       WORKING-STORAGE SECTION.

       01 Data-1         PIC 9(4) VALUE 30.
       01 Data-2         PIC 9(4) VALUE 20.

      * Here's how we do a character data type.
       77 MyChar         PIC A.

      * Initialize a 2-digit integer to zero.
       01 my-int PIC 99 VALUE 0.

       01 programmer-dude PIC x(30) VALUE 
           "Greg is a Cobol programmer".

      * This is simply grouped data.
       01 ws-record.
           05 first-name PIC x(10).
           05 last-name  PIC x(10).
           05 salary     PIC 9(8)v99.
           05 FILLER     PIC x(10).
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       PROCEDURE DIVISION.
      * https://www.ibm.com/docs/en/i/7.2?topic=overview-procedures
      * A procedure consists of:
      * - A section or group of sections
      * - A paragraph or group of paragraphs
      *-----------------------------------------------------------------

       DISPLAY ' '.

      * Tell the program to execute some paragraphs.
       PERFORM Paragraph-A
      * Never mind B...
      *PERFORM Paragraph-B
       PERFORM Paragraph-C

      * Tell the program to execute some sections.
       PERFORM Gitrdun.
       PERFORM ProgrammerDude.
       PERFORM VariousAndSundry.

      * Don't fall through to the paragraphs below.
       GOBACK.

      * We can just define paragraphs if we want.
       Paragraph-A.
           DISPLAY 'Paragraph-A performed.'.
           ADD Data-1 TO Data-2.
           DISPLAY '    Data-1: ' Data-1.
           DISPLAY '    Data-2: ' Data-2.
           DISPLAY ' '.

       Paragraph-B.
           DISPLAY 'Paragraph-B performed.'.
           DISPLAY ' '.

       Paragraph-C.
           DISPLAY 'Paragraph-C performed.'.
           DISPLAY ' '.

      *-----------------------------------------------------------------
      * Or we can define sections.
       Gitrdun SECTION.
           DISPLAY 'Gitrdun section performed.'.

           WritePersonFile.
               DISPLAY '    WritePersonFile paragraph performed.'.

      *        Open our person.dat file for output.
               OPEN OUTPUT person.

      *        These 3 variables are part of ws-record.
               MOVE "Jimmy"    TO first-name
               MOVE "Dean"     TO last-name
               MOVE 132000.59  TO salary
      *        Write working storage record to file system record.
               WRITE fs-record FROM ws-record

      *        Do the same again to add more records.
               MOVE "David"    TO first-name
               MOVE "Essex"    TO last-name
               MOVE 128000.59  TO salary
               WRITE fs-record FROM ws-record

               MOVE "Rod"      TO first-name
               MOVE "Serling"  TO last-name
               MOVE 156000.59  TO salary
               WRITE fs-record FROM ws-record

               CLOSE person.

           ReadPersonFile.
               DISPLAY '    ReadPersonFile paragraph performed.'.

               OPEN INPUT person.

               READ person INTO ws-record.
               DISPLAY '        'ws-record.

               READ person INTO ws-record.
               DISPLAY '        'ws-record.

               READ person into ws-record.
               DISPLAY '        'ws-record.
               DISPLAY ' '.

               CLOSE person.

       ProgrammerDude SECTION.
           DISPLAY 'ProgrammerDude section performed.'.

           DISPLAY '    'programmer-dude.
           INSPECT programmer-dude REPLACING ALL "Greg" BY "Dale"
           DISPLAY '    'programmer-dude.
           DISPLAY ' '.

       VariousAndSundry SECTION.
           DISPLAY 'Here is some various and sundry nonsense...'
           PERFORM AddOne 2 TIMES.
           DISPLAY ' '

           PERFORM AddOne UNTIL my-int > 5.
           DISPLAY ' '

           PERFORM ShowMyInt VARYING my-int FROM 20 
                             BY 1 UNTIL my-int > 22.

           DISPLAY "my-int equals " my-int

           GOBACK.
           DISPLAY "No, don't display this.".

           AddOne.
               ADD 1 TO my-int
               DISPLAY "my-int + 1 = " my-int.

               IF my-int > 4 THEN
                   PERFORM YouGotItParagraph
               END-IF.

           YouGotItParagraph.
               DISPLAY "You got it!".

           ShowMyInt.
               DISPLAY "my-int = " my-int.

      *-----------------------------------------------------------------
      *-----------------------------------------------------------------



