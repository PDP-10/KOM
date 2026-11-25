!MONSUB.CMD - Submit MONGEN.CTL (step 2 of the monitor build).
!Run with:  TAKE MONSUB.CMD   only after MSYSUB.CMD's MONSYM job is done.
!Compiles the whole monitor (with GTKOM), links it and saves MONITR.EXE
!in PS:<MONITOR-BUILD>.  Nothing is installed in SYSTEM:.
!Log goes to PS:<MONITOR-BUILD>MONGEN.LOG, it is not printed
!(/OUTPUT:NOLOG), it is replaced on each run (/BATCH-LOG:SUPERSEDE),
!and the job may run for at most one hour.
SUBMIT PS:<MONITOR-BUILD>MONGEN.CTL/LOGNAME:PS:<MONITOR-BUILD>MONGEN.LOG/OUTPUT:NOLOG/TIME:1:00:00/BATCH-LOG:SUPERSEDE
