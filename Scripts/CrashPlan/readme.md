# CrashPlan Deployment in JAMF Pro

### **Upload .mobileconfing files to JAMF Pro Configuration Profile**
> **JAMF Pro Instance --> Computers --> Configuration Profiles --> Upload**
  - [CrashPlan-MDM-Profile.mobileconfig](https://github.com/rohoyo/JAMF/blob/main/Scripts/CrashPlan/CrashPlan-MDM-Profile.mobileconfig) (PPPC - full disk access)
  - [CrashPlan-App-Config-Profile.mobileconfig](https://github.com/rohoyo/JAMF/blob/main/Scripts/CrashPlan/CrashPlan-App-Config-Profile.mobileconfig)
 
### **Create a New Script on your Jamf Pro**
> **JAMF Pro Instance --> Settings --> Scripts --> New (+)**
  - [CrashPlan-Installation-Script.sh](https://github.com/rohoyo/JAMF/blob/main/Scripts/CrashPlan/CrashPlan-Installation-Script.sh)
 
### **Paste User Detection Scrip to your CrashPlan Deployment Policy**
> **CrashPlan admin dashboard --> administration tab --> deployment tab --> deployment policy --> scripts**
  - [JAMF-User-Detection-Script](https://github.com/rohoyo/JAMF/blob/main/Scripts/CrashPlan/User-Detection-Script)
      - > other user detection scripts **[example mac user detection scripts](https://support.crashplan.com/hc/en-us/articles/8653225861901)**
    

### **Modify Properties on JAMF Pro for Your CrashPlan Instance(CrashPlan-App-Config-Profile.mobileconfing)**
> **Jamf Server --> computers --> Configuration Profiles --> CrashPlan Application Configuration --> Application & Custom Settings**
  - **crashplanActivationEmail (CrashPlan requires an email for this key)**
    - >**$USERNAME or $EMAIL** (depending on your attribute mapping)
  - **DEPLOYMENT_UR=**
    - > your CrashPlan's deployment URL
  - **DDEPLOYMENT_POLICY_TOKEN=**
    - > your CrashPlan's Policy Token
  - **CP_SILEN=**
    - false
      - > crashPlan app user interface opens on the user's device immediately after installation.
    - true
      - > crashPlan app user interface will NOT open but run in the background.
  - **DEVICE_CLOAKED=**
    - true
      - > most CrashPlan app user interface elements are hidden from users.
    - false
      - > all CrashPlan app user interface elements are visible to users.
        
  -  more information [deploy.properties](https://support.crashplan.com/hc/en-us/articles/8653225861901)



                 
