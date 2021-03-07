#This script is found in F:\scripts folder

$ITDI_ROOTDIR="F:\Program Files\IBM\TDI\V7.1"
#---Main section-----
if($args.count -ne 3){
  write-output "Usage: $MyInvocation.MyCommand.Name AL-FILE AL-NAME ITDI_SOLUTION"
  write-output "Exiting with code rc=1"
  exit 1
}

$currrentDir=(get-location).path

$IAM_AL_FILE = $args[0]
$IAM_AL = $args[1]
$ITDI_SOLUTION = $args[2]

$ITDI_SOLUTION_DIR="$ITDI_TOOTDIR\$ITDI_SOLUTION"
$ErrorActionPreference="stop"
try
{
  if(!(Test-Path "$ITDI_SOLUTION_DIR\$IAM_AL_FILE"))
  {
     $rc=2
     write-output "IAM TDI AL $ITDI_SOLUTION_DIR\$IAM_AL_FILE not found"
     write-output "Running IAM $IAM_AL failed (rc=$rc)"
     exit $rc
   }
   cd $ITDI_SOLUTION_DIR
   $cmd="cmd /c '"..\ibmdisrv.bat'" -s '"ITDI_SOLUTION_DIR'" -c $IAM_AL_FILE -r $IAM_AL"
   $cmd
   Invoke-Expression -Command $cmd
   if($lastexitcode -eq 0)
   {
      $rc=0
      write-output "Running IAM $IAM_AL completed (rc=$rc) for $ITDI_SOLUTION ITDI solution"
   }
   else {
     $rc=3
      write-output "Running IAM $IAM_AL failed (rc=$rc, lastexitcode=$lastexitcode) for $ITDI_SOLUTION ITDI solution"
     }
}
catch
{
   $rc=4
   write-output "Exception Type: $($_.Exception.GetType().FullName)"
   write-output "Exception Message: $($_.Exception.Message)"
   write-output "Running IAM $IAM_AL failed (rc=$rc) for $ITDI_SOLUTION ITDI solution"
}
finally
{
  cd $currentDir
}
exit $rc
