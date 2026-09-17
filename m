Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010026.outbound.protection.outlook.com [52.101.61.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4DF50EBE1;
	Thu, 17 Sep 2026 14:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654850; cv=fail; b=nMHR1/hFyjwUmnT1fu1Jt4RwqtIJF0IKAR/a9P8QPhqvtxeoR77KunSvpHFEvgDNBj2D8pEbr++ojyqtrYhVC8cm/e9Qd90yAGz/siTIAuWe2m8PNfMWwWNjUAaMou03sPCrlHIN6uwSV12RBMR25yGy2Y6N5Vu7RjWRInVgsFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654850; c=relaxed/simple;
	bh=57e3PbP3FT24gbHInETzTtMbW/NRPZoMqiLNoG3KKjw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=btme9BqYAaZiBsTeWYCe0jn/TDWX1Jm/nw9VIGYEd2Rmi1I1uVMEetyU2o/8V/wW8IWKG9TUD6Xhni1Okw10Cky62/V8CLdHCCbmxpbEtLtYx5xQ/1lNde7r363Zw9aBcVuk6s7nUiAuZ02vDqziMYuGwUQOLPH2TJ/vtGoauq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tK6GH/4D; arc=fail smtp.client-ip=52.101.61.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tK6GH/4D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SijMQ1dXrDLDQaq+ALNoT92tYtDN/OAPsEc2p/zLsQMpm7UKyT9QxUgt40P9/xzYgJpDZ5iTaipaUnnNiQSgRuO7/VALi3CWb2uNmhsurVRtQ2TIGZNlqbqcjFCLVyx5pMhBnbJmSLfKOHdYXbJgkfGxC8QNUyZ454lJQf6c6nxpKGIqEE6cQCGesX9jCcAQFHeKqnBp0/panSCMAalHPU9b8BzveTfaRgqiT8mnQO41AlDiUUm7neGXEbkXvbmaZ+mNyJ4IWEWLiOIyW+0M6wK/pTEE9zgRi/CJf+wG5V3TPRtw0PYczs0vBKq4ee3ul1Nn+dzuyC22Blpx2+0Q5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrHUC2uoG0Llou6+vqF4pzkTzuQTjiSJlaKZlZ13gd4=;
 b=ImVEJKokuWT2e1TJVKzUVIz+cb4qv5vu3RNtSDaBBGRa0Y2kX/wuka4EvPIFKU9I0sSvD4QVYxglEwL1dqfY4e9xWIaAuHRX1dciu0FDRzVEOFB5EBuZuC2TXw5iRcjbAY2SxQ7zMFagU+3o2FBJPz3SXAcASV7YFWzi8qqEb9VJ4WGvZiTPzrNtpbtxbprkKi9pcg0vLzkGaCItmfv+3BdgFd3YqN3VjConslgLwaGIVX+n9DlKeZYzAKhzkU1dyzj/n9B8h5TF6aQM0S9Q+D8hm3b3tuzvWwid1IPGVxDx0KKZMVPi+BWPnvbiA2GI9UgQh1GF9Z2jAdE2qPl0ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrHUC2uoG0Llou6+vqF4pzkTzuQTjiSJlaKZlZ13gd4=;
 b=tK6GH/4D9HWlmDEYY505laWUwPUe/buNNAHLLyqsEnR+gfp90CU1RDwsmYXesDisvwjLTfeWPkEzznh60YJhNoYR4Ia75c48+bozSBDK3ld5ooDXxAD8s6FU3fxgEkoncqsg5b21xwyZMDwLTVwwsOL8WQiaywSXqD7trXE5JVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by PH0PR12MB7094.namprd12.prod.outlook.com (2603:10b6:510:21d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 14:20:29 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 14:20:28 +0000
Message-ID: <22c9d6f9-b777-4647-bd71-81803acc5519@amd.com>
Date: Thu, 17 Sep 2026 09:20:25 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 07/16] fs/resctrl: Introduce
 resctrl_set_kmode_support() to register supported modes
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
 <077f2c8ea7e5b7ce89e63bf4a67bd74eee16f7ed.1787772750.git.babu.moger@amd.com>
 <2e0c9195-8599-43db-aced-dbe8a138956b@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <2e0c9195-8599-43db-aced-dbe8a138956b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P223CA0012.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:116::29) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|PH0PR12MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: eb15e39e-23ae-4a9d-6af2-08df14c6d306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|22082099003|18002099003|3023799007|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	a8ah+WkIZ9qd7yBR/cUEzU0K8HIzcEE3ZU1eHECMZ3EHBJ8HD/qdHR0xp7rgXSKgopmrgWNWQK/k4G7YxxqJIGyta/bj5DR7EveT2vMgoCOujy9IQsmjJKfqujHeW08CU9MWwx+M11lu0aA2F+R4y5bhScjB1/aE4z4jZVmnbkXiBhMklhLmgSpcM0PCnAH5z5dhiIlKFeFIUb+E60iABcZ8XuE2Hr7lg0wsNsOHvGR+0vwjBPkm3MQ2wI9uLKg/jDVPh3IQwlNB1UIWIX4FPwq+BM6gmHNKTbGU7UWnmge7OHiTYHSLyqYR8DErpHs92AqdLQCLxApIZgnrLv31ImYY3CqJcgqPLgSuF7Ez1ybd9XFCTgsM8CLJT++s1AQN1+RgVSVrqB6n6PPxPtwVlJi5BEAMffg6krdyAYeY1/0qIx3JgpAHAlHmkaO9m1K3dIXzRn/mAGK+kzjuefBG6as7KWpynlcDnV7UtwultuWbFlJ5dgA3biO2m4qpIWLG6mKwgXDXxUXWmUHuFcAis2/u7gYEAQ+c2vJTJ9E6bdJNUDxZ0HH33qmzETMvdyWHFom9oHjSsHsuEPr+24VqJ8Ea9Lo0yodteSWQw/NQiHJmVgr2YCK+t/+8DilU05PURJMfnLfHxkEUivgg5s6EEZEA0CTx0Qx9x5lF3HTIxP0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(22082099003)(18002099003)(3023799007)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUdUNHZmaDQzNHJLdUxtc2RvSWxVQTViZDNMbGVwc05xOVE3WTdQOURMTk5h?=
 =?utf-8?B?QStZOGRYTG9pK25PL0hicEo4VCtqQ3dzK2xuMzE0aVF2bjdGTlNvTFRxNXpl?=
 =?utf-8?B?bWNOUVEyM0pGNXlWVUNsNFNNRGMwaWdrSXhKam1ZRE5EYnBIUnhxdTlzbWgv?=
 =?utf-8?B?TWQ3NUFQSmlkVXJyUEpCOVRkaWhlNXBSL2hlNDlGQ2hMYS9qRkx4MW81UWcy?=
 =?utf-8?B?SWFnTmdRNTlFeGNXalRUbklLMmtLVFVWYzUvSGNuMk5kRzJMdjQxV3NwUGRD?=
 =?utf-8?B?Z3JvQ3Jidzh1dkZtZGNBLzFMdjY4ZHVhb20vWStwK3oxRDhsVFhXNnE4T2Rl?=
 =?utf-8?B?ZDhYWWMvenJ6bmpsbjBUTUx2OHlaU3BndHZaR01yWjAzbHBGalZjVTBFd3NC?=
 =?utf-8?B?c1laeVZ1aDIwZXZLbFNsUWRpaVJEOTVYb0FKQVIzVlVhRlQydlhTK0Y3cXow?=
 =?utf-8?B?TUpsNlJaVDBYYjk2Q1IwM0Z5dlhEQzVNOUFjL2VaN0MwNEdCNDAzVUdmV2Ji?=
 =?utf-8?B?OTh5VzRuQ1Yxa0J2WjdKMFp1RENLK0ZjcUpsWFgybG5pK0xsSExGbzFOMGhj?=
 =?utf-8?B?Z1BpOGh1bFBKTXdzOHZIcVdrSkdKdjd1bUYvcy82WlMzaVk5YTNXQmlaV3dX?=
 =?utf-8?B?azRXRFB3QzhuTUZEUm5MWXBDTm1TZDNaYkpkMVdEYmVIV1JiOVpvMW5oWUJm?=
 =?utf-8?B?VENqM2hMSmhvLys3cWNOMGRRQS9wSkhjZHFPRFhlRlJ0QUJTU296eGprZkJ6?=
 =?utf-8?B?RHJNQVdLb0FleHpYdnhTQUd2cVIyZ0QwVTdiNHFBQ1VyY2MwUUdWSC9oZ1Vq?=
 =?utf-8?B?SGFDUHR1QkJ0M0Zic05mTGpvbW0xTFFpeUd5bFdQWlJ4M0xScDFraDJpU0xt?=
 =?utf-8?B?dUdsSjdHcG9nZEs5ai9Qd3lPeS84d2IxMCtKYzBmV29GOWRNNmJhWlQ4MlJQ?=
 =?utf-8?B?eVJIdWpaTmRCeGdCRnhMbERDcUxQRGtOTXd4Z283bkkrWEdkdUdNaXpRTTdy?=
 =?utf-8?B?TUVYRWoydG5UVmliK0twZ09heUg5NXBVQ2UrRXJYcEkxWkpWUWFTTFBTUzhI?=
 =?utf-8?B?a1BwSGk1bjRJSnYrZUwxa3FCNGd0M04xZzY4U0I4b3ZodTJQTFZ6QXpYSWox?=
 =?utf-8?B?dmJSbGxBR1hXUVJLRFlZOHEzK3hCck9EN295d2NwajhYcWtCWFRvOEtabklr?=
 =?utf-8?B?ek9DblFtTGRrTGUzaTZqS0dodEtvRS92b1RtTjdhMlVDeGhORmhrOXJ3VjBw?=
 =?utf-8?B?VFFvRTR3QnB1anVCcnJTcGt1bWxGSHRnZ1QxRjkrbzZpcW9ncTBObVJnYStG?=
 =?utf-8?B?b09BT2dFUkZJa3FPMGlqRnVpSUsreEx0bjJjWHFuZEJodlZVUWV6Z3o0QzZw?=
 =?utf-8?B?Vk9Nc3cxcXNqait0NG9JZUhjNE1Zc0lyaXdIWjNwdGJQVG5KcWJDWi9uVW1B?=
 =?utf-8?B?UGVxWFNqeDFxTmtjdlpiZE55QitYMXNKZ3ZmWjJyN0l5aHIvdnRLN3o4SEZZ?=
 =?utf-8?B?R3c2Y3lIZmljeUc2RW1Sb0F2Y0RsbFJNL21mZEF3a0RYTFMvYno1WW5WeWtK?=
 =?utf-8?B?SzJWSXFBdTE0T2ZKZWZBTE5mZTJLU1lqYm1xZjZYYTd5bWx3bkRYbkhPaktM?=
 =?utf-8?B?dE51SmpodisvSjFYMDBEYjdTL21yV0J4UjVhdDBpS3d3aUszdWRPaDVPTzM5?=
 =?utf-8?B?R3pYVHYwY0dEOEtlQ2MzUk1RVE9rSzVueEdSaXJJNXhkbjZVNUw2ZlhqU3hr?=
 =?utf-8?B?VWhSY05nUm1XLzhMY3RZalV3WUVhcStQVXBHbkRGdE93WFJQTnNLQWhBWXpL?=
 =?utf-8?B?dkx6TTVWZDZUc2hBMTNpdmVQSTBGQlY3Y1pzbFFaNnFmeVUrZG5qY29lMUJW?=
 =?utf-8?B?WWtiUHNOeUtuZG5hci9ZOXJuWWpZSHhpaHVKOFhPcEEzZGZXVGMwMXNSbldr?=
 =?utf-8?B?QTNseHBxUnVxUlgyTHZlenhvdzZ0QW00V2l5V0g4MDBXQ1phQVhCL3Job052?=
 =?utf-8?B?bXdTRDZqSGgwa2RJREhvaEd0eDgweUNnM1FBSWIyanJtSkMzUmFQeFJNRmtW?=
 =?utf-8?B?aWxmNHhuOVFVRksrbDlhN05NeVpsOW05eHB5QWVCMDJTdHJldG9uK2xxajBC?=
 =?utf-8?B?QVphMFVLbklKRlh2cUhRYWhONnYvVEt3dUdJdzRlbi9TeW96NVY5eHFLamU5?=
 =?utf-8?B?aDQzSzVtV3ZXeTdrbzhiT294SURsYzhNMlVja3FuZWJGcndhcU9sRVBYVU96?=
 =?utf-8?B?VUN4c2hxUlBwZTR0M3pjTVRDdHNMSUtla0dSQmpkOHBUWDNza2VTOWI5YTV1?=
 =?utf-8?Q?5QUzoaYLbIoCDSzO+O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb15e39e-23ae-4a9d-6af2-08df14c6d306
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 14:20:28.7801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsI5MeHbxe4K9j+5AaSKZGubBdWqtj8RTnxFqBMcrcaCkoSobFDGEi0WiBEaqBsR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7094

Hi Reinette,

On 9/16/26 00:29, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/26/26 12:32 PM, Babu Moger wrote:
> 
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 3c53f3f74e5a..3bb0e3a203ac 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -892,6 +892,19 @@ static int rdtgroup_rmid_show(struct kernfs_open_file *of,
>>   	return ret;
>>   }
>>   
>> +/**
>> + * resctrl_set_kmode_support() - Register a supported kernel mode
>> + * @kmode:	Kernel mode policy supported by the architecture.
> 
> How is "Kernel mode" different from "Kernel mode policy"?

It should be just "kernel mode".

> 
>> + *
>> + * Set the corresponding bit in resctrl_kcfg.caps.kmode_sup so @kmode
>> + * is visible to the resctrl file system.
> 
> Verbatim description of what can be seen from the code.

ok.

> 
>> + */
>> +void resctrl_set_kmode_support(enum resctrl_kernel_mode kmode)
>> +{
>> +	if (kmode < RESCTRL_NUM_KERNEL_MODES)
>> +		__set_bit(kmode, resctrl_kcfg.caps.kmode_sup);
>> +}
>> +
>>   #ifdef CONFIG_PROC_CPU_RESCTRL
>>   /*
>>    * A task can only be part of one resctrl control group and of one monitor
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 8b30eef835aa..051aece77eb9 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -729,6 +729,23 @@ enum resctrl_kernel_mode {
>>   
>>   #define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
>>   
>> +/**
>> + * resctrl_set_kmode_support() - Register a supported kernel mode
>> + * @kmode: Kernel mode supported by the architecture.
>> + *
>> + * Set the corresponding bit in resctrl_kcfg.caps.kmode_sup so @kmode
> 
> No need to describe resctrl fs internal details here.

ok.

Thanks
Babu

