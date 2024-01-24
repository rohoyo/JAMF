## CrashPlan Deployment in JAMF Pro Instance 

- Upload .mobileconfing files to JAMF Instance
  - CrashPlan-MDM-Profile.mobileconfig (PPPC - full disk access)
  - CrashPlan-App-Config-Profile.mobileconfig
 
- Create a New Script on your Jamf Instance
  - CrashPlan-Installation-Script.sh
 
- Paste User Detection Scrip to your CrashPlan Deployment Policy
  - User-Detection-Script
    - CrashPlan admin dashboard --> administration tab --> deployment tab --> deployment policy --> scripts

- Modify Properties to your CrashPlan Instance on JAMF
  - Jamf Server --> computers --> Configuration Profiles --> CrashPlan Application Configuration --> Application & Custom Settings
      - crashplanActivationEmail (CrashPlan requires an email for this key)
          - $USERNAME or $EMAIL (depending on your attribute mapping)
      - DEPLOYMENT_UR
          - Your CrashPlan's deployment URL
      - DDEPLOYMENT_POLICY_TOKEN
          - Your CrashPlan's Policy Token
      - CP_SILENT
        - false
          - crashPlan app user interface opens on the user's device immediately after installation.
        - true
          - crashPlan app user interface will NOT open but run in the background.
      - DEVICE_CLOAKED
        - true
          - most CrashPlan app user interface elements are hidden from users.
        - false
          - all CrashPlan app user interface elements are visible to users.



                 
