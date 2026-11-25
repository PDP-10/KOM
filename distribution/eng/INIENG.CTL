!Control file to initialize a fresh KOM data base. English dialogue. -*-Text-*-
!	870603-1252/KPJ
!Define WORKIT: as the name of the program.
!Define TMPCOR: as the name of the temporary file used by the program.
!
!WORKIT: = KOM:KOM.EXE (KOM% only grants access when KOM runs execute-only from KOM:).
!TMPCOR: = KOM-TMPCOR.TMP in the login directory of the user who runs
!this job; KOM always writes the file there.  CONNECT with no argument
!goes to the login directory, and DSK: is the connected directory.
@DEFINE (LOGICAL NAME) WORKIT: (AS) KOM:KOM.EXE
@CONNECT
@DEFINE (LOGICAL NAME) TMPCOR: (AS) DSK:KOM-TMPCOR.TMP
!
@NOERROR
@DELETE (FILES) TMPCOR:
@EXPUNGE
@ERROR ?
!KOM prints "?" in normal dialogue (e.g. "? You are not a member of"),
!and batch aborts on "?". Hence NOERROR while KOM runs.
@NOERROR
@RUN (PROGRAM) WORKIT:
*Creator of this data base
*NEW
*veryobviouspassword
*veryobviouspassword
*I am a program, and have no telephone.
*I am a program, and have no address.
*Switch on short menu
*Switch off empty
*Switch off line
*Switch off command
*Switch off automatic
*Switch on obey
*Create conference Presentations (of) conferences
*Open
*No
*Create conference Presentations (of) users
*Open
*No
*Create conference Administrators conference
*Open
*No
*Create conference Messages (to) letter writers
*Open
*No
*Create conference Speakers Corner
*Open
*No
*Use administrator
*Define
*Conference 1
*Conference 2
*Conference 3
*Conference 4
*Change type Conference 1
*Write-protected Open
*Conference 5
*Change type Conference 2
*Write-protected Open
*Conference 5
*Change type Conference 3
*Closed
*Change type Conference 4
*Write-protected Open
*Conference 5
*Change type Person 1
*Write-protected Open
*Conference 3
*Change presentation Conference 1
*Conference for conference presentations.
*!Enter
*Change presentation Conference 2
*Conference for user presentations.
*!Enter
*Change presentation Conference 3
*Conference for the administrators. Feel free to ask for help.
*!Enter
*Change presentation Conference 4
*Conference for messages to letter writers.
*!Enter
*Change presentation Conference 5
*Conference for general discussions are various things.
*!Enter
*Change presentation Person 1
*Hello. I am a program. I created this data base.  Any mail you send me will
*instead be sent to the administrators. Have a nice day.
*!Enter
*Quit
;..and no more