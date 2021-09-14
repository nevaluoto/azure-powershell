
# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.Synopsis
This method gets the unencrypted secrets related to the job.
.Description
This method gets the unencrypted secrets related to the job.
.Example
PS C:\> Get-AzDataBoxJobCredential -Name "DtbxPowershell" -ResourceGroupName "resourceGroupName"

PS C:\> $obj = Get-AzDataBoxJobCredential -Name TJy-637522091284252285 -ResourceGroupName bvttoolrg12-Wednesday
PS C:\> $obj | Format-List

AdditionalInfo                          :
Code                                    :
DcAccessSecurityCodeForwardDcAccessCode :
DcAccessSecurityCodeReverseDcAccessCode :
Detail                                  :
JobName                                 : DtbxPowershell
JobSecret                               : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxHeavyJobSecrets
JobSecretJobSecretsType                 : DataBoxHeavy
Message                                 :
Target                                  :


PS C:\> $obj.JobSecret | Format-List

AdditionalInfo                          :
CabinetPodSecret                        : {, }
Code                                    :
DcAccessSecurityCode                    : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DcAccessSecurityCode
DcAccessSecurityCodeForwardDcAccessCode :
DcAccessSecurityCodeReverseDcAccessCode :
Detail                                  :
Error                                   : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.CloudError
Message                                 :
Target                                  :
Type                                    : DataBoxHeavy

PS C:\> $cabinetJobSecret = $obj.JobSecret.CabinetPodSecret | Format-List

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IUnencryptedCredentials
.Link
https://docs.microsoft.com/powershell/module/az.databox/get-azdataboxjobcredential
#>
function Get-AzDataBoxJobCredential {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IUnencryptedCredentials])]
[CmdletBinding(DefaultParameterSetName='List', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [System.String]
    # The name of the job Resource within the specified resource group.
    # job names must be between 3 and 24 characters in length and use any alphanumeric and underscore only
    ${Name},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [System.String]
    # The Resource Group Name
    ${ResourceGroupName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
    [System.String[]]
    # The Subscription Id
    ${SubscriptionId},

    [Parameter()]
    [Alias('AzureRMContext', 'AzureCredential')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Azure')]
    [System.Management.Automation.PSObject]
    # The credentials, account, tenant, and subscription used for communication with Azure.
    ${DefaultProfile},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            List = 'Az.DataBox.private\Get-AzDataBoxJobCredential_List';
        }
        if (('List') -contains $parameterSet -and -not $PSBoundParameters.ContainsKey('SubscriptionId')) {
            $PSBoundParameters['SubscriptionId'] = (Get-AzContext).Subscription.Id
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

<#
.Synopsis
Gets information about the specified job.
.Description
Gets information about the specified job.
.Example
PS C:\> Get-AzDataBoxJob -Name "Powershell10" -ResourceGroupName "resourceGroupName"  -SubscriptionId "SubscriptionId"

Name         Location Status        TransferType  SkuName IdentityType DeliveryType Detail
----         -------- ------        ------------  ------- ------------ ------------ ------
Powershell10 WestUS   DeviceOrdered ImportToAzure DataBox None         NonScheduled Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxJobDetails
.Example
PS C:\>  Get-AzDataBoxJob -SubscriptionId "SubscriptionId"

Name        Location      Status        TransferType    SkuName    IdentityType  DeliveryType Detail
----        --------      ------        ------------    -------    ------------  ------------ ------
brtestdbd  brazilsouth   DeviceOrdered ImportToAzure   DataBoxDisk None          NonScheduled Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxDiskJobDetails
testorder  uksouth       Cancelled     ImportToAzure   DataBoxDisk None          NonScheduled Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxDiskJobDetails
.Example
PS C:\>  Get-AzDataBoxJob -ResourceGroupName "resourceGroupName"

Name                   Location Status        TransferType    SkuName IdentityType   DeliveryType Detail
----                   -------- ------        ------------    ------- ------------   ------------ ------
abcbnkndnkndn          westus   DeviceOrdered ImportToAzure   DataBox None           NonScheduled Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxJobDetails
abcbnkndnkndn-Clone    westus   DeviceOrdered ImportToAzure   DataBox None           NonScheduled Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxJobDetails
abcOrder               westus   Cancelled     ImportToAzure   DataBox None           NonScheduled Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxJobDetails

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IJobResource
.Link
https://docs.microsoft.com/powershell/module/az.databox/get-azdataboxjob
#>
function Get-AzDataBoxJob {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IJobResource])]
[CmdletBinding(DefaultParameterSetName='List', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='Get', Mandatory)]
    [Alias('JobName')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [System.String]
    # The name of the job Resource within the specified resource group.
    # job names must be between 3 and 24 characters in length and use any alphanumeric and underscore only
    ${Name},

    [Parameter(ParameterSetName='Get', Mandatory)]
    [Parameter(ParameterSetName='List1', Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [System.String]
    # The Resource Group Name
    ${ResourceGroupName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
    [System.String[]]
    # The Subscription Id
    ${SubscriptionId},

    [Parameter(ParameterSetName='Get')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Query')]
    [System.String]
    # $expand is supported on details parameter for job, which provides details on the job stages.
    ${Expand},

    [Parameter(ParameterSetName='List')]
    [Parameter(ParameterSetName='List1')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Query')]
    [System.String]
    # $skipToken is supported on Get list of jobs, which provides the next page in the list of jobs.
    ${SkipToken},

    [Parameter()]
    [Alias('AzureRMContext', 'AzureCredential')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Azure')]
    [System.Management.Automation.PSObject]
    # The credentials, account, tenant, and subscription used for communication with Azure.
    ${DefaultProfile},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            Get = 'Az.DataBox.private\Get-AzDataBoxJob_Get';
            List = 'Az.DataBox.private\Get-AzDataBoxJob_List';
            List1 = 'Az.DataBox.private\Get-AzDataBoxJob_List1';
        }
        if (('Get', 'List', 'List1') -contains $parameterSet -and -not $PSBoundParameters.ContainsKey('SubscriptionId')) {
            $PSBoundParameters['SubscriptionId'] = (Get-AzContext).Subscription.Id
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

<#
.Synopsis
Creates a new job with the specified parameters.
Existing job cannot be updated with this API and should instead be updated with the Update job API.
.Description
Creates a new job with the specified parameters.
Existing job cannot be updated with this API and should instead be updated with the Update job API.
.Example
PS C:\> $dataAccount = New-AzDataBoxStorageAccountDetailsObject -DataAccountType "StorageAccount" -StorageAccountId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.Storage/storageAccounts/storageAccountName"
PS C:\>  $contactDetail = New-AzDataBoxContactDetailsObject -ContactName "random" -EmailList @("emailId") -Phone "1234567891"
PS C:\> $ShippingDetails = New-AzDataBoxShippingAddressObject -StreetAddress1 "101 TOWNSEND ST" -StateOrProvince "CA" -Country "US" -City "San Francisco" -PostalCode "94107" -AddressType "Commercial"
PS C:\>  $details = New-AzDataBoxJobDetailsObject -Type "DataBox"  -DataImportDetail  @(@{AccountDetail=$dataAccount; AccountDetailDataAccountType = "StorageAccount"} ) -ContactDetail $contactDetail -ShippingAddress $ShippingDetails
PS C:\> $resource = New-AzDataBoxJob -Name "ImportTest" -SubscriptionId "SubscriptionId" -ResourceGroupName "resourceGroupName" -TransferType "ImportToAzure" -Detail $details -Location "WestUS" -SkuName "DataBox"
PS C:\> $resource

Name         Location Status        TransferType  SkuName IdentityType DeliveryType Detail
----         -------- ------        ------------  ------- ------------ ------------ ------
ImportTest WestUS   DeviceOrdered ImportToAzure DataBox None         NonScheduled Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxJobDetails

PS C:\> $resource.Detail

Action                     :
ChainOfCustodySasKey       :
ContactDetail              : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.ContactDetails
CopyLogDetail              :
CopyProgress               :
DataExportDetail           :
DataImportDetail           : {Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataImportDetails}
DeliveryPackage            : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.PackageShippingDetails
DevicePassword             :
ExpectedDataSizeInTeraByte : 0
JobStage                   :
KeyEncryptionKey           : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.KeyEncryptionKey
LastMitigationActionOnJob  : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.LastMitigationActionOnJob
Preference                 : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.Preferences
ReturnPackage              : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.PackageShippingDetails
ReverseShipmentLabelSasKey :
ShippingAddress            : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.ShippingAddress
Type                       : DataBox

PS C:\> $resource.Detail.ShippingAddress

AddressType City          CompanyName Country PostalCode StateOrProvince StreetAddress1  StreetAddress2 StreetAddress3 ZipExtendedCode
----------- ----          ----------- ------- ---------- --------------- --------------  -------------- -------------- ---------------
Commercial  San Francisco             US      94107      CA              101 TOWNSEND ST
.Example
PS C:\> $dataAccount = New-AzDataBoxStorageAccountDetailsObject -DataAccountType "StorageAccount" -StorageAccountId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.Storage/storageAccounts/storageAccountName"
PS C:\>  $contactDetail = New-AzDataBoxContactDetailsObject -ContactName "random" -EmailList @("emailId") -Phone "1234567891"
PS C:\> $ShippingDetails = New-AzDataBoxShippingAddressObject -StreetAddress1 "101 TOWNSEND ST" -StateOrProvince "CA" -Country "US" -City "San Francisco" -PostalCode "94107" -AddressType "Commercial"
PS C:\> $transferConfigurationType = New-AzDataBoxTransferConfigurationObject -Type "TransferAll" -TransferAllDetail @{"IncludeDataAccountType"="StorageAccount";"IncludeTransferAllBlob"= "True"; "IncludeTransferAllFile"="True"}
PS C:\>  $details = New-AzDataBoxJobDetailsObject -Type "DataBox" -DataExportDetail  @(@{AccountDetail=$dataAccount; AccountDetailDataAccountType = "StorageAccount"; "TransferConfiguration"= $transferConfigurationType} ) -ContactDetail $contactDetail -ShippingAddress $ShippingDetails
PS C:\> $resource = New-AzDataBoxJob -Name "ExportTest" -SubscriptionId "SubscriptionId" -ResourceGroupName "resourceGroupName" -TransferType "ExportFromAzure" -Detail $details -Location "WestUS" -SkuName "DataBox"

Name      Location Status        TransferType    SkuName IdentityType DeliveryType Detail
----      -------- ------        ------------    ------- ------------ ------------ ------
ExportTest WestUS   DeviceOrdered ExportFromAzure DataBox None         NonScheduled Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxJobDetails
.Example
PS C:\> $managedDiskAccount=New-AzDataBoxManagedDiskDetailsObject -ResourceGroupId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName" -StagingStorageAccountId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.Storage/storageAccounts/stagingAccountName" -DataAccountType "ManagedDisk"
PS C:\>  $contactDetail = New-AzDataBoxContactDetailsObject -ContactName "random" -EmailList @("emailId") -Phone "1234567891"
PS C:\> $ShippingDetails = New-AzDataBoxShippingAddressObject -StreetAddress1 "101 TOWNSEND ST" -StateOrProvince "CA" -Country "US" -City "San Francisco" -PostalCode "94107" -AddressType "Commercial"
PS C:\>  $details = New-AzDataBoxJobDetailsObject -Type "DataBox"  -DataImportDetail  @(@{AccountDetail=$managedDiskAccount; AccountDetailDataAccountType = "ManagedDisk"} ) -ContactDetail $contactDetail -ShippingAddress $ShippingDetails
PS C:\> New-AzDataBoxJob -Name "PwshManagedDisk" -SubscriptionId "SubscriptionId" -ResourceGroupName "resourceGroupName" -TransferType "ImportToAzure" -Detail $details -Location "WestUS" -SkuName "DataBox"

Name            Location Status        TransferType  SkuName IdentityType DeliveryType Detail
----            -------- ------        ------------  ------- ------------ ------------ ------
PwshManagedDisk WestUS   DeviceOrdered ImportToAzure DataBox None         NonScheduled Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxJobDetails
.Example
$dataAccount = New-AzDataBoxStorageAccountDetailsObject -DataAccountType "StorageAccount" -StorageAccountId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.Storage/storageAccounts/storageAccountName"
PS C:\>  $contactDetail = New-AzDataBoxContactDetailsObject -ContactName "random" -EmailList @("emailId") -Phone "1234567891"
PS C:\> $ShippingDetails = New-AzDataBoxShippingAddressObject -StreetAddress1 "101 TOWNSEND ST" -StateOrProvince "CA" -Country "US" -City "San Francisco" -PostalCode "94107" -AddressType "Commercial"
PS C:\> $keyEncryptionDetails = New-AzDataBoxKeyEncryptionKeyObject -KekType "CustomerManaged" -IdentityProperty @{Type = "UserAssigned"; UserAssignedResourceId = "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.ManagedIdentity/userAssignedIdentities/identityName"} -KekUrl "keyIdentifier" -KekVaultResourceId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.KeyVault/vaults/keyVaultName"
PS C:\>  $details = New-AzDataBoxJobDetailsObject -Type "DataBox"  -DataImportDetail  @(@{AccountDetail=$dataAccount; AccountDetailDataAccountType = "StorageAccount"} ) -ContactDetail $contactDetail -ShippingAddress $ShippingDetails -KeyEncryptionKey $keyEncryptionDetails
PS C:\> New-AzDataBoxJob -Name "PowershellMSI" -SubscriptionId "SubscriptionId" -ResourceGroupName "resourceGroupName" -TransferType "ImportToAzure" -Detail $details -Location "WestUS" -SkuName "DataBox"  -IdentityType "UserAssigned" -UserAssignedIdentity @{"/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.ManagedIdentity/userAssignedIdentities/identityName" = @{}}

Name          Location Status        TransferType  SkuName IdentityType DeliveryType Detail
----          -------- ------        ------------  ------- ------------ ------------ ------
PowershellMSI WestUS   DeviceOrdered ImportToAzure DataBox UserAssigned NonScheduled Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxJobDetails
.Example
PS C:\> $dataAccount = New-AzDataBoxStorageAccountDetailsObject -DataAccountType "StorageAccount" -StorageAccountId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.Storage/storageAccounts/storageAccountName"
PS C:\>  $contactDetail = New-AzDataBoxContactDetailsObject -ContactName "random" -EmailList @("emailId") -Phone "1234567891"
PS C:\> $ShippingDetails = New-AzDataBoxShippingAddressObject -StreetAddress1 "101 TOWNSEND ST" -StateOrProvince "CA" -Country "US" -City "San Francisco" -PostalCode "94107" -AddressType "Commercial"
PS C:\>  $details = New-AzDataBoxJobDetailsObject -Type "DataBox"  -DataImportDetail  @(@{AccountDetail=$dataAccount; AccountDetailDataAccountType = "StorageAccount"} ) -ContactDetail $contactDetail -ShippingAddress $ShippingDetails
PS C:\> $date = Get-Date
PS C:\> $scheduleDate = $date.AddDays(15)
PS C:\> $resource = New-AzDataBoxJob -Name "pwshScheduleJob" -SubscriptionId "SubscriptionId" -ResourceGroupName "resourceGroupName" -TransferType "ImportToAzure" -Detail $details -Location "WestUS" -SkuName "DataBox" -DeliveryType "Scheduled" -DeliveryInfoScheduledDateTime $scheduleDate

Name            Location Status        TransferType  SkuName IdentityType DeliveryType Detail
----            -------- ------        ------------  ------- ------------ ------------ ------
pwshScheduleJob WestUS   DeviceOrdered ImportToAzure DataBox None         Scheduled    Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxJobDetails
.Example
PS C:\> $dataAccount = New-AzDataBoxStorageAccountDetailsObject -DataAccountType "StorageAccount" -StorageAccountId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.Storage/storageAccounts/storageAccountName"
PS C:\>  $contactDetail = New-AzDataBoxContactDetailsObject -ContactName "random" -EmailList @("emailId") -Phone "1234567891"
PS C:\> $ShippingDetails = New-AzDataBoxShippingAddressObject -StreetAddress1 "101 TOWNSEND ST" -StateOrProvince "CA" -Country "US" -City "San Francisco" -PostalCode "94107" -AddressType "Commercial"
PS C:\>  $details = New-AzDataBoxJobDetailsObject -Type "DataBox"  -DataImportDetail  @(@{AccountDetail=$dataAccount; AccountDetailDataAccountType = "StorageAccount"} ) -ContactDetail $contactDetail -ShippingAddress $ShippingDetails -DevicePassword "randmPass@12345"
PS C:\> $resource = New-AzDataBoxJob -Name "PowershellBYOK" -SubscriptionId "SubscriptionId" -ResourceGroupName "resourceGroupName" -TransferType "ImportToAzure" -Detail $details -Location "WestUS" -SkuName "DataBox"

Name           Location Status        TransferType  SkuName IdentityType DeliveryType Detail
----           -------- ------        ------------  ------- ------------ ------------ ------
PowershellBYOK WestUS   DeviceOrdered ImportToAzure DataBox None         NonScheduled Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxJobDetails
.Example
PS C:\> $dataAccount = New-AzDataBoxStorageAccountDetailsObject -DataAccountType "StorageAccount" -StorageAccountId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.Storage/storageAccounts/storageAccountName"
PS C:\>  $contactDetail = New-AzDataBoxContactDetailsObject -ContactName "random" -EmailList @("emailId") -Phone "1234567891"
PS C:\> $ShippingDetails = New-AzDataBoxShippingAddressObject -StreetAddress1 "101 TOWNSEND ST" -StateOrProvince "CA" -Country "US" -City "San Francisco" -PostalCode "94107" -AddressType "Commercial"
PS C:\>  $details = New-AzDataBoxHeavyJobDetailsObject -Type "DataBoxHeavy"  -DataImportDetail  @(@{AccountDetail=$dataAccount; AccountDetailDataAccountType = "StorageAccount"} ) -ContactDetail $contactDetail -ShippingAddress $ShippingDetails -DevicePassword "randm@423jarABC" -ExpectedDataSizeInTeraByte 10
PS C:\> $resource = New-AzDataBoxJob -Name "DbxHeavy" -SubscriptionId "SubscriptionId" -ResourceGroupName "resourceGroupName" -TransferType "ImportToAzure" -Detail $details -Location "WestUS" -SkuName "DataBoxHeavy"

Name    Location Status        TransferType  SkuName      IdentityType DeliveryType Detail
----    -------- ------        ------------  -------      ------------ ------------ ------
DbxHeavy WestUS  DeviceOrdered ImportToAzure DataBoxHeavy  None        NonScheduled Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxHeavyJobDetails
.Example
PS C:\> $dataAccount = New-AzDataBoxStorageAccountDetailsObject -DataAccountType "StorageAccount" -StorageAccountId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.Storage/storageAccounts/storageAccountName"
PS C:\>  $contactDetail = New-AzDataBoxContactDetailsObject -ContactName "random" -EmailList @("emailId") -Phone "1234567891"
PS C:\> $ShippingDetails = New-AzDataBoxShippingAddressObject -StreetAddress1 "101 TOWNSEND ST" -StateOrProvince "CA" -Country "US" -City "San Francisco" -PostalCode "94107" -AddressType "Commercial"
PS C:\>  $details = New-AzDataBoxDiskJobDetailsObject -Type "DataBoxDisk"  -DataImportDetail  @(@{AccountDetail=$dataAccount; AccountDetailDataAccountType = "StorageAccount"} ) -ContactDetail $contactDetail -ShippingAddress $ShippingDetails -Passkey "randm@423jarABC" -PreferredDisk @{"8" = 8; "4" = 2} -ExpectedDataSizeInTeraByte 18
PS C:\> New-AzDataBoxJob -Name "pwshDisk" -SubscriptionId "SubscriptionId" -ResourceGroupName "resourceGroupName" -TransferType "ImportToAzure" -Detail $details -Location "WestUS" -SkuName "DataBoxDisk"

Name     Location Status        TransferType  SkuName     IdentityType DeliveryType Detail
----     -------- ------        ------------  -------     ------------ ------------ ------
pwshDisk WestUS   DeviceOrdered ImportToAzure DataBoxDisk None         NonScheduled Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxDiskJobDetails
.Example
PS C:\> $dataAccount = New-AzDataBoxStorageAccountDetailsObject -DataAccountType "StorageAccount" -StorageAccountId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.Storage/storageAccounts/storageAccountName"
PS C:\>  $contactDetail = New-AzDataBoxContactDetailsObject -ContactName "random" -EmailList @("emailId") -Phone "1234567891"
PS C:\> $ShippingDetails = New-AzDataBoxShippingAddressObject -StreetAddress1 "101 TOWNSEND ST" -StateOrProvince "CA" -Country "US" -City "San Francisco" -PostalCode "94107" -AddressType "Commercial"
PS C:\>  $details = New-AzDataBoxJobDetailsObject -Type "DataBox"  -DataImportDetail  @(@{AccountDetail=$dataAccount; AccountDetailDataAccountType = "StorageAccount"} ) -ContactDetail $contactDetail -ShippingAddress $ShippingDetails -Preference @{EncryptionPreferenceDoubleEncryption="Enabled"}
PS C:\> New-AzDataBoxJob -Name "pwshDoubEncy" -SubscriptionId "SubscriptionId" -ResourceGroupName "resourceGroupName" -TransferType "ImportToAzure" -Detail $details -Location "WestUS" -SkuName "DataBox"

Name        Location Status        TransferType  SkuName     IdentityType DeliveryType Detail
----        -------- ------        ------------  -------     ------------ ------------ ------
pwshDoubEncy WestUS   DeviceOrdered ImportToAzure DataBox None         NonScheduled Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxDiskJobDetails

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IJobResource
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

DETAIL <IJobDetails>: Details of a job run. This field will only be sent for expand details filter.
  ContactDetail <IContactDetails>: Contact details for notification and shipping.
    ContactName <String>: Contact name of the person.
    EmailList <String[]>: List of Email-ids to be notified about job progress.
    Phone <String>: Phone number of the contact person.
    [Mobile <String>]: Mobile number of the contact person.
    [NotificationPreference <INotificationPreference[]>]: Notification preference for a job stage.
      SendNotification <Boolean>: Notification is required or not.
      StageName <NotificationStageName>: Name of the stage.
    [PhoneExtension <String>]: Phone extension number of the contact person.
  Type <ClassDiscriminator>: Indicates the type of job details.
  [DataExportDetail <IDataExportDetails[]>]: Details of the data to be exported from azure.
    AccountDetailDataAccountType <DataAccountType>: Account Type of the data to be transferred.
    TransferConfiguration <ITransferConfiguration>: Configuration for the data transfer.
      Type <TransferConfigurationType>: Type of the configuration for transfer.
      [TransferAllDetail <ITransferConfigurationTransferAllDetails>]: Map of filter type and the details to transfer all data. This field is required only if the TransferConfigurationType is given as TransferAll
        [IncludeDataAccountType <DataAccountType?>]: Type of the account of data
        [IncludeTransferAllBlob <Boolean?>]: To indicate if all Azure blobs have to be transferred
        [IncludeTransferAllFile <Boolean?>]: To indicate if all Azure Files have to be transferred
      [TransferFilterDetail <ITransferConfigurationTransferFilterDetails>]: Map of filter type and the details to filter. This field is required only if the TransferConfigurationType is given as TransferUsingFilter.
        [AzureFileFilterDetailFilePathList <String[]>]: List of full path of the files to be transferred.
        [AzureFileFilterDetailFilePrefixList <String[]>]: Prefix list of the Azure files to be transferred.
        [AzureFileFilterDetailFileShareList <String[]>]: List of file shares to be transferred.
        [BlobFilterDetailBlobPathList <String[]>]: List of full path of the blobs to be transferred.
        [BlobFilterDetailBlobPrefixList <String[]>]: Prefix list of the Azure blobs to be transferred.
        [BlobFilterDetailContainerList <String[]>]: List of blob containers to be transferred.
        [IncludeDataAccountType <DataAccountType?>]: Type of the account of data.
        [IncludeFilterFileDetail <IFilterFileDetails[]>]: Details of the filter files to be used for data transfer.
          FilterFilePath <String>: Path of the file that contains the details of all items to transfer.
          FilterFileType <FilterFileType>: Type of the filter file.
    [AccountDetailSharePassword <String>]: Password for all the shares to be created on the device. Should not be passed for TransferType:ExportFromAzure jobs. If this is not passed, the service will generate password itself. This will not be returned in Get Call. Password Requirements :  Password must be minimum of 12 and maximum of 64 characters. Password must have at least one uppercase alphabet, one number and one special character. Password cannot have the following characters : IilLoO0 Password can have only alphabets, numbers and these characters : @#\-$%^!+=;:_()]+
    [LogCollectionLevel <LogCollectionLevel?>]: Level of the logs to be collected.
  [DataImportDetail <IDataImportDetails[]>]: Details of the data to be imported into azure.
    AccountDetailDataAccountType <DataAccountType>: Account Type of the data to be transferred.
    [AccountDetailSharePassword <String>]: Password for all the shares to be created on the device. Should not be passed for TransferType:ExportFromAzure jobs. If this is not passed, the service will generate password itself. This will not be returned in Get Call. Password Requirements :  Password must be minimum of 12 and maximum of 64 characters. Password must have at least one uppercase alphabet, one number and one special character. Password cannot have the following characters : IilLoO0 Password can have only alphabets, numbers and these characters : @#\-$%^!+=;:_()]+
  [ExpectedDataSizeInTeraByte <Int32?>]: The expected size of the data, which needs to be transferred in this job, in terabytes.
  [KeyEncryptionKey <IKeyEncryptionKey>]: Details about which key encryption type is being used.
    KekType <KekType>: Type of encryption key used for key encryption.
    [IdentityProperty <IIdentityProperties>]: Managed identity properties used for key encryption.
      [Type <String>]: Managed service identity type.
      [UserAssignedResourceId <String>]: Arm resource id for user assigned identity to be used to fetch MSI token.
    [KekUrl <String>]: Key encryption key. It is required in case of Customer managed KekType.
    [KekVaultResourceId <String>]: Kek vault resource id. It is required in case of Customer managed KekType.
  [Preference <IPreferences>]: Preferences for the order.
    [EncryptionPreferenceDoubleEncryption <DoubleEncryption?>]: Defines secondary layer of software-based encryption enablement.
    [PreferredDataCenterRegion <String[]>]: Preferred data center region.
    [TransportPreferencePreferredShipmentType <TransportShipmentTypes?>]: Indicates Shipment Logistics type that the customer preferred.
  [ShippingAddress <IShippingAddress>]: Shipping address of the customer.
    Country <String>: Name of the Country.
    StreetAddress1 <String>: Street Address line 1.
    [AddressType <AddressType?>]: Type of address.
    [City <String>]: Name of the City.
    [CompanyName <String>]: Name of the company.
    [PostalCode <String>]: Postal code.
    [StateOrProvince <String>]: Name of the State or Province.
    [StreetAddress2 <String>]: Street Address line 2.
    [StreetAddress3 <String>]: Street Address line 3.
    [ZipExtendedCode <String>]: Extended Zip Code.
.Link
https://docs.microsoft.com/powershell/module/az.databox/new-azdataboxjob
#>
function New-AzDataBoxJob {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IJobResource])]
[CmdletBinding(DefaultParameterSetName='CreateExpanded', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory)]
    [Alias('JobName')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [System.String]
    # The name of the job Resource within the specified resource group.
    # job names must be between 3 and 24 characters in length and use any alphanumeric and underscore only
    ${Name},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [System.String]
    # The Resource Group Name
    ${ResourceGroupName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
    [System.String]
    # The Subscription Id
    ${SubscriptionId},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # The location of the resource.
    # This will be one of the supported and registered Azure Regions (e.g.
    # West US, East US, Southeast Asia, etc.).
    # The region of a resource cannot be changed once it is created, but if an identical region is specified on update the request will succeed.
    ${Location},

    [Parameter(Mandatory)]
    [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.SkuName])]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.SkuName]
    # The sku name.
    ${SkuName},

    [Parameter(Mandatory)]
    [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.TransferType])]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.TransferType]
    # Type of the data transfer.
    ${TransferType},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.DateTime]
    # Scheduled date time.
    ${DeliveryInfoScheduledDateTime},

    [Parameter()]
    [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.JobDeliveryType])]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.JobDeliveryType]
    # Delivery type of Job.
    ${DeliveryType},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IJobDetails]
    # Details of a job run.
    # This field will only be sent for expand details filter.
    # To construct, see NOTES section for DETAIL properties and create a hash table.
    ${Detail},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Identity type
    ${IdentityType},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # The display name of the sku.
    ${SkuDisplayName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # The sku family.
    ${SkuFamily},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.Info(PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IResourceTags]))]
    [System.Collections.Hashtable]
    # The list of key value pairs that describe the resource.
    # These tags can be used in viewing and grouping this resource (across resource groups).
    ${Tag},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.Info(PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IResourceIdentityUserAssignedIdentities]))]
    [System.Collections.Hashtable]
    # User Assigned Identities
    ${UserAssignedIdentity},

    [Parameter()]
    [Alias('AzureRMContext', 'AzureCredential')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Azure')]
    [System.Management.Automation.PSObject]
    # The credentials, account, tenant, and subscription used for communication with Azure.
    ${DefaultProfile},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Run the command as a job
    ${AsJob},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Run the command asynchronously
    ${NoWait},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            CreateExpanded = 'Az.DataBox.private\New-AzDataBoxJob_CreateExpanded';
        }
        if (('CreateExpanded') -contains $parameterSet -and -not $PSBoundParameters.ContainsKey('SubscriptionId')) {
            $PSBoundParameters['SubscriptionId'] = (Get-AzContext).Subscription.Id
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

<#
.Synopsis
Deletes a job.
.Description
Deletes a job.
.Example
PS C:\> Remove-AzDataBoxJob -Name "Powershell10" -ResourceGroupName "resourceGroupName"

.Outputs
System.Boolean
.Link
https://docs.microsoft.com/powershell/module/az.databox/remove-azdataboxjob
#>
function Remove-AzDataBoxJob {
[OutputType([System.Boolean])]
[CmdletBinding(DefaultParameterSetName='Delete', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory)]
    [Alias('JobName')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [System.String]
    # The name of the job Resource within the specified resource group.
    # job names must be between 3 and 24 characters in length and use any alphanumeric and underscore only
    ${Name},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [System.String]
    # The Resource Group Name
    ${ResourceGroupName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
    [System.String]
    # The Subscription Id
    ${SubscriptionId},

    [Parameter()]
    [Alias('AzureRMContext', 'AzureCredential')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Azure')]
    [System.Management.Automation.PSObject]
    # The credentials, account, tenant, and subscription used for communication with Azure.
    ${DefaultProfile},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Run the command as a job
    ${AsJob},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Run the command asynchronously
    ${NoWait},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Returns true when the command succeeds
    ${PassThru},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            Delete = 'Az.DataBox.private\Remove-AzDataBoxJob_Delete';
        }
        if (('Delete') -contains $parameterSet -and -not $PSBoundParameters.ContainsKey('SubscriptionId')) {
            $PSBoundParameters['SubscriptionId'] = (Get-AzContext).Subscription.Id
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

<#
.Synopsis
CancelJob.
.Description
CancelJob.
.Example
PS C:\> Stop-AzDataBoxJob -Name "Powershell10" -ResourceGroupName "resourceGroupName" -Reason "Powershell demo job"
PS C:\> Get-AzDataBoxJob -Name "Powershell10" -ResourceGroupName "resourceGroupName"

Name         Location Status    TransferType  SkuName IdentityType DeliveryType Detail
----         -------- ------    ------------  ------- ------------ ------------ ------
Powershell10 WestUS   Cancelled ImportToAzure DataBox UserAssigned NonScheduled Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxJobDetails

.Outputs
System.Boolean
.Link
https://docs.microsoft.com/powershell/module/az.databox/stop-azdataboxjob
#>
function Stop-AzDataBoxJob {
[OutputType([System.Boolean])]
[CmdletBinding(DefaultParameterSetName='CancelExpanded', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory)]
    [Alias('JobName')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [System.String]
    # The name of the job Resource within the specified resource group.
    # job names must be between 3 and 24 characters in length and use any alphanumeric and underscore only
    ${Name},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [System.String]
    # The Resource Group Name
    ${ResourceGroupName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
    [System.String]
    # The Subscription Id
    ${SubscriptionId},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Reason for cancellation.
    ${Reason},

    [Parameter()]
    [Alias('AzureRMContext', 'AzureCredential')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Azure')]
    [System.Management.Automation.PSObject]
    # The credentials, account, tenant, and subscription used for communication with Azure.
    ${DefaultProfile},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Returns true when the command succeeds
    ${PassThru},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            CancelExpanded = 'Az.DataBox.private\Stop-AzDataBoxJob_CancelExpanded';
        }
        if (('CancelExpanded') -contains $parameterSet -and -not $PSBoundParameters.ContainsKey('SubscriptionId')) {
            $PSBoundParameters['SubscriptionId'] = (Get-AzContext).Subscription.Id
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

<#
.Synopsis
Updates the properties of an existing job.
.Description
Updates the properties of an existing job.
.Example
PS C:\>  $keyEncryptionDetails = New-AzDataBoxKeyEncryptionKeyObject -KekType "CustomerManaged" -IdentityProperty @{Type = "UserAssigned"; UserAssignedResourceId = "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.ManagedIdentity/userAssignedIdentities/identityName"} -KekUrl "keyIdentifier" -KekVaultResourceId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.KeyVault/vaults/keyVaultName"

PS C:\> $keyEncryptionDetails

KekType         KekUrl                                           KekVaultResourceId
-------         ------                                           ------------------
CustomerManaged keyIdentifier /subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.KeyVault/vaults/keyVaultName

PS C:\> Update-AzDataBoxJob -Name "powershell10" -ResourceGroupName "resourceGroupName" -KeyEncryptionKey $keyEncryptionDetails -ContactDetail $contactDetail -ShippingAddress $ShippingDetails  -IdentityType "UserAssigned" -UserAssignedIdentity @{"/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.ManagedIdentity/userAssignedIdentities/identityName" = @{}}

Name         Location Status        TransferType  SkuName IdentityType DeliveryType Detail
----         -------- ------        ------------  ------- ------------ ------------ ------
Powershell10 WestUS   DeviceOrdered ImportToAzure DataBox UserAssigned NonScheduled Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxJobDetails
.Example
PS C:\>   $databoxUpdate = Update-AzDataBoxJob -Name "pwshTestSAssigned" -ResourceGroupName "resourceGroupName" -ContactDetail $contactDetail -ShippingAddress $ShippingDetails  -IdentityType "SystemAssigned"

PS C:\> $databoxUpdate.Identity

PrincipalId                          TenantId                             Type
-----------                          --------                             ----
920850f5-9b6b-4017-a81a-3dcafe348be7 72f988bf-86f1-41af-91ab-2d7cd011db47 SystemAssigned

PS C:\> $keyEncryptionDetails = New-AzDataBoxKeyEncryptionKeyObject -KekType "CustomerManaged" -IdentityProperty @{Type = "SystemAssigned"} -KekUrl "keyIdentifier" -KekVaultResourceId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.KeyVault/vaults/keyVaultName"

PS C:\> $databoxUpdateWithCMK = Update-AzDataBoxJob -Name "pwshTestSAssigned" -ResourceGroupName "resourceGroupName" -ContactDetail $contactDetail -ShippingAddress $ShippingDetails  -KeyEncryptionKey $keyEncryptionDetails

PS C:\> $databoxUpdateWithCMK.Identity

PrincipalId                          TenantId                             Type
-----------                          --------                             ----
920850f5-9b6b-4017-a81a-3dcafe348be7 72f988bf-86f1-41af-91ab-2d7cd011db47 SystemAssigned

PS C:\> $databoxUpdateWithCMK.Detail.KeyEncryptionKey

KekType         KekUrl                                           KekVaultResourceId
-------         ------                                           ------------------
CustomerManaged keyIdentifier /subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.KeyVault/vaults/keyVaultName
.Example
PS C:\>   $keyEncryptionDetails = New-AzDataBoxKeyEncryptionKeyObject -KekType "CustomerManaged" -IdentityProperty @{Type = "UserAssigned"; UserAssignedResourceId = "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.ManagedIdentity/userAssignedIdentities/identityName"} -KekUrl "keyIdentifier" -KekVaultResourceId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.KeyVault/vaults/keyVaultName"
PS C:\>  $updateSystemToUserAssigned = Update-AzDataBoxJob -Name "pwshTestSAssigned" -ResourceGroupName "resourceGroupName" -KeyEncryptionKey $keyEncryptionDetails -ContactDetail $contactDetail -ShippingAddress $ShippingDetails  -IdentityType "SystemAssigned,UserAssigned" -IdentityUserAssignedIdentity @{"/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.ManagedIdentity/userAssignedIdentities/identityName" = @{}}

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IJobResource
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

CONTACTDETAIL <IContactDetails>: Contact details for notification and shipping.
  ContactName <String>: Contact name of the person.
  EmailList <String[]>: List of Email-ids to be notified about job progress.
  Phone <String>: Phone number of the contact person.
  [Mobile <String>]: Mobile number of the contact person.
  [NotificationPreference <INotificationPreference[]>]: Notification preference for a job stage.
    SendNotification <Boolean>: Notification is required or not.
    StageName <NotificationStageName>: Name of the stage.
  [PhoneExtension <String>]: Phone extension number of the contact person.

KEYENCRYPTIONKEY <IKeyEncryptionKey>: Key encryption key for the job.
  KekType <KekType>: Type of encryption key used for key encryption.
  [IdentityProperty <IIdentityProperties>]: Managed identity properties used for key encryption.
    [Type <String>]: Managed service identity type.
    [UserAssignedResourceId <String>]: Arm resource id for user assigned identity to be used to fetch MSI token.
  [KekUrl <String>]: Key encryption key. It is required in case of Customer managed KekType.
  [KekVaultResourceId <String>]: Kek vault resource id. It is required in case of Customer managed KekType.

SHIPPINGADDRESS <IShippingAddress>: Shipping address of the customer.
  Country <String>: Name of the Country.
  StreetAddress1 <String>: Street Address line 1.
  [AddressType <AddressType?>]: Type of address.
  [City <String>]: Name of the City.
  [CompanyName <String>]: Name of the company.
  [PostalCode <String>]: Postal code.
  [StateOrProvince <String>]: Name of the State or Province.
  [StreetAddress2 <String>]: Street Address line 2.
  [StreetAddress3 <String>]: Street Address line 3.
  [ZipExtendedCode <String>]: Extended Zip Code.
.Link
https://docs.microsoft.com/powershell/module/az.databox/update-azdataboxjob
#>
function Update-AzDataBoxJob {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IJobResource])]
[CmdletBinding(DefaultParameterSetName='UpdateExpanded', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory)]
    [Alias('JobName')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [System.String]
    # The name of the job Resource within the specified resource group.
    # job names must be between 3 and 24 characters in length and use any alphanumeric and underscore only
    ${Name},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [System.String]
    # The Resource Group Name
    ${ResourceGroupName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Path')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
    [System.String]
    # The Subscription Id
    ${SubscriptionId},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Header')]
    [System.String]
    # Defines the If-Match condition.
    # The patch will be performed only if the ETag of the job on the server matches this value.
    ${IfMatch},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IContactDetails]
    # Contact details for notification and shipping.
    # To construct, see NOTES section for CONTACTDETAIL properties and create a hash table.
    ${ContactDetail},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Identity type
    ${IdentityType},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IKeyEncryptionKey]
    # Key encryption key for the job.
    # To construct, see NOTES section for KEYENCRYPTIONKEY properties and create a hash table.
    ${KeyEncryptionKey},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IShippingAddress]
    # Shipping address of the customer.
    # To construct, see NOTES section for SHIPPINGADDRESS properties and create a hash table.
    ${ShippingAddress},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.Info(PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IJobResourceUpdateParameterTags]))]
    [System.Collections.Hashtable]
    # The list of key value pairs that describe the resource.
    # These tags can be used in viewing and grouping this resource (across resource groups).
    ${Tag},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.Info(PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IResourceIdentityUserAssignedIdentities]))]
    [System.Collections.Hashtable]
    # User Assigned Identities
    ${UserAssignedIdentity},

    [Parameter()]
    [Alias('AzureRMContext', 'AzureCredential')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Azure')]
    [System.Management.Automation.PSObject]
    # The credentials, account, tenant, and subscription used for communication with Azure.
    ${DefaultProfile},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Run the command as a job
    ${AsJob},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Run the command asynchronously
    ${NoWait},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            UpdateExpanded = 'Az.DataBox.private\Update-AzDataBoxJob_UpdateExpanded';
        }
        if (('UpdateExpanded') -contains $parameterSet -and -not $PSBoundParameters.ContainsKey('SubscriptionId')) {
            $PSBoundParameters['SubscriptionId'] = (Get-AzContext).Subscription.Id
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

<#
.Synopsis
Create a in-memory object for ContactDetails
.Description
Create a in-memory object for ContactDetails
.Example
PS C:\> $contactDetail = New-AzDataBoxContactDetailsObject -ContactName "random" -EmailList @("emailId") -Phone "1234567891"
PS C:\>  $contactDetail

ContactName EmailList            Mobile Phone      PhoneExtension
----------- ---------            ------ -----      --------------
random      {emailId}        1234567891

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.ContactDetails
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

NOTIFICATIONPREFERENCE <INotificationPreference[]>: Notification preference for a job stage.
  SendNotification <Boolean>: Notification is required or not.
  StageName <NotificationStageName>: Name of the stage.
.Link
https://docs.microsoft.com/powershell/module/az.DataBox/new-AzDataBoxContactDetailsObject
#>
function New-AzDataBoxContactDetailsObject {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.ContactDetails])]
[CmdletBinding(PositionalBinding=$false)]
param(
    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Contact name of the person.
    ${ContactName},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String[]]
    # List of Email-ids to be notified about job progress.
    ${EmailList},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Phone number of the contact person.
    ${Phone},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Mobile number of the contact person.
    ${Mobile},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.INotificationPreference[]]
    # Notification preference for a job stage.
    # To construct, see NOTES section for NOTIFICATIONPREFERENCE properties and create a hash table.
    ${NotificationPreference},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Phone extension number of the contact person.
    ${PhoneExtension}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            __AllParameterSets = 'Az.DataBox.custom\New-AzDataBoxContactDetailsObject';
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

<#
.Synopsis
Create a in-memory object for DataBoxDiskJobDetails
.Description
Create a in-memory object for DataBoxDiskJobDetails
.Example
PS C:\> $details = New-AzDataBoxDiskJobDetailsObject -Type "DataBoxDisk"  -DataImportDetail  @(@{AccountDetail=$dataAccount; AccountDetailDataAccountType = "StorageAccount"} ) -ContactDetail $contactDetail -ShippingAddress $ShippingDetails -Passkey "randm@423jarABC" -PreferredDisk @{"8" = 8; "4" = 2} -ExpectedDataSizeInTeraByte 18

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxDiskJobDetails
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

CONTACTDETAIL <IContactDetails>: Contact details for notification and shipping.
  ContactName <String>: Contact name of the person.
  EmailList <String[]>: List of Email-ids to be notified about job progress.
  Phone <String>: Phone number of the contact person.
  [Mobile <String>]: Mobile number of the contact person.
  [NotificationPreference <INotificationPreference[]>]: Notification preference for a job stage.
    SendNotification <Boolean>: Notification is required or not.
    StageName <NotificationStageName>: Name of the stage.
  [PhoneExtension <String>]: Phone extension number of the contact person.

DATAEXPORTDETAIL <IDataExportDetails[]>: Details of the data to be exported from azure.
  AccountDetailDataAccountType <DataAccountType>: Account Type of the data to be transferred.
  TransferConfiguration <ITransferConfiguration>: Configuration for the data transfer.
    Type <TransferConfigurationType>: Type of the configuration for transfer.
    [TransferAllDetail <ITransferConfigurationTransferAllDetails>]: Map of filter type and the details to transfer all data. This field is required only if the TransferConfigurationType is given as TransferAll
      [IncludeDataAccountType <DataAccountType?>]: Type of the account of data
      [IncludeTransferAllBlob <Boolean?>]: To indicate if all Azure blobs have to be transferred
      [IncludeTransferAllFile <Boolean?>]: To indicate if all Azure Files have to be transferred
    [TransferFilterDetail <ITransferConfigurationTransferFilterDetails>]: Map of filter type and the details to filter. This field is required only if the TransferConfigurationType is given as TransferUsingFilter.
      [AzureFileFilterDetailFilePathList <String[]>]: List of full path of the files to be transferred.
      [AzureFileFilterDetailFilePrefixList <String[]>]: Prefix list of the Azure files to be transferred.
      [AzureFileFilterDetailFileShareList <String[]>]: List of file shares to be transferred.
      [BlobFilterDetailBlobPathList <String[]>]: List of full path of the blobs to be transferred.
      [BlobFilterDetailBlobPrefixList <String[]>]: Prefix list of the Azure blobs to be transferred.
      [BlobFilterDetailContainerList <String[]>]: List of blob containers to be transferred.
      [IncludeDataAccountType <DataAccountType?>]: Type of the account of data.
      [IncludeFilterFileDetail <IFilterFileDetails[]>]: Details of the filter files to be used for data transfer.
        FilterFilePath <String>: Path of the file that contains the details of all items to transfer.
        FilterFileType <FilterFileType>: Type of the filter file.
  [AccountDetailSharePassword <String>]: Password for all the shares to be created on the device. Should not be passed for TransferType:ExportFromAzure jobs. If this is not passed, the service will generate password itself. This will not be returned in Get Call. Password Requirements :  Password must be minimum of 12 and maximum of 64 characters. Password must have at least one uppercase alphabet, one number and one special character. Password cannot have the following characters : IilLoO0 Password can have only alphabets, numbers and these characters : @#\-$%^!+=;:_()]+
  [LogCollectionLevel <LogCollectionLevel?>]: Level of the logs to be collected.

DATAIMPORTDETAIL <IDataImportDetails[]>: Details of the data to be imported into azure.
  AccountDetailDataAccountType <DataAccountType>: Account Type of the data to be transferred.
  [AccountDetailSharePassword <String>]: Password for all the shares to be created on the device. Should not be passed for TransferType:ExportFromAzure jobs. If this is not passed, the service will generate password itself. This will not be returned in Get Call. Password Requirements :  Password must be minimum of 12 and maximum of 64 characters. Password must have at least one uppercase alphabet, one number and one special character. Password cannot have the following characters : IilLoO0 Password can have only alphabets, numbers and these characters : @#\-$%^!+=;:_()]+

KEYENCRYPTIONKEY <IKeyEncryptionKey>: Details about which key encryption type is being used.
  KekType <KekType>: Type of encryption key used for key encryption.
  [IdentityProperty <IIdentityProperties>]: Managed identity properties used for key encryption.
    [Type <String>]: Managed service identity type.
    [UserAssignedResourceId <String>]: Arm resource id for user assigned identity to be used to fetch MSI token.
  [KekUrl <String>]: Key encryption key. It is required in case of Customer managed KekType.
  [KekVaultResourceId <String>]: Kek vault resource id. It is required in case of Customer managed KekType.

PREFERENCE <IPreferences>: Preferences for the order.
  [EncryptionPreferenceDoubleEncryption <DoubleEncryption?>]: Defines secondary layer of software-based encryption enablement.
  [PreferredDataCenterRegion <String[]>]: Preferred data center region.
  [TransportPreferencePreferredShipmentType <TransportShipmentTypes?>]: Indicates Shipment Logistics type that the customer preferred.

PREFERREDDISK <IDataBoxDiskJobDetailsPreferredDisks>: User preference on what size disks are needed for the job. The map is from the disk size in TB to the count. Eg. {2,5} means 5 disks of 2 TB size. Key is string but will be checked against an int.
  [(Any) <Int32>]: This indicates any property can be added to this object.

SHIPPINGADDRESS <IShippingAddress>: Shipping address of the customer.
  Country <String>: Name of the Country.
  StreetAddress1 <String>: Street Address line 1.
  [AddressType <AddressType?>]: Type of address.
  [City <String>]: Name of the City.
  [CompanyName <String>]: Name of the company.
  [PostalCode <String>]: Postal code.
  [StateOrProvince <String>]: Name of the State or Province.
  [StreetAddress2 <String>]: Street Address line 2.
  [StreetAddress3 <String>]: Street Address line 3.
  [ZipExtendedCode <String>]: Extended Zip Code.
.Link
https://docs.microsoft.com/powershell/module/az.DataBox/new-AzDataBoxDiskJobDetailsObject
#>
function New-AzDataBoxDiskJobDetailsObject {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxDiskJobDetails])]
[CmdletBinding(PositionalBinding=$false)]
param(
    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IContactDetails]
    # Contact details for notification and shipping.
    # To construct, see NOTES section for CONTACTDETAIL properties and create a hash table.
    ${ContactDetail},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.ClassDiscriminator]
    # Indicates the type of job details.
    ${Type},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # User entered passkey for DataBox Disk job.
    ${Passkey},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IDataBoxDiskJobDetailsPreferredDisks]
    # User preference on what size disks are needed for the job.
    # The map is from the disk size in TB to the count.
    # Eg.
    # {2,5} means 5 disks of 2 TB size.
    # Key is string but will be checked against an int.
    # To construct, see NOTES section for PREFERREDDISK properties and create a hash table.
    ${PreferredDisk},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IDataExportDetails[]]
    # Details of the data to be exported from azure.
    # To construct, see NOTES section for DATAEXPORTDETAIL properties and create a hash table.
    ${DataExportDetail},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IDataImportDetails[]]
    # Details of the data to be imported into azure.
    # To construct, see NOTES section for DATAIMPORTDETAIL properties and create a hash table.
    ${DataImportDetail},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.Int32]
    # The expected size of the data, which needs to be transferred in this job, in terabytes.
    ${ExpectedDataSizeInTeraByte},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IKeyEncryptionKey]
    # Details about which key encryption type is being used.
    # To construct, see NOTES section for KEYENCRYPTIONKEY properties and create a hash table.
    ${KeyEncryptionKey},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IPreferences]
    # Preferences for the order.
    # To construct, see NOTES section for PREFERENCE properties and create a hash table.
    ${Preference},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IShippingAddress]
    # Shipping address of the customer.
    # To construct, see NOTES section for SHIPPINGADDRESS properties and create a hash table.
    ${ShippingAddress}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            __AllParameterSets = 'Az.DataBox.custom\New-AzDataBoxDiskJobDetailsObject';
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

<#
.Synopsis
Create a in-memory object for DataBoxHeavyJobDetails
.Description
Create a in-memory object for DataBoxHeavyJobDetails
.Example
PS C:\> $details = New-AzDataBoxHeavyJobDetailsObject -Type "DataBoxHeavy"  -DataImportDetail  @(@{AccountDetail=$dataAccount; AccountDetailDataAccountType = "StorageAccount"} ) -ContactDetail $contactDetail -ShippingAddress $ShippingDetails -DevicePassword "randm@423jarABC" -ExpectedDataSizeInTeraByte 10

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxHeavyJobDetails
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

CONTACTDETAIL <IContactDetails>: Contact details for notification and shipping.
  ContactName <String>: Contact name of the person.
  EmailList <String[]>: List of Email-ids to be notified about job progress.
  Phone <String>: Phone number of the contact person.
  [Mobile <String>]: Mobile number of the contact person.
  [NotificationPreference <INotificationPreference[]>]: Notification preference for a job stage.
    SendNotification <Boolean>: Notification is required or not.
    StageName <NotificationStageName>: Name of the stage.
  [PhoneExtension <String>]: Phone extension number of the contact person.

DATAEXPORTDETAIL <IDataExportDetails[]>: Details of the data to be exported from azure.
  AccountDetailDataAccountType <DataAccountType>: Account Type of the data to be transferred.
  TransferConfiguration <ITransferConfiguration>: Configuration for the data transfer.
    Type <TransferConfigurationType>: Type of the configuration for transfer.
    [TransferAllDetail <ITransferConfigurationTransferAllDetails>]: Map of filter type and the details to transfer all data. This field is required only if the TransferConfigurationType is given as TransferAll
      [IncludeDataAccountType <DataAccountType?>]: Type of the account of data
      [IncludeTransferAllBlob <Boolean?>]: To indicate if all Azure blobs have to be transferred
      [IncludeTransferAllFile <Boolean?>]: To indicate if all Azure Files have to be transferred
    [TransferFilterDetail <ITransferConfigurationTransferFilterDetails>]: Map of filter type and the details to filter. This field is required only if the TransferConfigurationType is given as TransferUsingFilter.
      [AzureFileFilterDetailFilePathList <String[]>]: List of full path of the files to be transferred.
      [AzureFileFilterDetailFilePrefixList <String[]>]: Prefix list of the Azure files to be transferred.
      [AzureFileFilterDetailFileShareList <String[]>]: List of file shares to be transferred.
      [BlobFilterDetailBlobPathList <String[]>]: List of full path of the blobs to be transferred.
      [BlobFilterDetailBlobPrefixList <String[]>]: Prefix list of the Azure blobs to be transferred.
      [BlobFilterDetailContainerList <String[]>]: List of blob containers to be transferred.
      [IncludeDataAccountType <DataAccountType?>]: Type of the account of data.
      [IncludeFilterFileDetail <IFilterFileDetails[]>]: Details of the filter files to be used for data transfer.
        FilterFilePath <String>: Path of the file that contains the details of all items to transfer.
        FilterFileType <FilterFileType>: Type of the filter file.
  [AccountDetailSharePassword <String>]: Password for all the shares to be created on the device. Should not be passed for TransferType:ExportFromAzure jobs. If this is not passed, the service will generate password itself. This will not be returned in Get Call. Password Requirements :  Password must be minimum of 12 and maximum of 64 characters. Password must have at least one uppercase alphabet, one number and one special character. Password cannot have the following characters : IilLoO0 Password can have only alphabets, numbers and these characters : @#\-$%^!+=;:_()]+
  [LogCollectionLevel <LogCollectionLevel?>]: Level of the logs to be collected.

DATAIMPORTDETAIL <IDataImportDetails[]>: Details of the data to be imported into azure.
  AccountDetailDataAccountType <DataAccountType>: Account Type of the data to be transferred.
  [AccountDetailSharePassword <String>]: Password for all the shares to be created on the device. Should not be passed for TransferType:ExportFromAzure jobs. If this is not passed, the service will generate password itself. This will not be returned in Get Call. Password Requirements :  Password must be minimum of 12 and maximum of 64 characters. Password must have at least one uppercase alphabet, one number and one special character. Password cannot have the following characters : IilLoO0 Password can have only alphabets, numbers and these characters : @#\-$%^!+=;:_()]+

KEYENCRYPTIONKEY <IKeyEncryptionKey>: Details about which key encryption type is being used.
  KekType <KekType>: Type of encryption key used for key encryption.
  [IdentityProperty <IIdentityProperties>]: Managed identity properties used for key encryption.
    [Type <String>]: Managed service identity type.
    [UserAssignedResourceId <String>]: Arm resource id for user assigned identity to be used to fetch MSI token.
  [KekUrl <String>]: Key encryption key. It is required in case of Customer managed KekType.
  [KekVaultResourceId <String>]: Kek vault resource id. It is required in case of Customer managed KekType.

PREFERENCE <IPreferences>: Preferences for the order.
  [EncryptionPreferenceDoubleEncryption <DoubleEncryption?>]: Defines secondary layer of software-based encryption enablement.
  [PreferredDataCenterRegion <String[]>]: Preferred data center region.
  [TransportPreferencePreferredShipmentType <TransportShipmentTypes?>]: Indicates Shipment Logistics type that the customer preferred.

SHIPPINGADDRESS <IShippingAddress>: Shipping address of the customer.
  Country <String>: Name of the Country.
  StreetAddress1 <String>: Street Address line 1.
  [AddressType <AddressType?>]: Type of address.
  [City <String>]: Name of the City.
  [CompanyName <String>]: Name of the company.
  [PostalCode <String>]: Postal code.
  [StateOrProvince <String>]: Name of the State or Province.
  [StreetAddress2 <String>]: Street Address line 2.
  [StreetAddress3 <String>]: Street Address line 3.
  [ZipExtendedCode <String>]: Extended Zip Code.
.Link
https://docs.microsoft.com/powershell/module/az.DataBox/new-AzDataBoxHeavyJobDetailsObject
#>
function New-AzDataBoxHeavyJobDetailsObject {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxHeavyJobDetails])]
[CmdletBinding(PositionalBinding=$false)]
param(
    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IContactDetails]
    # Contact details for notification and shipping.
    # To construct, see NOTES section for CONTACTDETAIL properties and create a hash table.
    ${ContactDetail},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.ClassDiscriminator]
    # Indicates the type of job details.
    ${Type},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Set Device password for unlocking Databox Heavy.
    # Should not be passed for TransferType:ExportFromAzure jobs.
    # If this is not passed, the service will generate password itself.
    # This will not be returned in Get Call.
    # Password Requirements :  Password must be minimum of 12 and maximum of 64 characters.
    # Password must have at least one uppercase alphabet, one number and one special character.
    # Password cannot have the following characters : IilLoO0 Password can have only alphabets, numbers and these characters : @#\-$%^!+=;:_()]+.
    ${DevicePassword},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IDataExportDetails[]]
    # Details of the data to be exported from azure.
    # To construct, see NOTES section for DATAEXPORTDETAIL properties and create a hash table.
    ${DataExportDetail},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IDataImportDetails[]]
    # Details of the data to be imported into azure.
    # To construct, see NOTES section for DATAIMPORTDETAIL properties and create a hash table.
    ${DataImportDetail},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.Int32]
    # The expected size of the data, which needs to be transferred in this job, in terabytes.
    ${ExpectedDataSizeInTeraByte},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IKeyEncryptionKey]
    # Details about which key encryption type is being used.
    # To construct, see NOTES section for KEYENCRYPTIONKEY properties and create a hash table.
    ${KeyEncryptionKey},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IPreferences]
    # Preferences for the order.
    # To construct, see NOTES section for PREFERENCE properties and create a hash table.
    ${Preference},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IShippingAddress]
    # Shipping address of the customer.
    # To construct, see NOTES section for SHIPPINGADDRESS properties and create a hash table.
    ${ShippingAddress}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            __AllParameterSets = 'Az.DataBox.custom\New-AzDataBoxHeavyJobDetailsObject';
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

<#
.Synopsis
Create a in-memory object for DataBoxJobDetails
.Description
Create a in-memory object for DataBoxJobDetails
.Example
PS C:\> $details = New-AzDataBoxJobDetailsObject -Type "DataBox"  -DataImportDetail  @(@{AccountDetail=$dataAccount; AccountDetailDataAccountType = "StorageAccount"} ) -ContactDetail $contactDetail -ShippingAddress $ShippingDetails
PS C:\> $details

Action                     :
ChainOfCustodySasKey       :
ContactDetail              : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.ContactDetails
CopyLogDetail              :
CopyProgress               :
DataExportDetail           :
DataImportDetail           : {Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataImportDetails}
DeliveryPackage            : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.PackageShippingDetails
DevicePassword             :
ExpectedDataSizeInTeraByte : 0
JobStage                   :
KeyEncryptionKey           : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.KeyEncryptionKey
LastMitigationActionOnJob  : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.LastMitigationActionOnJob
Preference                 : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.Preferences
ReturnPackage              : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.PackageShippingDetails
ReverseShipmentLabelSasKey :
ShippingAddress            : Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.ShippingAddress
Type                       : DataBox

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxJobDetails
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

CONTACTDETAIL <IContactDetails>: Contact details for notification and shipping.
  ContactName <String>: Contact name of the person.
  EmailList <String[]>: List of Email-ids to be notified about job progress.
  Phone <String>: Phone number of the contact person.
  [Mobile <String>]: Mobile number of the contact person.
  [NotificationPreference <INotificationPreference[]>]: Notification preference for a job stage.
    SendNotification <Boolean>: Notification is required or not.
    StageName <NotificationStageName>: Name of the stage.
  [PhoneExtension <String>]: Phone extension number of the contact person.

DATAEXPORTDETAIL <IDataExportDetails[]>: Details of the data to be exported from azure.
  AccountDetailDataAccountType <DataAccountType>: Account Type of the data to be transferred.
  TransferConfiguration <ITransferConfiguration>: Configuration for the data transfer.
    Type <TransferConfigurationType>: Type of the configuration for transfer.
    [TransferAllDetail <ITransferConfigurationTransferAllDetails>]: Map of filter type and the details to transfer all data. This field is required only if the TransferConfigurationType is given as TransferAll
      [IncludeDataAccountType <DataAccountType?>]: Type of the account of data
      [IncludeTransferAllBlob <Boolean?>]: To indicate if all Azure blobs have to be transferred
      [IncludeTransferAllFile <Boolean?>]: To indicate if all Azure Files have to be transferred
    [TransferFilterDetail <ITransferConfigurationTransferFilterDetails>]: Map of filter type and the details to filter. This field is required only if the TransferConfigurationType is given as TransferUsingFilter.
      [AzureFileFilterDetailFilePathList <String[]>]: List of full path of the files to be transferred.
      [AzureFileFilterDetailFilePrefixList <String[]>]: Prefix list of the Azure files to be transferred.
      [AzureFileFilterDetailFileShareList <String[]>]: List of file shares to be transferred.
      [BlobFilterDetailBlobPathList <String[]>]: List of full path of the blobs to be transferred.
      [BlobFilterDetailBlobPrefixList <String[]>]: Prefix list of the Azure blobs to be transferred.
      [BlobFilterDetailContainerList <String[]>]: List of blob containers to be transferred.
      [IncludeDataAccountType <DataAccountType?>]: Type of the account of data.
      [IncludeFilterFileDetail <IFilterFileDetails[]>]: Details of the filter files to be used for data transfer.
        FilterFilePath <String>: Path of the file that contains the details of all items to transfer.
        FilterFileType <FilterFileType>: Type of the filter file.
  [AccountDetailSharePassword <String>]: Password for all the shares to be created on the device. Should not be passed for TransferType:ExportFromAzure jobs. If this is not passed, the service will generate password itself. This will not be returned in Get Call. Password Requirements :  Password must be minimum of 12 and maximum of 64 characters. Password must have at least one uppercase alphabet, one number and one special character. Password cannot have the following characters : IilLoO0 Password can have only alphabets, numbers and these characters : @#\-$%^!+=;:_()]+
  [LogCollectionLevel <LogCollectionLevel?>]: Level of the logs to be collected.

DATAIMPORTDETAIL <IDataImportDetails[]>: Details of the data to be imported into azure.
  AccountDetailDataAccountType <DataAccountType>: Account Type of the data to be transferred.
  [AccountDetailSharePassword <String>]: Password for all the shares to be created on the device. Should not be passed for TransferType:ExportFromAzure jobs. If this is not passed, the service will generate password itself. This will not be returned in Get Call. Password Requirements :  Password must be minimum of 12 and maximum of 64 characters. Password must have at least one uppercase alphabet, one number and one special character. Password cannot have the following characters : IilLoO0 Password can have only alphabets, numbers and these characters : @#\-$%^!+=;:_()]+

KEYENCRYPTIONKEY <IKeyEncryptionKey>: Details about which key encryption type is being used.
  KekType <KekType>: Type of encryption key used for key encryption.
  [IdentityProperty <IIdentityProperties>]: Managed identity properties used for key encryption.
    [Type <String>]: Managed service identity type.
    [UserAssignedResourceId <String>]: Arm resource id for user assigned identity to be used to fetch MSI token.
  [KekUrl <String>]: Key encryption key. It is required in case of Customer managed KekType.
  [KekVaultResourceId <String>]: Kek vault resource id. It is required in case of Customer managed KekType.

PREFERENCE <IPreferences>: Preferences for the order.
  [EncryptionPreferenceDoubleEncryption <DoubleEncryption?>]: Defines secondary layer of software-based encryption enablement.
  [PreferredDataCenterRegion <String[]>]: Preferred data center region.
  [TransportPreferencePreferredShipmentType <TransportShipmentTypes?>]: Indicates Shipment Logistics type that the customer preferred.

SHIPPINGADDRESS <IShippingAddress>: Shipping address of the customer.
  Country <String>: Name of the Country.
  StreetAddress1 <String>: Street Address line 1.
  [AddressType <AddressType?>]: Type of address.
  [City <String>]: Name of the City.
  [CompanyName <String>]: Name of the company.
  [PostalCode <String>]: Postal code.
  [StateOrProvince <String>]: Name of the State or Province.
  [StreetAddress2 <String>]: Street Address line 2.
  [StreetAddress3 <String>]: Street Address line 3.
  [ZipExtendedCode <String>]: Extended Zip Code.
.Link
https://docs.microsoft.com/powershell/module/az.DataBox/new-AzDataBoxJobDetailsObject
#>
function New-AzDataBoxJobDetailsObject {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxJobDetails])]
[CmdletBinding(PositionalBinding=$false)]
param(
    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IContactDetails]
    # Contact details for notification and shipping.
    # To construct, see NOTES section for CONTACTDETAIL properties and create a hash table.
    ${ContactDetail},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.ClassDiscriminator]
    # Indicates the type of job details.
    ${Type},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Set Device password for unlocking Databox.
    # Should not be passed for TransferType:ExportFromAzure jobs.
    # If this is not passed, the service will generate password itself.
    # This will not be returned in Get Call.
    # Password Requirements :  Password must be minimum of 12 and maximum of 64 characters.
    # Password must have at least one uppercase alphabet, one number and one special character.
    # Password cannot have the following characters : IilLoO0 Password can have only alphabets, numbers and these characters : @#\-$%^!+=;:_()]+.
    ${DevicePassword},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IDataExportDetails[]]
    # Details of the data to be exported from azure.
    # To construct, see NOTES section for DATAEXPORTDETAIL properties and create a hash table.
    ${DataExportDetail},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IDataImportDetails[]]
    # Details of the data to be imported into azure.
    # To construct, see NOTES section for DATAIMPORTDETAIL properties and create a hash table.
    ${DataImportDetail},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.Int32]
    # The expected size of the data, which needs to be transferred in this job, in terabytes.
    ${ExpectedDataSizeInTeraByte},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IKeyEncryptionKey]
    # Details about which key encryption type is being used.
    # To construct, see NOTES section for KEYENCRYPTIONKEY properties and create a hash table.
    ${KeyEncryptionKey},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IPreferences]
    # Preferences for the order.
    # To construct, see NOTES section for PREFERENCE properties and create a hash table.
    ${Preference},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IShippingAddress]
    # Shipping address of the customer.
    # To construct, see NOTES section for SHIPPINGADDRESS properties and create a hash table.
    ${ShippingAddress}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            __AllParameterSets = 'Az.DataBox.custom\New-AzDataBoxJobDetailsObject';
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

<#
.Synopsis
Create a in-memory object for KeyEncryptionKey
.Description
Create a in-memory object for KeyEncryptionKey
.Example
PS C:\> $keyEncryptionDetails = New-AzDataBoxKeyEncryptionKeyObject -KekType "CustomerManaged" -IdentityProperty @{Type = "UserAssigned"; UserAssignedResourceId = "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.ManagedIdentity/userAssignedIdentities/identityName"} -KekUrl "keyIdentifier" -KekVaultResourceId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.KeyVault/vaults/keyVaultName"
PS C:\> $keyEncryptionDetails

KekType         KekUrl                                           KekVaultResourceId
-------         ------                                           ------------------
CustomerManaged keyIdentifier /subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.KeyVault/vaults/keyVaultName

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.KeyEncryptionKey
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

IDENTITYPROPERTY <IIdentityProperties>: Managed identity properties used for key encryption.
  [Type <String>]: Managed service identity type.
  [UserAssignedResourceId <String>]: Arm resource id for user assigned identity to be used to fetch MSI token.
.Link
https://docs.microsoft.com/powershell/module/az.DataBox/new-AzDataBoxKeyEncryptionKeyObject
#>
function New-AzDataBoxKeyEncryptionKeyObject {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.KeyEncryptionKey])]
[CmdletBinding(PositionalBinding=$false)]
param(
    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.KekType]
    # Type of encryption key used for key encryption.
    ${KekType},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IIdentityProperties]
    # Managed identity properties used for key encryption.
    # To construct, see NOTES section for IDENTITYPROPERTY properties and create a hash table.
    ${IdentityProperty},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Key encryption key.
    # It is required in case of Customer managed KekType.
    ${KekUrl},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Kek vault resource id.
    # It is required in case of Customer managed KekType.
    ${KekVaultResourceId}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            __AllParameterSets = 'Az.DataBox.custom\New-AzDataBoxKeyEncryptionKeyObject';
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

<#
.Synopsis
Create a in-memory object for ManagedDiskDetails
.Description
Create a in-memory object for ManagedDiskDetails
.Example
PS C:\> $managedDiskAccount=New-AzDataBoxManagedDiskDetailsObject -ResourceGroupId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName" -StagingStorageAccountId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.Storage/storageAccounts/stagingAccountName" -DataAccountType "ManagedDisk"

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.ManagedDiskDetails
.Link
https://docs.microsoft.com/powershell/module/az.DataBox/new-AzDataBoxManagedDiskDetailsObject
#>
function New-AzDataBoxManagedDiskDetailsObject {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.ManagedDiskDetails])]
[CmdletBinding(PositionalBinding=$false)]
param(
    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Resource Group Id of the compute disks.
    ${ResourceGroupId},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Resource Id of the storage account that can be used to copy the vhd for staging.
    ${StagingStorageAccountId},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.DataAccountType]
    # Account Type of the data to be transferred.
    ${DataAccountType},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Password for all the shares to be created on the device.
    # Should not be passed for TransferType:ExportFromAzure jobs.
    # If this is not passed, the service will generate password itself.
    # This will not be returned in Get Call.
    # Password Requirements :  Password must be minimum of 12 and maximum of 64 characters.
    # Password must have at least one uppercase alphabet, one number and one special character.
    # Password cannot have the following characters : IilLoO0 Password can have only alphabets, numbers and these characters : @#\-$%^!+=;:_()]+.
    ${SharePassword}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            __AllParameterSets = 'Az.DataBox.custom\New-AzDataBoxManagedDiskDetailsObject';
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

<#
.Synopsis
Create a in-memory object for ShippingAddress
.Description
Create a in-memory object for ShippingAddress
.Example
PS C:\> $ShippingDetails = New-AzDataBoxShippingAddressObject -StreetAddress1 "101 TOWNSEND ST" -StateOrProvince "CA" -Country "US" -City "San Francisco" -PostalCode "94107" -AddressType "Commercial"
PS C:\> $ShippingDetails

AddressType City          CompanyName Country PostalCode StateOrProvince StreetAddress1  StreetAddress2 StreetAddress3 ZipExtendedCode
----------- ----          ----------- ------- ---------- --------------- --------------  -------------- -------------- ---------------
Commercial  San Francisco             US      94107      CA              101 TOWNSEND ST

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.ShippingAddress
.Link
https://docs.microsoft.com/powershell/module/az.DataBox/new-AzDataBoxShippingAddressObject
#>
function New-AzDataBoxShippingAddressObject {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.ShippingAddress])]
[CmdletBinding(PositionalBinding=$false)]
param(
    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Name of the Country.
    ${Country},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Street Address line 1.
    ${StreetAddress1},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.AddressType]
    # Type of address.
    ${AddressType},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Name of the City.
    ${City},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Name of the company.
    ${CompanyName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Postal code.
    ${PostalCode},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Name of the State or Province.
    ${StateOrProvince},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Street Address line 2.
    ${StreetAddress2},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Street Address line 3.
    ${StreetAddress3},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Extended Zip Code.
    ${ZipExtendedCode}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            __AllParameterSets = 'Az.DataBox.custom\New-AzDataBoxShippingAddressObject';
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

<#
.Synopsis
Create a in-memory object for StorageAccountDetails
.Description
Create a in-memory object for StorageAccountDetails
.Example
PS C:\> $dataAccount = New-AzDataBoxStorageAccountDetailsObject -DataAccountType "StorageAccount" -StorageAccountId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.Storage/storageAccounts/storageAccountName"
PS C:\> $dataAccount

DataAccountType SharePassword StorageAccountId
--------------- ------------- ----------------
StorageAccount                /subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.Storage/storageAccounts/storageAccountName

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.StorageAccountDetails
.Link
https://docs.microsoft.com/powershell/module/az.DataBox/new-AzDataBoxStorageAccountDetailsObject
#>
function New-AzDataBoxStorageAccountDetailsObject {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.StorageAccountDetails])]
[CmdletBinding(PositionalBinding=$false)]
param(
    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Storage Account Resource Id.
    ${StorageAccountId},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.DataAccountType]
    # Account Type of the data to be transferred.
    ${DataAccountType},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Password for all the shares to be created on the device.
    # Should not be passed for TransferType:ExportFromAzure jobs.
    # If this is not passed, the service will generate password itself.
    # This will not be returned in Get Call.
    # Password Requirements :  Password must be minimum of 12 and maximum of 64 characters.
    # Password must have at least one uppercase alphabet, one number and one special character.
    # Password cannot have the following characters : IilLoO0 Password can have only alphabets, numbers and these characters : @#\-$%^!+=;:_()]+.
    ${SharePassword}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            __AllParameterSets = 'Az.DataBox.custom\New-AzDataBoxStorageAccountDetailsObject';
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

<#
.Synopsis
Create a in-memory object for TransferConfiguration
.Description
Create a in-memory object for TransferConfiguration
.Example
PS C:\>  $transferConfigurationType = New-AzDataBoxTransferConfigurationObject -Type "TransferAll" -TransferAllDetail @{"IncludeDataAccountType"="StorageAccount";"IncludeTransferAllBlob"= "True"; "IncludeTransferAllFile"="True"}

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.TransferConfiguration
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

TRANSFERALLDETAIL <ITransferConfigurationTransferAllDetails>: Map of filter type and the details to transfer all data. This field is required only if the TransferConfigurationType is given as TransferAll.
  [IncludeDataAccountType <DataAccountType?>]: Type of the account of data
  [IncludeTransferAllBlob <Boolean?>]: To indicate if all Azure blobs have to be transferred
  [IncludeTransferAllFile <Boolean?>]: To indicate if all Azure Files have to be transferred

TRANSFERFILTERDETAIL <ITransferConfigurationTransferFilterDetails>: Map of filter type and the details to filter. This field is required only if the TransferConfigurationType is given as TransferUsingFilter.
  [AzureFileFilterDetailFilePathList <String[]>]: List of full path of the files to be transferred.
  [AzureFileFilterDetailFilePrefixList <String[]>]: Prefix list of the Azure files to be transferred.
  [AzureFileFilterDetailFileShareList <String[]>]: List of file shares to be transferred.
  [BlobFilterDetailBlobPathList <String[]>]: List of full path of the blobs to be transferred.
  [BlobFilterDetailBlobPrefixList <String[]>]: Prefix list of the Azure blobs to be transferred.
  [BlobFilterDetailContainerList <String[]>]: List of blob containers to be transferred.
  [IncludeDataAccountType <DataAccountType?>]: Type of the account of data.
  [IncludeFilterFileDetail <IFilterFileDetails[]>]: Details of the filter files to be used for data transfer.
    FilterFilePath <String>: Path of the file that contains the details of all items to transfer.
    FilterFileType <FilterFileType>: Type of the filter file.
.Link
https://docs.microsoft.com/powershell/module/az.DataBox/new-AzDataBoxTransferConfigurationObject
#>
function New-AzDataBoxTransferConfigurationObject {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.TransferConfiguration])]
[CmdletBinding(PositionalBinding=$false)]
param(
    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.TransferConfigurationType]
    # Type of the configuration for transfer.
    ${Type},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.ITransferConfigurationTransferAllDetails]
    # Map of filter type and the details to transfer all data.
    # This field is required only if the TransferConfigurationType is given as TransferAll.
    # To construct, see NOTES section for TRANSFERALLDETAIL properties and create a hash table.
    ${TransferAllDetail},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.ITransferConfigurationTransferFilterDetails]
    # Map of filter type and the details to filter.
    # This field is required only if the TransferConfigurationType is given as TransferUsingFilter.
    # To construct, see NOTES section for TRANSFERFILTERDETAIL properties and create a hash table.
    ${TransferFilterDetail}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            __AllParameterSets = 'Az.DataBox.custom\New-AzDataBoxTransferConfigurationObject';
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}
