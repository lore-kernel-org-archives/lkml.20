Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010001.outbound.protection.outlook.com [40.93.198.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543E14CEE44;
	Thu, 17 Sep 2026 18:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669183; cv=fail; b=QI5hTVHcVzN//umA39/w7hMUEfw//vv0d63ervAuCKBwIeKgHOeIn5O3KkL766Om4mK2BuCmKrt6I04q1cYQrSZ86bRzMobL/5lUvjw03UxjH5+0AgdT6GijwQE+/Ht6kSeSafuA1o8NEOte0VhBZx7QCJ3Pp+9jZaWFebSkVc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669183; c=relaxed/simple;
	bh=w+wfVhn6e0NwI762456HiyiI9bmfsAbWS0EPI0Jv3Eo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UT5fNG4PlF7YDDQVBhV6zW1FRizpZ8DH+SRszvcs0B6qoG8BubANqPg7g6NfCCIGrV3M0vNg1MvvvtrvUppL9RHEIn2Q5euI+hM41OLMwNSeYbjEp3YiWrrsLYqf1Gg7mF/csWDGMauP3BcJTOrUz61wrvyslqFD3InbZY0P8Po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YeKCDUS8; arc=fail smtp.client-ip=40.93.198.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YeKCDUS8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5lCxjsXHfIMoEMcZNZfDnbYzATPT3kjNvhdtVkPIZfwkX2Cp02a0PNvgApB1dprbUVfKbwlmIJEhYXuzN8lofT2bOsjdBaPpqbh1QuX2m7dQ7zbSJ92d2ryuD++BfBRUmf4hxBZnEwGsGgH+nRNaCdKlIGTOPto3fDSmZW4xEyT3uauEDiW0UhFt87FfwGKv/s9Py/gx/hE3pYlqAbNWvDXQXogpVkTfcx+aCY4W1vKHDHIiB4768MG7m9ZTb7EGKZPDfUugh17s0t8za+9cgq7F3E1eMwu1iVyvNeYmBhRbn2DrIQl+aFu854aLt2cgtWGctn1a9P6Uh80b5sOHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAf0uAoq5I+Si6ZWcvQnrX0sPSZ80hnbVtiheEFYhv8=;
 b=OQD/baZWdu63sRykmK40JYysnTXipqp7Wuo5LYPhSVR2z50UtMAsK1ff8QfXbaPF0dWKHFEbVYPpz6KK+rM7vD+x7ByzGjoxMyQzRCaEJyRPgbVFkMzkP/jnO8c6Zkly3Y+RfMdi2xuMFERC8Ur51qJkpT7TNaRvi4ksxuZbkruwWvnF7SwjeiJ8kYjxzPSThQPdb9bscCQ6ffR+TCQz8JklwZYTukDC6TSJsO+boteMLcXM5quwcIyEWHxnQd1B14KMC9eMHCG+YO2BwGJHl93XjV7wnIFXEBjeMLKlg+5pwN3XB7guIrtVweDbCiA1s2WLrDYl23uf9LUEr0THSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAf0uAoq5I+Si6ZWcvQnrX0sPSZ80hnbVtiheEFYhv8=;
 b=YeKCDUS8/aK/K+zzN3MRcV4jCHEs6FuYcbQNmV/Gw/4M9Li4Rg8C53Hk45OXgUOMGEYFQvzaQ/NpJ11kVdD2EwyVQFObeot2AAcjed/FVaLbP2UGHJ6O6O0GFn1hNGG6bWy68gqgEynJyb95IvfFMc+U+OGfyDxaHTI+Izb0Qe8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SA1PR12MB8857.namprd12.prod.outlook.com (2603:10b6:806:38d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Thu, 17 Sep
 2026 18:19:31 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 18:19:28 +0000
Message-ID: <7c153a10-b847-427a-851a-c75bb4db71db@amd.com>
Date: Thu, 17 Sep 2026 13:19:24 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 11/16] fs/resctrl: Introduce kmode_cpus/kmode_cpus_list
 per rdtgroup
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, bp@alien8.de, ben.horgan@arm.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 tglx@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
 hpa@zytor.com, fenghuay@nvidia.com, akpm@linux-foundation.org,
 rppt@kernel.org, dapeng1.mi@linux.intel.com, elver@google.com,
 jlayton@kernel.org, enelsonmoore@gmail.com, kuba@kernel.org,
 ebiggers@kernel.org, seanjc@google.com, peterz@infradead.org,
 chao.gao@intel.com, jmattson@google.com, naveen@kernel.org,
 ricardo.neri-calderon@linux.intel.com, tiala@microsoft.com,
 chang.seok.bae@intel.com, prathyushi.nangia@amd.com, kim.phillips@amd.com,
 elena.reshetova@intel.com, darwi@linutronix.de, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <cover.1787772750.git.babu.moger@amd.com>
 <0ad1110a1fa2c041d71f50b0d756815676c4dee6.1787772750.git.babu.moger@amd.com>
 <ef8804d5-f20c-49a1-87cf-ab39437a5f0d@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <ef8804d5-f20c-49a1-87cf-ab39437a5f0d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0047.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::28) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SA1PR12MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: d1052702-3c88-4661-d42a-08df14e835bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	aWcgtuzCrNd0uvXW+0NcPUp+eoZ4ISR9T//ts8IFdlpcxn9QSsZEaQdzfrF2Jya7Kircybr6KQEqO8Q72xzMCQvdrI6J7aNf9d7MO4aAqSvt63nvU/qe1O4pUnKhwEEtSLyUQdDcFMUFXKxJbVOiaD+ZXECkAy9d+SQw4u/s4hh7WLFUoM7ZgiKNRaThLRiUsXlFDO3g3SwSsUShbwvs+tW6z1o4xKjCPQ2uj97DOprrewkRTUGxvnOPsxk/GmBAjbs8AcpdSU3geOnmBtOxsVUHsu+1Vu5By+dfWkWsZ55qJmUdo7n7aNufg4Ikmn0eVG6P5QDC341LnRJw9V90I4mJG0ry/+OcBW6u6KfmEI7DuqhMbXqozBnVUrEgoMDqNoH1rOy81dmSSIXx1YkYjTVTqkp0F0asHW2eORYfqb15H8TKunc9TpRDcwE9gSb6o2GaEppcwvepu/GeQ0lxUU1LVyg6f4doe3VzUeimwaAMP6VebW8cLQaBBrF6f/M/pB1erwOzYW4hDmw1yaCh9XeZQGnqMvulv4fruyXbCddTNKbcxJf9q0ugFYlGc9ynG7QguN1fs4Cmiw2j31rJsVG8pmqNsy2BnPvwg5ce474jtYCpckiboVOBedx8S2tNwv6nqeGwPyifpSDIYTxEJqqbHlzAWWEchtPks8mhh4M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVMyWUlkZHY2WjRUMlg2QnR6OFEwaEFSSmNLZlVCUUdsdWZDWWN3NWVRblpY?=
 =?utf-8?B?dWpET0V6R3psSEJXME9LbS9WSEEveER1d29KUCtQV05mdnpPb1RMbEV5OEJN?=
 =?utf-8?B?akxvaC9zMExPbHR5a0VqTk5CRjlIelZWNjdrQmhTS2dYYlRjUzRCanV4Zmht?=
 =?utf-8?B?eFI4bk0xQ01XRThRc0RTNG9Bd3UvWWMyOVlORWE3WFNTOVlFOXBCMnBsUEhk?=
 =?utf-8?B?MFpjK2ZPeEZLQlo1SXhzMWcwT2h0NklhU09hb2VnVTVEZzBsMjYwUUIyUHla?=
 =?utf-8?B?Y2JLTm5ETGE4ci9xTGlhck5BZk03c0drYUJuTWcyTlh1THhzbHpOdVJXS1VF?=
 =?utf-8?B?V0dzaFRUZ3pjSWNIQnByd3lqRnplMDZxb2NBYi8yR00ySTZUSmN1N2gyYiti?=
 =?utf-8?B?R2h6amsyNUVnMVVjc1dmSHJRUU1KK2owOUh2THgzTGNKTXZDVFlhWmNSeE9T?=
 =?utf-8?B?Y1h2RVBnQnZyOGNIN1BSZUVpem12WXpVOHdtME5NaEdCWW13TCt1cEVGdnVv?=
 =?utf-8?B?L2w1M0RQaTlLN3dEL0hIYUZLYUhqNUg2NXZsTXZvU0pDMWovRUMrYWhpeWhZ?=
 =?utf-8?B?ZWZPWURQTmVSRXZEYjJaL0QveEU0TEsvNmYxdTh6RmRBYWFCZ2tDLzN4WW84?=
 =?utf-8?B?Vm1pcjlZRlNPNUlSVGxIa2x0dUFKckkzaEpuOGFuVWg2WVlXS2d0REs5K05N?=
 =?utf-8?B?TWlvcWhNbWk5WFF5UUJVNkg5aEJ1SVhnRkV1TW14QnI2T0tsK3ZuUnd5Ly9a?=
 =?utf-8?B?dHlBVTJxeTc2dXBydUNKSjhJRFFaN0x6MGU1ZmViNTQxM2lTWFUrNUMralZF?=
 =?utf-8?B?c1dyWXNHdGdkZXFib0x6bEwzeXdvYVJqTExXR3luREFSbC9ZN0lGSE83N1Jt?=
 =?utf-8?B?ZUp4WVdrZEVkRGlFRndPc1ZoOS9pNmpyNU5WV3VrTndxYjFVMUlXbFZ3dTFI?=
 =?utf-8?B?YWNJMXluZDg5aUdvVzR6d2RGc3RTdHB6N1o5emR0TWxMRUJLZTFnL1A0MytR?=
 =?utf-8?B?NXJKTVBYbnBLWUc2eXQ5VmNSWXdVRmhKUFN0dUw5ZjhFZFhKUnBlUzJOdmdB?=
 =?utf-8?B?eVgzSnRUUDhDY1E3a1YxUWpoamxWdVZRUzJIRUhkRkdQbHBSQndJOFd2Q0c2?=
 =?utf-8?B?akljeXcyU2dONzhKN0x5WDJmcFRKMVVIWE1BbUpDQlZ6czdMbTlmMk5Tbk9r?=
 =?utf-8?B?M0UvUDJPMGhLMXVQNzNPVlh3SHV3M2F4NTFsUXoyZDRNVC91UkhIOU9zMHBG?=
 =?utf-8?B?NDZUekNQU24yQU1SZlkxNHgxcnZ1di9YVzlDOUtRT1ZPY0hOWk5YQWxXbnRI?=
 =?utf-8?B?Q2Z6bDRMZUdEeEFIYkc4bW5xZldQdGRNd0VaMHE3eEVybU50TmVPVGJYajlF?=
 =?utf-8?B?TkJkNmhpeFpwZTBGemFLOUVablZLS053YVNSRlRPZW1BeSs4c0lIVDh2YVVS?=
 =?utf-8?B?Zk9uUUFaV0dwWXRVQngvelVOTXI1QzFqb3dwL0Q2MnVJYnUvL0RVY0s5MUZ5?=
 =?utf-8?B?ZEkydHNXcjFPdUs5UERMdU43VFBHRDNUdVNsUmdDekhSeERsWi8xQUIzR1Bs?=
 =?utf-8?B?UXhrWmhTY3VsT3lkYi9Lbk83R1ZEUWFrT21qL2FObEhsazduSmVDYjFsVGdO?=
 =?utf-8?B?OVd6Q3VIZXJESkdWZDRyZEhPUUFBNGtuRmsxS2IwOVkyVzBKWW9nM1FEREJ5?=
 =?utf-8?B?aXNQcXdiODNoSHJITzJTd2RmT2tjdjlvbFJRa0tjNzlCRWhyY1VxL2VCQzZL?=
 =?utf-8?B?aWRXRUJWNzlHVm1xNkIrK3pLc29MUU9sdlNhK2hxb3paYWdHVkwvRHJvL21n?=
 =?utf-8?B?SERMRkdEeW9aSEcrYVM4Rm5pQjg3Ti9EUFg5UTdRc2I4WUhRY3gwZVU0MXdO?=
 =?utf-8?B?VURHL0xtMllHOCtFUlpXQXdnbGJrRjVGRHlFQlpIL2JUZVppUjNUSVk5dFNv?=
 =?utf-8?B?TTZ1T2ZMQnF5WmRDSDlsVFBrVXppUDNEMFVDaTdpOGtROVVhc2dQaU5mcGJC?=
 =?utf-8?B?T2srM0s5alBlSnR2cWhRN0FSRHZTWEZNZDZ4N0dPVUVuK3BHU1JYdXlLUXpY?=
 =?utf-8?B?ekRCeWdLckQzM1FOeHJNVmhMbjcwTkQxMFlheG93VG5MTjZ3NzJ3enVOYyt6?=
 =?utf-8?B?RjRKczR4WGpDbUJMODV2Z2VValNYRXF4QXUyMkVzK1p5Ykxpa254U2s0SmNt?=
 =?utf-8?B?L2IxR081UzViNHIzM3poMmZyR3pNQkEzVVdOU0RSbldHb3RNMVJPNjB6T01W?=
 =?utf-8?B?QmhWSXgvaFRabGU2RHNUTHhXL1k4dTZ6cURwVVVhM2Zublp4dms5OUhjTG1D?=
 =?utf-8?Q?UKaasG3RNzb+PU0vHj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1052702-3c88-4661-d42a-08df14e835bc
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 18:19:27.8021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IRoFakl1DerF4OxRiEpD/I8BS4hartufcpYQsagTd5IfJIETvxS+GIJQp7/RJOm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8857

Hi Reinette,

On 9/16/26 00:34, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/26/26 12:32 PM, Babu Moger wrote:
>>   fs/resctrl/internal.h |  5 +++++
>>   fs/resctrl/rdtgroup.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 48 insertions(+)
>>
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index b56f95625072..01f9f596f9b1 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -216,6 +216,9 @@ struct mongroup {
>>    * @mon:			mongroup related data
>>    * @mode:			mode of resource group
>>    * @mba_mbps_event:		input monitoring event id when mba_sc is enabled
>> + * @kmode:			true if this group has an active kernel-mode
>> + *				association
> 
> This really just seems specific to the global per-CPU kernel mode. Why is
> it necessary? Is resctrl_kcfg.active.k_rdtgrp not sufficient by itself? (more below)

I think we can do it by checking the
rdtgrp == resctrl_kcfg.active.k_rdtgrp

> 
>> + * @kmode_cpu_mask:		CPUs in this group's kernel-mode association
>>    * @plr:			pseudo-locked region
>>    */
>>   struct rdtgroup {
>> @@ -229,6 +232,8 @@ struct rdtgroup {
>>   	struct mongroup			mon;
>>   	enum rdtgrp_mode		mode;
>>   	enum resctrl_event_id		mba_mbps_event;
>> +	bool				kmode;
>> +	struct cpumask			kmode_cpu_mask;
>>   	struct pseudo_lock_region	*plr;
>>   };
>>   
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index d2fff8adf915..06e74b027044 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -389,6 +389,32 @@ static int rdtgroup_cpus_show(struct kernfs_open_file *of,
>>   	return ret;
>>   }
>>   
>> +/*
>> + * Display CPU masks for the kernel-mode associated resource group.
>> + * Supports both "kmode_cpus" (bitmap format) and "kmode_cpus_list"
>> + * (range list format); the output format is selected accordingly.
>> + *
>> + * Returns -ENOENT on error.
>> + */
>> +static int rdtgroup_kmode_cpus_show(struct kernfs_open_file *of,
>> +				    struct seq_file *s, void *v)
>> +{
>> +	struct rdtgroup *rdtgrp;
>> +	int ret = 0;
>> +
>> +	rdtgrp = rdtgroup_kn_lock_live(of->kn);
>> +
>> +	if (rdtgrp && rdtgrp->kmode) {
> 
> First, it would be helpful to explain why the second test is needed since it
> is not obvious that a resource group may get re-assigned while a user has this
> file open.
> 
> Second, could a check of rdtgrp->kmode be replaced with a comparison between
> rdtgrp and resctrl_kcfg.active.k_rdtgrp ? If so, why is rdtgrp::kmode needed?
> I think one part of this is how this series blurs between a generic
> "kernel mode" and the specific only-supported global per-CPU kernel mode
> that makes it difficult to know what state can be used.

ok. We can check rdtgrp == resctrl_kcfg.active.k_rdtgrp

Thanks
Babu
