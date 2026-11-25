!KOMINI.CMD - Submit the data base initialization.  Run with:  TAKE KOMINI.CMD
!Run it only on a NEW, EMPTY data base (create it first, see CRETDB.CTL).
!Uses INIENG.CTL (English data base, FTDB==1).
!Log goes to PS:<KOM-BUILD>INIENG.LOG, it is not printed
!(/OUTPUT:NOLOG), it is replaced on each run (/BATCH-LOG:SUPERSEDE),
!and the job may run for at most 30 minutes.
SUBMIT PS:<KOM-BUILD>INIENG.CTL/LOGNAME:PS:<KOM-BUILD>INIENG.LOG/OUTPUT:NOLOG/TIME:0:30:00/BATCH-LOG:SUPERSEDE
