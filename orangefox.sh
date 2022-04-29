 . build/envsetup.sh
  export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
  export LC_ALL="C"
  export OF_AB_DEVICE=0
  export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
  export OF_MAINTAINER="MisterZtr"
  export OF_MAINTAINER_AVATAR="/home/mrztr/avatar.png"
lunch omni_m1852-eng
mka recoveryimage -j$( nproc --all )
#replace ' # the target device(s)
#TARGET_DEVICE="m1852"
#TARGET_DEVICE_ALT="" '
#on this
#' # the target device(s)
#TARGET_DEVICE="m1852"
#TARGET_DEVICE_ALT="M1852"
#PRODUCT_DEVICE=$(getprop "ro.product.device") '
#in update-binary
