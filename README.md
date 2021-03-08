# Automation-using-TDI
The Program perfoms the following activities:
- connect to a database system 
- identity accts inactive for more than 30 days
- change status of the acct to suspended
- send the list of identified inactive accts to an email
- identify status suspended accts  
- if they are inactive for more than 60 days, save them into a separate database and
- delete them from ISIM

How to works:

Automation.ps1 - used to launch the automation task

#Create sybmbolic link for Automation

`> mklink Automation F:\feed\dev`

- Launching **Automation** triggers

`dev>./idifeed Automation.xml AutomationAL`

*idifeed*
*Automation.xml*

-idifeed determines environment/server from the directory: toolsol-$currrentEnv (toolsol-dev, toolsol-uat, etc.)
-idifeed ignites the following command

`F:\scripts\tdi-idifeed $args[0] $args[1] toolsol-$currrentEnv`

to be contd...
