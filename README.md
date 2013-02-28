## NextRNAi
========
By Thomas Horn, Thomas Sandmann and Michael Boutros. 
http://www.nextrnai.org

## About

NEXT-RNAi is a software for the design and evaluation of genome-wide RNAi libraries and performs all steps from the prediction of specific and efficient RNAi target sites to the visualization of designed reagents in their genomic context. The software enables the design and evaluation of siRNAs and long dsRNAs and was implemented in an organism-independent manner allowing designs for all sequenced and annotated genomes. It requires the minimal input of desired target sequences and an off-target database.

## Publication 
Thomas Horn, Thomas Sandmann and Michael Boutros. Design and evaluation of genome-wide libraries for RNAi screens. Genome Biol. 2010 Jun 15;11(6):R61. http://genomebiology.com/2010/11/6/R61/abstract

## Website
http://www.nextrnai.org

## Prerequisites
NEXT-RNAi prerequisites depend on the mode of running that is used. E.g. for designing or evaluating siRNAs solely based on their predicted efficiency, no prerequisites are required at all. Designing or evaluating long dsRNAs requires primer3 (for primer designs) in addition. The evaluation of the reagents' specificity further requires Bowtie (for alignments). All dependencies are listed and described below.

## Required software for a Linux installation
* perl
* nextrnai.pl (NEXT-RNAi perl script)
* LICENCE
* README
* bowtie (version 0.12.5)
* primer3 (version 1.1.1)
* blat (suite 34)
* blast (version 2.2.23)
* mdust
* ViennaRNA (version 1.8.4) 

## Get started
Read the installation instruction here: http://b110-wiki.dkfz.de/signaling/wiki/display/nextrnai/Installing+NEXT-RNAi

## Installation
Installation and testscripts are available for some OS, have a look at the directory: installation_scripts