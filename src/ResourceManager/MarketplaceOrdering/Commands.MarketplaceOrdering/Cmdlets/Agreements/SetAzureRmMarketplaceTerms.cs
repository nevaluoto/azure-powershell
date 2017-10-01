﻿// ----------------------------------------------------------------------------------
//
// Copyright Microsoft Corporation
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ----------------------------------------------------------------------------------

using System.Management.Automation;
using Microsoft.Azure.Commands.MarketplaceOrdering.Common;
using Microsoft.Azure.Commands.MarketplaceOrdering.Models;
using Microsoft.Azure.Management.MarketplaceOrdering;

namespace Microsoft.Azure.Commands.MarketplaceOrdering.Cmdlets.Agreements
{
    [Cmdlet(VerbsCommon.Set, "AzureRmMarketplaceTerms", DefaultParameterSetName = Constants.ParameterSetNames.AgreementParameterSet, SupportsShouldProcess = true), OutputType(typeof(PSAgreementTerms))]
    public class SetAzureRmMarketplaceTerms : AzureMarketplaceOrderingCmdletBase
    {
        [Parameter(Mandatory = true, HelpMessage = "Publisher identifier string of image being deployed.", ParameterSetName = Constants.ParameterSetNames.AgreementParameterSet)]
        [ValidateNotNullOrEmpty]
        public string Publisher { get; set; }

        [Parameter(Mandatory = true, HelpMessage = "Offer identifier string of image being deployed.", ParameterSetName = Constants.ParameterSetNames.AgreementParameterSet)]
        [ValidateNotNullOrEmpty]
        public string Product { get; set; }

        [Parameter(Mandatory = true, HelpMessage = "Plan identifier string of image being deployed.", ParameterSetName = Constants.ParameterSetNames.AgreementParameterSet)]
        [ValidateNotNullOrEmpty]
        public string Name { get; set; }

        [Parameter(Mandatory = true, HelpMessage = "Boolean which would indicate the status of acceptance of the terms, it should be true if any version of the terms have been accepted.", ParameterSetName = Constants.ParameterSetNames.AgreementParameterSet)]
        [ValidateNotNullOrEmpty]
        public SwitchParameter Accepted { get; set; }

        [Parameter(Mandatory = false, ValueFromPipeline = true, HelpMessage = "Terms object returned in Get-AzureRmMarketplaceTerms cmdlet. This is a mandatory parameter if Accepted paramter is true.", ParameterSetName = Constants.ParameterSetNames.AgreementParameterSet)]
        [ValidateNotNullOrEmpty]
        [Alias("Terms")]
        public PSAgreementTerms InputObject { get; set; }

        public override void ExecuteCmdlet()
        {
            if (ShouldProcess("AzureRmMarketplaceTerms", "Set Legal Terms"))
            {
                if (ParameterSetName.Equals(Constants.ParameterSetNames.AgreementParameterSet))
                {
                    if (!Accepted)
                    {
                        InputObject = new PSAgreementTerms
                        {
                            Accepted = false
                        };
                    }
                    else
                    {
                        if (InputObject != null)
                        {
                            InputObject.Accepted = Accepted;
                        }
                        else
                        {//Accepted = True but there is no terms object
                            WriteWarning("Terms parameter is mandatory when Accepted parameter is true.");
                            return;
                        }
                    }
                    var agreementTerms =
                        new PSAgreementTerms(MarketplaceOrderingAgreementsClient.MarketplaceAgreements.Create(
                            Publisher, Product, Name, InputObject.ToAgreementTerms()));
                    WriteObject(agreementTerms);
                }
            }
        }
    }
}
