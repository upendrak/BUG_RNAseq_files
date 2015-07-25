#!/bin/bash
#tophat2 -o test_tophat -G gencode.v23.annotation.gtf -p 3 hg38_chr1.fa T47dDm002p4hRawDataRep1.subset.test.fastq.gz

for i in *.fastq.gz
   do
   echo $i
   tophat2 -o $i.tophat -G gencode.v23.annotation.gtf -p 3 hg38_chr1.fa $i
done
