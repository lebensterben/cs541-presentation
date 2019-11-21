#! /usr/bin/env bash
if ! [ -d "./img" ]; then
  mkdir img
fi

cd "./src/" || exit
for i in ./*.tex; do
  pdflatex -interaction nonstopmode "$i" &> /dev/null || true &> /dev/null
  convert -density 300x300 "${i/%tex/pdf}" "${i/%tex/png}" &> /dev/null
  mv "${i/%tex/png}" ../img
done
