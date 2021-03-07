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

`> mklink Automation C:\feed\dev`

- Navigate to C:\feed\dev and launch the sysmbolic link **Automation** as follows

`dev>./tdifeed Automation.xml Automation`

*tdifeed*
*Automation.xml*

-
