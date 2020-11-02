#create file with unique record from all files
awk '{a[$0]++} END {for(k in a) if(a[k]==1) print k}' 1.test 2.test 3.test> uniq.test

# overlap each input file with unique records
for i in *test; do echo $i; awk 'NR==FNR { lines[$0]=1; next } $0 in lines' $i uniq.test> $i.uniq; done
