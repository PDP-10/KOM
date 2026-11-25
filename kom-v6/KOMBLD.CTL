!KOMBLD.CTL - Compile, link and save KOM 6 on a stock TOPS-20.
!
!Put all *.MAC files, FEATUR.MAC and KOMLNK.CMD in PS:<KOM-BUILD>
!and run:   TAKE KOMSUB.CMD   (submits this file)
!
!Needs MONSYM.UNV and MACSYM.UNV on UNV: (KOMMAC searches UNV:MONSYM).
!If your system has no UNV: logical name, uncomment the next line.
!@DEFINE UNV: SYS:
!
@CONNECT PS:<KOM-BUILD>
@NOERROR
@DELETE *.UNV,*.REL
@EXPUNGE
@ERROR ?
@MACRO
*kommac.unv=featur.mac,kommac.mac
*add.rel=add.mac
*addent.rel=addent.mac
*addlis.rel=addlis.mac
*addlnk.rel=addlnk.mac
*adreli.rel=adreli.mac
*alltab.rel=alltab.mac
*calvid.rel=calvid.mac
*chanam.rel=chanam.mac
*chapgs.rel=chapgs.mac
*chapre.rel=chapre.mac
*chatab.rel=chatab.mac
*chatyp.rel=chatyp.mac
*chknew.rel=chknew.mac
*chkrec.rel=chkrec.mac
*comput.rel=comput.mac
*creatm.rel=creatm.mac
*creemp.rel=creemp.mac
*crelnk.rel=crelnk.mac
*creloc.rel=creloc.mac
*cremar.rel=cremar.mac
*cremee.rel=cremee.mac
*crenam.rel=crenam.mac
*creper.rel=creper.mac
*crepre.rel=crepre.mac
*dbcon.rel=dbcon.mac
*dbpro.rel=dbpro.mac
*deamon.rel=deamon.mac
*defspe.rel=defspe.mac
*delobj.rel=delobj.mac
*displa.rel=displa.mac
*edit.rel=edit.mac
*entcon.rel=entcon.mac
*enter.rel=enter.mac
*errlog.rel=errlog.mac
*exclud.rel=exclud.mac
*filcon.rel=filcon.mac
*filpro.rel=filpro.mac
*find.rel=find.mac
*genera.rel=genera.mac
*getchr.rel=getchr.mac
*getnum.rel=getnum.mac
*gtname.rel=gtname.mac
*help.rel=help.mac
*impure.rel=impure.mac
*joinmt.rel=joinmt.mac
*liscom.rel=liscom.mac
*lismee.rel=lismee.mac
*lisper.rel=lisper.mac
*lispre.rel=lispre.mac
*loaemp.rel=loaemp.mac
*login.rel=login.mac
*mark.rel=mark.mac
*match.rel=match.mac
*member.rel=member.mac
*mkcomm.rel=mkcomm.mac
*mkmenu.rel=mkmenu.mac
*mkmess.rel=mkmess.mac
*monfil.rel=monfil.mac
*monito.rel=monito.mac
*montmp.rel=montmp.mac
*movent.rel=movent.mac
*new.rel=new.mac
*newnam.rel=newnam.mac
*nexcom.rel=nexcom.mac
*nexlet.rel=nexlet.mac
*objsta.rel=objsta.mac
*oerase.rel=oerase.mac
*onlyre.rel=onlyre.mac
*outent.rel=outent.mac
*prior.rel=prior.mac
*prirec.rel=prirec.mac
*prnews.rel=prnews.mac
*prpest.rel=prpest.mac
*quit.rel=quit.mac
*rdnext.rel=rdnext.mac
*rdobj.rel=rdobj.mac
*read.rel=read.mac
*refina.rel=refina.mac
*reptim.rel=reptim.mac
*revfun.rel=revfun.mac
*review.rel=review.mac
*revtab.rel=revtab.mac
*runtab.rel=runtab.mac
*scndat.rel=scndat.mac
*search.rel=search.mac
*site.rel=site.mac
*strcon.rel=strcon.mac
*strpro.rel=strpro.mac
*subtra.rel=subtra.mac
*sysinf.rel=sysinf.mac
*tercon.rel=tercon.mac
*terpro.rel=terpro.mac
*tertab.rel=tertab.mac
*texter.rel=texter.mac
*topcom.rel=topcom.mac
*updbeg.rel=updbeg.mac
*updlse.rel=updlse.mac
*uppmun.rel=uppmun.mac
*waitx.rel=waitx.mac
*wrient.rel=wrient.mac
*writee.rel=writee.mac
*zapobj.rel=zapobj.mac
=^Z
@LOAD @KOMLNK.CMD
@NOERROR
@SET PAGE-ACCESS 400:677 NO WRITE NO COPY-ON-WRITE
@ERROR ?
@SAVE KOM.EXE
!..and no more
