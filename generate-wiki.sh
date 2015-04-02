#!/bin/sh
# TODO change the output with command line switch: html or pdf
# for html, need to change the links (works for pdf)
outputFormat=markdown_github
outputDirectory=../WikiSMoS.wiki
filenameExtension=md
if [ $# -ge 1 ];
then
    outputFormat=$1
    outputDirectory=.
    filenameExtension=$1
else
    echo "Using default output format ${outputFormat}"
fi

for file in ./*.md
do
    prefix=`basename "${file}" .md`
    pandoc -S -w $outputFormat --filter pandoc-citeproc "${file}" > $outputDirectory/"${prefix}".$filenameExtension
done
#cp smos.bib ../WikiSMoS.wiki/

if [ $outputFormat = "markdown_github" ]
then
    #echo "md github"
    cd ../WikiSMoS.wiki/
    #sed 's/.md//' README.md > Home.md
    rm README.md
    git commit -a -m 'generated new wiki'
    git push
fi
