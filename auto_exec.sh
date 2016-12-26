#!/bin/bash

DATE=`date +"%m_%d_%y-%T"`
echo MM_dim_size,host_wait,gpu_wait,gpu_exec > mt_plot_data.csv

for i in 8 16 32 64 128
do
echo 'completing' $i
./MM $i > out_$i__$DATE.log
#rm out_$i__$DATE.log
cd eventDumps/
echo Type,Event Number,Queued,Submitted,Start,End > event_$i.csv
cat Ev* | sed -e 's/;/,/g'  |grep -Ev 'Info' >> event_$i.csv
rm Ev*
cd ..

./mm_data.py $i

done
echo 'done'

