# Makefile for building Arduino projects using arduino-build.
# Copyright (C) 2018 Mithat Konar (https://mithatkonar.com)
# License: LGPL v3

BB=./arduino-build

.PHONY : compile clean upload monitor upmon

build:
	$(BB) build

clean:
	$(BB) clean

upload:
	$(BB) upload

monitor:
	$(BB) monitor

upmon: upload monitor
