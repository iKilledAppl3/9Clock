ARCHS = armv7 arm64
TARGET = iphone:clang:latest
SDK = iPhoneOS8.1
THEOS_BUILD_DIR = DEBs

include theos/makefiles/common.mk

TWEAK_NAME = 9Clock
9Clock_FILES = Tweak.xm
9Clock_FRAMEWORKS = UIKit CoreGraphics
9Clock_LIBRARIES += cephei
9Clock += -Wl,-segalign,4000
9Clock_CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += 9Clock_prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
