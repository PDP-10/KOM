!KOMSUB.CMD - Submit the KOM build.  Run with:  TAKE KOMSUB.CMD
!Log goes to PS:<KOM-BUILD>KOMBLD.LOG, it is not printed
!(/OUTPUT:NOLOG), it is replaced on each run (/BATCH-LOG:SUPERSEDE),
!and the job may run for at most one hour.
SUBMIT PS:<KOM-BUILD>KOMBLD.CTL/LOGNAME:PS:<KOM-BUILD>KOMBLD.LOG/OUTPUT:NOLOG/TIME:1:00:00/BATCH-LOG:SUPERSEDE
