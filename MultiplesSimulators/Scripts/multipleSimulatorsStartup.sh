# installs and lanches the `bundle_id` for the specified simulator device
installAndLaunch() {
	device=$1
	app_path=$2
	app_bundle_id=$3

	xcrun instruments -w “$device”
	xcrun simctl install $device $path
	xcrun simctl launch $device $bundle_id &
}

# parses the configuration file
source ./Scripts/multipleSimulators.config
path=$(find $app_location -name MultiplesSimulators.app | head -n 1)

# iterates over the simulators list and start installation / launching process
IFS="," read -ra ADDR <<< $simulators_list
for device in ${ADDR[@]}; do
	installAndLaunch $device $path $bundle_id &
done
