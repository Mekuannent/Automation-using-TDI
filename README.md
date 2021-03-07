# Automation-using-TDI
The Program perfoms the following activities:
- connect to a database system 
- identity inactive accts
- change status of the acct
- send the list of identified inactive accts to an email
- check the status again 
- if the status remains inactive for more than 300 days, save the list into a separate database
- delete the list from ISIM

How to works:

Automation.ps1 - used to launch the automation task

#Create sybmbolic link

`> mklink Automation F:\feed\dev`

- Navigate to F:\feed\dev and launch the sysmbolic link **Automation** as follows

`dev>./idifeed Automation.xml Automation`

*idifeed*
*Automation.xml*

-idifeed determines environment/server from the directory: toolsol-$currrentEnv (toolsol-dev, toolsol-uat, etc.)
-idifeed ignites the following command

`F:\scripts\tdi-idifeed $args[0] $args[1] toolsol-$currrentEnv`

