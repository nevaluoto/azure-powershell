namespace Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701
{
    using static Microsoft.Azure.PowerShell.Cmdlets.Purview.Runtime.Extensions;

    /// <summary>Gets or sets the error.</summary>
    public partial class ErrorResponseModelError :
        Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorResponseModelError,
        Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorResponseModelErrorInternal,
        Microsoft.Azure.PowerShell.Cmdlets.Purview.Runtime.IValidates
    {
        /// <summary>
        /// Backing field for Inherited model <see cref= "Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModel"
        /// />
        /// </summary>
        private Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModel __errorModel = new Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.ErrorModel();

        /// <summary>Gets or sets the code.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.Purview.Origin(Microsoft.Azure.PowerShell.Cmdlets.Purview.PropertyOrigin.Inherited)]
        public string Code { get => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal)__errorModel).Code; }

        /// <summary>Gets or sets the details.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.Purview.Origin(Microsoft.Azure.PowerShell.Cmdlets.Purview.PropertyOrigin.Inherited)]
        public Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModel[] Detail { get => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal)__errorModel).Detail; }

        /// <summary>Gets or sets the messages.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.Purview.Origin(Microsoft.Azure.PowerShell.Cmdlets.Purview.PropertyOrigin.Inherited)]
        public string Message { get => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal)__errorModel).Message; }

        /// <summary>Internal Acessors for Code</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal.Code { get => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal)__errorModel).Code; set => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal)__errorModel).Code = value; }

        /// <summary>Internal Acessors for Detail</summary>
        Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModel[] Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal.Detail { get => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal)__errorModel).Detail; set => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal)__errorModel).Detail = value; }

        /// <summary>Internal Acessors for Message</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal.Message { get => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal)__errorModel).Message; set => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal)__errorModel).Message = value; }

        /// <summary>Internal Acessors for Target</summary>
        string Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal.Target { get => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal)__errorModel).Target; set => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal)__errorModel).Target = value; }

        /// <summary>Gets or sets the target.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.Purview.Origin(Microsoft.Azure.PowerShell.Cmdlets.Purview.PropertyOrigin.Inherited)]
        public string Target { get => ((Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal)__errorModel).Target; }

        /// <summary>Creates an new <see cref="ErrorResponseModelError" /> instance.</summary>
        public ErrorResponseModelError()
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
            await eventListener.AssertNotNull(nameof(__errorModel), __errorModel);
            await eventListener.AssertObjectIsValid(nameof(__errorModel), __errorModel);
        }
    }
    /// Gets or sets the error.
    public partial interface IErrorResponseModelError :
        Microsoft.Azure.PowerShell.Cmdlets.Purview.Runtime.IJsonSerializable,
        Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModel
    {

    }
    /// Gets or sets the error.
    internal partial interface IErrorResponseModelErrorInternal :
        Microsoft.Azure.PowerShell.Cmdlets.Purview.Models.Api20210701.IErrorModelInternal
    {

    }
}