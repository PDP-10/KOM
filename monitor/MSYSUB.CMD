!MSYSUB.CMD - Submit MONSYM.CTL (step 1 of the monitor build).
!Run with:  TAKE MSYSUB.CMD   and wait until INFORMATION BATCH-REQUESTS
!no longer shows MONSYM, then run TAKE MONSUB.CMD.
!Rebuilds MONSYM.UNV/.REL (with KOM% and GTKOM%), MACSYM, MACREL and ACTSYM.
!Log goes to PS:<MONITOR-BUILD>MONSYM.LOG, it is not printed
!(/OUTPUT:NOLOG), it is replaced on each run (/BATCH-LOG:SUPERSEDE),
!and the job may run for at most ten minutes.
SUBMIT PS:<MONITOR-BUILD>MONSYM.CTL/LOGNAME:PS:<MONITOR-BUILD>MONSYM.LOG/OUTPUT:NOLOG/TIME:0:10:00/BATCH-LOG:SUPERSEDE
