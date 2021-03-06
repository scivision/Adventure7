MODULE ALLCOM
 implicit none

 logical :: debug=.false.,usesound=.true.,cheat=.false.
 integer :: ucheat

 INTEGER, PARAMETER:: MAX_LINES=22000,MAX_TRAVEL=1400,MAX_DWARF=6,MAX_LOC=300,MAX_PREP=300,MAX_OBJECT=150,LOC_SIZE=250,&
                      RTEXT_SIZE=450,TAB_SIZE=600,MAX_VERB=60,MAX_ADJ=50,MAX_TAB=600,&
                      DEADBT=10,OPENBT=2,LOCKBT=4,BURNBT=6,WEARBT=12

!        SAVCOM

 INTEGER ABBNUM,ADJ,ATBS,ATTACK,BCROSS,BONUS,CHASE,CLOCK1,CLOCK2,CLOCK3,CLSMAX,COMBO,DETAIL,DKILL,DTOTAL,DWARFN,&
         FLG239,FOO,FOOBAR,FOOD,HEALTH,HINT,HNTMAX,IKK,ILOC,IOBJ,LIMIT,LINSIZ,LOCK,MESSAG,OBJ,PTBS,RTXSIZ,SCORE,&
         SECT,SKEY,SLOC,SPK,STICK,TABNDX,TALLY,TALLY2,ACTSPK(60),CTEXT(12),CVAL(12),HNAME(10)
 LOGICAL START,TERSE,RDFLAG,CLOSED,CLOSNG,GAVEUP,LMWARN,PANIC,SCORNG,YEA

!        SV2COM

 INTEGER ANVIL,BASILISK,BATTER,BEES,BILLBD,BIRD,BRUSH,CAGE,CAKES,CHAIN,CHEST,CHLOC,CHLOC2,CLAM,CLOAK,CLSSES,COINS,CROWN,&
         DALTLC,DOG,DRAGON,EGGS,FISSUR,FLOWER,GATLOC,GLASS,GRAIL,HIVE,HONEY,HORN,JEWELS,KEYS,LYRE,MAGZIN,MERMAID,MIRROR,&
         MUSHRM,MXSCOR,NUGGET,OYSTER,PEARL,PHONE,PILLOW,POLE,POSTER,PREPAT,PREPDN,PREPFR,PREPIN,PREPOF,PREPON,PYRAM,RADIUM,&
         RING,RUG,SAPPHI,SHIELD,SHOES,SHUT,SLUGS,SNAKE,SPHERE,STEPS,STICKS,SWORD,TABLET,TRIDNT,NLOCK,VASE,WALL,WALL2,WEAR,&
         WUMPUS,Y2,YACHT,YANK
 CHARACTER(12) DTK(9)*6, ATAB(TAB_SIZE)*6, VTXT(MAX_VERB), OTXT(45), IOTXT(15), TXT(35)

!        ALLCOM

 TYPE POINT_TAB
 SEQUENCE
    INTEGER VAL    !BASE VALUE
    INTEGER PROP   !REQUIRED PROP VALUE
    INTEGER LOC    !REQUIRED LOCATION FOR VAL*5
 END TYPE POINT_TAB
 TYPE (POINT_TAB) POINTS(MAX_OBJECT)

 INTEGER INDENT,TRAVEL(MAX_TRAVEL),NUMDIE,MAXDIE,TURNS,LOC,OLDLOC,OLDLC2,NEWLOC,MAXLOC,BOTTLE,CASK,WATER,OIL,WINE,&
         LIQTYP(5),LOCCON(LOC_SIZE),OBJCON(MAX_OBJECT),DWARF,KNIFE,KNFLOC,DFLAG, DLOC(MAX_DWARF),ODLOC(MAX_DWARF),DWFMAX,&
         HOLDER(MAX_OBJECT),HLINK(MAX_OBJECT),HINTLC(20),HINTS(20,4),HNTSIZ,HNTMIN,LTEXT(LOC_SIZE),STEXT(LOC_SIZE),&
         KEY(LOC_SIZE),ABB(LOC_SIZE),LOCSIZ,PLAC(MAX_OBJECT),FIXD(MAX_OBJECT),WEIGHT(MAX_OBJECT),PROP(MAX_OBJECT),&
         ATLOC(LOC_SIZE),LINK(MAX_LOC),PLACE(MAX_OBJECT),FIXED(MAX_OBJECT),MAXOBJ,VKEY(60),PTAB(MAX_PREP),VKYSIZ,PTBSIZ,&
         VERBS(MAX_VERB),VRBX,OBJS(45),OBJX,IOBJS(15),IOBX,PREP,WORDS(45),ADJKEY(MAX_ADJ),ADJTAB(MAX_OBJECT),ADJSIZ,WDX,&
         KTAB(MAX_TAB),TABSIZ,LINES(MAX_LINES),RTEXT(RTEXT_SIZE), PTEXT(MAX_OBJECT),ZCLYD,XCLYD
 LOGICAL ISWIZ,BLKLIN,KILLED,DSEEN(MAX_DWARF),HINTED(20)

!        USEFUL MNEMONICS

 INTEGER BACK,CAVE,DPRSSN,ENTRNC,EXIT,GO,LOOK,NULL,AXE,BEAR,BOAT,BOOK,BOOK2,BOOTH,CARVNG,CHASM,CHASM2,DOOR,GNOME,GRATE,&
         LAMP,PDOOR,PLANT,PLANT2,ROCKS,ROD,ROD2,SAFE,TDOOR,TDOOR2,TROLL,TROLL2,EMRALD,SPICES,FIND,YELL,INVENT,LEAVE,POUR,&
         SAY,TAKE,THROW,IWEST,PHUCE(2,4),TK(20)
END MODULE
