;This control file describes how to create a new data base.	-*-Text-*-
;
;KOM: must be defined (system logical name) and point to the KOM
;directory: the data base is created as KOM:KOM.DATABASE.
;The program is KOM:KOM.EXE: the KOM% JSYS only grants access when KOM
;runs execute-only from KOM:.
@GET KOM:KOM.EXE
@DDT
=120/^I.+3^[G
@;and no more..