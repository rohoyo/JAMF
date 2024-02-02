#!/bin/bash

###############################################################
##   This script will update any computer's extension attribute 
##   using the computer's serial number and extension attribute ID.
##
##     Created and Uploaded by Rodolfo Hoyo - 02/02/2024
##
##                 JAMF POLICY PARAMETERS
##       --------------------------------------------
##       - Parameter 4 = https://yourserver.jamfcloud.com
##       - Parameter 5 = API-Username
##       - Parameter 6 = API-Password
##       - Parameter 7 = Extension Attribute ID
##       - Parameter 8 = Extension Attribute Value
###############################################################


## Defined Variables
jamfProURL=$4
jamfUser=$5
jamfPass=$6
attributeID=$7
attributeValue=$8

## Get Machines Serial Num
serialNumber=$(system_profiler SPHardwareDataType | grep "Serial Number (system)" | awk '{print $4}')

## API CALL -> Update Extension Attibute
curl --request PUT \
     --header "Content-type: application/xml" \
     --user "$jamfUser:$jamfPass" \
     --url $jamfProURL/JSSResource/computers/serialnumber/$serialNumber/subset/ExtensionAttributes \
     --data "<computer><extension_attributes><extension_attribute><id>$attributeID</id><value>$attributeValue</value></extension_attribute></extension_attributes></computer>"

