// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301
{
    using static Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.Extensions;

    /// <summary>Notification preference for a job stage.</summary>
    public partial class NotificationPreference :
        Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.INotificationPreference,
        Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.INotificationPreferenceInternal
    {

        /// <summary>Backing field for <see cref="SendNotification" /> property.</summary>
        private bool _sendNotification;

        /// <summary>Notification is required or not.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Origin(Microsoft.Azure.PowerShell.Cmdlets.DataBox.PropertyOrigin.Owned)]
        public bool SendNotification { get => this._sendNotification; set => this._sendNotification = value; }

        /// <summary>Backing field for <see cref="StageName" /> property.</summary>
        private Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.NotificationStageName _stageName;

        /// <summary>Name of the stage.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Origin(Microsoft.Azure.PowerShell.Cmdlets.DataBox.PropertyOrigin.Owned)]
        public Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.NotificationStageName StageName { get => this._stageName; set => this._stageName = value; }

        /// <summary>Creates an new <see cref="NotificationPreference" /> instance.</summary>
        public NotificationPreference()
        {

        }
    }
    /// Notification preference for a job stage.
    public partial interface INotificationPreference :
        Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.IJsonSerializable
    {
        /// <summary>Notification is required or not.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.Info(
        Required = true,
        ReadOnly = false,
        Description = @"Notification is required or not.",
        SerializedName = @"sendNotification",
        PossibleTypes = new [] { typeof(bool) })]
        bool SendNotification { get; set; }
        /// <summary>Name of the stage.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.Info(
        Required = true,
        ReadOnly = false,
        Description = @"Name of the stage.",
        SerializedName = @"stageName",
        PossibleTypes = new [] { typeof(Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.NotificationStageName) })]
        Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.NotificationStageName StageName { get; set; }

    }
    /// Notification preference for a job stage.
    internal partial interface INotificationPreferenceInternal

    {
        /// <summary>Notification is required or not.</summary>
        bool SendNotification { get; set; }
        /// <summary>Name of the stage.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.NotificationStageName StageName { get; set; }

    }
}