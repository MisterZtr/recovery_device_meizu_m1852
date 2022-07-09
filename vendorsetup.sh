#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2018-2022 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="m1852"
# set -o xtrace

fox_get_target_device() {
	local F="$BASH_ARGV"
	[ -z "$F" ] && F="$BASH_SOURCE"
	if [ -n "$F" ]; then
		local D1=$(dirname "$F")
		local D2=$(basename "$D1")
		[ -n "$D2" ] && echo "$D2"
	fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
	FOX_BUILD_DEVICE=$(fox_get_target_device)
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export OF_AB_DEVICE=0
	export LC_ALL="C"
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export OF_FL_PATH1="/sys/class/leds/torch-light"
	export TARGET_DEVICE_ALT="M1852"
	export OF_TARGET_DEVICES="m1852,X8"

	# -- add settings for R11 --
	export FOX_R11=1
	export OF_QUICK_BACKUP_LIST="/boot;/data;/system;/vendor;"
	export OF_USE_TWRP_SAR_DETECT=1
	#export FOX_ADVANCED_SECURITY=1
	# -- end R11 settings --

	# run a process after formatting data to work-around MTP issues
	export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1

	# let's log what are the build VARs that we used
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
		export | grep "FOX" >>$FOX_BUILD_LOG_FILE
		export | grep "OF_" >>$FOX_BUILD_LOG_FILE
		export | grep "TW_" >>$FOX_BUILD_LOG_FILE
		export | grep "TARGET_" >>$FOX_BUILD_LOG_FILE
		export | grep "PLATFORM_" >>$FOX_BUILD_LOG_FILE
	fi
fi
#
