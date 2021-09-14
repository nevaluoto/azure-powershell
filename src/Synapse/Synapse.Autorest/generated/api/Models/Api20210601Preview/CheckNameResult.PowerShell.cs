// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview
{
    using Microsoft.Azure.PowerShell.Cmdlets.Synapse.Runtime.PowerShell;

    /// <summary>The result returned from a check name availability request.</summary>
    [System.ComponentModel.TypeConverter(typeof(CheckNameResultTypeConverter))]
    public partial class CheckNameResult
    {

        /// <summary>
        /// <c>AfterDeserializeDictionary</c> will be called after the deserialization has finished, allowing customization of the
        /// object before it is returned. Implement this method in a partial class to enable this behavior
        /// </summary>
        /// <param name="content">The global::System.Collections.IDictionary content that should be used.</param>

        partial void AfterDeserializeDictionary(global::System.Collections.IDictionary content);

        /// <summary>
        /// <c>AfterDeserializePSObject</c> will be called after the deserialization has finished, allowing customization of the object
        /// before it is returned. Implement this method in a partial class to enable this behavior
        /// </summary>
        /// <param name="content">The global::System.Management.Automation.PSObject content that should be used.</param>

        partial void AfterDeserializePSObject(global::System.Management.Automation.PSObject content);

        /// <summary>
        /// <c>BeforeDeserializeDictionary</c> will be called before the deserialization has commenced, allowing complete customization
        /// of the object before it is deserialized.
        /// If you wish to disable the default deserialization entirely, return <c>true</c> in the <see "returnNow" /> output parameter.
        /// Implement this method in a partial class to enable this behavior.
        /// </summary>
        /// <param name="content">The global::System.Collections.IDictionary content that should be used.</param>
        /// <param name="returnNow">Determines if the rest of the serialization should be processed, or if the method should return
        /// instantly.</param>

        partial void BeforeDeserializeDictionary(global::System.Collections.IDictionary content, ref bool returnNow);

        /// <summary>
        /// <c>BeforeDeserializePSObject</c> will be called before the deserialization has commenced, allowing complete customization
        /// of the object before it is deserialized.
        /// If you wish to disable the default deserialization entirely, return <c>true</c> in the <see "returnNow" /> output parameter.
        /// Implement this method in a partial class to enable this behavior.
        /// </summary>
        /// <param name="content">The global::System.Management.Automation.PSObject content that should be used.</param>
        /// <param name="returnNow">Determines if the rest of the serialization should be processed, or if the method should return
        /// instantly.</param>

        partial void BeforeDeserializePSObject(global::System.Management.Automation.PSObject content, ref bool returnNow);

        /// <summary>
        /// Deserializes a <see cref="global::System.Collections.IDictionary" /> into a new instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.CheckNameResult"
        /// />.
        /// </summary>
        /// <param name="content">The global::System.Collections.IDictionary content that should be used.</param>
        internal CheckNameResult(global::System.Collections.IDictionary content)
        {
            bool returnNow = false;
            BeforeDeserializeDictionary(content, ref returnNow);
            if (returnNow)
            {
                return;
            }
            // actually deserialize
            ((Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResultInternal)this).NameAvailable = (bool?) content.GetValueForProperty("NameAvailable",((Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResultInternal)this).NameAvailable, (__y)=> (bool) global::System.Convert.ChangeType(__y, typeof(bool)));
            ((Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResultInternal)this).Name = (string) content.GetValueForProperty("Name",((Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResultInternal)this).Name, global::System.Convert.ToString);
            ((Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResultInternal)this).Message = (string) content.GetValueForProperty("Message",((Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResultInternal)this).Message, global::System.Convert.ToString);
            ((Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResultInternal)this).Reason = (Microsoft.Azure.PowerShell.Cmdlets.Synapse.Support.Reason?) content.GetValueForProperty("Reason",((Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResultInternal)this).Reason, Microsoft.Azure.PowerShell.Cmdlets.Synapse.Support.Reason.CreateFrom);
            AfterDeserializeDictionary(content);
        }

        /// <summary>
        /// Deserializes a <see cref="global::System.Management.Automation.PSObject" /> into a new instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.CheckNameResult"
        /// />.
        /// </summary>
        /// <param name="content">The global::System.Management.Automation.PSObject content that should be used.</param>
        internal CheckNameResult(global::System.Management.Automation.PSObject content)
        {
            bool returnNow = false;
            BeforeDeserializePSObject(content, ref returnNow);
            if (returnNow)
            {
                return;
            }
            // actually deserialize
            ((Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResultInternal)this).NameAvailable = (bool?) content.GetValueForProperty("NameAvailable",((Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResultInternal)this).NameAvailable, (__y)=> (bool) global::System.Convert.ChangeType(__y, typeof(bool)));
            ((Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResultInternal)this).Name = (string) content.GetValueForProperty("Name",((Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResultInternal)this).Name, global::System.Convert.ToString);
            ((Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResultInternal)this).Message = (string) content.GetValueForProperty("Message",((Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResultInternal)this).Message, global::System.Convert.ToString);
            ((Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResultInternal)this).Reason = (Microsoft.Azure.PowerShell.Cmdlets.Synapse.Support.Reason?) content.GetValueForProperty("Reason",((Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResultInternal)this).Reason, Microsoft.Azure.PowerShell.Cmdlets.Synapse.Support.Reason.CreateFrom);
            AfterDeserializePSObject(content);
        }

        /// <summary>
        /// Deserializes a <see cref="global::System.Collections.IDictionary" /> into an instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.CheckNameResult"
        /// />.
        /// </summary>
        /// <param name="content">The global::System.Collections.IDictionary content that should be used.</param>
        /// <returns>
        /// an instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResult" />.
        /// </returns>
        public static Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResult DeserializeFromDictionary(global::System.Collections.IDictionary content)
        {
            return new CheckNameResult(content);
        }

        /// <summary>
        /// Deserializes a <see cref="global::System.Management.Automation.PSObject" /> into an instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.CheckNameResult"
        /// />.
        /// </summary>
        /// <param name="content">The global::System.Management.Automation.PSObject content that should be used.</param>
        /// <returns>
        /// an instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResult" />.
        /// </returns>
        public static Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResult DeserializeFromPSObject(global::System.Management.Automation.PSObject content)
        {
            return new CheckNameResult(content);
        }

        /// <summary>
        /// Creates a new instance of <see cref="CheckNameResult" />, deserializing the content from a json string.
        /// </summary>
        /// <param name="jsonText">a string containing a JSON serialized instance of this model.</param>
        /// <returns>an instance of the <see cref="className" /> model class.</returns>
        public static Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.ICheckNameResult FromJsonString(string jsonText) => FromJson(Microsoft.Azure.PowerShell.Cmdlets.Synapse.Runtime.Json.JsonNode.Parse(jsonText));

        /// <summary>Serializes this instance to a json string.</summary>

        /// <returns>a <see cref="System.String" /> containing this model serialized to JSON text.</returns>
        public string ToJsonString() => ToJson(null, Microsoft.Azure.PowerShell.Cmdlets.Synapse.Runtime.SerializationMode.IncludeAll)?.ToString();
    }
    /// The result returned from a check name availability request.
    [System.ComponentModel.TypeConverter(typeof(CheckNameResultTypeConverter))]
    public partial interface ICheckNameResult

    {

    }
}