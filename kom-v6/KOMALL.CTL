!	Control file to compile, link and save a KOM program for TOPS-20.
!	(Assumes You have write access to the WK: are.)		870603-1154
!
@DEFINE (LOGICAL NAME) mak: (AS) ps:<KPJ-Jaakkola.rls.src>
@DEFINE (LOGICAL NAME) mik: (AS) ps:<KPJ-Jaakkola.rls.mic>
@DEFINE (LOGICAL NAME) wk:  (AS) ps:<KPJ-Jaakkola.rls.tst>
@ENABLE	!turn on all capabilities!
@CONNECT (TO DIRECTORY) wk:
@
@DELETE (FILES) *.unv,*.rel,
@EXPUNGE
@!Yes!
@!Confirm!
@COPY (FROM) mak:featur.mac (TO) dsk:featur.mac
@MACRO.EXE
*kommac.unv=dsk:featur.mac,mak:kommac.mac
*add.rel=mak:add.mac
*addent.rel=mak:addent.mac
*addlis.rel=mak:addlis.mac
*addlnk.rel=mak:addlnk.mac
*adreli.rel=mak:adreli.mac
*alltab.rel=mak:alltab.mac
*calvid.rel=mak:calvid.mac
*chanam.rel=mak:chanam.mac
*chapgs.rel=mak:chapgs.mac
*chapre.rel=mak:chapre.mac
*chatab.rel=mak:chatab.mac
*chatyp.rel=mak:chatyp.mac
*chknew.rel=mak:chknew.mac
*chkrec.rel=mak:chkrec.mac
*comput.rel=mak:comput.mac
*creatm.rel=mak:creatm.mac
*creemp.rel=mak:creemp.mac
*crelnk.rel=mak:crelnk.mac
*creloc.rel=mak:creloc.mac
*cremar.rel=mak:cremar.mac
*cremee.rel=mak:cremee.mac
*crenam.rel=mak:crenam.mac
*creper.rel=mak:creper.mac
*crepre.rel=mak:crepre.mac
*dbcon.rel=mak:dbcon.mac
*dbpro.rel=mak:dbpro.mac
*deamon.rel=mak:deamon.mac
*defspe.rel=mak:defspe.mac
*delobj.rel=mak:delobj.mac
*displa.rel=mak:displa.mac
*edit.rel=mak:edit.mac
*entcon.rel=mak:entcon.mac
*enter.rel=mak:enter.mac
*ERRLOG.REL=MAK:ERRLOG.MAC
*exclud.rel=mak:exclud.mac
*filcon.rel=mak:filcon.mac
*filpro.rel=mak:filpro.mac
*find.rel=mak:find.mac
*genera.rel=mak:genera.mac
*getchr.rel=mak:getchr.mac
*getnum.rel=mak:getnum.mac
*gtname.rel=mak:gtname.mac
*help.rel=mak:help.mac
*IMPURE.REL=MAK:IMPURE.MAC
*joinmt.rel=mak:joinmt.mac
*liscom.rel=mak:liscom.mac
*lismee.rel=mak:lismee.mac
*lisper.rel=mak:lisper.mac
*lispre.rel=mak:lispre.mac
*loaemp.rel=mak:loaemp.mac
*login.rel=mak:login.mac
*mark.rel=mak:mark.mac
*match.rel=mak:match.mac
*member.rel=mak:member.mac
*mkcomm.rel=mak:mkcomm.mac
*mkmenu.rel=mak:mkmenu.mac
*mkmess.rel=mak:mkmess.mac
*monfil.rel=mak:monfil.mac
*monito.rel=mak:monito.mac
*montmp.rel=mak:montmp.mac
*movent.rel=mak:movent.mac
*new.rel=mak:new.mac
*newnam.rel=mak:newnam.mac
*nexcom.rel=mak:nexcom.mac
*nexlet.rel=mak:nexlet.mac
*objsta.rel=mak:objsta.mac
*oerase.rel=mak:oerase.mac
*onlyre.rel=mak:onlyre.mac
*outent.rel=mak:outent.mac
*prior.rel=mak:prior.mac
*prirec.rel=mak:prirec.mac
*prnews.rel=mak:prnews.mac
*prpest.rel=mak:prpest.mac
*ptykom.rel=mak:ptykom.mac
*quit.rel=mak:quit.mac
*rdnext.rel=mak:rdnext.mac
*rdobj.rel=mak:rdobj.mac
*read.rel=mak:read.mac
*refina.rel=mak:refina.mac
*reptim.rel=mak:reptim.mac
*revfun.rel=mak:revfun.mac
*review.rel=mak:review.mac
*revtab.rel=mak:revtab.mac
*runtab.rel=mak:runtab.mac
*scndat.rel=mak:scndat.mac
*search.rel=mak:search.mac
*site.rel=mak:site.mac
*strcon.rel=mak:strcon.mac
*strpro.rel=mak:strpro.mac
*subtra.rel=mak:subtra.mac
*sysinf.rel=mak:sysinf.mac
*tercon.rel=mak:tercon.mac
*terpro.rel=mak:terpro.mac
*tertab.rel=mak:tertab.mac
*texter.rel=mak:texter.mac
*topcom.rel=mak:topcom.mac
*updbeg.rel=mak:updbeg.mac
*updlse.rel=mak:updlse.mac
*uppmun.rel=mak:uppmun.mac
*waitx.rel=mak:waitx.mac
*wrient.rel=mak:wrient.mac
*writee.rel=mak:writee.mac
*zapobj.rel=mak:zapobj.mac
=^Z
@LOAD (FROM) @mik:new20.cmd
@NOERROR
@SET PAGE-ACCESS (OF PAGES) 400:677 (ACCESS) NO WRITE NO COPY-ON-WRITE
@ERROR ?
@SAVE (ON FILE) kom.exe.-1
;..and no more