#!/bin/bash
# Linux shell script to automate NextRNAi installation in debian/Ubuntu Os
# Written by Krishnath Sankaran
# for dkfz 
#

#Turning on exception handling
set -e
#Installing the required dependencies software
apt-get install build-essential
apt-get install gawk

#Downloading NextRNAi perl script
wget http://www.dkfz.de/signaling/nextrnaiData/NEXT-RNAi_v1.31.tar.gz
tar -xvzf NEXT-RNAi_v1.31.tar.gz
cd NEXT-RNAi_v1.31
#Creating a folder to  download and install all the required softwares to run the NextRnai script
mkdir "software"
cd "software"

#Bowtie
#wget http://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.0.6/bowtie2-2.0.6-linux-i386.zip -- This is the new version not compatible  with the NextRnai perl script
wget http://sourceforge.net/projects/bowtie-bio/files/bowtie/0.12.9/bowtie-0.12.9-linux-i386.zip
unzip -d "../software" "bowtie-0.12.9-linux-i386.zip"
mv "bowtie-0.12.9" "bowtie"

#Installation of primer3
wget http://sourceforge.net/projects/primer3/files/primer3/1.1.4/primer3-1.1.4.tar.gz
mkdir "primer3"
tar -C "primer3" -xvf "primer3-1.1.4.tar.gz"
cd "primer3/src"
make all

#Installation of mdust
cd "../.."
wget "ftp://occams.dfci.harvard.edu/pub/bio/tgi/software/seqclean/mdust.tar.gz"
mkdir "mdust"
tar -C "mdust" -xvf "mdust.tar.gz"
cd "mdust/mdust"
make all
cd ../..

#Installation of blatz
wget "http://hgwdev.cse.ucsc.edu/~kent/exe/linux/blatSuite.34.zip"
mkdir "blat"
unzip -d "../software/blat" "blatSuite.34.zip"

#Installation of blast
wget "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/release/LATEST/blast-2.2.26-ia32-linux.tar.gz"
tar -C "../software" -xvf "blast-2.2.26-ia32-linux.tar.gz"
mv "blast-2.2.26" "blast"

#Install ViennaRNA
wget "http://www.tbi.univie.ac.at/RNA/ViennaRNA-1.8.5.tar.gz"
tar -C "../software" -xvf "ViennaRNA-1.8.5.tar.gz"
mv "ViennaRNA-1.8.5" "ViennaRNA"
cd "ViennaRNA"
./configure
make
sudo make install

#Finally testing the installation using test Data - this calls a script callled test.sh to test it.
echo -n "Installation is complete would you like to test it? [y]es or [n]o:"
read inputline
if [ "$inputline" = "y" ]; then
	cd /opt
        sh test.sh
else
        echo "Installation Completed"
fi




