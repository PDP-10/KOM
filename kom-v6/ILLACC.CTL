;
;	Control file to compile, link and save an ILLACC program.
;
@sys:macro.exe
*illsys.unv=illsys.mac
*dbsmac.unv=dbsmac.mac
*komdbh.rel=komdbh.mac
*illacc.rel=illacc.mac
=^Z
@load illacc.rel,rel:oprpar.rel,rel:glxlib.rel
@save illacc.exe
@set file protection illacc.exe 770202
;..and no more
