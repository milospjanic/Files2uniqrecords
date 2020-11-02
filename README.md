# Files2uniqrecords

(base) Miloss-MBP:~ milospjanic$ cat 1.test 
aaa
1
2
34
456
5678
7890
bbb
ccc
(base) Miloss-MBP:~ milospjanic$ cat 2.test 
2
34
5
678
7890
aaa
bbb
ccc
(base) Miloss-MBP:~ milospjanic$ cat 3.test 
45
678
7890
aaa
bbb
ccc
(base) Miloss-MBP:~ milospjanic$ awk '{a[$0]++} END {for(k in a) if(a[k]==1) print k}' 1.test 2.test 3.test
5
45
456
5678
1
(base) Miloss-MBP:~ milospjanic$ awk '{a[$0]++} END {for(k in a) if(a[k]==1) print k}' 1.test 2.test 3.test> uniq.test
(base) Miloss-MBP:~ milospjanic$ awk 'NR==FNR { lines[$0]=1; next } $0 in lines' 1.test uniq.test 
456
5678
1
(base) Miloss-MBP:~ milospjanic$ awk 'NR==FNR { lines[$0]=1; next } $0 in lines' 2.test uniq.test 
5
(base) Miloss-MBP:~ milospjanic$ awk 'NR==FNR { lines[$0]=1; next } $0 in lines' 3.test uniq.test 
45
(base) Miloss-MBP:~ milospjanic$ for i in *test; do echo $i; done
1.test
2.test
3.test
comb.test
uniq.test
(base) Miloss-MBP:~ milospjanic$ for i in *test; do echo $i; awk 'NR==FNR { lines[$0]=1; next } $0 in lines' $i uniq.test> $i.uniq; done
