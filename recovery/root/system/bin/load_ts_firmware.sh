#!/system/bin/sh

touch_class_path=/sys/class/touchscreen
touch_path=
firmware_path=/vendor/firmware
firmware_file=
device=$(getprop ro.boot.device)

wait_for_poweron()
{
	local wait_nomore
	local readiness
	local count
	wait_nomore=60
	count=0
	while true; do
		readiness=$(cat $touch_path/poweron)
		if [ "$readiness" == "1" ]; then
			break;
		fi
		count=$((count+1))
		[ $count -eq $wait_nomore ] && break
		sleep 1
	done
	if [ $count -eq $wait_nomore ]; then
		return 1
	fi
	return 0
}
cd $firmware_path
touch_product_string=$(ls $touch_class_path)
if [[ -d /sys/class/touchscreen/ft8006s_aa ]]; then
       echo "focaltech"
       firmware_file="focaltech-dsbj-ft8006s_aa-05-0000-cebu.bin"
       touch_path=/sys$(cat $touch_class_path/$touch_product_string/path | awk '{print $1}')
       wait_for_poweron
       echo $firmware_file > $touch_path/doreflash
       echo 1 > $touch_path/forcereflash
       sleep 5
       echo 1 > $touch_path/reset
elif [[ -d /sys/class/touchscreen/ICNL9911C ]]; then
        echo "chipone"
        chipone_fw_path=/vendor/firmware/ICNL9911.bin
        flash_path=/sys/chipone-tddi/cts_firmware
        sleep 2
        echo $chipone_fw_path > $flash_path/update_from_file
fi

return 0
