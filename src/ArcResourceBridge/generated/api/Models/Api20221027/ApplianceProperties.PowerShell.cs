// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027
{
    using Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Runtime.PowerShell;

    /// <summary>Properties for an appliance.</summary>
    [System.ComponentModel.TypeConverter(typeof(AppliancePropertiesTypeConverter))]
    public partial class ApplianceProperties
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
        /// If you wish to disable the default deserialization entirely, return <c>true</c> in the <paramref name="returnNow" /> output
        /// parameter.
        /// Implement this method in a partial class to enable this behavior.
        /// </summary>
        /// <param name="content">The global::System.Collections.IDictionary content that should be used.</param>
        /// <param name="returnNow">Determines if the rest of the serialization should be processed, or if the method should return
        /// instantly.</param>

        partial void BeforeDeserializeDictionary(global::System.Collections.IDictionary content, ref bool returnNow);

        /// <summary>
        /// <c>BeforeDeserializePSObject</c> will be called before the deserialization has commenced, allowing complete customization
        /// of the object before it is deserialized.
        /// If you wish to disable the default deserialization entirely, return <c>true</c> in the <paramref name="returnNow" /> output
        /// parameter.
        /// Implement this method in a partial class to enable this behavior.
        /// </summary>
        /// <param name="content">The global::System.Management.Automation.PSObject content that should be used.</param>
        /// <param name="returnNow">Determines if the rest of the serialization should be processed, or if the method should return
        /// instantly.</param>

        partial void BeforeDeserializePSObject(global::System.Management.Automation.PSObject content, ref bool returnNow);

        /// <summary>
        /// <c>OverrideToString</c> will be called if it is implemented. Implement this method in a partial class to enable this behavior
        /// </summary>
        /// <param name="stringResult">/// instance serialized to a string, normally it is a Json</param>
        /// <param name="returnNow">/// set returnNow to true if you provide a customized OverrideToString function</param>

        partial void OverrideToString(ref string stringResult, ref bool returnNow);

        /// <summary>
        /// Deserializes a <see cref="global::System.Collections.IDictionary" /> into a new instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.ApplianceProperties"
        /// />.
        /// </summary>
        /// <param name="content">The global::System.Collections.IDictionary content that should be used.</param>
        internal ApplianceProperties(global::System.Collections.IDictionary content)
        {
            bool returnNow = false;
            BeforeDeserializeDictionary(content, ref returnNow);
            if (returnNow)
            {
                return;
            }
            // actually deserialize
            if (content.Contains("InfrastructureConfig"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).InfrastructureConfig = (Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInfrastructureConfig) content.GetValueForProperty("InfrastructureConfig",((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).InfrastructureConfig, Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.AppliancePropertiesInfrastructureConfigTypeConverter.ConvertFrom);
            }
            if (content.Contains("Distro"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).Distro = (Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Support.Distro?) content.GetValueForProperty("Distro",((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).Distro, Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Support.Distro.CreateFrom);
            }
            if (content.Contains("ProvisioningState"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).ProvisioningState = (string) content.GetValueForProperty("ProvisioningState",((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).ProvisioningState, global::System.Convert.ToString);
            }
            if (content.Contains("PublicKey"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).PublicKey = (string) content.GetValueForProperty("PublicKey",((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).PublicKey, global::System.Convert.ToString);
            }
            if (content.Contains("Status"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).Status = (Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Support.Status?) content.GetValueForProperty("Status",((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).Status, Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Support.Status.CreateFrom);
            }
            if (content.Contains("Version"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).Version = (string) content.GetValueForProperty("Version",((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).Version, global::System.Convert.ToString);
            }
            if (content.Contains("InfrastructureConfigProvider"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).InfrastructureConfigProvider = (Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Support.Provider?) content.GetValueForProperty("InfrastructureConfigProvider",((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).InfrastructureConfigProvider, Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Support.Provider.CreateFrom);
            }
            AfterDeserializeDictionary(content);
        }

        /// <summary>
        /// Deserializes a <see cref="global::System.Management.Automation.PSObject" /> into a new instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.ApplianceProperties"
        /// />.
        /// </summary>
        /// <param name="content">The global::System.Management.Automation.PSObject content that should be used.</param>
        internal ApplianceProperties(global::System.Management.Automation.PSObject content)
        {
            bool returnNow = false;
            BeforeDeserializePSObject(content, ref returnNow);
            if (returnNow)
            {
                return;
            }
            // actually deserialize
            if (content.Contains("InfrastructureConfig"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).InfrastructureConfig = (Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInfrastructureConfig) content.GetValueForProperty("InfrastructureConfig",((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).InfrastructureConfig, Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.AppliancePropertiesInfrastructureConfigTypeConverter.ConvertFrom);
            }
            if (content.Contains("Distro"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).Distro = (Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Support.Distro?) content.GetValueForProperty("Distro",((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).Distro, Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Support.Distro.CreateFrom);
            }
            if (content.Contains("ProvisioningState"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).ProvisioningState = (string) content.GetValueForProperty("ProvisioningState",((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).ProvisioningState, global::System.Convert.ToString);
            }
            if (content.Contains("PublicKey"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).PublicKey = (string) content.GetValueForProperty("PublicKey",((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).PublicKey, global::System.Convert.ToString);
            }
            if (content.Contains("Status"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).Status = (Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Support.Status?) content.GetValueForProperty("Status",((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).Status, Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Support.Status.CreateFrom);
            }
            if (content.Contains("Version"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).Version = (string) content.GetValueForProperty("Version",((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).Version, global::System.Convert.ToString);
            }
            if (content.Contains("InfrastructureConfigProvider"))
            {
                ((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).InfrastructureConfigProvider = (Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Support.Provider?) content.GetValueForProperty("InfrastructureConfigProvider",((Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IAppliancePropertiesInternal)this).InfrastructureConfigProvider, Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Support.Provider.CreateFrom);
            }
            AfterDeserializePSObject(content);
        }

        /// <summary>
        /// Deserializes a <see cref="global::System.Collections.IDictionary" /> into an instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.ApplianceProperties"
        /// />.
        /// </summary>
        /// <param name="content">The global::System.Collections.IDictionary content that should be used.</param>
        /// <returns>
        /// an instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IApplianceProperties"
        /// />.
        /// </returns>
        public static Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IApplianceProperties DeserializeFromDictionary(global::System.Collections.IDictionary content)
        {
            return new ApplianceProperties(content);
        }

        /// <summary>
        /// Deserializes a <see cref="global::System.Management.Automation.PSObject" /> into an instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.ApplianceProperties"
        /// />.
        /// </summary>
        /// <param name="content">The global::System.Management.Automation.PSObject content that should be used.</param>
        /// <returns>
        /// an instance of <see cref="Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IApplianceProperties"
        /// />.
        /// </returns>
        public static Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IApplianceProperties DeserializeFromPSObject(global::System.Management.Automation.PSObject content)
        {
            return new ApplianceProperties(content);
        }

        /// <summary>
        /// Creates a new instance of <see cref="ApplianceProperties" />, deserializing the content from a json string.
        /// </summary>
        /// <param name="jsonText">a string containing a JSON serialized instance of this model.</param>
        /// <returns>an instance of the <see cref="ApplianceProperties" /> model class.</returns>
        public static Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Models.Api20221027.IApplianceProperties FromJsonString(string jsonText) => FromJson(Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Runtime.Json.JsonNode.Parse(jsonText));

        /// <summary>Serializes this instance to a json string.</summary>

        /// <returns>a <see cref="System.String" /> containing this model serialized to JSON text.</returns>
        public string ToJsonString() => ToJson(null, Microsoft.Azure.PowerShell.Cmdlets.ArcResourceBridge.Runtime.SerializationMode.IncludeAll)?.ToString();

        public override string ToString()
        {
            var returnNow = false;
            var result = global::System.String.Empty;
            OverrideToString(ref result, ref returnNow);
            if (returnNow)
            {
                return result;
            }
            return ToJsonString();
        }
    }
    /// Properties for an appliance.
    [System.ComponentModel.TypeConverter(typeof(AppliancePropertiesTypeConverter))]
    public partial interface IApplianceProperties

    {

    }
}