#!/bin/bash

PACKAGES="sphinx_rtd_theme lapack suitesparse scikit-umfpack oset pybtex latexcodec pybtex-docutils sphinxcontrib-bibtex"

BUILD=
UPLOAD=

if [ "x$1" = "xbuild" ]; then
   BUILD="yes"
   shift
else
   BUILD="no"
fi


if [ "x$1" = "xupload" ]; then
  UPLOAD="yes"
else
  UPLOAD="no"
fi

if [ "x${BUILD}" = "xyes" ]; then
    conda-build $PACKAGES
fi

if [ "x${UPLOAD}" = "xyes" ]; then
    anaconda upload --interactive $(conda-build --output $PACKAGES)
fi
