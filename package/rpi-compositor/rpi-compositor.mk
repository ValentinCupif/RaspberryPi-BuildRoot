RPI_COMPOSITOR_VERSION = 1.0
RPI_COMPOSITOR_SITE = file://$(DL_DIR)
RPI_COMPOSITOR_SOURCE = rpi-compositor-$(RPI_COMPOSITOR_VERSION).tar.gz
RPI_COMPOSITOR_DEPENDENCIES = qtbase qtjsbackend
RPI_COMPOSITOR_DEPENDENCIES = 
RPI_COMPOSITOR_INSTALL_STAGING = YES



define RPI_COMPOSITOR_CONFIGURE_CMDS
	-[ -f $(@D)/Makefile ] && $(MAKE) -C $(@D) distclean
	(cd $(@D) && $(HOST_DIR)/usr/bin/qmake )
endef

define RPI_COMPOSITOR_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define RPI_COMPOSITOR_INSTALL_STAGING_CMDS
	$(MAKE) -C $(@D) install
endef

define RPI_COMPOSITOR_INSTALL_TARGET_CMDS
	cp -dpf $(RPI_COMPOSITOR_DIR)/compositor $(TARGET_DIR)/usr/bin
endef

define RPI_COMPOSITOR_UNINSTALL_TARGET_CMDS
	-rm $(TARGET_DIR)/usr/bin/compositor
endef

$(eval $(generic-package))
