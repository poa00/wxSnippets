
SUBDIRS = AboutBoxDlg AboutBoxWx AddRemoveCtrl AutoComplete PwdProtect Guid Ipc SettingsManager StdPaths TestApp

ifeq ($(OS),Windows_NT)
OS_Detected=Windows
else
OS_Detected=$(shell uname -s)
endif

all: $(SUBDIRS)

.PHONY: $(SUBDIRS) all clean infos

clean: $(SUBDIRS)

infos :
	@$(MAKE) -f Makefile.$(OS_Detected) -w -C build $(MAKECMDGOALS) PRJNAME=TestApp

$(SUBDIRS):
	@$(MAKE) -f Makefile.$(OS_Detected) -w -C build $(MAKECMDGOALS) PRJNAME=$@ OS_Detected=$(OS_Detected)
