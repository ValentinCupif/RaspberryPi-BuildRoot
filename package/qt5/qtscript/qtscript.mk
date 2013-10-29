QTSCRIPT_VERSION = 5.0.1
QTSCRIPT_SITE = http://download.qt-project.org/archive/qt/5.0/5.0.1/submodules_tar
QTSCRIPT_SOURCE = qtscript-opensource-src-$(QTSCRIPT_VERSION).tar.xz
QTSCRIPT_DEPENDENCIES = qtbase
QTSCRIPT_INSTALL_STAGING = YES

define QTSCRIPT_CONFIGURE_CMDS
	-[ -f $(@D)/Makefile ] && $(MAKE) -C $(@D) distclean
	#run qmake
	(cd $(@D) && $(HOST_DIR)/usr/bin/qmake )
endef

define QTSCRIPT_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QTSCRIPT_INSTALL_STAGING_CMDS
	$(MAKE) -C $(@D) install
endef

define QTSCRIPT_INSTALL_TARGET_CMDS
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Script*.so.* $(TARGET_DIR)/usr/lib
endef

define QTSCRIPT_UNINSTALL_TARGET_CMDS
	-rm $(TARGET_DIR)/usr/lib/libQt5Script*.so.*
endef

$(eval $(generic-package))
