if($args.count -ne 2){
  $scriptName=$MyInvocation.MyCommand.Name
  write-output "usage: $scriptName AL-FILE AL-NAME"
  write-output "Exiting with code rc=1"
  exit 1
}
#Determine current directory which also signifys environment
#Eg if Directory solution is tdisol-dev, Dev signifies env
$currentDir=(get-location).path
$currentEnv=split-path(get-location).path -leaf
if($currentEnv -eq "idifeed"){
 $scriptName=$MyInvocation.MyCommand.Name
 write-output "$scriptName cannot be invoked from $currentDir"
 write-output "Exiting with code rc=2"
 exit 2
}
F:\scripts\tdi-idifeed $args[0] $args[1] toolsol-$currrentEnv
#Directory maybe toolsol-dev, toolsol-prod etc.
#Archive files under ("*.completed") and rename
Move-Item $currentDir\data\*.completed $currentDir\archives
$date=Get-Date -format "yyyy.MMM.dd.hh.mm.ss"
Get-ChildItem "$currentDir\archives\*.completed" | Rename-Item -NewName {$_.name -replace $_.name, "$_.name.$date"}
Move-Item $currentDir\archives\*.completed $currentDir\archives\*.completed.$date
