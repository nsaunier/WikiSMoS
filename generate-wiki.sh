#!/bin/sh
for file in *.md
do
    pandoc -S -w markdown_github --filter pandoc-citeproc $file > ../WikiSMoS.wiki/$file
done
cp smos.bib ../WikiSMoS.wiki/
cd ../WikiSMoS.wiki/
mv README.md Home.md
sed 's/.md//' Home.md > Home.md
git commit -m 'generated new wiki'
git push
