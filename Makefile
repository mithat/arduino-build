# Makefile for building Arduino projects using arduino-build.sh.

BB=./arduino-build.sh

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
