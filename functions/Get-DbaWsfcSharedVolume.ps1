﻿#ValidationTags#Messaging,FlowControl,Pipeline,CodeStyle#
function Get-DbaWsfcSharedVolume {
<#
    .SYNOPSIS
        Gets information about Cluster Shared Volumes in a failover cluster.
    
    .DESCRIPTION
        Gets information about Cluster Shared Volumes in a failover cluster.

        All Windows Server Failover Clustering (Wsfc) commands require local admin on each member node.

    .PARAMETER ComputerName
        The target cluster name. Can be a node or the cluster name itself.

    .PARAMETER Credential
        Allows you to login to the cluster using alternative credentials.

    .PARAMETER EnableException
        By default, when something goes wrong we try to catch it, interpret it and give you a friendly warning message.
        This avoids overwhelming you with "sea of red" exceptions, but is inconvenient because it basically disables advanced scripting.
        Using this switch turns this "nice by default" feature off and enables you to catch exceptions with your own try/catch.

    .NOTES
        Tags: Cluster, WSFC, FCI, HA
        Author: Chrissy LeMaire (@cl), netnerds.net
        Website: https://dbatools.io
        Copyright: (C) Chrissy LeMaire, clemaire@gmail.com
        License: MIT https://opensource.org/licenses/MIT

    .LINK
        https://dbatools.io/Get-DbaWsfcSharedVolume
    
    .EXAMPLE
        Get-DbaWsfcSharedVolume -ComputerName cluster01
    
        Gets shared volume (CSV) information from the failover cluster cluster01
#>
    [CmdletBinding()]
    param (
        [parameter(ValueFromPipeline)]
        [DbaInstanceParameter[]]$ComputerName = $env:COMPUTERNAME,
        [PSCredential]$Credential,
        [switch]$EnableException
    )
    process {
        foreach ($computer in $computername) {
            Get-DbaCmObject -Computername $computer -Namespace root\MSCluster -ClassName ClusterSharedVolume
        }
    }
}