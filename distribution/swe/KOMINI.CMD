!KOMINI.CMD - Submit the data base initialization.  Run with:  TAKE KOMINI.CMD
!Run it only on a NEW, EMPTY data base (create it first, see CRETDB.CTL).
!Uses INISWE.CTL (Swedish data base, FTDB==0).  For an English data base
!use the KOMINI.CMD in the eng directory.
!Log goes to PS:<KOM-BUILD>INISWE.LOG, it is not printed
!(/OUTPUT:NOLOG), it is replaced on each run (/BATCH-LOG:SUPERSEDE),
!and the job may run for at most 30 minutes.
SUBMIT PS:<KOM-BUILD>INISWE.CTL/LOGNAME:PS:<KOM-BUILD>INISWE.LOG/OUTPUT:NOLOG/TIME:0:30:00/BATCH-LOG:SUPERSEDE
