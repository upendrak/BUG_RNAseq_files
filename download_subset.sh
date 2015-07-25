#!/bin/bash

#Download processed fastq files
curl -OL http://hgdownload.cse.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeHaibRnaSeq/wgEncodeHaibRnaSeqT47dDm002p4hRawDataRep1.fastq.gz
curl -OL http://hgdownload.cse.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeHaibRnaSeq/wgEncodeHaibRnaSeqT47dDm002p4hRawDataRep2.fastq.gz
curl -OL http://hgdownload.cse.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeHaibRnaSeq/wgEncodeHaibRnaSeqT47dEstradia4hRawDataRep1.fastq.gz
curl -OL http://hgdownload.cse.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeHaibRnaSeq/wgEncodeHaibRnaSeqT47dEstradia4hRawDataRep2.fastq.gz

# unzip the files
gunzip wg*fastq.gz

# Rename and subset them
for i in wg*.fastq
  do
  name=$(echo $i | awk -F"wgEncodeHaibRnaSeq" '{print $NF}' | awk -F".fastq" '{print $1}')
  echo $name
  head -400000 $i > $name.subset.test.fastq
  gzip $name.subset.test.fastq
done
