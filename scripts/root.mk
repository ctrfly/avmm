
TOPDIR := $(shell pwd)

CC := $(CROSS_COMPILE)gcc

export BUILD
export TOPDIR

all: debug prepare $(dir)

$(dir):
	@if [ ! -d $(BUILD)/$@ ]; then \
		mkdir $(BUILD)/$@; \
		cat $@/Makefile > $(BUILD)/$@/.Makefile;	\
		echo -e '\n' >> $(BUILD)/$@/.Makefile;	\
		echo include $(TOPDIR)/scripts/common.mk >> $(BUILD)/$@/.Makefile;	\
	fi
	@make -s --directory=$@ -f $(BUILD)/$@/.Makefile built-in

clean:
	@rm -fr $(BUILD)

prepare:
	@if [ ! -d $(BUILD) ]; then \
		mkdir $(BUILD); \
	fi

debug:
	@echo IMAGE:$(IMAGE)
	@echo CC:$(CC)
	@echo dir:$(dir)
	@echo BUILD:$(BUILD)

.PHONY: all prepare clean debug $(dir)