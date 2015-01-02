#! .bin/sh
for file in *.html
do
    cp  $file  $file.bak &&
    sed  's|/www/philo|/philo|g'  $file.bak  >  $file
done
