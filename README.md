PURE_Program
============


How to RUN
============

For each data folder we need to separate sentences with labels: 

sed '1~3d' input_entailment.txt > sentences.txt
sed -n 'p;N;N' input_entailment.txt > labels.txt

And parse the sentences 

./stanford-parser-2011-09-14/lexparser.sh sentences.txt > parsed.txt

And run the matlab code 

cd code
echo run | matlab -nodesktop


TODO: 
============

Parser.py: Adding options for generating data with the following cases: 

1) ENTAILMENT  vs. ( NEUTRAL or CONTRADICTION) -> (done) 

2) CONTRADICTION  vs. ( NEUTRAL or ENTAILMENT) 

3) NEUTRAL  vs. ( CONTRADICTION or ENTAILMENT) 

(data is generated and parseed for the above items. But the parser.py needs to be more userfriendly.)

4) Similarity measure (scaled to one)

Generate and parse all data into their corresponding folders inside 'EntailmentData/'

Running the baseine 

Adding F1 table to the final result -> (done)

We need to ask if we can use previous RTE datasets for training or not. If we can, we should pretrain on other datasets. 


Wiki of the results
===========
https://wiki.engr.illinois.edu/display/~khashab2/RTE+project

Data
============
The data is classified inside 'EntailmentData/'

../data/vars.normalized.100.mat : Contains the word vectors 


What is the difference between 'params.mat' and 'simMat_release.mat'


Variables 
============
Meaning of some important variables: 


TODO: 


allSNum: array of each word's index in the dictionary

allSStr: array of words

allSTree: tree structure. allSTree[i] = j means j is i's parent

allSKids: children info. of the tree.

          allSKids[i,1] is the i's left child

          allSKids[i,2] is the i's right child

allSOStr = {};

allSPOS = {};


