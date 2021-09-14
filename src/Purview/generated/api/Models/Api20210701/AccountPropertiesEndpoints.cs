namespace Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701
{
    using static Microsoft.Azure.PowerShell.Cmdlets.Purview.Runtime.Extensions;

    /// <summary>The URIs that are the public endpoints of the account.</summary>
    public partial class AccountPropertiesEndpoints :
        Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountPropertiesEndpoints,
        Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountPropertiesEndpointsInternal,
        Microsoft.Azure.PowerShell.Cmdlets.Purview.Runtime.IValidates
    {
        /// <summary>
        /// Backing field for Inherited model <see cref= "Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountEndpoints"
        /// />
        /// </summary>
        private Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountEndpoints __accountEndpoints = new Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.AccountEndpoints();

        /// <summary>Gets the catalog endpoint.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.Purview.Origin(Microsoft.Azure.PowerShell.Cmdlets.Purview.PropertyOrigin.Inherited)]
        public string Catalog { get => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountEndpointsInternal)__accountEndpoints).Catalog; }

        /// <summary>Gets the guardian endpoint.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.Purview.Origin(Microsoft.Azure.PowerShell.Cmdlets.Purview.PropertyOrigin.Inherited)]
        public string Guardian { get => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountEndpointsInternal)__accountEndpoints).Guardian; }

        /// <summary>Internal Acessors for Catalog</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountEndpointsInternal.Catalog { get => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountEndpointsInternal)__accountEndpoints).Catalog; set => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountEndpointsInternal)__accountEndpoints).Catalog = value; }

        /// <summary>Internal Acessors for Guardian</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountEndpointsInternal.Guardian { get => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountEndpointsInternal)__accountEndpoints).Guardian; set => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountEndpointsInternal)__accountEndpoints).Guardian = value; }

        /// <summary>Internal Acessors for Scan</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountEndpointsInternal.Scan { get => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountEndpointsInternal)__accountEndpoints).Scan; set => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountEndpointsInternal)__accountEndpoints).Scan = value; }

        /// <summary>Gets the scan endpoint.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.Purview.Origin(Microsoft.Azure.PowerShell.Cmdlets.Purview.PropertyOrigin.Inherited)]
        public string Scan { get => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountEndpointsInternal)__accountEndpoints).Scan; }

        /// <summary>Creates an new <see cref="AccountPropertiesEndpoints" /> instance.</summary>
        public AccountPropertiesEndpoints()
        {

        }

        /// <summary>Validates that this object meets the validation criteria.</summary>
        /// <param name="eventListener">an <see cref="Microsoft.Azure.PowerShell.Cmdlets.Purview.Runtime.IEventListener" /> instance that will receive validation
        /// events.</param>
        /// <returns>
        /// A < see cref = "global::System.Threading.Tasks.Task" /> that will be complete when validation is completed.
        /// </returns>
        public async global::System.Threading.Tasks.Task Validate(Microsoft.Azure.PowerShell.Cmdlets.Purview.Runtime.IEventListener eventListener)
        {
            await eventListener.AssertNotNull(nameof(__accountEndpoints), __accountEndpoints);
            await eventListener.AssertObjectIsValid(nameof(__accountEndpoints), __accountEndpoints);
        }
    }
    /// The URIs that are the public endpoints of the account.
    public partial interface IAccountPropertiesEndpoints :
        Microsoft.Azure.PowerShell.Cmdlets.Purview.Runtime.IJsonSerializable,
        Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountEndpoints
    {

    }
    /// The URIs that are the public endpoints of the account.
    internal partial interface IAccountPropertiesEndpointsInternal :
        Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IAccountEndpointsInternal
    {

    }
}