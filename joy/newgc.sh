mv gc gc-5.3
gtar -zxvf gc.tar.gz
ln -s gc6.0 gc
cd gc
./configure
cp include/gc.h .
cd ..
gmake -f make.gc
