#!/bin/bash

###################################################
##  This Scrip Restarts All Mobile		   
##  devices within a MobileDevice Group  
##  using the mobile device group ID or	 
##  a single mobile device by ID.		     
##										                   
##  Created by Rodolfo Hoyo 01/30/2024	 
###################################################
###################################################
###################################################
##  If wanting to restart only one device 
##  Enter "yes" in the policy parameter 7  
##  and enter the single mobildeDeviceID in  
##  policy parameter 8.  
##
##
##  If wanting to restart all devices in  
##  a group. Leave policy parameter 7     
##  Empty and enter the mobildedeviceID 	 
##  in parameter 8.						           
###################################################



## Defined Variables
jamfProURL=$4					
jamfUser=$5
jamfPass=$6
deviceOrGroupCheck=$7
mobileDeviceGroupID=$8


# If Restarting Only ONE Mobile Device. 
# Policy Parameter 7 MUST BE EMPTY and Enter MobileDeviceID in 
#	policy parameter 8.

if [ -n "$deviceOrGroupCheck" ]
then
  # Restart Single Mobile Device
	curl \
	--request POST \
	--user "$jamfUser:$jamfPass" \
	--url "$jamfProURL/JSSResource/mobiledevicecommands/command/RestartDevice/id/${mobileDeviceGroupID}"
fi


## GET List of Mobile Devices from MobileDeviveGroups/id

mobileDevicesIDs=$(curl \
--request GET \
--user "$jamfUser:$jamfPass" \
--header 'Accept: text/xml' \
"$jamfProURL/JSSResource/mobiledevicegroups/id/$mobileDeviceGroupID" \
| xmllint --format - | awk -F '>|<' '/<id>/{print $3}'
)

## Convert mobileDevicesIDs to mdIDArray for iteration

mobileDeviceIDsList=($mobileDevicesIDs)


## Iterate through mobileDeviceIDsList and Restart Device(s)
## Skip first two items (index 0 = GroupID & index 1 = SiteID)

for index in "${mobileDeviceIDsList[@]:2}" 
do
	## Restart Mobile Devices inside MobileDevice Group
 
	curl \
	--request POST \
	--user "$jamfUser:$jamfPass" \
	--url "$jamfProURL/JSSResource/mobiledevicecommands/command/RestartDevice/id/${index}"
	
	sleep 5 # Delay until next restart next device
done

