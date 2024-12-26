#!/bin/bash

if [[ $(file --mime-type -b "$1") == application/pdf ]]; then
  zathura "$1" &  # Open PDFs with Zathura
elif [[ $(file --mime-type -b "$1") == image/* ]]; then
  viewnior "$1" &  # Open images with Viewnior
else
  xdg-open "$1" &  # Default behavior for other files
fi

