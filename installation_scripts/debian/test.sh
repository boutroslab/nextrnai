#!/bin/sh
#Script to test NextRNAi
#Created by Krishnath Sankaran
#for dkfz
#
wget "http://www.dkfz.de/signaling/nextrnaiData/NEXT-RNAi_testData.tar.gz"
tar -xvzf "NEXT-RNAi_testData.tar.gz"
cd "testData"
rm options.txt
cp ../options.txt ../testData
#perl /home/dkfz/Desktop/dir/NEXT-RNAi_v1.31/nextrnai.pl -i common_regions.fa -s 250 -r d -d dmel-all-transcript-r5.26 -e NO -o options.txt -n nextrnaiTest
perl /opt/NEXT-RNAi_v1.31/nextrnai.pl -i common_regions.fa -s 250 -r d -d dmel-all-transcript-r5.26 -e NO -o options.txt -n nextrnaiTest
