#!/bin/bash
perl -ne 'if(/^>(\S+)/){$c=grep{/^$1$/}qw(chr1)}print if $c' hg38.fa > hg38_chr1.fa
