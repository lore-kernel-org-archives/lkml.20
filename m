Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010035.outbound.protection.outlook.com [52.101.46.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0041030C158;
	Mon, 14 Sep 2026 06:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789366098; cv=fail; b=OKLFHsH31pFo2YRz6qwqz9fOzuIHTBxyyXO65LeIY9/b3DD+JgQhb0bY7zKIwK01J3r4mBMzbQVLBs2v8h0oFI6DzPQ1EqVgKbplkcq8/GAdr0/f5AkW2uQ1eVXFzaAr/eTXE0cUu27RwNLNu556EfWhZQz5PqVWuJ7I9LraRWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789366098; c=relaxed/simple;
	bh=L0sj5jgWSQA7S/6+vkaWwQLd/gdYnPY4AJ7hwJz58/w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W6ts5RmOiqKNYdHLMT8Wqr1glxK+OwJQz9v2YBVVkSVsy9pKu3/sC5HAmivJ7H5FcNdT7ArMpdDwlm4IWT+lx39ZW45YK6hB6VwUghUtmQiJ0R+CNIQHNh+mnHALFnBCDetImyGCiRO7JZm1yBSjhTWvv+suiwL/prceVAxhijs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aZ0BN+xG; arc=fail smtp.client-ip=52.101.46.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aZ0BN+xG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5P+7ZFc0jlAOEBZ/0p4sSaCWsJH8BfkaJdZ85WXYAP1k9h7MpVR7wZwh9acRMPCk1AMupNcHpnB3DxA7TziYRp9IosviA24KyRuwff7VMKmw60SzKRnIzNexM32BHMyzPf90fcDFwqnbJzbfyWpbp7dBin52V5kmgG4js/jm/s7j50kJq+AU5Tw/5c3eTQGmWqe/4++aFTJcPkpfSKgw/gBSE6KM2XBqM0z2CknJZsKWFgsA0nwjoS9KbDynGEGWavzeDLFYJkuLsleufP+yytgTxH2zNtWsWjKQFKAQSO2fYmH9ckb8G8R4ZyF3hIYCI3gY2jiS3nkGtLwS1sPDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQVdMhlk81Yrw3YKfR4wgQLktOfAAqc9GFx4Wr9vd3g=;
 b=AuhXX6vhkVviqfgEiJVNX17UgPjCFj08LwlgsNDdFM4gu8WCFxjH/uaL89JVhQx8XB8d51JI0+ynLrESmg+1EprziyCmfcWFVQF8kWQWwQRzVHBQDI6J6FkVV6Kp2xKwgW3BdfXnX/CHMcOd0U8/TjBTdgNAGGv+iW9OmgDq551+TSSp12vLmGzNv9hNBkvsDq3IgEuCfqSAX4rrs0evYKT4+lSvpbH92w88LShIJgU+YMNOFFKtAk0XcwvKvsvrxPqHwzhUM4yJmm7+BJNk3WsRavYVY4gAKvI34aAWorzVjha7qrIaxTUyz3fe+oQNdvTfPAULXbkeFcx3ngkIFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQVdMhlk81Yrw3YKfR4wgQLktOfAAqc9GFx4Wr9vd3g=;
 b=aZ0BN+xG1GfAcpxeN940s9o5n8EKeRcRBb8+nWWtnemOB3lAVXl3CurMNw/o58i4x+U7s3MsMR+QOwsD2fwOctpl9kwe8azW02iPeE3X3eo3BKjf3T+1k7swmpAL+LieYbHlPVAP/+PmkWzX23gc8CmiXIoSkyOb8sWhfOB8hR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CH3PR12MB7498.namprd12.prod.outlook.com (2603:10b6:610:143::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 06:08:13 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 06:08:13 +0000
Message-ID: <3abf2784-49ff-459c-9022-acd88bd767b4@amd.com>
Date: Mon, 14 Sep 2026 11:37:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] soundwire: amd: fix work drain ordering and
 pm_runtime guard in remove path
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com, Richard.Gong@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
 <20260910190240.1604447-4-Vijendar.Mukunda@amd.com>
 <860a28bf-9c69-48da-9fa7-1cdb82761c35@linux.dev>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <860a28bf-9c69-48da-9fa7-1cdb82761c35@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::6) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CH3PR12MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: ee0579ec-78b3-493d-e5ad-08df12268eef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Bqt3TkCeyxs2QCo1L8O+kIDVPpcomrs45zu+o2nTEQVEkP9aVNMjUIXcjA695XnpRSiT1yno//PmCTWYlZK9g4JWXYZFIFe6bnITSjhCFkNXNrllV9Hkm1sa4C5mJXVKBv/C+iuX4yPInepxHfdS8HXXse/4gWGC7CRyC/arJujkwhMEPsz2T2RsuRGXW6uC9SPxi/GEXpeZS3VLNjhqoKAmCT1h2PBfbMWluJPphHqn+8C5eZuabESE7gIQYR2QcbC0pH/Ryi55l7lC4LiWlGNI8gAZgoNy4Sm2UvTPAUb2ut6uY1EDzH4d/wBfBBcLOIvxn1d/JAOjtGyD+W8PHq4ocjZTN8eEKHvZUWb6Xkgkhtucns3AMOz1pYeeTAMZKwMPbRxksd+cuBE/AJo8vqkSOIBMRk3bZeflYgSkVUH7Az13lyMME306wvnWSdueYD+KfX4E/Td2zdY1ltU0aZbL4mg7b6mSNUSlz2hqTwh+UPQSNHEqwwGjoOGMM4pC+CgYvaCvj7IrRNhmKfkMGMFgP8Q21tguRjNQHgQZig2B2opVtxJ6iW6kDU4egj4ghYdHlKkJWQRbgScbQ347zkNYvpSRMg9S1oqwSh9bl0kyge1w9rBnA5kcSoPmNSXVTdlr3TKoWypDXMVUwhUK/GTi5WZ16EOsvGOGrU4S1ZI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2t3VjJSK0d5VElvY2xldVZXYlRIK3Vpd0JCTWQzZlIvNjR0bzMwNlRQU0RW?=
 =?utf-8?B?YlNjVXUyLzV0a2Y3VWlEcGVrbkw3WERtOHRQSlNRVjgrcU8rb0JsVTJZSnQz?=
 =?utf-8?B?RElHQ3FiVkxUYVFrM2xhRUM1UnFyS01SQ2Fyc3pQL3Q2THhnSUZSN1pERXdx?=
 =?utf-8?B?c29XRnVkS21YSnJCdCtLZzBzTzJOdG9EYW5PU0hjSTRKR2lxS0xvbDhWazRK?=
 =?utf-8?B?WGxaakh6TUp6T3pIMENEU1RuZTNtbk1lREE3MTdQVGhoUk9BUjVmRVVKQ3hZ?=
 =?utf-8?B?eEs3YVFCNVdUUVJrN3NaeWVCR1JxT3pXdTd1SzI4V3hha0J3RjFmRGhrNm0z?=
 =?utf-8?B?elZEVHFGenMvUFpIRHVHN0g0OHRvSUdoa1Q3RExqcy9ORmFZVGhYZHA0d1Jm?=
 =?utf-8?B?dkhKNXJiUVc1UDNqL3BpZmdOVjhlMG4yeEJnV0ZQZmFkZTNGalptR0cwU20y?=
 =?utf-8?B?bzhkc3hZNXZhT0ZLVWkwM2MxQTJvcjVnQ2FRNFNnQ2lYZWZXS1MyVUcwcmhX?=
 =?utf-8?B?MjJsTGNQcnBFTG5sTWJDRjAxVENjV2lUcklhS3BZMGdNbXRLczIyeUJWZDE5?=
 =?utf-8?B?eGtKTWtSQzhmNTZidVB5NGJ5NGllRGNFVW1tODIrMmNJbExHYWtaYlMrOVhx?=
 =?utf-8?B?RU9lQ0xjWTdmRGFWcDZ6OXBGTUd2RnhVMlU4K0VUTHFYcWNyeGRKbVB3cDg4?=
 =?utf-8?B?Q2J5UWZDdnhkUDl5REFjbmlRWTNoc2RaS1QyVHVIOVNHVnFIUmhlbVpIcFc2?=
 =?utf-8?B?MDUrZDdUYTN6MEZlakF0bFhKalJkbjdxUzlyNkI2eXp5alVjejhwZzJnRjBN?=
 =?utf-8?B?RDlxckNyOUxCM1FlTy9TdVd2MDVtdUlFS3BsSVlpc1RPRW4xREMrQTVONnl4?=
 =?utf-8?B?alB6bnUrT0xNek9xWHV3elowUnRKTGEwSGdwVFRFcW9YWUJNL1pNOGpzZVhG?=
 =?utf-8?B?U3J1a3V3RmNHYm5abzI3QTN1UGl0NkQ0dGNDbDNHTHlRcDdyUHFDU0I4elVw?=
 =?utf-8?B?dXBRaFppdlVBbUxHUS9IL25ObDREaVRhMXhreEhaZ211T3FwWEhVckpWN3Ri?=
 =?utf-8?B?OE0xalZnRjJKeE5BM0JEREFzMnV6Y3hUYlJHY2tlLzA5Unp3d3ZuTjUzWVZu?=
 =?utf-8?B?ZDRlQ1poSDBiYm4wTEVuOVFqSWphbU9UVlRwY3Y3WXhNQ1ZLZXJ6TU03SThq?=
 =?utf-8?B?RWplZnhGSzFZKzhFeGtmQmVKeVVySHpqUEpKV0hEdjc0WmdLM0xCVmZRRWZU?=
 =?utf-8?B?T0pySmRRSkwrb25BblUzT24wUUxvMEEyK1A4eFVoTjAzdWplUWl1a1ZYcDVM?=
 =?utf-8?B?SmZMMGF3eXNoZnBYL29XTG9ESU1naVBBVVd4ZTVKeXUxTHFHMGwrM0xySFFr?=
 =?utf-8?B?aUIvWmhZQWMzc245cUE0OU8xMmgvYnlzMzRjN1FaRTF4bGpJaVBrbUo0dzNa?=
 =?utf-8?B?UXRnRTNoQVk4V2RoeGJDbW1IbDNlS1JZdDR0b1crNFZzQ1VxVGlmazYwdWli?=
 =?utf-8?B?TnZJNzZzZEhlN0daWjBOZTVWMExmdVJXYWw4N3IzL3ZFOEpFcXVYTjVCRHF1?=
 =?utf-8?B?MFNVejJWV1ZiT0RNODVMNVpQdDZzK1c0RWl3U3RxcUVYb3k1cGVnV1RjNnJL?=
 =?utf-8?B?N2JqNHBmZVd3Qk9vWGZzUDJ3NW1LVXU1VHl6ZzNpb0trTCtRM01lcUNyOWdk?=
 =?utf-8?B?RWFiZzI2UXNZejcvM2lIOEdHZlVxSjVZQWtQd1QyU0FMZHdHK0dIZEtVS1FD?=
 =?utf-8?B?bEgxZ1BsVlloT2Y4Uy9qcHRZQXRnS3JWcU4wN29CbnU4NW1uYzNmM3lVTEVM?=
 =?utf-8?B?eGRLWGx6MUNMVk1TaHdQdE9idmZ1bzNUOGJSVlRXbDl4aEc1RktGNE5LM3ZF?=
 =?utf-8?B?akZUUTQ1VURRQTUxQVpUQUpKOUJJU0tKS3NUZ0lSOVdpeEM3MksvNHhjSVht?=
 =?utf-8?B?MlprdzhhNVBHMk5RQ0RwMC9UQXl4R21lYnYyYVZzb1hZWE9hK012L056OFN6?=
 =?utf-8?B?Wm9GalhGZmEreDA2MjMzMFhxdzZzcGpCd3kxOWRmZVVHWlFvOFlrbkVWcFlE?=
 =?utf-8?B?bktzeGIyZFlZcnlUNWJINnM4ckZsRjM3dHJmN0tHRkhVcmJSNkU0ZmVoNWdx?=
 =?utf-8?B?QWhxTWVCWlozQ1duSW5aZmNadDA5Z0tGSUNwRmN2U1RXMkVjbVFmM0x0Q3BN?=
 =?utf-8?B?S3ZuWFNiMS91MTQzalZjRGlESWE3em1OQjFTVWlnTU1WTnE3MGNUTmdyZGp5?=
 =?utf-8?B?a2R2S0xXc2tVdDJHM3FHRkJaSEhOenZTcmUwRUtaUG9COWF5L1BxRy9IK2JY?=
 =?utf-8?B?ZS9rTUJNMVZjY2hlcEttVk01T0FQYTV1b0xVYzhuSUg0Qm1yUWcvZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0579ec-78b3-493d-e5ad-08df12268eef
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 06:08:12.9146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcnnyVV4AY8ubeWN7zv0lAPb33um9ojiWcBgc2Q+LqqvV+EIj4FNy7LAQprE3g+vR2FGstz7IRW6vebGWW9Ehw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7498



On 9/14/26 01:35, Pierre-Louis Bossart wrote:
> On 9/10/26 21:00, Vijendar Mukunda wrote:
>> amd_sdw_manager_remove() cancelled amd_sdw_work but not
>> amd_sdw_irq_thread. Since amd_sdw_irq_thread() calls
>> schedule_work(&amd_sdw_work), an in-flight irq_thread item can
>> re-queue amd_sdw_work after its cancel returns, defeating the
>> cancellation.
>>
>> Fix by calling amd_disable_sdw_interrupts() first to quiesce the
>> hardware IRQ source, then cancel_work_sync() for amd_sdw_irq_thread,
>> then cancel_work_sync() for amd_sdw_work. The existing
>> cancel_work_sync(amd_sdw_work) is also moved to after
>> amd_disable_sdw_interrupts() so that any work item queued between the
>> old cancel position and the interrupt disable cannot escape draining.
>>
>> synchronize_irq() is deliberately not used before the
>> cancel_work_sync() calls. Once SoundWire interrupts are masked, no new
>> IRQ deliveries can occur. An IRQ handler already in flight may still
>> queue amd_sdw_irq_thread, so cancel_work_sync() is used to drain both
>> amd_sdw_irq_thread and any amd_sdw_work items it may have scheduled.
>> This fully quiesces the driver workqueues, making synchronize_irq()
>> unnecessary.
>>
>> Also guard pm_runtime_disable() so it is only called when runtime PM
>> was actually enabled. amd_sdw_manager_start() calls pm_runtime_enable()
>> only at the very end, after several fallible hardware init steps. If
>> sdw_amd_startup() fails mid-loop (one manager started, the next fails
>> before pm_runtime_enable()), sdw_amd_exit() triggers
>> platform_device_unregister() for all managers. Calling
>> pm_runtime_disable() on the partially-started manager finds
>> disable_depth already at its initial value of 1, silently increments it
>> to 2 and returns without a warning, so a later pm_runtime_enable() would
>> only bring it back to 1 and leave runtime PM disabled. Use
>> pm_runtime_enabled() to skip the call when it was never paired with an
>> enable.
> The alternative is to do a pm_runtime_enable() in the probe(), and later
> a pm_runtime_set_active().
>
> That way if the probe is successful, then the remove() will always deal
> a balanced enable.
>
> Maybe only put a single 'fix' per patch?
Thanks for the comments. I agree that it is preferable to keep each patch
focused, but in this case both changes are part of the same remove-path
cleanup bug and are tightly coupled.

I do not think moving pm_runtime_enable() to probe() is the right fix
here. In this driver, runtime PM is intentionally enabled only at the end
of amd_sdw_manager_start(), after the fallible hardware bring-up sequence.
If one instance succeeds and the next fails before pm_runtime_enable(), the
remove path can still run for the partially started instance. In that
scenario, an unconditional pm_runtime_disable() is incorrect because there
was no matching enable for that instance.

This driver is multi-instance: the controller loops over each link and
starts them independently. The PM state and workqueue state are per
instance, so the guard in remove() is needed to avoid an unbalanced PM
state from the partial-start failure path. Moving the enable into probe()
would also change the device lifecycle semantics by enabling PM before the
hardware bring-up sequence completes, which is broader than the actual bug
being fixed.

The work-drain ordering change is part of the same teardown correctness
issue: amd_sdw_irq_thread() can requeue amd_sdw_work, so the interrupt
source must be masked before draining both work items. That is a remove-
path issue and not something that belongs in probe().

I kept the patch scoped to the actual cleanup bug instead of restructuring
the startup lifecycle. If needed, I can split the PM guard and the work-
drain ordering into separate patches, but they are both required for the
same failure mode.


>> Fixes: f93b697ed98e ("soundwire: amd: cancel pending slave status handling workqueue during remove sequence")
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>   drivers/soundwire/amd_manager.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index a57b59609bfe..bbe1e73ed255 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -1172,9 +1172,11 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
>>   	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
>>   	int ret;
>>   
>> -	pm_runtime_disable(&pdev->dev);
>> -	cancel_work_sync(&amd_manager->amd_sdw_work);
>> +	if (pm_runtime_enabled(&pdev->dev))
>> +		pm_runtime_disable(&pdev->dev);
>>   	amd_disable_sdw_interrupts(amd_manager);
>> +	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>> +	cancel_work_sync(&amd_manager->amd_sdw_work);
>>   	sdw_bus_master_delete(&amd_manager->bus);
>>   	ret = amd_disable_sdw_manager(amd_manager);
>>   	if (ret)

