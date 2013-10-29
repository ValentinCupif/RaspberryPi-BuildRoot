QTQUICK1_VERSION = 5.0.1
QTQUICK1_SITE = http://download.qt-project.org/archive/qt/5.0/5.0.1/submodules_tar
QTQUICK1_SOURCE = qtquick1-opensource-src-$(QTQUICK1_VERSION).tar.xz
QTQUICK1_DEPENDENCIES = qtbase qtxmlpatterns qtscript qtdeclarative qtjsbackend qtwebkit
QTQUICK1_INSTALL_STAGING = YES

define QTQUICK1_CONFIGURE_CMDS
	-[ -f $(@D)/Makefile ] && $(MAKE) -C $(@D) distclean
	#run qmake
	(cd $(@D) && $(HOST_DIR)/usr/bin/qmake )
endef

define QTQUICK1_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QTQUICK1_INSTALL_STAGING_CMDS
	$(MAKE) -C $(@D) install
endef

define QTQUICK1_INSTALL_TARGET_CMDS
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Declarative.so.* $(TARGET_DIR)/usr/lib
	cp -dpf $(STAGING_DIR)/usr/bin/qmlviewer $(TARGET_DIR)/usr/bin
	cp -dpf $(STAGING_DIR)/usr/plugins/qmltooling/libqmldbg_inspector.so $(TARGET_DIR)/usr/plugins/qmltooling/
	cp -dpf $(STAGING_DIR)/usr/plugins/qmltooling/libqmldbg_tcp_qtdeclarative.so $(TARGET_DIR)/usr/plugins/qmltooling/
	cp -dpfr $(STAGING_DIR)/usr/imports $(TARGET_DIR)/usr
endef

define QTQUICK1_UNINSTALL_TARGET_CMDS
	-rm $(TARGET_DIR)/usr/lib/libQt5Declarative.so.*
	-rm $(TARGET_DIR)/usr/plugins/qmltooling/libqmldbg_inspector.so
	-rm $(TARGET_DIR)/usr/plugins/qmltooling/libqmldbg_tcp_qtdeclarative.so
	-rm $(TARGET_DIR)/usr/bin/qmlviewer
	-rm -r $(TARGET_DIR)/usr/imports
endef

$(eval $(generic-package))
