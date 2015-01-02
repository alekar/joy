# File:    update-tars.sh
# Usage:   $   sh  update-tars.sh
# updates gzipped tar files for
#    joyhtml  -  the *.html files
#    joylibs  -  the Joy libraries
#    joy1src  -  the *.c and *.h files, make.nogc         
#    joy      -  gc directory, the *.c and *.h files, all makefiles

joy >allhelp.temp <<!
all-libload.
help.
quit.
!
cat html-head.html allhelp.temp html-tail.html  >allhelp.html


mv usrlib.joy usrlib.joy-tmp
joy >plain-manual.temp <<!
manual.
quit.
!
joy >html-manual.html <<!
__html_manual.
quit.
!
mv usrlib.joy-tmp usrlib.joy
cat html-head.html plain-manual.temp html-tail.html  >plain-manual.html


echo  "updating joyhtml.tar  ..."
tar   -cf  joyhtml.tar \
      j0*.html jp-*.html faq*.html joybibl.bib
#     listing from joyhtml.tar:
#     tar   -tvf  joyhtml.tar
#     now  gzip  joyhtml.tar:
rm    -f  joyhtml.tar.gz
gzip  joyhtml.tar

echo  "updating joylibs.tar ..."
tar   -cf  joylibs.tar \
      *.joy  *.inp  *.out
#     listing from joylibs.tar:
#     tar   -tvf  joylibs.tar
#     now  gzip  joylibs.tar:
rm    -f  joylibs.tar.gz
gzip  joylibs.tar

echo  "updating joy1src.tar.gz ..."
tar   -cf  joy1src.tar \
      *.c  *.h  plain-manual.html  make.nogc
#     listing from  joy1src.tar:
#     tar   -tvf  joy1src.tar
#     now  gzip  joy1src.tar:
rm    -f  joy1src.tar.gz
gzip  joy1src.tar

echo  "updating  joy.tar.gz ..."
make  tar

echo  "updating directory.txt ..."
ls    -oct >joydir.txt

echo  " "


# END file update-tars

