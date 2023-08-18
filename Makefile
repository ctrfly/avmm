
BUILD ?= $(shell pwd)/build
IMAGE := avmm
CROSS_COMPILE := aarch64-none-elf-

dir := init 
dir += driver

include scripts/root.mk