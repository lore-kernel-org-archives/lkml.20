Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011028.outbound.protection.outlook.com [52.101.52.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FD93BAD9A;
	Wed, 16 Sep 2026 20:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592271; cv=fail; b=KGDY0Vi1WqgOcoJbjjZysAk/cfgBipeGOu2SJn54MYaNBCvAWn8UY1J8Q2zUM1t0z6+Dm9TYW0nsd68SBAMxHG+4Xf0gO3jxDjD0h26uZ89xJjVxA9bPXWNPTDXoSqbWk6+Zk4z5zrH4rHvfKHO7VX+qOfhPjMVjqrSLSNWPuQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592271; c=relaxed/simple;
	bh=A4yGostR6npogb+8in9EsfQg4Eezigz7JUvq4RLzGiM=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=stQ0d4bxrdW8vIU0BAJHBaSJRCzuW/cKrw/24lD/vuH/Qccaz9W4/pEMJvNubgvXsBg/zhgIyaQx/T6Eg46lXmSCGDORU6fC3znORzVueEycIi/a7kZivt9/k+YKqjle2bUHyXZDzvrfTcc0n6pGv+8KUnc8uU9twpniMzcXDMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CU1jdrEs; arc=fail smtp.client-ip=52.101.52.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CU1jdrEs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2Ctst7tRTxJKC+DrEEpm/j7TID1DshXVO/aHS3v2IdIBOXNYu5txCCAaZQMEk9GsJvMR7hXUTZ24LbnFYC1TX9Dlo8tZ9gjdRoMnApLLrs5TMpE1K45B42oCtqKw1OY1alB13qf1PXLNMVnK3EuMjBV0j4vv5c7IN/EoZ+xYIA890423EJOJx0mB1Eo4AbVuaHqYbh4B0lYnWcqCeVFxt4mKBxAVUPTYj8yM4If7gfQjCCAXfTn4STh4uTuB8r6+aiu6rIs+2jLVgvhKlrv68zXijVcgDhESa/zusmNSBOXtRni5pK+8lZnWtxYNqTp8DozbQjjf030z7fbYCd8Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eStqV4WSuGeBphbPNCj7tpeB5CailttDk4PeY1Ux4Vk=;
 b=BLhr5uu8CggMoZ+V4DAnby6k5rmo5BSdW/BsrG3wsymhodw4zPkCyN5yZizRiteqXkxPVYRpTgVzGgY4ThG11yVFge6JetZii9TfGzQhtfkcq2UUiKNqSiCAyukny//7QeQb5nysezLHELQHKuZ5CtRMCpLPpktOWsAPc0Fdqfg0tvgocb7kMPpfmcwGGx1DoVr3Ag7kdXWkyS1+QR8f1inqj0FVxc4H4fv9uZNRYXIaLI3A7F8AyIlPCwypWcNiQnac9uO6htmlZVC+YFPeHVRCUdk9Nc7pXu8tS+OQQJT3873JaGZrECaYHViZTFHLcoxOTUad2BA559rKOYwAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eStqV4WSuGeBphbPNCj7tpeB5CailttDk4PeY1Ux4Vk=;
 b=CU1jdrEsb9EL3QMlUy3K/rc7PlKuxMMkl3AMg3DF3/eRUCmZ/GLN8m4JOL98Ts/nNMMSUkKJ/k+YydwDPZwbLnLDINLxilx3zORmaJ2KyRVjKH8qM2IG7E3265d5G5nbmYH3uNY79eWGbm7SCYRbGzR6FZOu10mAeSf8D6U7JD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SJ2PR12MB8133.namprd12.prod.outlook.com (2603:10b6:a03:4af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 20:57:28 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 20:57:25 +0000
Message-ID: <a223c0c7-fa05-4625-af2b-369046913e6b@amd.com>
Date: Wed, 16 Sep 2026 15:57:22 -0500
User-Agent: Mozilla Thunderbird Beta
From: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v5 05/16] x86,fs/resctrl: Introduce architecture hooks to
 program kernel mode
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
 <be2bfecd0ac11f2b564860bb2066a7678466bc1d.1787772750.git.babu.moger@amd.com>
 <543008be-688e-424d-a7bb-398bf98b3613@intel.com>
Content-Language: en-US
In-Reply-To: <543008be-688e-424d-a7bb-398bf98b3613@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR17CA0026.namprd17.prod.outlook.com
 (2603:10b6:610:53::36) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SJ2PR12MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 06514453-e07d-4137-d91f-08df14351c40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|13003099007|6133799003|4143699003|3023799007|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HQjmU3tcebI3W4pPNSRYErXfknK7gjck5iYGzXAIdL+lA2mRgr+Ci/SMIoGU+YZPlGwiCmqigP6TBm4s0FtYeiGqgWQXzHfcQvH60mfV6m7GnqNi9roTaQ5tv2LX0sFnCdp67kMuMf1agcx7V74basJMp3S0ctlvQETdNXkbrSYEE7SJ2YoAEaPFHzxm6q5RCev0kMgPVonLHwd4iJW8RM4JgjFaRH8HBh1TUvZ9xX33BoZYBNX9pK/xicBz2tnA40yN2/V6F8Qe0mTTfCBRIM4a7ZjoBVTeoEkwIyzSEUwxXyOy/BFHSVJESI7x40OWQzkzN9io/INyf9WgPQmEpQHWZC5GJAAJz+5bkOOJHgQmPmQGQ2nPlVQ/rYBE28u5S0nCVTE/+d5/o48BMWlqfa8FgzNEDAQtOQ1duVYgoUIEovsxE/XH50DMNaEbQTiHTH4kgRjPiYIelUfJ2Vbt4QSKUzmGwXSAC834S89mdKKILUqzdT5jvoHqhkfmyoe53KTspIcEZg3r/GurfgYmvYnMzlhTTc96B3KpjdSjn2aheUgWrRBRFnFWs8aF7hw6Z74f4stk9qmbtXOHsx6dCtshe7LX/fZuz+OFNxpA8ldM5SY7JOLlrBfVCVIf+OpZbCqOoJNxcz4db/IuAQSxlJBJcm55vfUDpvu7igWQzEA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(13003099007)(6133799003)(4143699003)(3023799007)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWJBQXNxKzdpTTJHQWE4VCtPTWdjeHFSVm5RZmd2WUd5UXp6TUN1Vm1iQ0po?=
 =?utf-8?B?Smh1Y01xa3g1MGJBdnRGemcwU3ExS3RrNGovdXdhZlVPMGtsT29OQ2hEMFli?=
 =?utf-8?B?ZjlGL29MUmFSaFkvaUZlRnduVmQ3VUZZOUtGRGp3MXZFR242UXpIMU0yZGRW?=
 =?utf-8?B?ZEJnS25tREZCZkhIcmlSeWdZN0tYNDdvbW83RzYxakU5a2s2QlBGR1p4SXlT?=
 =?utf-8?B?VVBXZms0WjcrT0pLUHI0SFNjZ1BreVdRRm1pQ2ZiRndVK2pUSlNkelFxemor?=
 =?utf-8?B?b3NaODZlcFJ2cVB2SlRHZkZWUWhFaklQdVd6eE8raEdVd09JQ0ZvdVpuUGow?=
 =?utf-8?B?UjU0VGdyU3RGcDk2MVZJc2F5blZoeldTTzdZVmNWblBzSmJiQ2lnVXc0REZ5?=
 =?utf-8?B?UXRxUjRtb0w4dThjcGVoSUVVd1lwOExSSW45d1NYdjBOQXc4YjNBK0hoZ0pD?=
 =?utf-8?B?MHRmRXY4dWpNZFRVQlJqVkhCQll6dGlwbG9MMHB0UktuRUVrbEdtL2ROQVFM?=
 =?utf-8?B?UDgzMGRRRURteWJWMzN1S2JMd3pnNGNtaHNpZnNXQTFsREdJM2tXMmxJVG5y?=
 =?utf-8?B?NEFJbyt4S3VvMU1ZelZxaWd5N2F6eW43dXJJQkQ5Ni9YbmtUVHcxbzF5UFpM?=
 =?utf-8?B?VFBuRmtaMmY2R1BacUlzYzFibXlmK2JLbHhic1k0ckU4Sk9Kdy9JUkxHL0JB?=
 =?utf-8?B?d0FsaDZhdTBidTBmajRFclFYU1h5Q3NWV0hKVHB3MmlEVkxTbE5NNlBkMFVM?=
 =?utf-8?B?N2hTVUJZWk1NRExFdGs1L0o4eEo4YVEwY2hHbW1GMG9yNmRIcTFHcUZpc281?=
 =?utf-8?B?ZC9pdEpmVGZxRXRuQ3NEWWN0QzBTVkY1MkdFSkMzUTRZN0dkRFduSXlWcnkz?=
 =?utf-8?B?STY2R2h4M2FqL3JSK29OSFQzSThVbFFIT2Mrdm9JUDdaSE1rK0xFdm1ybzE1?=
 =?utf-8?B?RVB2eGJMdHExQldldFZSUExqOC9JdllRSmg1Zzc1ekJ5SStKOWJtMkt3aWkx?=
 =?utf-8?B?UXY5b0Rkd0MwQ0loTFpWSHlsQ2ZWU2g0ZUZXbmNVWGZtQmxDS2lUbmR2TDRp?=
 =?utf-8?B?TnFaK1JBeUhRWVVrUEgyUjNTbXd6dFNJYkFWNmFSUTVaQWo5S2MzQkk0amh1?=
 =?utf-8?B?K0hMMmdxb0pGRjRDOWpadFBYQlcva00wSXpYYkpnSEJISzNTZkZOQUVaNkc0?=
 =?utf-8?B?dWY1Z0dVOEhhbVRvYVJoYzZtTlorb2RMRE0xL3c3TTFFVzB5aU1QS1IzRHcw?=
 =?utf-8?B?ODRKbWNJem5IYzVwcVhzKzM1YVErZVhQdXkwVitTOE83UzgydHdDT2ZVak5O?=
 =?utf-8?B?RXFOcTdtazJBbkU5SnBFeUd0ZWdlaXZpWHVhU01RL2hGc0RtckNteU10YjdR?=
 =?utf-8?B?NVMrQzVPK3NOalRUMC9PVHhyeGR1aUN6WVZibm5DbThkN0U1V3pUSXZCUmVy?=
 =?utf-8?B?MUdkUnlEZHVwMlNmcWVmUThkRXBkTmZXRWVhSS9jZTZUc0xiNkdjcEorU0NN?=
 =?utf-8?B?UFByUStIc1NxSmZENS9iQmM1L2tIbmJNQ2lXRmdqMnVPU2ExRUR6UVc3VDhS?=
 =?utf-8?B?WU5kcG9FTldqL2RrYUNRRVZuQUpCS211YmZQeHZvdW4zY2p2bnFoZ3FaOWlQ?=
 =?utf-8?B?MUdjVXl5VVAzRkRPZlNLdUw5UlNIYWlrb1VuRFA2Z1AwanVUdGdjai9jRjRI?=
 =?utf-8?B?eThLS3k0R0xoTWVSK25YTE1mV1dreUlnbWpqQ05pWHM5Z3oyNkVZRDIvczg0?=
 =?utf-8?B?T2lVUHdTMVBSWG5GUXhpVXB4blNNcWFucUFBUDloWWh6TFovTHF2WHZmeVlQ?=
 =?utf-8?B?R3FUZjBPT3Q4dlNyKzJPbDlNOC9hYmRNL003M1lpaG1oVGhZL3JSTkxRWllt?=
 =?utf-8?B?dDYrdklzM2Q0WFdZQVB5NzB0dEFLR0RGak5PaFl6UTFTcWYreW82RFowdGc5?=
 =?utf-8?B?bG1IVkxLR1VZZ21WZXVRT040TWVoS0RwbFc2dzZNckZsSlJZcVlRb3ZaY1pv?=
 =?utf-8?B?RXRjbFdTcUJCU1JKdHFzTmczU2JNcTBUTGtnTXFOYmJtVGMwTktjSFh1YTN6?=
 =?utf-8?B?OHpLTlpET283dlR3bHZQQ2dsTlI5RVpTM2hsNkhRRjdFaEZxMDlZV3BaVkVC?=
 =?utf-8?B?Nit2WWVVK1ViMHZwUWx5bE9HNzZnTFVCbDNjbGNlNFVXbWV0UmpJMGk0a0tj?=
 =?utf-8?B?QW9rdk9KSFVlK3NqQ1lPdmV4bWFVL1Fhc1V3ajB3TXBZSlBNbHl3eEdKdUUz?=
 =?utf-8?B?aC9jdVJ3akN2M1ZiNDhXTVphY2RVL0F6aEdVWFpGSXhUQjJwSlRUWFZCWnh3?=
 =?utf-8?Q?U8eg2KTVe7j9e+jy5c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06514453-e07d-4137-d91f-08df14351c40
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 20:57:25.1222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+bGlp/xxSjete7bvpH3PUvEhU6PBMyRJALHyW+1OdTswrLHkGgst685LSC/0HY4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8133

Hi Reinette,

On 9/16/26 00:26, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/26/26 12:32 PM, Babu Moger wrote:
>> Kernel modes defined by enum resctrl_kernel_mode must be applied on
>> the CPUs when user space activates, deactivates, or updates a
>> configuration.
> 
> Not necessarily. This is just what PLZA/RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU
> requires, no? The "applied on the CPUs" seems specific to the
> RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU mode - hence the name includes
> "enable per CPU". Above text implies that all possible kernel modes
> require this, we know that upcoming ones don't so this could just be
> specific to the only kernel mode that needs it?

That is correct. Will rephrase it.

> 
>>
>> Generic resctrl has no architecture hook to apply these modes across
>> a CPU mask when the active mode changes.
> 
> I cannot believe this. v3 of this series wrote the changelogs of this
> new feature enabling as bugfixes. I asked you several times in v3 to not do this:
> 
> https://lore.kernel.org/lkml/2429a51a-92ad-4810-bee9-44bd6fba3443@intel.com/
> https://lore.kernel.org/lkml/57f6324b-6340-4633-b3a0-b40683a5ec12@intel.com/
> https://lore.kernel.org/lkml/10c18df6-d990-4050-bd79-1ca914eee673@intel.com/
> 
> v4 did not follow that style ... but now this style of presenting enabling
> code as bugfix is back in v5! In v2 I already expressed frustration that every
> new series seemingly starts from scratch
> 
> https://lore.kernel.org/lkml/57c72d52-e62a-44f6-a08a-891a354058e5@intel.com/
> 
> Now a new version seems to forget feedback from just two versions ago :(

My apologies. Thank you for the feedback. I'll address these issues and 
aim for a better version in the next revision.

> 
>>
>> Add resctrl_arch_configure_kmode() to program kernel mode allocation and
>> monitoring associations on @cpu_mask. Accept separate assign_ctrl and
>> assign_mon parameters so CLOSID and RMID can be assigned independently.
> 
> Below is just a sampling from the last two versions of me asking you to not
> just verbatim describe the code:
> 
> https://lore.kernel.org/lkml/db9c0b3e-184c-4100-b59a-91f6e818fd31@intel.com/ V3
> https://lore.kernel.org/lkml/6273f424-9701-4731-9568-10b3eef8b5fd@intel.com/ V3
> https://lore.kernel.org/lkml/57f6324b-6340-4633-b3a0-b40683a5ec12@intel.com/ V3
> https://lore.kernel.org/lkml/0764a430-f64a-4655-a44f-5c2ff15f2ed7@intel.com/ V4
> https://lore.kernel.org/lkml/0764a430-f64a-4655-a44f-5c2ff15f2ed7@intel.com/ V4
> https://lore.kernel.org/lkml/681e0257-80e0-44c3-b826-20e314a3eb0d@intel.com/ V4
> 
> Again, please do not just verbatim describe what clearly can be seen from the patch.
> Use the changelog to describe why the code behaves a certain way.
> 
> Maybe you need this request to come from Boris instead before you start following
> the guidance? Here are some examples:
> 
> https://lore.kernel.org/all/20240702124524.GEZoP2ZKcTcKl1ca1R@fat_crate.local/
> https://lore.kernel.org/lkml/20250911165433.GBaML-yTUZHkywuJIe@fat_crate.local/
> 
>>From here on the changelogs all seem to have this strange pattern of:
> "Architecture needs X"
> 
> "Architecture is missing X"
> 
> "Verbatim description of X implementation"
> 
> Apart from the issues mentioned above this interchangeable repetition turns the
> changelogs into a blur. The x86 format for changelogs is described in
> Documentation/process/maintainer-tip.rst. Just follow that. This should not be
> new to you.
> 
> Do not expect further comments on any of the changelogs that follow. I consider
> them all unusable.
> 
> I clearly demonstrate above that you ignore my feedback. There really seems no
> reason for me to provide any. I'll make a final attempt to provide feedback
> to *just* the patches (as much as I can without being able to use the changelogs) to
> try and help this work make progress.

Again, my apologies. It wasn't intentional. I try to address your 
feedback in every revision, but clearly I'm still missing the mark here.

I'll keep working on it and do my best to improve with each version. :(

Thanks for your patience and continued feedback. Please do not hesitate 
to call it.

>   
>> Implement the x86 hook to program per-CPU PLZA settings. On x86, PLZA
>> programs these associations per CPU, with CLOSID and RMID configured
>> independently.
>>
>> Provide an MPAM stub so the filesystem layer can call the hook on systems
>> without PLZA.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 38 +++++++++++++++++++++++
>>   drivers/resctrl/mpam_resctrl.c            |  6 ++++
> 
> Needs "arm" in subject prefix.

Sure.

> 
>>   include/linux/resctrl.h                   | 33 ++++++++++++++++++++
>>   3 files changed, 77 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> index e74f1ed54b86..40fd5e31c94e 100644
>> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> @@ -131,3 +131,41 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
>>   
>>   	return 0;
>>   }
>> +
>> +static void resctrl_kmode_set_one_amd(void *arg)
>> +{
>> +	union msr_pqr_plza_assoc *plza = arg;
>> +
>> +	wrmsrq(MSR_IA32_PQR_PLZA_ASSOC, plza->full);
>> +}
>> +
>> +/*
>> + * Program Privilege Level Zero Association (PLZA) on @cpu_mask.
>> + *
> 
> Please follow the custom with function parameters described first, followed by
> description.

Sure.

> 
>> + * When @enable is true, kernel mode allocation on @cpu_mask uses @closid from
>> + * MSR_IA32_PQR_PLZA_ASSOC if @assign_ctrl is true, otherwise the CLOSID from
>> + * MSR_IA32_PQR_ASSOC. Kernel mode monitoring uses @rmid from
>> + * MSR_IA32_PQR_PLZA_ASSOC if @assign_mon is true, otherwise the RMID of the
>> + * current task.
> 
> This just seems to duplicate the description of union msr_pqr_plza_assoc?

Yes. Some of it. Let me shorten it little bit for the context here.

> 
>> + *
>> + * @cpu_mask:	CPUs whose PLZA MSR should be updated.
>> + * @closid:	CLOSID to use for kernel mode allocation when @assign_ctrl is true.
> 
> Contrary to what the comment states the closid parameter is always programmed, whether
> assign_ctrl is true or false. A valid closid is thus expected to always be provided?

Yes. Will change it.

> 
>> + * @assign_ctrl: Whether PLZA should provide the kernel mode CLOSID.
>> + * @rmid:	RMID to use for kernel mode monitoring when @assign_mon is true.
> 
> Same comment.
> 

Sure.

>> + * @assign_mon: Whether PLZA should provide the kernel mode RMID.
>> + * @enable:	Whether PLZA should provide the kernel mode association.
>> + */
>> +void resctrl_arch_configure_kmode(const struct cpumask *cpu_mask, u32 closid,
>> +				  bool assign_ctrl, u32 rmid,
>> +				  bool assign_mon, bool enable)
>> +{
>> +	union msr_pqr_plza_assoc plza = { 0 };
>> +
>> +	plza.split.rmid = rmid;
>> +	plza.split.rmid_en = assign_mon;
>> +	plza.split.closid = closid;
>> +	plza.split.closid_en = assign_ctrl;
>> +	plza.split.plza_en = enable;
>> +
>> +	on_each_cpu_mask(cpu_mask, resctrl_kmode_set_one_amd, &plza, 1);
>> +}
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 9d223057953a..286284ac8423 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -139,6 +139,12 @@ bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
>>   	return false;
>>   }
>>   
>> +void resctrl_arch_configure_kmode(const struct cpumask *cpu_mask, u32 closid,
>> +				  bool assign_ctrl, u32 rmid, bool assign_mon,
>> +				  bool enable)
>> +{
>> +}
>> +
>>   void resctrl_arch_pre_mount(void)
>>   {
>>   }
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 4245d1e65ccc..8b30eef835aa 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -729,6 +729,39 @@ enum resctrl_kernel_mode {
>>   
>>   #define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
>>   
>> +/**
>> + * resctrl_arch_configure_kmode() - Program kernel mode association
> 
> resctrl_arch_configure_kmode() implies a generic kernel mode callback but the
> parameters are specific to the global, per-CPU mode. I expect that either the
> kernel mode self be a parameter or the callback be unique to the kernel mode.
> To simplify the parameter management this could be the latter and renamed
> to something like "resctrl_arch_configure_kmode_global()"/"resctrl_arch_configure_global_kmode()" ?

Yes, Sure. Will change it to "resctrl_arch_configure_kmode_global()".

> 
>> + * @cpu_mask:	CPUs to assign the kernel mode on.
>> + * @closid:	CLOSID that matches the RMID to program kernel mode. Depending
>> + *		on the architecture, the counter may match traffic of both
>> + *		@closid and @rmid, or @rmid only.
>> + * @assign_ctrl: true to assign @closid for kernel mode; false to inherit
>> + *		association from the user-space task.
>> + * @rmid:	RMID to program the kernel mode. Some architectures may use
>> + *		CLOSID/RMID separately, others will consider them together.
>> + * @assign_mon:	true to assign @rmid for kernel mode; false to inherit
>> + *		monitoring association from the user-space task.
>> + * @enable:	true to enable kernel mode association on CPUs in @cpu_mask;
>> + *		false to disable kernel mode.
>> + *
>> + * The function can be called in the following scenarios:
> 
> "can be" -> "is"?

ok.>
>> + * - If a per-cpu kernel mode is active when user space switches to a new
> 
> per-cpu -> per-CPU

sure.

> 
>> + *   per-cpu kernel mode then resctrl_arch_configure_kmode() will first be
> 
> "a new per-cpu kernel mode" - what does this refer to? There is only one
> per-CPU kernel mode, no? It may help to refer to the kernel modes explicitly by
> their enum value to be clear which modes this callback applies to.

Yes.

"RESCTRL_GLOBAL_ENABLE_PER_CPU kernel mode."

> 
>> + *   called to de-activate the active kernel mode on all CPUs that the
>> + *   kernel mode is active on.
>> + * - When user space switches to a new per-cpu kernel mode then
>> + *   resctrl_arch_configure_kmode() is called with cpu_online_mask.
>> + * - When user space adds a CPU to an active per-cpu kernel mode.
>> + * - When user space removes a CPU from an active per-cpu kernel mode.
> 
> Above scenarios all have the "per-cpu kernel mode" in description that
> confirms that this callback is dedicated to this single kernel mode and
> not actually a generic "enable kernel mode" callback.
> 
> Below does not seem to fall under "scenario" like the above but actually
> represents a contract between fs and arch that can be separated and
> highlighted.

I can add a line about the difference.

> 
>> + * - resctrl fs will always provide the same closid, assign_ctrl, rmid,
>> + *   and assign_mon parameters when activating a kernel mode, all
> 
> "a kernel mode" -> this callback is not generic so it should be specific to
> which modes it applies to.

Will mention the kernel mode name here.

Thanks
Babu
