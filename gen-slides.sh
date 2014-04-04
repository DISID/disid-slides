#!/bin/bash
#
# Script to generate DZSlides from Asciidoc
# 
# Copyright (C) 2014 DISID - All Rights Reserved
# Permission to copy and modify is granted under Creative Commons 
# Attribution-NonCommercial-ShareAlike 3.0 Unported License
# https://creativecommons.org/licenses/by-nc-sa/3.0/legalcode
#
# DISCLAIMER
# This script come without warranty of any kind. Use them at your own risk. I 
# assume no liability for the accuracy, correctness, completeness, or 
# usefulness of any information provided by this code nor for any sort of 
# damages using this script may cause. 

SLIDE=$1
BACKEND=$2

if [ "${SLIDE}x" == "x" ]; then
  printf "Usage: gen-slides.sh SLIDE_NAME [BACKEND_NAME]\n";
  printf "(.adoc extension will be added to SLIDE_NAME)\n\n";
  exit 1;
fi

if [ "${BACKEND}x" == "x" ]; then
  # by default use dzslides backend
  BACKEND="dzslides";
fi

asciidoc -a data-uri -a linkcss! -b $BACKEND -o "${SLIDE}".html "${SLIDE}.adoc"

