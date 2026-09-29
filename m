Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010054.outbound.protection.outlook.com [52.101.193.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27363DFC74
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709468; cv=fail; b=bsTwPDx30bLiFh4aCCHpPp5PPwNntNxUvP4aOGUj3m/gBWbDgQ+x9Zcv6vPeJiToQTOec51xK1+DIrJiXWp674EI3yL+T1FZ8jTfXZ0JDkRCewST9o/mCWrQRAjXdsp1RjqEgSJcX0iTwl1OmzHwWLM0+1AdjD7riFF/jYVmI8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709468; c=relaxed/simple;
	bh=NchPWW9K+hUbjx582SSd/A2YqmVKxFt5h4dUgLESzUE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rkBtKR3C2OTHrRveBl0zpVogyjAwZWx3oh5Wshoeqgw9VhRlpPQfYn7BTaJzjHgD8cIC9yeaeGk5msMytn78lkR8jV2tJLjYlwJmJW1vF3CX4rN0lMMEJecmZO9ZS1uMCkeVPTZHsX0CgAPUSVCS4WtXt7++UElJPyG1mNoGYro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BF5p95M4; arc=fail smtp.client-ip=52.101.193.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BF5p95M4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cghqgw0xb2xE+07OmIcNq2ea27OJsGcZQkm6UBHtPMy87Cb7G56wDzVNR92mhLP9jpwrLC6shK8mjMnDFEqPFtrtlMIgZwAPyTagHueirXd9txOjI/ulSnxvgHiI9xZFZuRCxfkSkVvRsPl3vahOnSr2GD/Cagoyx3FM65ydbTHfSm1cAgIFNOosS10KSMK9QULsDNIVtxhoMyFA5rbedvlcn6luWSJyW6cyWH+PO4toBrg4fMWewrH+R4wVDGAV/mpUsZsbdtbfQ4Z4s8UgWLYputQu2r2+fkwupRQDH+4Jbp3cFs80/rrVZuvA/HtFAwecfO3UoNnxsgLfU8eriA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aLKSbcifLtUExcjFCj3P/iDTx88vDMsbZ+ZHpACKRw=;
 b=pSok8LhktIFmOyotOvGduqQbrqwuCZkRV7k0ZdICe9TUGKcrqGtaCsSIssBjhY9TtaaGlVUF6hk1J8wTM5mAqCqEVsKcBemSBAJGakILzg9ouFPq5xtN7gDIdYqOgB/AcxuLFoDIk5IBpcAi3QxGnH/eoO90DLmRj7At86SgBiPRbHoVYgbLXT0HAVXI2DTfb4/ztb1QJ6LKu19K/6gtO44yheFGiOIW5kT3NgblNRLuK2DxhYWXi2ihFqFEUasyOiUPX7GjTRLXNZBF4CQvQz21Q4KQMWAOcSvkdd7rL+LJ0Gz6ZKfBP68FIK4eKkzQ2NaK1L4VijQzJMfXgDw+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aLKSbcifLtUExcjFCj3P/iDTx88vDMsbZ+ZHpACKRw=;
 b=BF5p95M4NPDgYAiGkmLDSGtepUK2LmALfF3UVgB6iJovPlHzg8MycEobvCvJZaIgHlylhgDzpsqrizxIwCh5t6p+WX6GwAjiYi3tOyj8dO/DZWFTghIpd7zUBSO2uRO0vXUNHj1QcQt1VKv4/BbgKrkzcg52LKlJxo/a8s2AFcE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by MW4PR12MB7031.namprd12.prod.outlook.com (2603:10b6:303:1ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 19:17:39 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 19:17:38 +0000
Message-ID: <34bf0f1a-a0a5-490f-a14b-9fef6d6250fd@amd.com>
Date: Tue, 29 Sep 2026 14:17:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/resctrl: Rename AMD resctrl MSR defines to use
 MSR_AMD_ prefix
To: Reinette Chatre <reinette.chatre@intel.com>, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, tony.luck@intel.com
Cc: dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 Dave.Martin@arm.com, james.morse@arm.com, dapeng1.mi@linux.intel.com,
 peterz@infradead.org, seanjc@google.com, chang.seok.bae@intel.com,
 acme@redhat.com, namhyung@kernel.org, kan.liang@linux.intel.com,
 prathyushi.nangia@amd.com, linux-kernel@vger.kernel.org
References: <96992e30d6c02ebb7bdb58f2d8060bfd61274649.1784739398.git.babu.moger@amd.com>
 <483c5b72-5f39-435c-b6f7-0f9f4f7abff3@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <483c5b72-5f39-435c-b6f7-0f9f4f7abff3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:610:52::13) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|MW4PR12MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: 776fc7a9-9b52-4cfc-3ed3-08df1e5e5153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|1800799024|376014|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	cDoAac4ddVdR7A4OcKLePrxGjYX2yJiam7taNVfZGjYBuwZn1rjfrK4wKzUILsK1LgLF2T7nL4J0oiuAdgN+OUolVlVU4+nqUtlR+lcgJ5jfsL3WWDOvxZn0KjMCTj9whVB+bGFjMLVuH26jVOzvYKu8euor7/T5MnR5eGeKjkekj7VdnuKJs/OR7upRYq/o83DKBMX4J6H0gmGygnw7MYiU78UCN2mPsT+IsckG3F21jei3v7wg4qCxo5t9a648uvjVTRjqh1OlI+jKZ7f1k5wBANyr/x4mVRsQJ2NeHAAz66X7crmK61RchS/FZscU725tbW4M892VEQyKpvriOFEsu35WUs4x+HQevs4LHilBhXg/dDC09TMNtEfvueSoc7QnVZD1R+2BCH27E39nMMeBv6JdTlLf5hBImQLNMJEKufCs3NmmhlqIcCA7STOZDkKx46hxdAQSqB86d76q77YLHFutdyC/aeIgEk3tewNpDb0mFAecRj/8CthyCYrJCaZndatPQ3ecdmFgg4YnpnZYfo+/feiJY1PKawtm976HdlruOM+Z26Jl3DGas52Yl2jAuqxe185VTTkoHrJSRM6m2sY2bkh1CBOpBtniJoca9AwKTQtKyDFXMpER8PmNoko6whVYXKL9NDQ3FPN694vWoDTacZeHGMpnquhPLV8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWpFUS9hOW1ENkRkMnZET0t3dk1vUStpOENmRnVFM0xaYy9hL24yd0E1b093?=
 =?utf-8?B?bVFqc2FpaU9oYm1qc1NlZDRGMk9xWWVoaUNmelM2SHAzVWtEMGlFMnJ1VUdH?=
 =?utf-8?B?dW05Vng1SXZOWml1SkpRQTZ3NEhnWGovcjhnZGNnY1cwOGlOYm5RYTB3cmhB?=
 =?utf-8?B?aWdyS3RkU3paeEw3L1haY2hFdU0xL2dXc1NXemFIQUx4cnRJRjBvWVdYZE0r?=
 =?utf-8?B?UnJPbkt1cnB3blFQMm1JVW1FZFpYajR1b2kvWlBYTGt2Q2tIZEc4eWg4V2Fk?=
 =?utf-8?B?Vkl4YzFlUGV5TTZiQmRVcXlOb3A1K2lEekFlZk5URzlyYnovZU1nNnNJSFdO?=
 =?utf-8?B?dGQ5ZHpmMTUzM09qMVkwd2sxVGtsakJvbmNOZmlmeTVuM3BSTDVUN2hWN2Zo?=
 =?utf-8?B?ZEFWNUJXMFJrT09BTXZGYlU1WTBZd3BMZVNWdXlVT090N1JPMFBUYkUrUmwr?=
 =?utf-8?B?UmRXcTRrSGIwekZIblFoRnpXZzZrYUlTM1NvZTYzOU12ZjRoaDZPSEdWa1FG?=
 =?utf-8?B?OURvS1RscHNqU1pVUmE5UmE3WUNXWVNKdWhHb3BXcWQ1NFQza0RubDBhUHRF?=
 =?utf-8?B?TXczN1lBTWhGZE9rS2F4bUdOS1RMTGZ5bWhxSjlaSmtYZkpwNUtDTVNuM29E?=
 =?utf-8?B?R0t2YVEyTU1DNkluR2o4QW1idW9pd2EzSUhJaDlBM1NZQ2g3cG0xUmJsMldx?=
 =?utf-8?B?Q25MWmFvMnZoeG5NZzdsVS9aSElwZFZZbUpvS05xSGVkVERKU2RteFhEQTFm?=
 =?utf-8?B?MzBMTWU0WjdKZnAyZnJhUTFSZWpBSk9ma3RMSk5PckRnb3RDSjhhTE0rSU52?=
 =?utf-8?B?RzJlcGJHSG5KTWdZMHlxYkJlNEJiU3pWZlJPV0dVWnh1cnQ5V04ybWdkTENW?=
 =?utf-8?B?c3FrR0hZQ3BKNjNOODBURVpNS3pMZ1MyOGEwNnVhTnJBeGw3MTdqbTRmTENs?=
 =?utf-8?B?UG5FVDhtSnY0eHJRdjROZWF3aHp6dlZXNVE2Wit1QXppdGFMaUNZc1MwUjRu?=
 =?utf-8?B?UWRnTHArUWtpbXQyMWJWM0t5TmZVWUFkWVZMZkFuMlJsa1YzY2pKbUNHb29J?=
 =?utf-8?B?dE9OVnVaRXBFSTN4K2xIWGFERHRBU0pwaThRUEtoZVdxakNZNmFmVTh6V01W?=
 =?utf-8?B?QkhJTHF0OVRFRFRCS1NmSEhNN2hwQU1rVks4M0lVYkZ1Q282MTNNTkZhWkFU?=
 =?utf-8?B?dm1nMDRaWlhPU3QxbGhrcm96aFMva3NGdGJ0VEJRK3lMWHVqdThpRDZBN3lh?=
 =?utf-8?B?R0EwWUowaDNITFZhL3pXOUFXNUlIRmdudmRZdGpiU2I4MzY2cTF3V085Z1FG?=
 =?utf-8?B?S0t4Rk4zUko0N3FoNDF1TUhJZStPSVhXREg4QWlicDhrb2pEVVY4SWNOM2R0?=
 =?utf-8?B?YXRmdDBkRmR1ajZ1RDhLeSsybVZvWTQvWU16cEFNYUNJT1VIVER5WDY5VHYy?=
 =?utf-8?B?T0k1QlI2TndYc0o2a3M0aGl5SnVMUUwva3N2SU0wby8xRUtnNzM3c3p6Y3lq?=
 =?utf-8?B?UXd3SU45eVJtYWw3R05DNGtKc2ZHalI4dFVXTWl5eU54ay9wclVjMFI1QUc4?=
 =?utf-8?B?UFd0bGJFSmFsSzROODJVYnNLeVNPOTNHZ1UrejQ1RjdTRldNK1lSeDhtUGNu?=
 =?utf-8?B?bGY1eGIxYm8xaHJQUy9hM3RPZDkybjhHWVBjZWpsT3I5d0lZMXV6RTNBVlJw?=
 =?utf-8?B?QlhwR1p0YnRuZXRkTmxOTzJldUt6cFVsOFdPekFzc05pVkhPT1RXNkc3eUZr?=
 =?utf-8?B?OThvcEtmbUxKQ253d0FETXpKMjZoNGpRQUYveW11eGRwSUJYLzZVclNmQXVN?=
 =?utf-8?B?TysxQkU2TVZjOHZ1UDcrWXpRK3k3eFVMQWFEQ3R2YWJOUU9heG4rekJKeVd6?=
 =?utf-8?B?NjlFZ2lmWVlHNlVQZnlvbU1zS0RtUmp2RmswREtNRlA5a0l4YlA1aWgrcWkw?=
 =?utf-8?B?MWp5UHo1aGM1Nzk2aWtKTUd1NlQrMmFTT05Eem5ySlRhN2dZQXpRMHc0YzlZ?=
 =?utf-8?B?eXFiRU9kWnZWVkFBekRMN3FUN3VYN041QWdkYXpMbzl3Q0w1Q2RyTjdreTd3?=
 =?utf-8?B?WENsSW03MjA5cUNkR0oxdmJXZjBGYVpZT0Q0Y1k0bCtyN3BuT3Z5RjgySDNF?=
 =?utf-8?B?amkraXBXMUNvTk85N2QrNFNqM1RHTmttTTFGNTFadzV0Zkk2OHE0bC9oWVNT?=
 =?utf-8?B?OUdsQnhEc3hTdXEwb2JWc1ZRQVhPZG1rV0Zadk1mVjg2VEZWQkozSDNJZ04y?=
 =?utf-8?B?RUZiYm0rR3pKNVh2TENlMSs4bzljZ3FLVjBIdGZVV2Rmc1h2a0srZi8yUC9z?=
 =?utf-8?Q?6Bn6t9CWQKBwcGF0vY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 776fc7a9-9b52-4cfc-3ed3-08df1e5e5153
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:17:38.3175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdbNaw0WU8bQXKo78TkYe36jOGbsiozxNFMFn8b1yzmyf9xieIynwYPykWCnCP9K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7031

Hi Reinette,

Sorry.  Missed this thread.

Taken care of all the comments. Will send v2 soon.

Thanks
Babu

On 8/12/26 17:29, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/22/26 9:57 AM, Babu Moger wrote:
>> Several resctrl MSRs in the AMD address range (0xc0000xxx) were defined
> 
> "Several resctrl MSRs" -> "resctrl MSRs"?
> (looks like all of them were defined this way)
> 
> "were defined" -> "are defined"?
> 
>> with an MSR_IA32_ prefix even though they are AMD-specific and unrelated
>> to Intel's IA32 resctrl MSRs.  The MSR_IA32_ prefix is misleading when
>> reading or grepping the codebase alongside the Intel MSR_IA32_* resctrl
>> definitions in msr-index.h.
>>
>> Rename the AMD resctrl MSR definitions, update all call sites, and keep
>> the tools copy of msr-index.h in sync:
>>
>>    MSR_IA32_MBA_BW_BASE      -> MSR_AMD_MBA_BW_BASE
>>    MSR_IA32_SMBA_BW_BASE     -> MSR_AMD_SMBA_BW_BASE
>>    MSR_IA32_L3_QOS_ABMC_CFG  -> MSR_AMD_L3_QOS_ABMC_CFG
>>    MSR_IA32_L3_QOS_EXT_CFG   -> MSR_AMD_L3_QOS_EXT_CFG
>>    MSR_IA32_EVT_CFG_BASE     -> MSR_AMD_EVT_CFG_BASE
>>
>> No functional changes.
>>
>> Suggested-by: Borislav Petkov (AMD) <bp@alien8.de>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> @@ -114,7 +114,7 @@ static void _resctrl_sdciae_enable(struct rdt_resource *r, bool enable)
>>   	/* Walking r->ctrl_domains, ensure it can't race with cpuhp */
>>   	lockdep_assert_cpus_held();
>>   
>> -	/* Update MSR_IA32_L3_QOS_EXT_CFG MSR on all the CPUs in all domains */
>> +	/* Update MSR_AMD_L3_QOS_EXT_CFG MSR on all the CPUs in all domains */
> 
> I think this is a good opportunity to remove the redundant text when referring to these MSRs.
> For example, "Update MSR_AMD_L3_QOS_EXT_CFG MSR ..." can just be "Update MSR_AMD_L3_QOS_EXT_CFG ..."
> 
> This is indeed done by this patch, but not consistently.
> 
>>   	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held())
>>   		on_each_cpu_mask(&d->hdr.cpu_mask, resctrl_sdciae_set_one_amd, &enable, 1);
>>   }
> 
> ...
> 
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index 3838e0a13d36..a2c9acc7aec8 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -498,9 +498,9 @@ static void resctrl_abmc_set_one_amd(void *arg)
>>   	bool *enable = arg;
>>   
>>   	if (*enable)
>> -		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
>> +		msr_set_bit(MSR_AMD_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
>>   	else
>> -		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
>> +		msr_clear_bit(MSR_AMD_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
>>   }
>>   
>>   /*
> 
> The comment appearing at this point contains "L3_QOS_EXT_CFG MSR" - the changelog mentions
> support for "grepping the codebase" making this a candidate for changing also?
> 
>> @@ -542,7 +542,7 @@ static void resctrl_abmc_config_one_amd(void *info)
>>   {
>>   	union l3_qos_abmc_cfg *abmc_cfg = info;
>>   
>> -	wrmsrq(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg->full);
>> +	wrmsrq(MSR_AMD_L3_QOS_ABMC_CFG, abmc_cfg->full);
>>   }
>>   
>>   /*
> 
> ...
> 
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 30df902ea776..30c4c57e0e4c 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1785,8 +1785,8 @@ static void mbm_config_write_domain(struct rdt_resource *r,
>>   	mon_info.mon_config = val;
>>   
>>   	/*
>> -	 * Update MSR_IA32_EVT_CFG_BASE MSR on one of the CPUs in the
>> -	 * domain. The MSRs offset from MSR MSR_IA32_EVT_CFG_BASE
>> +	 * Update MSR_AMD_EVT_CFG_BASE MSR on one of the CPUs in the
> 
> "MSR_AMD_EVT_CFG_BASE MSR" -> "MSR_AMD_EVT_CFG_BASE"?
> 
>> +	 * domain. The MSRs offset from MSR_AMD_EVT_CFG_BASE
> 
> Here the redundant text is indeed removed.
> 
>>   	 * are scoped at the domain level. Writing any of these MSRs
>>   	 * on one CPU is observed by all the CPUs in the domain.
>>   	 */
> I just have these nits. The patch looks good to me.
> 
> Reinette

