#!/bin/sh 
alias hugo='docker run --rm -it -v $PWD/src:/src -u hugo hugo-builder hugo'
alias hugo-server='docker run --rm -it -v $PWD/src:/src -p 1313:1313 -u hugo hugo-builder  hugo server --bind 0.0.0.0'
