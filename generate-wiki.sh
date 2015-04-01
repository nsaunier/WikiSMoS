#!/bin/sh
for file in ./*.md
do
    pandoc -S -w markdown_github --filter pandoc-citeproc $file > ../WikiSMoS.wiki/$file
done
#cp smos.bib ../WikiSMoS.wiki/
cd ../WikiSMoS.wiki/
#sed 's/.md//' README.md > Home.md
rm README.md
git commit -a -m 'generated new wiki'
git push
