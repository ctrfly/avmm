

obj-dir := $(subst $(TOPDIR),,$(CURDIR))
obj-dir := $(BUILD)$(obj-dir)

built-in: debug $(obj) $(dir)
	@echo xxxxxxxxxxxxxxxxxxxxx

$(dir):
	@if [ ! -d $(BUILD)/$@ ]; then \
		mkdir $(BUILD)/$@; \
		cat $@/Makefile > $(BUILD)/$@/.Makefile;	\
		echo -e '\n' >> $(BUILD)/$@/.Makefile;	\
		echo include $(TOPDIR)/scripts/common.mk >> $(BUILD)/$@/.Makefile;	\
	fi
	@make -s --directory=$@ -f $(BUILD)/$@/.Makefile built-in

debug:
	@echo CURDIR:$(CURDIR)
	@echo BUILD:$(BUILD)
	@echo obj-dir:$(obj-dir)

.PHONY: built-in $(dir) debug