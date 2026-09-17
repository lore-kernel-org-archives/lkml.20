Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010060.outbound.protection.outlook.com [52.101.201.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3973AA4E8;
	Thu, 17 Sep 2026 18:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669621; cv=fail; b=Vf5xE0o/rG4ukoo5j3x5MbCMzBELjGYIhRUAwN1UCBYW6TwCZnKYCnF1P2Rod74LPd4sJbujR3C9hHWbWzQFERtGGXUzfH+NYA4ubAWXnth2GsKpRthIB5LvFy/6mQK8KpOif74/uOUouSBV/wTSM/Wk+GZ/+O5xo+58ExxsY5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669621; c=relaxed/simple;
	bh=zfNkGNa5zIkLF1sgRHgRErQNt3XEM9DVbK4vzSDMP7E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DPMP2NuQqTgj03SgfzPK15hmARP3aYC+EsN/ucyh/k0r6uipvj6I/oRI4JGuhh8pRa8onFT6B35hJgtkp7GXbsaAGls77ykOy0LoxaOSCc3P1wqDY8O/WWZPbaCQDkukqasIEBqauOiPBP/hVReA8OdCk47vWm50fO8l0DSRyfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=A7pj6WGf; arc=fail smtp.client-ip=52.101.201.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="A7pj6WGf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7FW/XGI6jYvPdgqfQckh5Qr5AqgQ4JcIBzWpy1q59AYWYvMGa2TdsF8gPC4FrqyJaY+ErFtxqne76c4dtANIwBwb+aAJrpoiJ/APkpQ7BsBYkXSErYwcnvjdV6U+Mi0bGncKHD3XkH4bf7CGNPBOKkXJwPd01QmPLFCGuN/CVVn59t5Y2uC2CXbdFwUpwpsfOhCWA5CI45R+TjzpPAiBcKKnMoMTrQ+6ARBu5wTC57KJ3juCyLlX9VIahxqkWyeX41eIJbygWfBGuhUQCHdMlh/msX5an19R3amazY8eg3rehJpcnz/G1YjKZxN7kRHnXWBVf07+C8jSNLMchdG0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBRjkuQkjwRkF520gfBvh52lLXx3fW8ngecQzD6xeqU=;
 b=lHnAdihDmS6nJLtIxWv4TjcXuiRvnwbErf9QBhX3r807q7UUhuuVhuD5M/IjxOKIR3eCV/o8xAbQ6hy9aMY9h/1oGGzN2rpKJ+yswdeROt95HyYSYZAsVLQPyaoAHBXvpzi+7/3Hjv2JfCbWr/4VR7ZsVOr29MupsZsEVbXocUGmYCgO1g55Vyxru/PfWme0zbCbkH4lFjrQhUM7Dp4bmAt6fzppGedII2Z16/XuKSxCfK/GmpETTxrnRPCH6j49kbq3riCEr2g/dwFnBPTYVSRN5GAhZYGNo9r9YVkgVhSULn0OGUSqZ1/4QW4XiNmdfryJFtikJfrSo8gDlGsgoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBRjkuQkjwRkF520gfBvh52lLXx3fW8ngecQzD6xeqU=;
 b=A7pj6WGfBfCfWNcMfL/88X4QBNTUR07hPCSNVXeO8I4D3+ZZotvkY4TaFEYrmAFprysv7q7bW7/jKheFU4TR0L//2ZEvydg5DJSoeTYBdBN9w2RnvT124eGG5X5gTF6nUTTIxTKosjoDPxt+NZ9k9+9WYiFGRdv0ARFuJhhEo7U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SA5PPF7D510B798.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 18:26:49 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 18:26:49 +0000
Message-ID: <114e1e54-3990-4498-9e27-42afa1aaa8fb@amd.com>
Date: Thu, 17 Sep 2026 13:26:46 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 12/16] fs/resctrl: Program kernel mode assignments on
 CPU hotplug
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
 <16b8b0e9d91c9224722691009317464c4d585178.1787772750.git.babu.moger@amd.com>
 <f93c9241-8fc9-4076-a290-47b89021e1b2@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <f93c9241-8fc9-4076-a290-47b89021e1b2@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0044.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::27) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SA5PPF7D510B798:EE_
X-MS-Office365-Filtering-Correlation-Id: abe456f2-fec1-4fca-ab78-08df14e93d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LOx7BJGfZDe8hsrZ+EAuxWOruSmZ8bZgrOkchbr1zg+o6fVhKDQAcOLsscNaqEv/szS7F8keZEWKi04jAOyfUSQBvCZtEG2DTnLOKYbo3OHkqHOn9M5AhgXLTvE2ZHhcDK9u7hAVVMuUMH8AI49Z9oXsTJea2IuBKncI9zScmGpuVeS6oWKplR4WvMbDHF/vdcwKyKwLV60F8hoqbjjPQBNv1+HItfng84ZQtbU9nHqupEMIg4RzQ7RLV9Ix+M7FuO7x/D1tNBl49qevM0Q+G9cFWv5MDHe/YcsjW2aDSuJhVFqKFVJGcYdC6A4rjsh6R2oPQdR9Jo2Vghr7h32KzflNEHyo5c8etCEwtd21sAkpS7upAjzvzQ3cqiuFU7rvRwsHcGbOu3Ir2MjFXFwAjuQh8fIk7tLSX1/cLrFV4zZnc+lBRurMvk2kDIQXOduOcrDlpQUlQ2wRI7zyET9BvsSfUrOEMqaIBnOTrkuTm3vOHqtxnOfV6UL2OsKclB9yKgznonyLaVZdbNL6vPIC0EdBGHpmRJRdx3qp2LfFeLxGzvmgrvn1YeaMlrl0z89wv9ZxLHUqzhjS7LWyF42bjBJUUIekIYQTVAgrgChKV3JgSAlWZEeYXXE3bjj/h6PAvYrfBA9nA/bxtwPKBGUq1QdI7vghYR3ZUaO/rrv3I+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RG12UzlrZVZIc0pDTFpJc0paOXRmK05nM3RXNDBpNmo5bGpydXBUWEo0cVZC?=
 =?utf-8?B?VmJXMXRMNzFOZktVcG1uRkh5VkpjQ2hCVWE4eFB6aEo2ajBEaUJiZ2dlTGtN?=
 =?utf-8?B?Ry9hQmIwY2hSTFY0QkQyd0ZrNk9lNWdEd05tMkRTelYzTzF5TDhSMlZqVHc3?=
 =?utf-8?B?ZXlUeE1HSEErdTZHTENNVEhSRThJTnBNdVZaYnhBWENWYlMwWlR5Vm9tcFB1?=
 =?utf-8?B?OEk0cDBuRFBYUDJNOVpSZHcrU0JDSlpRQUhIZXNWbHhCWXJHSFFlOXprWkt0?=
 =?utf-8?B?QkVTUU1heEFxYkE1K2VDWW5DNGRmamVYTU04K1dyUTE2ay9LU2c1T2xpcFpB?=
 =?utf-8?B?Y2Rha3hRcU1hL0lKdzMyNG9kOTdLUTZCdllRMEtMNVNLMGFsQVdlcUpxL3BR?=
 =?utf-8?B?citzVEhzRWRxYVcybzN0eWhBeFhUUSt3L2JMU0F3RC9pZHN3bExnaWZuSFl3?=
 =?utf-8?B?WGdnbjdoVFM5Uy95eEVxU2ZCOVNtSENxa1ZjWlFYa3ZmYTR1cUVMVERBMUt5?=
 =?utf-8?B?Umw3VkYxbit0MUdyYmxmK2JMVHk1UGM4S2RibDFEbCtIdnNsUVFObk9kajQv?=
 =?utf-8?B?YjF2dytrUXZzdnJ5Yks1OEtVWWVkR25GZnFnWUVZQkp2eUxrdHZxRldxZ3E0?=
 =?utf-8?B?dE5yUDJ0Slk5a2RnNzNtR3B3NWhtaXVCMGsxKzc0WThvQXYwZDBxT1lZUFRr?=
 =?utf-8?B?elRzSjZjRjVtVHZxRmlSTis2V1NOZVVwSFZOTHVSNlVvT3FQV0h4NHBQRmhJ?=
 =?utf-8?B?VCs4OGI0cklqS1kxM2QrT3NCOHVVTTB4cTZ4QXdwTnpIVFBEZWlNSDhvWm1L?=
 =?utf-8?B?ZGJVUGNCYjgwdUtYeGYrK3B2VkdadTFQNGYyazRDUVpoU0VNUU9OQ05JeWFq?=
 =?utf-8?B?aFhnTld2Vmk1cXlYQTdrWVZQSjBndDkvc3lEQ3JSeEhHSFU5VVhXOXU4SmNa?=
 =?utf-8?B?clB6SkYwN0VzZ3MrWjY5WkljZEdhQzl4c3drUDU2RnBZd2ZraXl3RUllQzU1?=
 =?utf-8?B?WFErK0VCTThEc2dIdk1DU0F5VzlrQ3hMM0ozbjhvUVVnZjYrVkhzd2FTM2tL?=
 =?utf-8?B?Z2tWeThoei9MSlRSSlZtcDdhTS81OXVjSnJTTGtjTEJRUkV5TlAvcTI0QUc4?=
 =?utf-8?B?dUN3aFNXYjVEV0swbDAzSTZyL210Z3RFMk5vY0ZDVXRNWDc1RFZIOHZKd3pl?=
 =?utf-8?B?WFlMY3lTVUp5R0hmM3d5dVl3aHBOSHJmV1NIUDRQRHJTTXp6YzVjdm1FRFNM?=
 =?utf-8?B?MmVrY1lwYkpYb2QxWVZBNHR0ZkplbUZIYnVZN3BmNWQyWXhSZ3dtZEd4QzN0?=
 =?utf-8?B?TldQOEFOY2tSTlFYaUl2VFM1amRXNjh0amhVRU5iWU10YlVrV2dKUFhhdkpo?=
 =?utf-8?B?eDV3UTdyWVFtOWpXRzQvM21DaXhZc3lFemZDYkZoM2p2akJTTmk4UGJHKzQy?=
 =?utf-8?B?VzNXMG95ZStDdGVrZ0orVzYrR29keWFWcVl6aGI1YUg0bUhxSjN6bFdUZkND?=
 =?utf-8?B?SW5lRERJb25iRnU4c3liRDRGQVBWbUE4T2t5UlBLcXZUVkxRSGV6Q2pab0Iw?=
 =?utf-8?B?WlBhQmF1aWUya1V0RWVmUDFITFlyTTI0ek95WGhGVnNUdEN4RjdZeUNQTWpw?=
 =?utf-8?B?NFRKV2tiVXJxd0FPVHJ6L2YxUUVIeTlQamZVWENJbWVNT3VuRnlCKzMvRThU?=
 =?utf-8?B?RDM1K1N1d0x1N0Y3YWthcEFQWjgxVnJlbEh5akRvU2lSZndBalJuY3pUL3V1?=
 =?utf-8?B?K3hQV0w4b3ljUG5wZXFPdVpPeEVPRTdsLzMvemF2NjNDZUw4bklzMEZqQ1Vk?=
 =?utf-8?B?MjNORGgxWk1nQUx5bUdYUWczbTNGbXFzaFlqNXlhRVlXRUFXYXZINkZEeC9D?=
 =?utf-8?B?ZUtYMUxwV0cweHRFN251MERRUG92NkNrUzVJYU1UcXI1S01RUDhHRkZBcFVB?=
 =?utf-8?B?OVFUWDVYY2dnQzJsTFpSOXpWSG1LVDlrRDlsOTErRVJPQ0REaHZBVit4UzFH?=
 =?utf-8?B?TzFRbkxjTzNlRU56RXl6SlNOay9RM2MwTkhrMnFQbjIrYzlEQVpBak01eVhY?=
 =?utf-8?B?UGw3UFpxUGFLMGJnUjZMVXRUL25VT1RpZ1hNbitTSVZBZTNVQ0wvM3hRTUZC?=
 =?utf-8?B?dnJUWTVFUno2WXM4R2hReUtpVFRQNDhVOWlKVWN4dGNmUktyQUZkaUpXWUlL?=
 =?utf-8?B?dU85SFo2SEVnRXlxQUV0RGJZUUowRVJPdWRxZ044aGQ2NDZDNTRHYU82Szhu?=
 =?utf-8?B?ckdxMmJLUFE2UXF1STZ2ZmZtNVdmL01mUWxFQjBuTGUzQmNyaGlGRXN1S2lq?=
 =?utf-8?Q?hRtmWiW14FlDFqUQ3Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe456f2-fec1-4fca-ab78-08df14e93d05
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 18:26:49.4815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olYO5MSD1cmAgQFq/a5fPq2j7tnWG4ANybbClCJGJqPfUN8GqtwKFSFfX1mAw8pK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7D510B798

Hi Reinette,

On 9/16/26 00:35, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/26/26 12:32 PM, Babu Moger wrote:
> 
> 
>> ---
>>   fs/resctrl/rdtgroup.c | 59 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 06e74b027044..97e4176669e5 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -4951,11 +4951,67 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
>>   	return err;
>>   }
>>   
>> +/*
>> + * resctrl_kmode_online_cpu() - Program kernel mode association for @cpu
>> + * @cpu: CPU that has just been brought online
>> + *
>> + * If assign_global_enable_per_cpu is active and the rdtgroup has an active
>> + * kernel-mode association, add @cpu to kmode_cpu_mask and program the
>> + * corresponding kernel mode association.
>> + */
>> +static void resctrl_kmode_online_cpu(unsigned int cpu)
>> +{
>> +	struct rdtgroup *rdtgrp = resctrl_kcfg.active.k_rdtgrp;
>> +	bool assign_ctrl, assign_mon;
>> +
>> +	if (resctrl_kcfg.active.kmode_cur != RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU ||
>> +	    !rdtgrp || !rdtgrp->kmode)
>> +		return;
>> +
>> +	assign_ctrl = (resctrl_kcfg.active.ctrl_mode == KMODE_ASSIGN);
>> +	assign_mon = (resctrl_kcfg.active.mon_mode == KMODE_ASSIGN);
>> +
>> +	cpumask_set_cpu(cpu, &rdtgrp->kmode_cpu_mask);
>> +
>> +	resctrl_arch_configure_kmode(cpumask_of(cpu), rdtgrp->closid, assign_ctrl,
>> +				     rdtgrp->mon.rmid, assign_mon, true);
> 
> If I counted right, at end of this series, resctrl_arch_configure_kmode() is called
> six times and _every_ call is preceded with the same two line pattern above:
> 
> 	assign_ctrl = (resctrl_kcfg.active.ctrl_mode == KMODE_ASSIGN);
> 	assign_mon = (resctrl_kcfg.active.mon_mode == KMODE_ASSIGN);
> 
> Could this be simplified with a single helper that does something like:
> 
> static void resctrl_configure_global_kmode(const struct cpumask *mask,
> 					   struct rdtgroup *rdtgrp, bool enable)
> {
>    	resctrl_arch_configure_global_kmode(mask, rdtgrp->closid,
>    					    resctrl_kcfg.active.ctrl_mode == KMODE_ASSIGN,
> 					    rdtgrp->mon.rmid,
> 					    resctrl_kcfg.active.mon_mode == KMODE_ASSIGN,
> 					    enable);
> }
> 

Sure. That will do. Thanks.

> 
>> +}
>> +
>> +/*
>> + * resctrl_kmode_offline_cpu() - Clear kernel mode association for @cpu
>> + * @cpu: CPU being taken offline.
>> + *
>> + * If assign_global_enable_per_cpu is active, disable the kernel mode
>> + * association for @cpu and remove it from kmode_cpu_mask.
>> + */
>> +static void resctrl_kmode_offline_cpu(unsigned int cpu)
>> +{
>> +	struct rdtgroup *rdtgrp = resctrl_kcfg.active.k_rdtgrp;
>> +	bool assign_ctrl, assign_mon;
>> +
>> +	if (resctrl_kcfg.active.kmode_cur != RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU ||
>> +	    !rdtgrp || !rdtgrp->kmode)
>> +		return;
>> +
>> +	if (!cpumask_test_cpu(cpu, &rdtgrp->kmode_cpu_mask))
>> +		return;
>> +
>> +	assign_ctrl = (resctrl_kcfg.active.ctrl_mode == KMODE_ASSIGN);
>> +	assign_mon = (resctrl_kcfg.active.mon_mode == KMODE_ASSIGN);
>> +
>> +	cpumask_clear_cpu(cpu, &rdtgrp->kmode_cpu_mask);
>> +
>> +	resctrl_arch_configure_kmode(cpumask_of(cpu), rdtgrp->closid, assign_ctrl,
>> +				     rdtgrp->mon.rmid, assign_mon, false);
>> +}
>> +
>>   void resctrl_online_cpu(unsigned int cpu)
>>   {
>>   	mutex_lock(&rdtgroup_mutex);
>>   	/* The CPU is set in default rdtgroup after online. */
>>   	cpumask_set_cpu(cpu, &rdtgroup_default.cpu_mask);
>> +	/* Program any active kernel mode association on this CPU. */
> 
> This comment is not helpful.

Will remove these comments.

Thanks
Babu
