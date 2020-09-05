param(
  [Parameter(Mandatory = $true)] [string]$Subscription, # Name of Existing Subsription
  [Parameter(Mandatory = $true)] [string]$ResourceGroup, # Name of Existing Resource Group
  [Parameter(Mandatory = $true)] [string]$NameSpace, # Desired NameSpace
  [Parameter(Mandatory = $true)] [string]$Location, # Location of SeviceBus.  i.e eastus
  [Parameter(Mandatory = $true)] [string]$Queues # Multiple queues separated by comma
)

$Cred = get-Credential
Connect-AzAccount -Credential $Cred -Subscription $Subscription

New-AzServiceBusNamespace -ResourceGroupName $ResourceGroup -Name $NameSpace -Location $Location
$QueueArray = $Queues.Split(",")
Foreach ($Queue in $QueueArray) {
	New-AzServiceBusQueue -ResourceGroupName $ResourceGroup -NamespaceName $NameSpace -Name $Queue
}

