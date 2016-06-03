$cred = Get-Credential
Login-AzureRmAccount -Credential $cred
login-azureRmAccount
get-azureRmSubscription
Get-azureRmSubscription -Subscriptionname "TCNE BIT Infrastructure 350 TST MSDN"
Get-AzureRMSubscription -Subscriptionname "TCNE BIT DEV MSDN" -
Get-AzureRmContext
Get-AzureRmResourceGroup -name "mms-weu" -Verbose
Get-AzureRmResourceGroup -name "mms-weu"

Get-AzureRmResourceGroup -Name "mms-weu"

Get-AzureRmResource -ResourceName "mms-weu"

Find-AzureRmResource -TagName billTo -TagValue TCNE-BIT-350 | %{ $_.ResourceName }

Find-AzureRmResourceGroup -Tag @{ Name="billTo"; Value="TCNE-BIT-350" } | %{ $_.Name }

Set-AzureRmResourceGroup -Name PROD-GROUP -Tag @( @{ Name="Ankeborg"; Value="Kalle" }, @{ Name="Hus"; Value="Pengabingen"} )
Find-AzureRmResourceGroup -Tag @{ Name="Hus"; Value="Pengabingen" } | %{ $_.Name }
Get-AzureRMTag

$tags = (Get-AzureRmResourceGroup -Name PROD-GROUP).Tags
$tags += @{Name="status";Value="approved"}
Set-AzureRmResourceGroup -Name PROD-GROUP -Tag $tags

$policy = New-AzureRmPolicyDefinition -Name regionPolicyDefinition -Description "Policy to allow resource creation only in certain regions BLABLABLA" -Policy '{  
  "if" : {
    "not" : {
      "field" : "location",
      "in" : ["northeurope" , "westeurope"]
    }
  },
  "then" : {
    "effect" : "deny"
  }
}'  

Get-AzureRmPolicyDefinition

New-AzureRmPolicyAssignment -Name regionPolicyAssignment -PolicyDefinition $policy -Scope    /subscriptions/939c1da9-8f7d-470a-b0ae-40c0fd5768c5/resourceGroups/PROD-GROUP

Get-AzureRmPolicyDefinition
Remove-AzureRmPolicyAssignment
Get-AzureRmPolicyAssignment
Set-AzureRmPolicyAssignment

$RegionPolicy = New-AzureRmPolicyDefinition -Name RegionPolicyDefinition -DisplayName Region creation policy -Description "Policy to allow resource creation only in certain regions "
-Policy https://github.com/M-Oberg/Azure/blob/master/Policies/RegionPolicyDEV.json

<#'{  
  "if" : {
    "not" : {
      "field" : "location",
      "in" : ["northeurope" , "westeurope"]
    }
  },
  "then" : {
    "effect" : "deny"
  }
}' #>



$Subscription = Get-AzureRmSubscription -SubscriptionName "TCNE BIT DEV MSDN"
New-AzureRmPolicyAssignment -Name RegionPolicyAssignment -PolicyDefinition $RegionPolicy -Scope /subscriptions/$Subscription/







 

New-AzureRmPolicyAssignment -Name RegionPolicyAssignment -PolicyDefinition $RegionPolicy -Scope /subscriptions/e99d2ce7-2b7c-43ae-a35d-ea565ae13974/


Get-AzureRmPolicyDefinition -Name RegionPolicyDefinition

$Subscription = Get-AzureRmSubscription -SubscriptionName TCNE BIT DEV MSDN
$resourceGroup = Get-AzureRmResourceGroup -Name demo-rg
$scope = "/subscriptions/" + $subscription.SubscriptionId + "/resourceGroups/" + $resourceGroup.ResourceGroupName
New-AzureRmPolicyAssignment -Name serverNaming -PolicyDefinition $policy -Scope $scope


Get-Help New-AzureRMPolicyAssignment -Full