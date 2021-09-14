﻿//
// Copyright (c) Microsoft and contributors.  All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//
// See the License for the specific language governing permissions and
// limitations under the License.
//

// Warning: This code was generated by a tool.
//
// Changes to this file may cause incorrect behavior and will be lost if the
// code is regenerated.

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Management.Automation;
using Microsoft.Azure.Commands.Compute.Automation.Models;
using Microsoft.Azure.Commands.ResourceManager.Common.ArgumentCompleters;
using Microsoft.Azure.Management.Compute;
using Microsoft.Azure.Management.Compute.Models;
using Microsoft.WindowsAzure.Commands.Utilities.Common;

namespace Microsoft.Azure.Commands.Compute.Automation
{
    [Cmdlet(VerbsCommon.Get, ResourceManager.Common.AzureRMConstants.AzureRMPrefix + "CapacityReservation")]
    [OutputType(typeof(PSCapacityReservation))]
    public partial class GetAzurecapacityReservation : ComputeAutomationBaseCmdlet
    {

        [Parameter(
            Mandatory = true,
            ValueFromPipelineByPropertyName = true)]
        [ResourceGroupCompleter]
        [SupportsWildcards]
        public string ResourceGroupName { get; set; }

        [Parameter(
            Mandatory = true,
            ValueFromPipelineByPropertyName = true)]
        [ResourceNameCompleter("Microsoft.Compute/capacityReservationGroups", "ResourceGroupName")]
        [SupportsWildcards]
        [Alias("CapacityReservationGroupName")]
        public string ReservationGroupName { get; set; }

        [Parameter(
            ValueFromPipelineByPropertyName = true)]
        [ResourceNameCompleter("Microsoft.Compute/capacityReservationGroups/capacityReservations", "ResourceGroupName")]
        [SupportsWildcards]
        [Alias("CapacityReservationName")]
        public string Name { get; set; }

        [Parameter(
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "Get the Instance View of the Capacity Reservation.")]
        public SwitchParameter InstanceView { get; set; }

        public override void ExecuteCmdlet()
        {
            base.ExecuteCmdlet();
            ExecuteClientAction(() =>
            {

                if (this.IsParameterBound(c => c.Name))
                {
                    CapacityReservation result = new CapacityReservation();
                    if (this.InstanceView.IsPresent)
                    {
                        result = CapacityReservationClient.Get(this.ResourceGroupName, this.ReservationGroupName, this.Name, "InstanceView");
                    }
                    else
                    {
                        result = CapacityReservationClient.Get(this.ResourceGroupName, this.ReservationGroupName, this.Name);
                    }
                    var psObject = new PSCapacityReservation();
                    ComputeAutomationAutoMapperProfile.Mapper.Map<CapacityReservation, PSCapacityReservation>(result, psObject);
                    WriteObject(psObject);
                }
                else
                {
                    var result = CapacityReservationClient.ListByCapacityReservationGroup(this.ResourceGroupName, this.ReservationGroupName);
                    var resultList = result.ToList();
                    var nextPageLink = result.NextPageLink;
                    while (!string.IsNullOrEmpty(nextPageLink))
                    {
                        var pageResult = CapacityReservationClient.ListByCapacityReservationGroupNext(nextPageLink);
                        foreach (var pageItem in pageResult)
                        {
                            resultList.Add(pageItem);
                        }
                        nextPageLink = pageResult.NextPageLink;
                    }
                    var psObject = new List<PSCapacityReservationList>();
                    foreach (var r in resultList)
                    {
                        psObject.Add(ComputeAutomationAutoMapperProfile.Mapper.Map<CapacityReservation, PSCapacityReservationList>(r));
                    }
                    WriteObject(TopLevelWildcardFilter(this.ResourceGroupName, this.Name, psObject), true);
                }
            });
        }
    }
}
