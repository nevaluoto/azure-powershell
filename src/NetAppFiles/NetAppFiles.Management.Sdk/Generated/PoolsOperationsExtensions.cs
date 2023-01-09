// <auto-generated>
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
//
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// </auto-generated>

namespace Microsoft.Azure.Management.NetApp
{
    using Microsoft.Rest;
    using Microsoft.Rest.Azure;
    using Models;
    using System.Threading;
    using System.Threading.Tasks;

    /// <summary>
    /// Extension methods for PoolsOperations.
    /// </summary>
    public static partial class PoolsOperationsExtensions
    {
            /// <summary>
            /// Describe all Capacity Pools
            /// </summary>
            /// <remarks>
            /// List all capacity pools in the NetApp Account
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='resourceGroupName'>
            /// The name of the resource group.
            /// </param>
            /// <param name='accountName'>
            /// The name of the NetApp account
            /// </param>
            public static IPage<CapacityPool> List(this IPoolsOperations operations, string resourceGroupName, string accountName)
            {
                return operations.ListAsync(resourceGroupName, accountName).GetAwaiter().GetResult();
            }

            /// <summary>
            /// Describe all Capacity Pools
            /// </summary>
            /// <remarks>
            /// List all capacity pools in the NetApp Account
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='resourceGroupName'>
            /// The name of the resource group.
            /// </param>
            /// <param name='accountName'>
            /// The name of the NetApp account
            /// </param>
            /// <param name='cancellationToken'>
            /// The cancellation token.
            /// </param>
            public static async Task<IPage<CapacityPool>> ListAsync(this IPoolsOperations operations, string resourceGroupName, string accountName, CancellationToken cancellationToken = default(CancellationToken))
            {
                using (var _result = await operations.ListWithHttpMessagesAsync(resourceGroupName, accountName, null, cancellationToken).ConfigureAwait(false))
                {
                    return _result.Body;
                }
            }

            /// <summary>
            /// Describe a Capacity Pool
            /// </summary>
            /// <remarks>
            /// Get details of the specified capacity pool
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='resourceGroupName'>
            /// The name of the resource group.
            /// </param>
            /// <param name='accountName'>
            /// The name of the NetApp account
            /// </param>
            /// <param name='poolName'>
            /// The name of the capacity pool
            /// </param>
            public static CapacityPool Get(this IPoolsOperations operations, string resourceGroupName, string accountName, string poolName)
            {
                return operations.GetAsync(resourceGroupName, accountName, poolName).GetAwaiter().GetResult();
            }

            /// <summary>
            /// Describe a Capacity Pool
            /// </summary>
            /// <remarks>
            /// Get details of the specified capacity pool
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='resourceGroupName'>
            /// The name of the resource group.
            /// </param>
            /// <param name='accountName'>
            /// The name of the NetApp account
            /// </param>
            /// <param name='poolName'>
            /// The name of the capacity pool
            /// </param>
            /// <param name='cancellationToken'>
            /// The cancellation token.
            /// </param>
            public static async Task<CapacityPool> GetAsync(this IPoolsOperations operations, string resourceGroupName, string accountName, string poolName, CancellationToken cancellationToken = default(CancellationToken))
            {
                using (var _result = await operations.GetWithHttpMessagesAsync(resourceGroupName, accountName, poolName, null, cancellationToken).ConfigureAwait(false))
                {
                    return _result.Body;
                }
            }

            /// <summary>
            /// Create or Update the specified capacity pool within the resource group
            /// </summary>
            /// <remarks>
            /// Create or Update a capacity pool
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='body'>
            /// Capacity pool object supplied in the body of the operation.
            /// </param>
            /// <param name='resourceGroupName'>
            /// The name of the resource group.
            /// </param>
            /// <param name='accountName'>
            /// The name of the NetApp account
            /// </param>
            /// <param name='poolName'>
            /// The name of the capacity pool
            /// </param>
            public static CapacityPool CreateOrUpdate(this IPoolsOperations operations, CapacityPool body, string resourceGroupName, string accountName, string poolName)
            {
                return operations.CreateOrUpdateAsync(body, resourceGroupName, accountName, poolName).GetAwaiter().GetResult();
            }

            /// <summary>
            /// Create or Update the specified capacity pool within the resource group
            /// </summary>
            /// <remarks>
            /// Create or Update a capacity pool
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='body'>
            /// Capacity pool object supplied in the body of the operation.
            /// </param>
            /// <param name='resourceGroupName'>
            /// The name of the resource group.
            /// </param>
            /// <param name='accountName'>
            /// The name of the NetApp account
            /// </param>
            /// <param name='poolName'>
            /// The name of the capacity pool
            /// </param>
            /// <param name='cancellationToken'>
            /// The cancellation token.
            /// </param>
            public static async Task<CapacityPool> CreateOrUpdateAsync(this IPoolsOperations operations, CapacityPool body, string resourceGroupName, string accountName, string poolName, CancellationToken cancellationToken = default(CancellationToken))
            {
                using (var _result = await operations.CreateOrUpdateWithHttpMessagesAsync(body, resourceGroupName, accountName, poolName, null, cancellationToken).ConfigureAwait(false))
                {
                    return _result.Body;
                }
            }

            /// <summary>
            /// Update a capacity pool
            /// </summary>
            /// <remarks>
            /// Patch the specified capacity pool
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='body'>
            /// Capacity pool object supplied in the body of the operation.
            /// </param>
            /// <param name='resourceGroupName'>
            /// The name of the resource group.
            /// </param>
            /// <param name='accountName'>
            /// The name of the NetApp account
            /// </param>
            /// <param name='poolName'>
            /// The name of the capacity pool
            /// </param>
            public static CapacityPool Update(this IPoolsOperations operations, CapacityPoolPatch body, string resourceGroupName, string accountName, string poolName)
            {
                return operations.UpdateAsync(body, resourceGroupName, accountName, poolName).GetAwaiter().GetResult();
            }

            /// <summary>
            /// Update a capacity pool
            /// </summary>
            /// <remarks>
            /// Patch the specified capacity pool
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='body'>
            /// Capacity pool object supplied in the body of the operation.
            /// </param>
            /// <param name='resourceGroupName'>
            /// The name of the resource group.
            /// </param>
            /// <param name='accountName'>
            /// The name of the NetApp account
            /// </param>
            /// <param name='poolName'>
            /// The name of the capacity pool
            /// </param>
            /// <param name='cancellationToken'>
            /// The cancellation token.
            /// </param>
            public static async Task<CapacityPool> UpdateAsync(this IPoolsOperations operations, CapacityPoolPatch body, string resourceGroupName, string accountName, string poolName, CancellationToken cancellationToken = default(CancellationToken))
            {
                using (var _result = await operations.UpdateWithHttpMessagesAsync(body, resourceGroupName, accountName, poolName, null, cancellationToken).ConfigureAwait(false))
                {
                    return _result.Body;
                }
            }

            /// <summary>
            /// Delete a capacity pool
            /// </summary>
            /// <remarks>
            /// Delete the specified capacity pool
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='resourceGroupName'>
            /// The name of the resource group.
            /// </param>
            /// <param name='accountName'>
            /// The name of the NetApp account
            /// </param>
            /// <param name='poolName'>
            /// The name of the capacity pool
            /// </param>
            public static void Delete(this IPoolsOperations operations, string resourceGroupName, string accountName, string poolName)
            {
                operations.DeleteAsync(resourceGroupName, accountName, poolName).GetAwaiter().GetResult();
            }

            /// <summary>
            /// Delete a capacity pool
            /// </summary>
            /// <remarks>
            /// Delete the specified capacity pool
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='resourceGroupName'>
            /// The name of the resource group.
            /// </param>
            /// <param name='accountName'>
            /// The name of the NetApp account
            /// </param>
            /// <param name='poolName'>
            /// The name of the capacity pool
            /// </param>
            /// <param name='cancellationToken'>
            /// The cancellation token.
            /// </param>
            public static async Task DeleteAsync(this IPoolsOperations operations, string resourceGroupName, string accountName, string poolName, CancellationToken cancellationToken = default(CancellationToken))
            {
                (await operations.DeleteWithHttpMessagesAsync(resourceGroupName, accountName, poolName, null, cancellationToken).ConfigureAwait(false)).Dispose();
            }

            /// <summary>
            /// Create or Update the specified capacity pool within the resource group
            /// </summary>
            /// <remarks>
            /// Create or Update a capacity pool
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='body'>
            /// Capacity pool object supplied in the body of the operation.
            /// </param>
            /// <param name='resourceGroupName'>
            /// The name of the resource group.
            /// </param>
            /// <param name='accountName'>
            /// The name of the NetApp account
            /// </param>
            /// <param name='poolName'>
            /// The name of the capacity pool
            /// </param>
            public static CapacityPool BeginCreateOrUpdate(this IPoolsOperations operations, CapacityPool body, string resourceGroupName, string accountName, string poolName)
            {
                return operations.BeginCreateOrUpdateAsync(body, resourceGroupName, accountName, poolName).GetAwaiter().GetResult();
            }

            /// <summary>
            /// Create or Update the specified capacity pool within the resource group
            /// </summary>
            /// <remarks>
            /// Create or Update a capacity pool
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='body'>
            /// Capacity pool object supplied in the body of the operation.
            /// </param>
            /// <param name='resourceGroupName'>
            /// The name of the resource group.
            /// </param>
            /// <param name='accountName'>
            /// The name of the NetApp account
            /// </param>
            /// <param name='poolName'>
            /// The name of the capacity pool
            /// </param>
            /// <param name='cancellationToken'>
            /// The cancellation token.
            /// </param>
            public static async Task<CapacityPool> BeginCreateOrUpdateAsync(this IPoolsOperations operations, CapacityPool body, string resourceGroupName, string accountName, string poolName, CancellationToken cancellationToken = default(CancellationToken))
            {
                using (var _result = await operations.BeginCreateOrUpdateWithHttpMessagesAsync(body, resourceGroupName, accountName, poolName, null, cancellationToken).ConfigureAwait(false))
                {
                    return _result.Body;
                }
            }

            /// <summary>
            /// Update a capacity pool
            /// </summary>
            /// <remarks>
            /// Patch the specified capacity pool
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='body'>
            /// Capacity pool object supplied in the body of the operation.
            /// </param>
            /// <param name='resourceGroupName'>
            /// The name of the resource group.
            /// </param>
            /// <param name='accountName'>
            /// The name of the NetApp account
            /// </param>
            /// <param name='poolName'>
            /// The name of the capacity pool
            /// </param>
            public static CapacityPool BeginUpdate(this IPoolsOperations operations, CapacityPoolPatch body, string resourceGroupName, string accountName, string poolName)
            {
                return operations.BeginUpdateAsync(body, resourceGroupName, accountName, poolName).GetAwaiter().GetResult();
            }

            /// <summary>
            /// Update a capacity pool
            /// </summary>
            /// <remarks>
            /// Patch the specified capacity pool
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='body'>
            /// Capacity pool object supplied in the body of the operation.
            /// </param>
            /// <param name='resourceGroupName'>
            /// The name of the resource group.
            /// </param>
            /// <param name='accountName'>
            /// The name of the NetApp account
            /// </param>
            /// <param name='poolName'>
            /// The name of the capacity pool
            /// </param>
            /// <param name='cancellationToken'>
            /// The cancellation token.
            /// </param>
            public static async Task<CapacityPool> BeginUpdateAsync(this IPoolsOperations operations, CapacityPoolPatch body, string resourceGroupName, string accountName, string poolName, CancellationToken cancellationToken = default(CancellationToken))
            {
                using (var _result = await operations.BeginUpdateWithHttpMessagesAsync(body, resourceGroupName, accountName, poolName, null, cancellationToken).ConfigureAwait(false))
                {
                    return _result.Body;
                }
            }

            /// <summary>
            /// Delete a capacity pool
            /// </summary>
            /// <remarks>
            /// Delete the specified capacity pool
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='resourceGroupName'>
            /// The name of the resource group.
            /// </param>
            /// <param name='accountName'>
            /// The name of the NetApp account
            /// </param>
            /// <param name='poolName'>
            /// The name of the capacity pool
            /// </param>
            public static void BeginDelete(this IPoolsOperations operations, string resourceGroupName, string accountName, string poolName)
            {
                operations.BeginDeleteAsync(resourceGroupName, accountName, poolName).GetAwaiter().GetResult();
            }

            /// <summary>
            /// Delete a capacity pool
            /// </summary>
            /// <remarks>
            /// Delete the specified capacity pool
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='resourceGroupName'>
            /// The name of the resource group.
            /// </param>
            /// <param name='accountName'>
            /// The name of the NetApp account
            /// </param>
            /// <param name='poolName'>
            /// The name of the capacity pool
            /// </param>
            /// <param name='cancellationToken'>
            /// The cancellation token.
            /// </param>
            public static async Task BeginDeleteAsync(this IPoolsOperations operations, string resourceGroupName, string accountName, string poolName, CancellationToken cancellationToken = default(CancellationToken))
            {
                (await operations.BeginDeleteWithHttpMessagesAsync(resourceGroupName, accountName, poolName, null, cancellationToken).ConfigureAwait(false)).Dispose();
            }

            /// <summary>
            /// Describe all Capacity Pools
            /// </summary>
            /// <remarks>
            /// List all capacity pools in the NetApp Account
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='nextPageLink'>
            /// The NextLink from the previous successful call to List operation.
            /// </param>
            public static IPage<CapacityPool> ListNext(this IPoolsOperations operations, string nextPageLink)
            {
                return operations.ListNextAsync(nextPageLink).GetAwaiter().GetResult();
            }

            /// <summary>
            /// Describe all Capacity Pools
            /// </summary>
            /// <remarks>
            /// List all capacity pools in the NetApp Account
            /// </remarks>
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='nextPageLink'>
            /// The NextLink from the previous successful call to List operation.
            /// </param>
            /// <param name='cancellationToken'>
            /// The cancellation token.
            /// </param>
            public static async Task<IPage<CapacityPool>> ListNextAsync(this IPoolsOperations operations, string nextPageLink, CancellationToken cancellationToken = default(CancellationToken))
            {
                using (var _result = await operations.ListNextWithHttpMessagesAsync(nextPageLink, null, cancellationToken).ConfigureAwait(false))
                {
                    return _result.Body;
                }
            }

    }
}
