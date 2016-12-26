#!/bin/bash
rm fft_ip.dat
for i in {1..2048}
do
cat fft.dat >> fft_ip.dat
done

