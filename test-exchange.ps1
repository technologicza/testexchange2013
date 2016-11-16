#v15
param( [string]$auditlist, $output)

Function Get-CustomHTML ($Header){
$Report = @"
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html><head><title>Exchange 2013 Audit Report</title>
<META http-equiv=Content-Type content='text/html; charset=windows-1252'>

<meta name="save" content="history">

<style type="text/css">
DIV .expando {DISPLAY: block,; FONT-WEIGHT: normal; FONT-SIZE: 8pt; RIGHT: 8px; COLOR: #000000; FONT-FAMILY: Arial; POSITION: absolute; TEXT-DECORATION: underline}
TABLE {TABLE-LAYOUT: fixed; FONT-SIZE: 100%; WIDTH: 100%}
*{margin:0}
.dspcont { display: none; BORDER-RIGHT: #B1BABF 1px solid; BORDER-TOP: #B1BABF 1px solid; PADDING-LEFT: 16px; FONT-SIZE: 8pt;MARGIN-BOTTOM: -1px; PADDING-BOTTOM: 5px; MARGIN-LEFT: 0px; BORDER-LEFT: #B1BABF 1px solid; WIDTH: 95%; COLOR: #000000; MARGIN-RIGHT: 0px; PADDING-TOP: 4px; BORDER-BOTTOM: #B1BABF 1px solid; FONT-FAMILY: Tahoma; POSITION: relative; BACKGROUND-COLOR: #ffffff}
.filler {BORDER-RIGHT: medium none; BORDER-TOP: medium none; display:none; BACKGROUND: none transparent scroll repeat 0% 0%; MARGIN-BOTTOM: -1px; FONT: 100%/8px Tahoma; MARGIN-LEFT: 43px; BORDER-LEFT: medium none; COLOR: #ffffff; MARGIN-RIGHT: 0px; PADDING-TOP: 4px; BORDER-BOTTOM: medium none; POSITION: relative}
.save{behavior:url(#default#savehistory);}
.dspcont1{ display:none}
a.dsphead0 {BORDER-RIGHT: #B1BABF 1px solid; PADDING-RIGHT: 5em; BORDER-TOP: #B1BABF 1px solid; DISPLAY: block; PADDING-LEFT: 5px; FONT-WEIGHT: bold; FONT-SIZE: 8pt; MARGIN-BOTTOM: -1px; MARGIN-LEFT: 0px; BORDER-LEFT: #B1BABF 1px solid; CURSOR: hand; COLOR: #FFFFFF; MARGIN-RIGHT: 0px; PADDING-TOP: 4px; BORDER-BOTTOM: #B1BABF 1px solid; FONT-FAMILY: Tahoma; POSITION: relative; HEIGHT: 2.25em; WIDTH: 95%; BACKGROUND-COLOR: #4071C2}
a.dsphead1 {BORDER-RIGHT: #B1BABF 1px solid; PADDING-RIGHT: 5em; BORDER-TOP: #B1BABF 1px solid; DISPLAY: block; PADDING-LEFT: 5px; FONT-WEIGHT: bold; FONT-SIZE: 8pt; MARGIN-BOTTOM: -1px; MARGIN-LEFT: 0px; BORDER-LEFT: #B1BABF 1px solid; CURSOR: hand; COLOR: #515456; MARGIN-RIGHT: 0px; PADDING-TOP: 4px; BORDER-BOTTOM: #B1BABF 1px solid; FONT-FAMILY: Tahoma; POSITION: relative; HEIGHT: 2.25em; WIDTH: 95%; BACKGROUND-COLOR: #FFFCE1}
a.dsphead2 {BORDER-RIGHT: #B1BABF 1px solid; PADDING-RIGHT: 5em; BORDER-TOP: #B1BABF 1px solid; DISPLAY: block; PADDING-LEFT: 5px; FONT-WEIGHT: bold; FONT-SIZE: 8pt; MARGIN-BOTTOM: -1px; MARGIN-LEFT: 0px; BORDER-LEFT: #B1BABF 1px solid; CURSOR: hand; COLOR: #515456; MARGIN-RIGHT: 0px; PADDING-TOP: 4px; BORDER-BOTTOM: #B1BABF 1px solid; FONT-FAMILY: Tahoma; POSITION: relative; HEIGHT: 2.25em; WIDTH: 95%; BACKGROUND-COLOR: #EAEBED}
a.dsphead1 span.dspchar{font-family:monospace;font-weight:normal;}
td {VERTICAL-ALIGN: TOP; FONT-FAMILY: Tahoma}
th {VERTICAL-ALIGN: TOP; COLOR: #4071C2; TEXT-ALIGN: left}
BODY {margin-left: 4pt} 
BODY {margin-right: 4pt} 
BODY {margin-top: 6pt} 
</style>


<script type="text/javascript">
function dsp(loc){
   if(document.getElementById){
      var foc=loc.firstChild;
      foc=loc.firstChild.innerHTML?
         loc.firstChild:
         loc.firstChild.nextSibling;
      foc.innerHTML=foc.innerHTML=='hide'?'show':'hide';
      foc=loc.parentNode.nextSibling.style?
         loc.parentNode.nextSibling:
         loc.parentNode.nextSibling.nextSibling;
      foc.style.display=foc.style.display=='block'?'none':'block';}}  

if(!document.getElementById)
   document.write('<style type="text/css">\n'+'.dspcont{display:block;}\n'+ '</style>');
</script>

</head>
<body>
<b><font face="Arial" size="5">$($Header)</font></b><hr size="8" color="#666666">
<font face="Arial" size="1"><b>Version 15.0 | Jean Louw | <A HREF='http://www.powershellneedfulthings.com/'>www.powershellneedfulthings.com</A></b></font><br>
<font face="Arial" size="1">Report created on $(Get-Date)</font>
<div class="filler"></div>
<div class="filler"></div>
<div class="filler"></div>
<div class="save">
"@
Return $Report
}

Function Get-CustomHeader0 ($Title){
$Report = @"
	<div class="dspcont0">
	<h1><a href="javascript:void(0)" class="dsphead0" onclick="dsp(this)">
	<span class="expando">show</span>$($Title)</a></h1>
	<div class="dspcont0">
"@
Return $Report
}

Function Get-CustomHeader ($Num, $Title){
$Report = @"
	<h2><a href="javascript:void(0)" class="dsphead$($Num)" onclick="dsp(this)">
	<span class="expando">show</span>$($Title)</a></h2>
	<div class="dspcont">
"@
Return $Report
}

Function Get-CustomHeaderClose{

	$Report = @"
		</DIV>
		<div class="filler"></div>
"@
Return $Report
}

Function Get-CustomHeader0Close{

	$Report = @"
		</DIV>
		<div class="filler"></div>
"@
Return $Report
}

Function Get-CustomHTMLClose{

	$Report = @"
</div>

</body>
</html>
"@
Return $Report
}

Function Get-HTMLTable{
	param([array]$Content)
	$HTMLTable = $Content | ConvertTo-Html
	$HTMLTable = $HTMLTable -replace '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">', ""
	$HTMLTable = $HTMLTable -replace '<html xmlns="http://www.w3.org/1999/xhtml">', ""
	$HTMLTable = $HTMLTable -replace '<head>', ""
	$HTMLTable = $HTMLTable -replace '<title>HTML TABLE</title>', ""
	$HTMLTable = $HTMLTable -replace '&lt;', "<"
	$HTMLTable = $HTMLTable -replace '&gt;', ">"
	$HTMLTable = $HTMLTable -replace '</head><body>', ""
	$HTMLTable = $HTMLTable -replace '</body></html>', ""
	Return $HTMLTable
}

Function Get-HTMLLink ($activeURL){
$Report = @"
<a href=$activeURL>$activeURL</a>
"@
Return $Report 
}

Function Get-CUDelta ($inData){
If (((Get-ExchangeServer $Target | select -ExpandProperty AdminDisplayVersion).Build) -ge '1236')
{
$Report = @"
<font color=#009900>$inData (UP TO DATE)</font>
"@
}
Else
{
$Report = @"
$inData <font color=#CA4539>(UPDATE REQUIRED: This server can be updated to Build (15.00.1236.003) Exchange Server 2013 CU14)</font>
"@
}
Return $Report

}

Function Get-DateDelta ([datetime]$inData){
$expireIn = New-TimeSpan -start (Get-Date) -End $inData
If ($expireIn.Days -ge '60')
{
$Report = @"
<font color=#009900>$inData</font>
"@
}
Else
{
$Report = @"
<font color=#CA4539>$inData (Expires in less than 60 days!)</font>
"@
}
Return $Report

}

Function Get-BUDelta ([datetime]$inData){

$lastBU = New-TimeSpan -start $inData -End (Get-Date)
If ($lastBU.TotalHours -le '24')
{
$Report = @"
<font color=#009900>$inData</font>
"@
}
Else
{
$Report = @"
<font color=#CA4539>$inData (ALERT)</font>
"@
}
Return $Report

}

Function Get-NumInk ([Int]$inData){
If ($inData -gt '35')
{#Write-Host $inData -ForegroundColor Green
$Report = @"
<font color=#009900>$inData</font>
"@
}
Else
{#Write-Host $inData -ForegroundColor Red
$Report = @"
<font color=#CA4539>$inData</font>
"@
}
Return $Report
}

Function Get-Ink ([String]$inData){
$positive = ('Success', 'Ready', 'Running', 'OK', 'True', 'Information', 'Completed', 'Healthy', 'Mounted')
If ($positive -match $inData)
{#Write-Host $inData -ForegroundColor Green
$Report = @"
<font color=#009900>$inData</font>
"@
}
Else
{#Write-Host $inData -ForegroundColor Red
$Report = @"
<font color=#CA4539>$inData</font>
"@
}
Return $Report
}

Function Get-HTMLBasic ($Detail){
$Report = @"
<TABLE>
	<tr>
		<td width='75%'>$($Detail)</td>
	</tr>
</TABLE>
"@
Return $Report
}

Function Get-HTMLDetail ($Heading, $Detail){
$Report = @"
<TABLE>
	<tr>
	<th width='25%'><b>$Heading</b></font></th>
	<td width='75%'>$($Detail)</td>
	</tr>
</TABLE>
"@
Return $Report
}

$input | foreach {$exServers += @($_)}
If ((Test-Path variable:\exServers) -eq $True){
			Foreach ($s in $exServers){[array]$Targets += @($s.name)}
			Write-Host "Server list input detected on pipeline" -ForegroundColor Yellow
			}
Else{
	if ($auditlist -eq ""){
			Write-Host "No server list specified, getting all Exchange 2013 servers" -ForegroundColor Yellow
			$ExchangeServerCount = (Get-ExchangeServer).count
			Write-Host "There are $ExchangeServerCount in your Exchange environment" -ForegroundColor Yellow
			$exServers = Get-ExchangeServer | Where-Object {$_.IsE15OrLater -eq $True}
			Foreach ($s in $exServers){[array]$Targets += $s.name}
		}
		else
		{
			if ((Test-Path $auditlist) -eq $false)
			{
				Write-Host "Invalid server list specified: $auditlist" -ForegroundColor DarkRed
				exit
			}
			else
			{
				Write-Host "Using Audit list: $auditlist" -ForegroundColor Cyan
				$Targets = Get-Content $auditlist
			}
			}
}

$now = Get-Date

#Custom Expressions
$latencyMS = @{Name="Latency(MS)";expression={[Math]::Round(([TimeSpan] $_.Latency).TotalMilliSeconds)}}
$hotLink = @{Name="URL";expression={Get-HTMLLink ($_.URL)}}
$colourResult = @{Name="Result";expression={Get-Ink ($_.Result)}}
$colourStatus = @{Name="Status";expression={Get-Ink ($_.Status)}}
$colourType = @{Name="Status";expression={Get-Ink ($_.Type)}}
$colourAlertValue = @{Name="Alert Value";expression={Get-Ink ($_.AlertValue)}}
$colourContentIndexState = @{Name="ContentIndexState";expression={Get-Ink ($_.ContentIndexState)}}
$colourMounted = @{Name="Mounted";expression={Get-Ink ($_.Mounted)}}
$colourDate = @{Name="Expiry Date";expression={Get-DateDelta $_.NotAfter}}
$colourCU = @{Name="Cumulative Update";expression={Get-CUDelta $CUFullName}}
$colourBU = @{Name="Last Full Backup";expression={Get-BUDelta $_.LastFullBackup}}
$newResult = @{Name="Result";expression={If ($_.Result.ToString() -ne 'Success'){Get-Ink ('Failure')} Else {Get-Ink ('Success') }}}

$fullReport = Get-CustomHTML "<img src=data:image/jpeg;base64,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 alt='Exchange Server 2013 Audit'></font></b><hr size="8" color="#4071C2">"
$fullReport += Get-CustomHTMLClose

$ESCount = 0
Foreach ($Target in $Targets){
New-Variable "$Target" -Force
$(Get-Variable | where {$_.Name -match $Target}).value += Get-CustomHTML "<img src=data:image/jpeg;base64,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 alt='Exchange Server 2013 Audit'>"
$(Get-Variable | where {$_.Name -match $Target}).value += Get-CustomHTMLClose

$ESCount = $ESCount + 1

Write-Host "Collating Detail for $Target, $ESCount out of $ExchangeServerCount" -ForegroundColor Yellow
	Write-Host "..getting basic computer configuration"
	$ComputerSystem = Get-WmiObject -computername $Target Win32_ComputerSystem
	switch ($ComputerSystem.DomainRole){
		0 { $ComputerRole = "Standalone Workstation" }
		1 { $ComputerRole = "Member Workstation" }
		2 { $ComputerRole = "Standalone Server" }
		3 { $ComputerRole = "Member Server" }
		4 { $ComputerRole = "Domain Controller" }
		5 { $ComputerRole = "Domain Controller" }
		default { $ComputerRole = "Information not available" }
	}
	
	$OperatingSystems = Get-WmiObject -computername $Target Win32_OperatingSystem
	$TimeZone = Get-WmiObject -computername $Target Win32_Timezone
	$Keyboards = Get-WmiObject -computername $Target Win32_Keyboard
	$SchedTasks = Get-WmiObject -computername $Target Win32_ScheduledJob
	$BootINI = $OperatingSystems.SystemDrive + "boot.ini"
	$RecoveryOptions = Get-WmiObject -computername $Target Win32_OSRecoveryConfiguration
	$exServer = Get-ExchangeServer | where {$_.Name -eq "$Target"}
	$exVersion = "Version " + $exServer.AdminDisplayVersion.Major + "." + $exServer.AdminDisplayVersion.Minor + " (Build " + $exServer.AdminDisplayVersion.Build + "." + $exServer.AdminDisplayVersion.Revision + ")"

	switch ($ComputerRole){
		"Member Workstation" { $CompType = "Computer Domain"; break }
		"Domain Controller" { $CompType = "Computer Domain"; break }
		"Member Server" { $CompType = "Computer Domain"; break }
		default { $CompType = "Computer Workgroup"; break }
	}

	$LBTime=$OperatingSystems.ConvertToDateTime($OperatingSystems.Lastbootuptime)
	$MyReport += Get-CustomHeader0  "$Target - Role(s): $($exServer.ServerRole) | Site: $($exserver.Site.Name)"
	$MyReport += Get-CustomHeader "2" "SYS: Basic Server Information"
		$MyReport += Get-HTMLDetail "Computer Name" ($ComputerSystem.Name)
		$MyReport += Get-HTMLDetail "Computer Role" ($ComputerRole)
		$MyReport += Get-HTMLDetail $CompType ($ComputerSystem.Domain)
		$MyReport += Get-HTMLDetail "Operating System" ($OperatingSystems.Caption)
		$MyReport += Get-HTMLDetail "Service Pack" ($OperatingSystems.CSDVersion)
		$MyReport += Get-HTMLDetail "Exchange Version" ($exVersion)
		$MyReport += Get-HTMLDetail "Exchange Edition" ($exServer.Edition)
		$MyReport += Get-HTMLDetail "Exchange Role(s)" ($exServer.ServerRole)
		$MyReport += Get-HTMLDetail "System Root" ($OperatingSystems.SystemDrive)
		$MyReport += Get-HTMLDetail "Manufacturer" ($ComputerSystem.Manufacturer)
		$MyReport += Get-HTMLDetail "Model" ($ComputerSystem.Model)
		$MyReport += Get-HTMLDetail "Number of Processors" ($ComputerSystem.NumberOfProcessors)
		$MyReport += Get-HTMLDetail "Memory (GB)" ([math]::round(($ComputerSystem.TotalPhysicalMemory / 1GB)))
		$MyReport += Get-HTMLDetail "Registered User" ($ComputerSystem.PrimaryOwnerName)
		$MyReport += Get-HTMLDetail "Registered Organisation" ($OperatingSystems.Organization)
		$MyReport += Get-HTMLDetail "Last System Boot" ($LBTime)
		$MyReport += Get-CustomHeaderClose
		
		Write-Host "..getting Exchange update information"
        $MyReport += Get-CustomHeader "2" "SYS: Exchange Build Version (Up to CU14)"
        $colEXVersion = (Get-ExchangeServer $Target | select -ExpandProperty AdminDisplayVersion).Build
        
        [string]$CUFullName = switch ($colEXVersion) 
    { 
        1236 {"Build (15.00.1236.003) Exchange Server 2013 CU14"} 
        1210 {"Build (15.00.1210.003) Exchange Server 2013 CU13"} 
        1178 {"Build (15.00.1178.004) Exchange Server 2013 CU12"} 
        1156 {"Build (15.00.1156.006) Exchange Server 2013 CU11"} 
        1130 {"Build (15.00.1130.007) Exchange Server 2013 CU10"} 
        1104 {"Build (15.00.1104.005) Exchange Server 2013 CU9."} 
        1076 {"Build (15.00.1076.009) Exchange Server 2013 CU8"}
        1044 {"Build (15.00.1044.025) Exchange Server 2013 CU7"}
        0995 {"Build (15.00.0995.029) Exchange Server 2013 CU6"}
        0913 {"Build (15.00.0913.022) Exchange Server 2013 CU5"}
        0847 {"Build (15.00.0847.032) Exchange Server 2013 SP1"}
        0775 {"Build (15.00.0775.038) Exchange Server 2013 CU3"}
        0712 {"Build (15.00.0712.024) Exchange Server 2013 CU2"}
        0620 {"Build (15.00.0620.029) Exchange Server 2013 CU1"}
        0516 {"Release to Manufacturing (RTM) version of Exchange Server 2013"}
        default {"Unknown"}
    }		

        $MyReport += Get-HTMLDetail "Cumulative Update (CU)" (Get-CUDelta $CUFullName)
		$MyReport += Get-CustomHeaderClose

		Write-Host "..getting volume information"
		$Disks = Get-WmiObject -ComputerName $Target Win32_Volume | sort Name
		$MyReport += Get-CustomHeader "2" "SYS: Volume Information"
			$LogicalDrives = @()
			Foreach ($LDrive in ($Disks | Where {$_.DriveType -eq 3 -and $_.Label -ne "System Reserved"})){
				$Details = "" | Select "Name", Label, "File System", "Capacity (GB)", "Free Space", "% Free Space"
				$Details."Name" = $LDrive.Name
				$Details.Label = $LDrive.Label
				$Details."File System" = $LDrive.FileSystem
				$Details."Capacity (GB)" = [math]::round(($LDrive.Capacity / 1GB))
				$Details."Free Space" = [math]::round(($LDrive.FreeSpace / 1GB))
				$Details."% Free Space" = Get-NumInk ([Math]::Round(($LDrive.FreeSpace /1GB) / ($LDrive.Capacity / 1GB) * 100))
				$LogicalDrives += $Details
			}
			$MyReport += Get-HTMLTable ($LogicalDrives)
		$MyReport += Get-CustomHeaderClose
		
		if ($exServer.ServerRole -like "*ClientAccess*")
		{
			$MyReport += Get-CustomHeader "2" "CAS: Exchange Certificates"
			Write-Host "..performing Exchange Certificate test"
			$colCertResults = Get-ExchangeCertificate 
			$MyReport += Get-HTMLTable ($colCertResults | select Subject, Thumbprint, Services, $colourDate )
			$MyReport += Get-CustomHeaderClose
			
            $MyReport += Get-CustomHeader "2" "CAS: ActiveSync Connectivity (Error Suppressed)"
			Write-Host "..performing ActiveSync connectivity test"
			$colActiveSyncResults = Test-ActiveSyncConnectivity -ClientAccessServer $Target.ToString() -TrustAnySSLCertificate
			$MyReport += Get-HTMLTable ($colActiveSyncResults | select ClientAccessServer, LocalSite, Scenario, $colourResult, $latencyMS)
			$MyReport += Get-CustomHeaderClose
			
            $MyReport += Get-CustomHeader "2" "CAS: Outlook Web Services"
			Write-Host "..performing Outlook Web Services test"
			$colOWSResults = Test-OutlookWebServices
			$MyReport += Get-HTMLTable ($colOWSResults | select Source, ServiceEndpoint, Scenario, $colourResult, $latencyMS)
			$MyReport += Get-CustomHeaderClose
		}
		
		if ($exServer.ServerRole -like "*Mailbox*")
		{
		Write-Host "..getting queue details"
		$MyReport += Get-CustomHeader "2" "MBX: Queue Information"
		$colQs = Get-Queue -server $Target 
		$MyReport += Get-HTMLTable ($colQs | Select-Object NextHopDomain, $colourStatus, MessageCount, NextRetryTime)
		$MyReport += Get-CustomHeaderClose

        Write-Host "..testing mailflow"
		$MyReport += Get-CustomHeader "2" "MBX: Mailflow Information (BETA)"
		$colFlow = Get-MailboxDatabase -Server $Target | %{Test-MailFlow -TargetDatabase $_.Name}
		$MyReport += Get-HTMLTable ($colFlow)
		$MyReport += Get-CustomHeaderClose
		}
		
		if ($exServer.ServerRole -like "*Mailbox*")
		{
				
		Write-Host "..getting mailbox database information"		
			$MyReport += Get-CustomHeader "2" "MBX: Mailbox Database Properties"
			$colMailboxStores = Get-MailboxDatabase -Server $Target -Status | Sort-Object Name
			$storeTable = @()
			Foreach ($objMailboxStore in $colMailboxStores)
			{
				[string]$totalUsers = (get-mailbox -database $objMailboxStore).count
				[string]$empty = $totalUsers.Length -eq 0
		
				if ($empty -eq 'True')
				{
					[string]$totalUsers = "0"
				}
				$storeDetails = "" | Select Name, Server, Mounted, "Total Users", "White Space", LastFullBackup
				$storeDetails.Name = $objMailboxStore.Name
                $storeDetails.Server = $objMailboxStore.Server
				$storeDetails.Mounted = Get-Ink ($objMailboxStore.Mounted)
				$storeDetails."Total Users" = $totalUsers
				$storeDetails."White Space" = $objMailboxStore.AvailableNewMailboxSpace
				
                If ($objMailboxStore.LastFullBackup -ne $null){
                $storeDetails.LastFullBackup = Get-BUDelta ($objMailboxStore.LastFullBackup)
				}
                Else {$storeDetails.LastFullBackup = 'Never'}

                $storeTable += $storeDetails
			}
				$MyReport += Get-HTMLTable ($storeTable)
			$MyReport += Get-CustomHeaderClose

			$MyReport += Get-CustomHeader "2" "MBX: Mailbox Database Copy Status"
			Write-Host "..performing Copy Status test"
			$colDAGResults = Get-MailboxDatabaseCopyStatus -Server $Target
		    $MyReport += Get-HTMLTable ($colDAGResults | select Name, $ColourStatus, CopyQueueLength, $ColourContentIndexState)
			$MyReport += Get-CustomHeaderClose					


            $MyReport += Get-CustomHeader "2" "MBX: MAPI Connectivity"
			Write-Host "..performing MAPI connectivity test"
			$colMAPIResults = Test-MAPIConnectivity -Server $Target
				$MyReport += Get-HTMLTable ($colMAPIResults | select Database, $newResult, $latencyMS, Error)
			$MyReport += Get-CustomHeaderClose

			
			Write-Host "..getting Exchange 2013 Health Status"
			$MyReport += Get-CustomHeader "2" "GEN: Health Report"
            $colHealthResults = Get-HealthReport $Target
				$MyReport += Get-HTMLTable ($colHealthResults | select HealthSet, $colourAlertValue, LastTransitionTime)
			$MyReport += Get-CustomHeaderClose
          

            
            Write-Host "..getting uncleared move requests"
			$MyReport += Get-CustomHeader "2" "GEN: Uncleared Move Requests"
			$colMoveRequests = Get-MoveRequest | where {$_.PSComputerName -match $Target} | Get-MoveRequestStatistics | Sort-Object DisplayName	
				$MyReport += Get-HTMLTable ($colMoveRequests | select DisplayName,Status,TotalMailboxSize,PercentComplete)
			$MyReport += Get-CustomHeaderClose
			            
		}
		
		Write-Host "..getting Exchange services"
		$ListOfServices = (gwmi -computer $Target -query "select * from win32_service where Name like 'MSExchange%' or Name like 'IIS%' or Name like 'SMTP%' or Name like 'POP%' or Name like 'W3SVC%'")
		$MyReport += Get-CustomHeader "2" "SYS: Exchange Services"
			$Services = @()
			Foreach ($Service in $ListOfServices){
				$Details = "" | Select Name,Account,"Start Mode",State,"Expected State"
				$Details.Name = $Service.Caption
				$Details.Account = $Service.Startname
				$Details."Start Mode" = $Service.StartMode
				If ($Service.StartMode -eq "Auto")
					{
						if ($Service.State -eq "Stopped")
						{
							$Details.State = $Service.State
							$Details."Expected State" = Get-Ink ("Unexpected")
						}
					}
					If ($Service.StartMode -eq "Auto")
					{
						if ($Service.State -eq "Running")
						{
							$Details.State = $Service.State
							$Details."Expected State" = Get-Ink ("OK")
						}
					}
					If ($Service.StartMode -eq "Disabled")
					{
						If ($Service.State -eq "Running")
						{
							$Details.State = $Service.State
							$Details."Expected State" = Get-Ink ("Unexpected")
						}
					}
					If ($Service.StartMode -eq "Disabled")
					{
						if ($Service.State -eq "Stopped")
						{
							$Details.State = $Service.State
							$Details."Expected State" = Get-Ink ("OK")
						}
					}
					If ($Service.StartMode -eq "Manual")
					{
						$Details.State = $Service.State
						$Details."Expected State" = Get-Ink ("OK")
					}
					If ($Service.State -eq "Paused")
					{
						$Details.State = $Service.State
						$Details."Expected State" = Get-Ink ("OK")
					}
				$Services += $Details
			}
				$MyReport += Get-HTMLTable ($Services)
			$MyReport += Get-CustomHeaderClose
		
				$eventLogs=[System.Diagnostics.EventLog]::GetEventLogs($Target) | where {($_.LogDisplayName -eq "Application") -OR ($_.LogDisplayName -eq "System")}
				$warningEvents = @()
				$errorEvents = @()
				$LogSettings = @()
			Write-Host "..getting event log settings"
			ForEach ($eventLog in $eventLogs)
			{
				$Details = "" | select "Log Name", "Overflow Action", "Maximum Kilobytes"
				$Details."Log Name" = $eventLog.LogDisplayName
				$MaximumKilobytes = ($eventLog.MaximumKilobytes)
				$Details."Maximum Kilobytes" = $MaximumKilobytes
				$Details."Overflow Action" = $eventLog.OverflowAction
				$LogSettings += $Details
				Write-Host "..getting event log warnings for" $eventLog.LogDisplayName "Log  (last 4 hours)"
				$warningEvents += ($eventLog.entries) | ForEach-Object { Add-Member -inputobject $_ -Name LogName -MemberType NoteProperty -Value $eventLog.LogDisplayName -Force -PassThru} | where {($_.TimeWritten -ge $now.AddHours(-4))} | where {($_.EntryType -eq "Warning")} | where {($_.Source -like "*MSExchange*" -or $_.Source -like "*ESE*")}
				Write-Host "..getting event log errors for" $eventLog.LogDisplayName "Log  (last 4 hours)"
				$errorEvents += ($eventLog.entries) | ForEach-Object { Add-Member -inputobject $_ -Name LogName -MemberType NoteProperty -Value $eventLog.LogDisplayName -Force -PassThru} | where {($_.TimeWritten -ge $now.AddHours(-4))} | where {($_.EntryType -eq "Error")} | where {($_.Source -like "*MSExchange*" -or $_.Source -like "*ESE*")}
			}
					$MyReport += Get-CustomHeader "2" "SYS: Event Logs (last 4 hours)"
				$MyReport += Get-CustomHeader "2" "Event Log Settings"
				$MyReport += Get-HTMLTable ($LogSettings)
			$MyReport += Get-CustomHeaderClose
				$MyReport += Get-CustomHeader "2" "SYS: Warning Events"
				$MyReport += Get-HTMLTable ($warningEvents | select EventID, Source, TimeWritten, LogName, Message)
			$MyReport += Get-CustomHeaderClose
					$MyReport += Get-CustomHeader "2" "SYS: Error Events"
				$MyReport += Get-HTMLTable ($errorEvents | select EventID, Source, TimeWritten, LogName, Message)
				$MyReport += Get-CustomHeaderClose
		$MyReport += Get-CustomHeaderClose
		$MyReport += Get-CustomHeaderClose
	$MyReport += Get-CustomHeader0Close
	$MyReport += Get-CustomHTMLClose
	$fullReport += $MyReport
	$(Get-Variable | where {$_.Name -match $Target}).value += $MyReport
    $MyReport = $null
}

if ($output -eq "s"){
	$Date = Get-Date
	$Filename = "Exchange_Audit" + "_" + $date.Hour + $date.Minute + "_" + $Date.Day + "-" + $Date.Month + "-" + $Date.Year + ".htm"
	$fullReport | out-file -encoding ASCII -filepath $Filename
    Get-Variable | where {$_.Name -match $Target} | Set-Variable -Value $null
    Write "Single-file audit report saved as $Filename"
}

elseif ($output -eq "m"){
    #This is still in BETA test mode.
    $Date = Get-Date
	$subject = "Exchange_Audit" + "_" + $date.Hour + $date.Minute + "_" + $Date.Day + "-" + $Date.Month + "-" + $Date.Year + ".htm"
    Send-MailMessage -subject $subject -from report@xxx.co.za -to user@xxx.co.za -Body ($fullReport | Out-String) -BodyAsHtml -SmtpServer xxx.xxx.xxx.xxx
    Write-Host 'Sending message'
    }

else {
	$Date = Get-Date
	Foreach ($Target in $Targets) {
	$Filename = $Target + "_" + $date.Hour + $date.Minute + "_" + $Date.Day + "-" + $Date.Month + "-" + $Date.Year + ".htm"
	out-file -encoding ASCII -filepath $Filename -InputObject $(Get-Variable | where {$_.Name -match $Target}).value
	Get-Variable | where {$_.Name -match $Target} | Set-Variable -Value $null
    Write "Multi-file audit report saved as $Filename"
	}
}
$output = $null
Get-Variable | where {$_.Name -match $Target} | Remove-Variable