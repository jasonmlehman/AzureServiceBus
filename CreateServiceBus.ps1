param(
  [Parameter(Mandatory = $true)] [string]$ResourceGroup,
  [Parameter(Mandatory = $true)] [string]$NameSpace,
  [Parameter(Mandatory = $true)] [string]$Queues # Multiple queues separated by comma
)
New-AzServiceBusNamespace -ResourceGroupName $ResourceGroup -Name $NameSpace -Location eastus
For ($Queue in $Queues) {
	New-AzServiceBusQueue -ResourceGroupName $ResourceGroup -NamespaceName $NameSpace -Name $Queue
}

