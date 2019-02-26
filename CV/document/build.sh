#!/usr/bin/env bash

set -e

# Ensure that the CWD is set to script's location
cd "${0%/*}"
CWD=$(pwd)

INTERACTION=nonstopmode
OUTDIR=dist
JOBNAME=cv
ITERATIONS=3
COMPILER=lualatex

echo "Cleaning up workspace"

rm -rf ${OUTDIR}
mkdir -p ${OUTDIR}

for j in `seq 1 $ITERATIONS`;
do
	echo "Compiling for the $j time..."

	${COMPILER} \
		--interaction=${INTERACTION} \
		-output-directory=${OUTDIR} \
		-jobname=${JOBNAME} \
		main.tex

	if [ "$j" == "1" ]
	then
		biber ${OUTDIR}/${JOBNAME}
	fi

done

echo "Removing build files..."

rm -f ${OUTDIR}/*.{aux,log,out,xwm,toc,lof,lot,bib,bbl,bcf,blg,xml}

echo "Done."
