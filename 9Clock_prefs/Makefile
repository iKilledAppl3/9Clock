ARCHS = armv7 arm64
TARGET = iphone:clang:latest
SDK = iPhoneOS8.1

include theos/makefiles/common.mk

BUNDLE_NAME = 9Clock
9Clock_FILES = 9Clock.mm
9Clock_INSTALL_PATH = /Library/PreferenceBundles
9Clock_FRAMEWORKS = UIKit MessageUI CoreGraphics
9Clock_PRIVATE_FRAMEWORKS = Preferences
9Clock_LIBRARIES += cepheiprefs MobileGestalt
9Clock_CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/9Clock.plist$(ECHO_END)
