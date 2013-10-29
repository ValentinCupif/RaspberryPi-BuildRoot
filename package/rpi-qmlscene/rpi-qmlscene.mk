RPI_QMLSCENE_VERSION = 1.0
RPI_QMLSCENE_SITE = file://$(DL_DIR)
RPI_QMLSCENE_SOURCE = rpi-qmlscene-$(RPI_QMLSCENE_VERSION).tar.gz
RPI_QMLSCENE_DEPENDENCIES = 
RPI_QMLSCENE_DEPENDENCIES = 
RPI_QMLSCENE_INSTALL_STAGING = YES



define RPI_QMLSCENE_CONFIGURE_CMDS
	-[ -f $(@D)/Makefile ] && $(MAKE) -C $(@D) distclean
	(cd $(@D) && $(HOST_DIR)/usr/bin/qmake )
endef

define RPI_QMLSCENE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define RPI_QMLSCENE_INSTALL_STAGING_CMDS
	$(MAKE) -C $(@D) install
endef

define RPI_QMLSCENE_INSTALL_TARGET_CMDS
	cp -dpf $(RPI_QMLSCENE_DIR)/QmlScene $(TARGET_DIR)/usr/bin
endef

define RPI_QMLSCENE_UNINSTALL_TARGET_CMDS
	-rm $(TARGET_DIR)/usr/bin/QmlScene
endef

$(eval $(generic-package))
