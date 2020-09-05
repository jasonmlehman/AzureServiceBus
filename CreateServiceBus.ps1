param(
  [Parameter(Mandatory = $true)] [string]$ResourceGroup,
  [Parameter(Mandatory = $true)] [string]$NameSpace,
  [Parameter(Mandatory = $true)] [string]$Queues # Multiple queues separated by comma
)
New-AzServiceBusNamespace -ResourceGroupName $ResourceGroup -Name $NameSpace -Location eastus
$QueueArray = $Queues.Split(",")
Foreach ($Queue in $QueueArray) {
	New-AzServiceBusQueue -ResourceGroupName $ResourceGroup -NamespaceName $NameSpace -Name $Queue
}

