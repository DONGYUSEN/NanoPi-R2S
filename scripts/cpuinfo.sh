#!/bin/sh

cpu_arch="$(cat "/proc/cpuinfo" | grep "model name" | sed -n "1p" | awk -F ': ' '{print $2}')"
[ -z "${cpu_arch}" ] && cpu_arch="ARMv8 Processor"
cpu_cores="$(cat "/proc/cpuinfo" | grep "processor" | wc -l)"

if grep -q "bcm27xx" "/etc/openwrt_release"; then
	cpu_freq="$(expr $(vcgencmd measure_clock arm | awk -F '=' '{print $2}') / 1000000)Mhz"
elif grep -q "bcm53xx" "/etc/openwrt_release"; then
	cpu_freq="$(nvram get clkfreq | awk -F ',' '{print $1}')MHz"
elif grep -q "mvebu" "/etc/openwrt_release"; then
	cpu_freq="$(cat "/proc/cpuinfo" | grep "BogoMIPS" | sed -n "1p" | awk -F ': ' '{print $2}')MHz"
else
	cpu_freq="$(expr $(cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq) / 1000)MHz"
	big_cpu_freq="$(expr $(cat /sys/devices/system/cpu/cpufreq/policy4/cpuinfo_cur_freq 2>"/dev/null") / 1000 2>"/dev/null")"
	[ -n "${big_cpu_freq}" ] && big_cpu_freq="${big_cpu_freq}MHz "
fi

if grep -q "ipq" "/etc/openwrt_release"; then
	echo -n "${cpu_arch} x ${cpu_cores} (${cpu_freq})"
else
	if grep -q "bcm27xx" "/etc/openwrt_release"; then
		cpu_temp="$(vcgencmd measure_temp | awk -F '=' '{print $2}' | awk -F "'" '{print $1}')°C"
	else
		cpu_temp="$(awk "BEGIN{printf (\"%.1f\n\",$(cat /sys/class/thermal/thermal_zone0/temp)/1000) }")°C"
	fi
	echo -n "${cpu_arch} x ${cpu_cores} (${big_cpu_freq}${cpu_freq}, ${cpu_temp})"
fi