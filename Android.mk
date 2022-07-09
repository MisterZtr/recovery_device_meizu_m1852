LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),m1852)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
