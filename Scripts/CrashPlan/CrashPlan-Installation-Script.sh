#!/bin/bash

############################################################################################
############################################################################################
##
## Script to install the latest [CrashPlan] 
##
############################################################################################
############################################################################################

	#### User Defined variables
	dmgfile="CrashPlan.dmg"
	volname="CrashPlan"
	dlURL='https://download.crashplan.com/installs/agent/latest-mac.dmg'
	
	#### Get Properties Values from CrashPlan-App-Config-Profile on JAMF Server
	DEPLOYMENT_URL=$(defaults read /Library/Managed\ Preferences/com.crashplan.email.plist DEPLOYMENT_URL)
	DEPLOYMENT_POLICY_TOKEN=$(defaults read /Library/Managed\ Preferences/com.crashplan.email.plist DEPLOYMENT_POLICY_TOKEN)
	CP_SILENT=$(defaults read /Library/Managed\ Preferences/com.crashplan.email.plist CP_SILENT)
	DEVICE_CLOAKED=$(defaults read /Library/Managed\ Preferences/com.crashplan.email.plist DEVICE_CLOAKED)
	
	#### Create deploy.properties file for CrashPlan Application
	mkdir -p /Library/Application\ Support/CrashPlan
	echo "DEPLOYMENT_URL=${DEPLOYMENT_URL}
	DEPLOYMENT_POLICY_TOKEN=${DEPLOYMENT_POLICY_TOKEN}
	CP_SILENT=${CP_SILENT}
	DEVICE_CLOAKED=${DEVICE_CLOAKED}" > /Library/Application\ Support/CrashPlan/deploy.properties
	
	#### Download CrashPlan 
	/usr/bin/curl -Ls -o /tmp/${dmgfile} -w %{url_effective} ${dlURL}
	
	#### Mount CrashPlan
	hdiutil attach /tmp/${dmgfile}
	
	#### Install CrashPlan
	writeLog "Installing CrashPlan Installer......"
	installer -package "/Volumes/${volname}/Install CrashPlan.pkg" -target LocalSystem
	
	#### Unmounting CrashPlan 
	hdiutil detach /Volumes/${volname}
 
