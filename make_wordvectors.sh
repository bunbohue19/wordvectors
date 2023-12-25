#!/bin/bash

#### Set your hyper-parameters here ####
############## START ###################
lcode="vi" # ISO 639-1 code of target language. See `lcodes.txt`.
max_corpus_size=1000000000 # the maximum size of the corpus. Feel free to adjust it according to your computing power.
vector_size=300 # the size of a word vector
window_size=5 # the maximum distance between the current and predicted word within a sentence.
vocab_size=20000 # the maximum vocabulary size
num_negative=5 # the int for negative specifies how many “noise words” should be drawn
############## END #####################

echo "step 0. Make `data` directory and move there."
mkdir data; cd data

echo "step 1. Download the stored wikipedia file to your disk."
echo "Downloaded!"
# wget "https://dumps.wikimedia.org/${lcode}wiki/20161201/${lcode}wiki-20161201-pages-articles-multistream.xml.bz2"

echo "step 2. Extract the bz2 file."
echo "Extracted!"
# bzip2 -d viwiki-20231101-pages-articles-multistream.xml.bz2

cd ..
echo "step 3. Build Corpus."
echo "Build!"
# python build_corpus.py --lcode=${lcode} --max_corpus_size=${max_corpus_size}

echo "step 4. make wordvectors"
echo "Made!"
# python make_wordvectors.py --lcode=${lcode} --vector_size=${vector_size} --window_size=${window_size} --vocab_size=${vocab_size} --num_negative=${num_negative}