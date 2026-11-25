# KOM

![KOM](https://user-images.githubusercontent.com/775050/40669223-bff59146-6366-11e8-91cd-e03bcad2bbdb.jpg)

KOM is a bulletin board system (conference system) for TOPS-20 (and other operating systems). It was mainly used by the Swedish university and research community in the late seventies and the eighties.
For more about KOM in general, see the [history of KOM](https://people.dsv.su.se/~jpalme/s1/history-of-KOM.html).

This source tree originates from [QZ](https://sv.wikipedia.org/wiki/QZ). The code is essentially intact. The main exception is the file FEATUR.MAC, which has been created because it was missing from the QZ sources. FEATUR.MAC holds the build-time configuration of KOM: language, data base size, which monitor calls to use, and so on. A few small fixes were also needed to build and run KOM on TOPS-20 V7.1: the global symbol NRMWID was missing (TERCON.MAC), and KOM could not run as a batch job (MONITO.MAC).

The sources and build procedures have been tested on TOPS-20 V7.1 ([PANDA distribution](https://panda.trailing-edge.com/)) running on a Raspberry Pi 4 Model B.
The distribution matters, because the KOM described here uses two JSYS calls of its own and also needs a new monitor (MONITR.EXE). The PANDA distribution's TOPS-20 RP07 disk includes the monitor source code.

All commands below are given as a user with WHEEL capability. Steps marked `$` need `ENABLE` first.

KOM is built in `TOPS20:<KOM-BUILD>` and the monitor in `TOPS20:<MONITOR-BUILD>`. The command and control files refer to these directories as `PS:<KOM-BUILD>` and `PS:<MONITOR-BUILD>`: `PS:` always names the public structure, which is called `TOPS20` on the PANDA disk.

## Build KOM.EXE

Users who use the KOM bulletin board run the program KOM.EXE. To build KOM.EXE:

- Create the build directory `TOPS20:<KOM-BUILD>`.
- Copy to `TOPS20:<KOM-BUILD>`:
  - all files in the repository directory `kom-v6/`, and
  - the files in the `distribution/` directory for the language you want (FEATUR.MAC, CRETDB.CTL, INISWE.CTL or INIENG.CTL, and KOMINI.CMD):

    | Directory | Data base and dialogue |
    |---|---|
    | `distribution/swe` | Swedish |
    | `distribution/eng` | English |

    There is no default language: the build needs the FEATUR.MAC from one of these directories. The Swedish configuration (`distribution/swe`) is the one that has been tested.

    Both use the KOM JSYS calls KOM% and GTKOM%, and need the KOM monitor (see below).

    KOM can also be built without the KOM JSYS calls, to run on a stock monitor: set `ftjsys==0` and `ftjsy2==0` in FEATUR.MAC, and KOM then uses OPENF% and GTJFN%. In that case every user needs direct read/write access to the data base file, so anyone can read or change it outside KOM. That build is not described here and its files are not included.

  Transfer the files as 7-bit ASCII text (FTP ASCII mode, LF-only line endings on the sending side, as they are stored in the repository), never in binary mode.
- KOMBLD.CTL needs `UNV:MONSYM.UNV` and `UNV:MACSYM.UNV`. If the logical name `UNV:` is not defined on your system, uncomment the line `@DEFINE UNV: SYS:` in KOMBLD.CTL.
- Run the command file KOMSUB.CMD. It submits the batch job KOMBLD.CTL. Both files refer to `TOPS20:<KOM-BUILD>`, so if you choose another directory, you have to update KOMSUB.CMD and KOMBLD.CTL (and the files from `distribution/`, which also refer to it).

```
@CONNECT TOPS20:<KOM-BUILD>
@TAKE KOMSUB.CMD
@INFORMATION BATCH-REQUESTS
```

The batch job assembles all modules, links them and saves KOM.EXE in `TOPS20:<KOM-BUILD>`. If no KOM.EXE is produced, something has failed: check `KOMBLD.LOG` for errors. A good build has `NO ERRORS DETECTED` for every module and no `%LNKUGS` (undefined global) messages from LINK.

The files KOMALL.CTL, KOMPIL.CTL, LOAD.MIC, NEW20.CMD and ILLACC.CTL in `kom-v6/` are the original QZ control files, kept for reference. They refer to QZ's directories and are not used by the build. NEW20.CMD has the same content as KOMLNK.CMD.

## Build MONITR.EXE

When users use the KOM bulletin board, they run KOM.EXE. The program runs in the context of the user's own account, which means that every user would need read/write access to the KOM data base. TOPS-20 has no feature like setuid/setgid on Linux. Instead, the monitor is patched so that users running KOM get controlled read/write access to the KOM data base, even though the file is closed to ordinary users.

Two JSYS calls, KOM% and GTKOM%, are added to the monitor (MONITR.EXE). The implementation is in the file GTKOM.MAC. The JSYS numbers are 661 and 663 (octal). KOM% works like OPENF% and GTKOM% like GTJFN%, but with WHEEL enabled during the call, and only when the caller is an execute-only program loaded from `KOM:*.EXE`.

The changes to the PANDA monitor sources that add the KOM JSYS calls are:

- `MONSYM.MAC`: two lines added to the JSYS list (JSLIST), `DEFJS KOM,661,MSEC1` and `DEFJS GTKOM,663,MSEC1`. LDINIT.MAC builds the JSYS dispatch table (JSTAB) from this list.
- `GTKOM.MAC`: new file with the KOM% and GTKOM% code.
- `MONGEN.CTL`: a `CONNECT` to the build directory added; assembles GTKOM.MAC and links GTKOM.REL into the monitor. All `COMPILE` commands use `/COMPILE`, so that every module is reassembled even when an older .REL file exists.
- `MONSYM.CTL`: a `CONNECT` to the build directory added.
- `MSYSUB.CMD` and `MONSUB.CMD`: new command files that submit MONSYM.CTL and MONGEN.CTL.

The steps for building a new monitor are:

- Create the build directory `TOPS20:<MONITOR-BUILD>`.
- Copy the current monitor sources to `TOPS20:<MONITOR-BUILD>`. In the PANDA distribution, the monitor sources are in the directory `TOPS20:<MONITOR-SOURCES>`. That directory can only be read with WHEEL enabled:

  ```
  @ENABLE
  $COPY TOPS20:<MONITOR-SOURCES>*.* TOPS20:<MONITOR-BUILD>*.*
  $DISABLE
  ```
- Copy the files `MONSYM.MAC`, `GTKOM.MAC`, `MONGEN.CTL`, `MONSYM.CTL`, `MSYSUB.CMD` and `MONSUB.CMD` from the repository directory `monitor/` to `TOPS20:<MONITOR-BUILD>`, replacing the original MONSYM.MAC, MONGEN.CTL and MONSYM.CTL copied in the previous step. The CTL and CMD files refer to `TOPS20:<MONITOR-BUILD>`. Transfer them as 7-bit ASCII text, like the KOM sources. `monitor/` holds only these new and changed files; all other monitor sources are used unchanged from `TOPS20:<MONITOR-SOURCES>`.
- MONGEN.CTL sets `DBUGSW` to 1. With this setting SYSTAT reports "System is remedial", and a BUGHLT stops in EDDT instead of reloading. Logins are not affected. For a production system, change the line `*DBUGSW[ 1` in MONGEN.CTL to `*DBUGSW[ 0` before building.
- Run MSYSUB.CMD, wait until the MONSYM batch job has completed, and then run MONSUB.CMD:

```
@CONNECT TOPS20:<MONITOR-BUILD>
@TAKE MSYSUB.CMD
@INFORMATION BATCH-REQUESTS        (wait until MONSYM is no longer listed)
@TAKE MONSUB.CMD
```

A new MONITR.EXE should have been created in the build directory. A full build takes a few minutes of CPU time. Check `MONGEN.LOG`: every module should be assembled (look for `MACRO:` lines, including GTKOM and LDINIT) without errors, and LINK should report no undefined globals.

To check that the JSYS calls are in the new monitor, look at the dispatch table with FILDDT:

```
@FILDDT
FILDDT>GET MONITR.EXE
JSTAB+661/   T1,,.KOM
JSTAB+663/   T1,,.GTKOM
^Z
```

(FILDDT shows the section number 1 as `T1`. Slots 660 and 662 contain `UJSYS`.)

## Installation and Configuration

Install the new monitor first and boot it. The KOM.EXE built with the JSYS configuration uses JSYS 661 and 663, and it does not work on a monitor without them.

### Install the monitor

1. Keep a copy of the current monitor, so that you can boot it again if the new one has problems:

   ```
   @ENABLE
   $COPY SYSTEM:MONITR.EXE SYSTEM:MONITR-OLD.EXE
   ```

2. Install the new monitor:

   ```
   $COPY TOPS20:<MONITOR-BUILD>MONITR.EXE SYSTEM:MONITR.EXE
   $DISABLE
   ```

3. Shut down the system and boot it. With KLH10, the configuration file loads `boot.sav`; start it with `go` and press RETURN at the `BOOT>` prompt to load `PS:<SYSTEM>MONITR.EXE`. To fall back to the old monitor, type `PS:<SYSTEM>MONITR-OLD.EXE` at the `BOOT>` prompt instead.

### Install KOM

1. **Create the KOM directory.** All KOM files (program, data base, error log) live in `TOPS20:<KOM>`. It is a files-only directory, and new files in it are closed to ordinary users:

   ```
   @ENABLE
   $BUILD TOPS20:<KOM>
   $$FILES-ONLY
   $$PROTECTION 777744
   $$DEFAULT-FILE-PROTECTION 770202
   $$WORKING 100000
   $$PERMANENT 100000
   $$
   ```

2. **Define the logical name KOM:.** KOM opens its data base as `KOM:KOM.DATABASE`, and the monitor only grants access to programs loaded from `KOM:*.EXE`. Define it for the running system:

   ```
   $^EDEFINE KOM: PS:<KOM>
   ```

   To make it permanent, add this line to `SYSTEM:7-1-CONFIG.CMD`:

   ```
   DEFINE KOM: PS:<KOM>
   ```

   To let users start KOM by just typing `KOM`, also add `KOM:` to the `SYS:` search list, both in 7-1-CONFIG.CMD and with `^EDEFINE` for the running system. Example:

   ```
   DEFINE SYS: PS:<SUBSYS>,KOM:,DOMAIN:,UNS:,UNIX-SYS:,SAI:,FUN:,HLP:,DSK:
   ```

3. **Install KOM.EXE as an execute-only program:**

   ```
   $COPY TOPS20:<KOM-BUILD>KOM.EXE KOM:KOM.EXE
   $SET FILE PROTECTION KOM:KOM.EXE 771212
   ```

   Rules:
   - KOM.EXE must be in `KOM:` and must be execute-only (protection 771212). Do **not** put it in `<SUBSYS>`, and do not give it a readable protection such as 775252. In both cases the monitor refuses access and KOM stops with "?Read access required".
   - Every `KOM:*.EXE` file gets WHEEL access during its file opens. Keep `KOM:` writable only by the KOM administrator, and put nothing else there.

4. **Create the data base.** This is a one-time step. Run KOM's CREATE entry point (entry vector offset 3) with WHEEL enabled. CRETDB.CTL (from `distribution/swe` or `distribution/eng`) contains the same commands, but it does not enable WHEEL, so give the commands interactively:

   ```
   $GET KOM:KOM.EXE
   $DDT
   120/   (press TAB)   .+3$G      ($ = ESC)
   ```

   KOM reports that the data base has been created (the Swedish build prints "Databasen skapad!"). The file is `KOM:KOM.DATABASE` with protection 770202. It is created sparse and grows as it is used.

5. **Initialize the data base.** This is also a one-time step, and only on a new, empty data base. It creates the person "Creator of this data base" ("Skaparen av denna databas"), the first conferences, and the standard presentations. `INISWE.CTL` (Swedish data base) or `INIENG.CTL` (English data base), and `KOMINI.CMD`, were copied from `distribution/swe` or `distribution/eng` to `TOPS20:<KOM-BUILD>` together with FEATUR.MAC. Run:

   ```
   @CONNECT TOPS20:<KOM-BUILD>
   @TAKE KOMINI.CMD
   ```

   KOMINI.CMD submits INISWE.CTL (from `swe`) or INIENG.CTL (from `eng`). Check `INISWE.LOG` (or `INIENG.LOG`) when the job has finished. The CTL file runs `KOM:KOM.EXE` in batch. KOM always writes its temporary file `KOM-TMPCOR.TMP` in the login directory of the user who runs it. The CTL file first connects to the login directory (`@CONNECT` with no argument) and defines `TMPCOR:` as `DSK:KOM-TMPCOR.TMP`, so that an old copy is deleted before KOM starts, whichever user runs the job.

6. **Change the creator's password.** The initialization gives "Creator of this data base" the password that is written in INISWE.CTL / INIENG.CTL (`bristp}fantasi` in the Swedish data base, `veryobviouspassword` in the English one), and these files are public. Log in to KOM as this person and change the password immediately.

7. **Start KOM.** Users start KOM with:

   ```
   @KOM
   ```

   (or `@KOM:KOM` if `KOM:` is not in the `SYS:` search list).

### Make the logical names permanent

A system-wide logical name defined with `^EDEFINE` only lasts until the system is restarted. When TOPS-20 starts, it reads the system configuration file `SYSTEM:7-1-CONFIG.CMD` and sets up the system-wide logical names from the `DEFINE` lines in it. To make the KOM definitions survive a boot, add them to that file.

1. **Look at the current definitions:**

   ```
   @TYPE SYSTEM:7-1-CONFIG.CMD
   @INFORMATION LOGICAL-NAMES SYS:
   ```

   `INFORMATION LOGICAL-NAMES` lists both job-wide and system-wide definitions; the KOM definitions must be listed under "System-wide".

2. **Edit a copy of the file in your own directory** (for example with EMACS or EDIT):

   ```
   @ENABLE
   $COPY SYSTEM:7-1-CONFIG.CMD 7-1-CONFIG.CMD
   ```

   - Add the definition of `KOM:` together with the other `DEFINE` lines:

     ```
     DEFINE KOM: PS:<KOM>
     ```

   - Add `KOM:` to the existing `SYS:` line, so that users can start KOM by typing `KOM`. Change only the `SYS:` line that is already in the file, and keep all the directories it lists. For example, on the PANDA system:

     ```
     DEFINE SYS: PS:<SUBSYS>,KOM:,DOMAIN:,UNS:,UNIX-SYS:,SAI:,FUN:,HLP:,DSK:
     ```

     Put `KOM:` after `PS:<SUBSYS>`, so that system programs are still found first.

3. **Install the edited file** as a new generation of the system file:

   ```
   $COPY 7-1-CONFIG.CMD SYSTEM:7-1-CONFIG.CMD
   $VDIRECTORY SYSTEM:7-1-CONFIG.CMD.*
   ```

   The previous generation remains in `<SYSTEM>`, so a mistake can be undone by copying it back.

4. **Make the same definitions in the running system**, so that you do not have to reboot to use them:

   ```
   $^EDEFINE KOM: PS:<KOM>
   $^EDEFINE SYS: PS:<SUBSYS>,KOM:,DOMAIN:,UNS:,UNIX-SYS:,SAI:,FUN:,HLP:,DSK:
   $DISABLE
   ```

   `^EDEFINE` replaces the whole definition, so give the complete `SYS:` list, exactly as in 7-1-CONFIG.CMD. `^EDEFINE` asks for confirmation; press RETURN.

5. **Check the definitions**, now and again after the next boot:

   ```
   @INFORMATION LOGICAL-NAMES KOM:
   @INFORMATION LOGICAL-NAMES SYS:
   ```

   Both should be listed under "System-wide". If a definition is missing after a boot, check the console output from the system start for error messages about 7-1-CONFIG.CMD.


