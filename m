Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010038.outbound.protection.outlook.com [52.101.85.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21FD4D17B2;
	Thu, 17 Sep 2026 19:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789673154; cv=fail; b=riqyJXGWKdrVXfFVqH9AapvZDVc5nLxkkqBYMDcp9RhQdZN3YyHUkRI2QBbatWmgmJ/k9IHekHiS3dAbgQ3/hNxyvpDFxI6M7WZcaU7o/Eu9hvrzjx99vpwfvUF8CCUeMP/uBVxxtpgIKFOn9q+MLnvDm1IjPj0Q0s9XPD3JvsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789673154; c=relaxed/simple;
	bh=JByHGpW9gOmP00b2QE1jLXD07R3Inr44qCm2E8TGXEE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TZCPM7h6417utKFFTCecTb3nXkI1sTc1MgKxYgI9DCfng7GeZwi0f5LmucCX9gXFGmKfOxCEPPvcagc8mFFOLaPJxd5EunyAEHol/R5NnFKX5w/BswZ1o4dP7C5a9nodoQP3KHn2Som8D1rfnsRZr/P29e68JwZC9/fc/7z4ZrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=W1MizAK9; arc=fail smtp.client-ip=52.101.85.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="W1MizAK9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcUECYMbc0cjHy09OUEQE1l6DIwrLo6RV8hg/H1DLXXbiTLl01UY6s+yGHm9uopjp1Pf53DfKazX6Y9R1IBToFPVhuWbzNnIVXCw58OJYSc2MgSHpEmL1h9yhw+jjU24AhfwEMhcN7R62K9iw9AlcGOr/2t6uPdeXsGD/I4BE8n6GyhinRT5E0K29CjgOaluDj+9o7fkCkAcj+fDiY98gHiEpzI+W6nWaoDdNAv9kFYJLrqSTAORD7+Ud99nwR6VPBt2educYKibCgxhAWbmZCeGpVJLSsVOuy5DQhQ2g193/IrHruadJOne6jf/akKPAvJM9nuUT3cHoaMGYekvCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfhHutjgIyAR559tbfRSucZdzBjdT9n5KwXkS1T+CLM=;
 b=DoQE0klxsp9fqksdE705qT0Dl3/SrZlwwwM6NU7fgVR8+zdvzzuSQeQVSlQ4whe/JP5XDNWhnWqRYDRKWTp7Riv2d352CSr9MByPWcjNVUoBGAzNEKDKuPadhRkaZLjAVewx42/DK9BSDWIoxgM8OHPN7aadBQLnbhwvfDz68MQgEzmbpVRq++Ak22RpJWDqOf/EHLLaqPUAYYCHf5cspbAE3aKxuZZqhpLgPHRZzXux31TG3jJBrwlZaXa2PSsIfOy/0DfqZzzTZTl2eveqXqKxT8VnMFDISDaqLsuyO9WVmqu7pXNuI7F8EpxscmFfwmWv39C5KpSrJV/B0byZug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfhHutjgIyAR559tbfRSucZdzBjdT9n5KwXkS1T+CLM=;
 b=W1MizAK9uFYx5UdlIKletmpPeY+ADyLJqSRlyhMijEfS9lAjuP8aIcOERiwY+7QKSfJNxWvXj4x2xvwwHVPx5MhpbbNDSsNtoKCb8KMTpwsa3RGtZlMesst5ede1m9kz/EaqzVrwxkV8M7FLz3GGvE24zwwDgOKMXe7bH51JFtY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by BL3PR12MB6521.namprd12.prod.outlook.com (2603:10b6:208:3bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 19:25:45 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 19:25:44 +0000
Message-ID: <45e322b2-a808-4b26-b33a-4ce7c84d5241@amd.com>
Date: Thu, 17 Sep 2026 14:25:41 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 13/16] fs/resctrl: Deactivate the kernel mode
 association when a group is removed
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
 <432f0cbfb811aee3c8c51bbc42faf66174375d8b.1787772750.git.babu.moger@amd.com>
 <9dd7905f-6180-428d-8c9d-10e9353b5091@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <9dd7905f-6180-428d-8c9d-10e9353b5091@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:610:4c::25) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|BL3PR12MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: fe680104-fc6d-4125-c4af-08df14f17827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|23010399003|366016|18002099003|22082099003|3023799007|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	tfPIK+7V38YZiQWIaxIm9H1aMy2AjJ+8qSpqzCEXhLUTQ0bm55uGd2SyHOVXwj5vVDJvjywH0DHsmnx77J+CtM3BWNxo742XtqJDTCr2QazoC+fG4Js94dUORRqMvckHRUPy9F6bDzyeYi/VKkf9QxZBqykUzPqaY7V62dQGWKHE7k6HCIdM5vBy9yy4v9KjLkY8JXXtbmkNcfZX8/NoD/u0YCMuPdsF/X2Ndaq0G9dnZYBPy3bmdEKAV1Z0pzwGB/pUf+9SPafffANrRRb7Ttx13O4octzu2LoW9KBhPxVh+TXddoiPuu3K/C5jWVfkXUEbR8xV9khebGVpbsY6UwQ0/zRkweqK+5neb+EZ7niLGo4LW7lgbV/rl/7VXXcZpyXiu3vpCQy+RE8msFS7hKZOf0kAdmIA6ofsKofHZzD9qd+d0vNr3jE6WO6ULqpk0EgwlvEZuIx3MSFLpQuWEwb4iKUgv4riSnIivD5x2WDAtq4AYocPshs8jVIW2EAOVgqfm1toQaLX3mxBNOsqyO892VW34Kmkbf8BemoLn3FHl4YoJ4iHW48v7FGzXBdsmA3e+zttsz0hotxzBV0RFYUYIH3kNhQ/FmkqIZpeLef0PLiq/WjEPpEiE1OpBHQ5jh/N+Jz+aqdloBpjGhAH2wi/C/714iyRKnRYvhYvivo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(3023799007)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ri9DL2VVU2hsVlJsQ2Rvdi9SWE93dktOdmVvWkxZNHQraUlTMXdlazlsdEVD?=
 =?utf-8?B?M0hTOHBkMWU4TmwyT2VPWkZRS2RWbGlLQy9waVRNak85VFJGOVlzNUNYaWpv?=
 =?utf-8?B?cC93Rkt3WXgvTVVvU1RoZDBCcXJscHYxbU5KdnhHSDM1REpwSURSK1lGYWVu?=
 =?utf-8?B?U3Z5OHAvOUw5eERNeUVaL0RjQmhvMG9neWJFWDcvSzc1ZiswTlVVQnRFTHdG?=
 =?utf-8?B?NnFMK0R1UjFIYmdiRVNJdU4za2NjMUdUeExwa1JxUVduaytSOGFFdy9UVk1I?=
 =?utf-8?B?YXZaU2g3V2F5MTA1dFlKQVBOaFk2OCtFY1YyRHhGZXVJZFdkNTdHd2tkYVEv?=
 =?utf-8?B?Rkw2NWd1Yms1R3hobnJuS09zU2t2a0w1MXA3UFNDUXZmS290dGYwdXF5TjV1?=
 =?utf-8?B?NG1pdVZZQnh4NFBEMDlmbEFFSzdnWjNtalBFdlVxTGtYT3NYcHQ1Y0NIYkdt?=
 =?utf-8?B?ZnBDcDVuQjdwZWpHOTVhR0NhUVhoMWR0MnFzbkZJZHZCTGVYdVJuTHMvVSt0?=
 =?utf-8?B?c0w0WHJXUzFneVpHaU45d21DMVAxdVN1dnY3QXVXZ2toT3ZOemhSSEZOdjBu?=
 =?utf-8?B?eFVVaWVzb0dyUjZ6SzR2Q3NINko2aFJqZVkvaFdkT0k1cnNIRkYvUVRBdHR5?=
 =?utf-8?B?T01EN0gyczNDM2tFcTN0YlBhblpWNlRyWWgweHJnejdLV2FySENWZVp0c2Y3?=
 =?utf-8?B?VVJ0M3JGVHFTK2t0Rk5IWlBnbHBLK1JnTmZTeFpyeDluVFQxelhCbjZMTnFB?=
 =?utf-8?B?VGo2QWMzQzZNcXNJWTIweVMxTTZXaEhKa0tOeVl4cHNqTmZVN0N1SjFvVkh2?=
 =?utf-8?B?b2k3eXR2UnZRclBmSGNocGhlRytPNmFja2d1S0lkcDhLZUdFVHF3N3R3V0pD?=
 =?utf-8?B?MWdqNmYwM2lUNTFZeE5VZXlPTVlNVHUrYnRaQUhxWUtTOFpLMFpEcTlDMnIz?=
 =?utf-8?B?dVAzc2FuUU1VYnhTOXFwSUF2T0pSdkl0NThDa09DT2txQTFSbUxRdjJpMDQv?=
 =?utf-8?B?UXp4UTg2aE5HZWJuTFNsNFFpRzNTcUMxWGhGQ1JmRkYwbWs5cjErVTRGaDNY?=
 =?utf-8?B?ODhzZ0w5blZrUFg2Q2NqUjZ4YnZTMDRQaURva21UNWtvb2Q0WXF1eFFvRW9T?=
 =?utf-8?B?aUFwUzFpSnQ4TjNjUmNPLzFGUkJBdDBraXZ6WlY2aW5aUFg3Y2pkeElFNzZS?=
 =?utf-8?B?SkxxM2hFUjJlSDd6K2RxRi9Tb0Z1ZG1laXlTQlVYa0xrODZIcjNCYWlyUUJG?=
 =?utf-8?B?Q3VLWkxicmxjN0dzZjYxdVp1VHN6enFXSEIwajNvMkhmRUVGTkFUQ0dYSzFE?=
 =?utf-8?B?bWw3dzROZkxqL3BTUG05NmhZbnV4ZngxSCtmTFNnUXdzaEFuVzExNDNLenRk?=
 =?utf-8?B?Q0l4NUFmYUR0aDdlK25HL0I3YnBkU29kV2ZrMnU3Z0VFUHlTWE9GT3dHM1R2?=
 =?utf-8?B?RmVEeDRDUzRkeVlLU2dYSU9DUE8wRnVqTVczQ25RUTd3ZkJLT01nZE5ZU1NM?=
 =?utf-8?B?TGcvd0Y0SHJOanJqZWM1VjM1alJrdWlhV3diL3poNk1lU3p1WkVmS0JpRWF1?=
 =?utf-8?B?bk1rK2hsSnJ1QzBjS0h2ZnNxUExNcnFOZzBua3FKcmpoOHVNY1k3L2xPUzRH?=
 =?utf-8?B?QjhpQkt6ZVNiUUtFbFNlYjRkN2hhSER1UEFlRE9IbUx2bG10SGhneVVrRlhB?=
 =?utf-8?B?by95ZG1SbWJYUkpqNXBOSVQwQmVBK0hhbGtOVGRaZVBHTGUreUsyaW5oWVl0?=
 =?utf-8?B?SFBxcGwyaE1yOG0yZGtnN0hXZk5kMkNzUnpLRDVjMnpiWEdCekl3bmJqUUZr?=
 =?utf-8?B?Q3N4aFlKZXJnc3hhSXkwTTBiZWovcWxGSlVKbXB2MEdyQ1hVaVNJeUdJTVBH?=
 =?utf-8?B?V0l4bkZ3TGZGN2tuY25GREpJYzdJamFVQjNobmU0V0RESExRQ2xnckV2ZnBk?=
 =?utf-8?B?Z0VlTFhGRDUvTGNjcUFORldsUGFHWUpDbGVwMVVEVGdsR3RodkhRQ3Nndlg1?=
 =?utf-8?B?WjkwNTJ3UTY2MVRkN3hvRVAxTW0xYVpjejhpcnRxZitjWkRVSGQ4VkZPOEwv?=
 =?utf-8?B?Yy9mK3c1UjVob1pLMXQxSlVOTlVQeTd1Z0plZFJoZnNoR0Q5VGZyMDlhWUdq?=
 =?utf-8?B?enJUNHNrR1dlMTRxZkFBeU4zQTlxd3dXRXBrVlNyK05HdjQxVDVZWEdnRVhw?=
 =?utf-8?B?UHVmb2JUK1hRemdFdXcyYTBubWUxckREK2dEb2ZzNHVWNmxYNEt1dmJHdUpL?=
 =?utf-8?B?dlUxR3FsSThpYlhPTFVZVUFnYlMrZ1VGUnptdWJyUGhzbWd0NStDbWFiZmhL?=
 =?utf-8?Q?6EymXziPlRuZgsKYHY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe680104-fc6d-4125-c4af-08df14f17827
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 19:25:44.6641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dW6f9JsiTxQHvLt0KptpibeGPec9xfbG9HYOFdyqCN19GQG6NWryTM4OfO1YTc8O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6521

Hi Reinette,

On 9/16/26 00:36, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/26/26 12:32 PM, Babu Moger wrote:
>> +/**
>> + * rdtgroup_kmode_detach() - Detach @rdtgrp from a kernel mode association
>> + * @rdtgrp: Resctrl group being removed or torn down.
>> + *
>> + * If @rdtgrp backs the active kernel mode association, disable the
>> + * hardware association programmed for the group's kmode_cpu_mask,
>> + * clear the associated kernel mode state, and restore
>> + * RESCTRL_INHERIT_USER as the active mode.
> 
> I am not going to keep pointing these out but please check entire series
> and remove all these verbatim code descriptions from function comments.

Ack.

> 
>> + */
>> +static void rdtgroup_kmode_detach(struct rdtgroup *rdtgrp)
> 
> Similar to previous comments this only seems relevant to the
> global per-CPU kernel mode so function can be made specific to it.

ok.

> 
>> +{
>> +	if (!rdtgrp || !rdtgrp->kmode)
>> +		return;
>> +
>> +	if (resctrl_kcfg.active.k_rdtgrp != rdtgrp) {
> 
> Related to comment in previous patch this double check of rdtgrp->kmode
> and resctrl_kcfg.active.k_rdtgrp seems to support that only one is needed?

Yes. We can remove rdtgrp->kmode field.

> 
>> +		pr_warn("resctrl: kernel mode group not valid\n");
> 
> Please just fix this file's pr_fmt(fmt) instead.


Hmm... It looks like we have a pr_fmt(fmt) inconsistency across multiple 
files.

Some files use:

#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt


while others use:

#define pr_fmt(fmt) "resctrl: " fmt


My understanding is that these will produce different log prefixes. For 
example, KBUILD_MODNAME will typically use the object file name, whereas 
"resctrl" provides a consistent subsystem-wide prefix.

Do you think we should standardize all files to use the same prefix? If 
so, I believe that would be better handled as a separate cleanup patch 
rather than being mixed into this change.

Thanks,
Babu

