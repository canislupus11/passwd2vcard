#!/bin/bash
if [ "$1" == "" ] ; then
   echo "Usage: passed2vcard.sh [PASSWD_FILE] [OUTPUT_FILE]"
else
   echo " " > $2
        for LOGIN in `cat $1|grep "/bin/bash"|grep -v spam|grep -v wirusy|grep -v mpg99|grep -v root|grep -v lupus|grep -v karbowy|cut -d":" -f1` ; do
                FN=`grep ^$LOGIN: $1 |cut -d":" -f5|cut -d"," -f1`
                N1=`echo $FN|cut -d" " -f2`
                N2=`echo $FN|cut -d" " -f1`
                echo "BEGIN:VCARD" >> $2
                echo "VERSION:3.0" >> $2
                echo "N:;$FN;$N2;;" >> $2
                echo "FN:$FN" >> $2
                echo "EMAIL:$LOGIN@up.krakow.pl"  >> $2
                echo "END:VCARD" >> $2
        done
fi
