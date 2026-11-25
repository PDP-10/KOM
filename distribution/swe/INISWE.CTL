!Control file to initialize a fresh KOM data base. Swedish dialogue. -*-Text-*-
!	870603-1253/KPJ
!Definiera WORKIT: som programmets namn.
!Definiera TMPCOR: som TMPCOR-filens namn.
!
!WORKIT: = KOM:KOM.EXE (KOM% ger bara {tkomst n{r KOM k|rs execute-only fr}n KOM:).
!TMPCOR: = KOM-TMPCOR.TMP i inloggningskatalogen f|r den anv{ndare
!som k|r jobbet; KOM skriver alltid filen d{r.  CONNECT utan argument
!g}r till inloggningskatalogen, och DSK: {r den anslutna katalogen.
@DEFINE (LOGICAL NAME) WORKIT: (AS) KOM:KOM.EXE
@CONNECT
@DEFINE (LOGICAL NAME) TMPCOR: (AS) DSK:KOM-TMPCOR.TMP
!
@NOERROR
@DELETE (FILES) TMPCOR:
@EXPUNGE
@ERROR ?
!KOM skriver "?" i vanlig dialog (t.ex. "? Du {r inte medlem i ..."),
!och batch avbryter p} "?". D{rf|r NOERROR under k|rningen.
@NOERROR
@RUN (PROGRAM) WORKIT:
*Skaparen av denna databas
*NY
*bristp}fantasi
*bristp}fantasi
*Jag {r ett program, och har ingen telefon.
*Jag {r ett program, och har ingen post-adress.
*Sl} p} korta menyer
*Sl} av tom rad
*Sl} av streck
*Sl} av kommandotolkning
*Sl} av automatisk
*Sl} p} lyd
*Skapa m|te Presentationer (av) m|ten
*\ppet
*Nej
*Skapa m|te Presentationer (av) anv{ndare
*\ppet
*Nej
*Skapa m|te Administrat|rernas m|te
*\ppet
*Nej
*Skapa m|te Anslagstavla (f|r) d|rr-lappar
*\ppet
*Nej
*Skapa m|te Fritt Forum
*\ppet
*Nej
*\verg} administrat|r
*Definiera
*M|te 1
*M|te 2
*M|te 3
*M|te 4
*[ndra typ M|te 1
*Skrivskyddat \ppet
*M|te 5
*[ndra typ M|te 2
*Skrivskyddat \ppet
*M|te 5
*[ndra typ M|te 3
*Slutet
*[ndra typ M|te 4
*Skrivskyddat \ppet
*M|te 5
*[ndra typ Person 1
*Skrivskyddat \ppet
*M|te 3
*[ndra presentation M|te 1
*M|te f|r presentationer av m|ten.
*!L{gg
*[ndra presentation M|te 2
*M|te f|r presentationer av anv{ndare.
*!L{gg
*[ndra presentation M|te 3
*Administrat|rernas m|te. Fr}ga g{rna om Ni beh|ver hj{lp.
*!L{gg
*[ndra presentation M|te 4
*M|te f|r meddelanden till brev-skrivare.
*!L{gg
*[ndra presentation M|te 5
*M|te f|r allm{nt och blandat.
*!L{gg
*[ndra presentation Person 1
*Goddag. Jag {r ett program. Jag skapade denna databas. Alla brev som s{nds
*till mig kommer att ist{llet vidare-befordras till administrat|rerna.
*Ha en trevlig dag.
*!L{gg
*Sluta
;..and no more