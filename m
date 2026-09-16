Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011015.outbound.protection.outlook.com [52.101.52.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750BD4C33D1;
	Wed, 16 Sep 2026 20:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591645; cv=fail; b=TZfkAMAjS2lk1FTddiN4LYWSTeuDiTMSheKb5Sp97TuTguIIsHS0QB1eZItXPQcLLzrGQTELZerIBw/c5ucrz+ZeEspckuwdV+v/37rEU7DFKIIV7L+C8gTQ2SHS7BaAD7HXeQDkzKrlmpyFVVqZ2e/UWCthjQlM20QnCM4mCEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591645; c=relaxed/simple;
	bh=3t0LH1MspGB/JmbolheVleei8G25L/TSt/1U3XKhuJ4=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T+hCtdAgOE6XuH6fJlJa0D4yggWSkMgffJnPhTR8BsuTl97BYEsx46DlVDE7raLFekMKA7P5jI6sHLqtHbBQ5MLXU4e/fN8JQMKjgUjbcR0FUYYZqVkqIKJCo6ehVnlXvCdeS5ddsggeA/nYQgwFXZ2qGyWTGCKZb65f8SZvKUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BO66fMXw; arc=fail smtp.client-ip=52.101.52.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BO66fMXw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKGoMJEx+3246rgcAdN2fMa3URw1gCr4YT6H33Le12tl7a6zymfxH9bnMMzunnwBpd0jzO8uyCaS51GLvsnhgNOJd4Rpl7ZttxK//9WxAyCfdPWOv/lNLZYep0PhcNuHr6NtTS9PA16oBCIHQ7kEBp/P8ZDBZnsPCaDTgC4sS4FqSIbeq89MFCo/3EHDCSNBmadsN+NbDuAhwgU18OzRNroddQrIlRjTGnTVrKm7GB+S+c4/AyhTL0KVmBgu+QO9nwbBMcM1QXjWs8fMSM2zK0MYnK4rwlDgErE2to+4zWYRK4AKooKwLC03E8ETCvhgqQKODguQCHMsyf5bAF1CDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jf0cWG63jCa/vFTDcCkZ5ZZRtg9g7ASW+1J/rxSuz1o=;
 b=KaozMngQdvYUQSLB79YhJ/OPQPOvlZZda1NYzRLR5l9y4eaFiJZVJ0agDz/VUGhvB0140BGQKjrx5E5Oo3VL4fSI3lehjJyeb/vHPlDAZ/ZEK9YEIG821Fn/jdHLKmhIfU35LBwbaVikDZGfoP6iNgA3m/w/9tpdj7bi80C+szmKpFqa1M1jhbYEZg6sgju8yX/n45ltTFagHBHOJ1kqGHV3Oh25tENsvfmIIs2fWS7ObZIymM9cbQT5zjuelJ4U06IcFUbbZrLOMcS58rES5dEMLJgqi4SfYAetKA5wLHt0OZ8+fYhZnyuomtePBqeTrsZjYopW03TcytmwCpOSQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jf0cWG63jCa/vFTDcCkZ5ZZRtg9g7ASW+1J/rxSuz1o=;
 b=BO66fMXw8Az3DWgS8k1U7efl7I/RLZNZvxVcuSYsweux/JCgRSyW+uSPbZXh6+pdhljdaq6U37WbY4yAnxUW0Q2egiX7fH6S7m+Z1BoWM4cVMYMIayhUpZ3RVCm3vr+kJcVOnnuk+gag63Rc6LUkl8WRaggQ6Uk6M9/D90o5gsI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DS8PR12MB854423.namprd12.prod.outlook.com (2603:10b6:8:446::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 20:45:12 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 20:45:12 +0000
Message-ID: <d528fe23-3c1d-4eab-99ba-567983dd805d@amd.com>
Date: Wed, 16 Sep 2026 15:45:09 -0500
User-Agent: Mozilla Thunderbird Beta
From: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v5 01/16] x86/cpufeatures: Support Privilege Level Zero
 Association (PLZA)
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
 <1e7f4c3b0cb570f6e501a01d361745b180271f30.1787772750.git.babu.moger@amd.com>
 <0b4f2242-c22f-4557-99cc-ff622be9ee2c@intel.com>
Content-Language: en-US
In-Reply-To: <0b4f2242-c22f-4557-99cc-ff622be9ee2c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0228.namprd03.prod.outlook.com
 (2603:10b6:610:e7::23) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DS8PR12MB854423:EE_
X-MS-Office365-Filtering-Correlation-Id: ab3b2fa3-dba6-4701-e9eb-08df1433679d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1SjtDsggLgVlf9Lo0tg3HGOoDiBejBFlvRpnQHT/0CVRIdEEwDeEhLbkn+IXpDXuF+fq3GPWFESYpEdw9zX1ototkuQTn5dshkHmZCCSjteIrrxzCwtoVMZdQ/+EFta8nQx/eSePCH8cq+XLrf8gEfWrmSQ8r+ye38hW+fH25fkDuzFDxML3YjRu6WEjQCaIHEBhvcpvGCdnw9v7kziBGBt2iq5pZFEzDyHovRVMhIkzyL6B+fbr5DROIB/McXHL9jtJEuypqf5Rs3Sji9k0XHjnNITqZheMjNbvm16bu0294OOHO/w7yCZbPJqiKYbdbMx3nbXRR9cNIqylRAzHljCc5hq1ydwzX2d4Rh402TBBVQT3lEZ9gaWqAmHQcP2CBzx0TLfylRJ9WJDMqEGkciGpF2maW5fRfn/8UBOEi2LEZOmY/PQZyrJo4cYyPrim4zqkO4+mqKXyf2QMJVbxzXF4IMR9f+3OEk/9h0yM9+NMjHY9R/pvsPdwnJZL9eJo3Cq6Ysx6m1TF+KJ5cGfcLqmm7UJ8eeyhZE47gIvdjmIBLQ+RFoh3xgOb31l+EDUrxjqlKYXm0Yo7U6lPaBoQuw5N1Rvkh1W7eYRt3FX0vIPj6BTeZUze3Ou9PemWwiqBo3djOtzxPr3Td/b1JGNCE8Dv5lyfd7Mwhvez3lLTsW0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2M4OWc2UXAzN0hOc3orR01ITnpCZTYzM3o4OVRnS2lOcVpRU2xCU2JxUHk1?=
 =?utf-8?B?ZjM1SGhvVFFBYWlwdVJSbzBablNoTXVnZ0NXaFRZWmFVOG0rU1h3SXRVczJL?=
 =?utf-8?B?OXVWcEh5M2pEM1MwN3YzRnZ2dnoyWktpSEJ3S1RVRlRDT3A5V3Z5djBmODQy?=
 =?utf-8?B?bTZGRTZvWC84NWJuMFZ4YkFHNFIweDVoR2x4ZzI3OXNWT0ZHMzdncStWTkk2?=
 =?utf-8?B?bmRwRzFOb3NHb0Q3SEljb1gzL3lBU3l1MVBvN3BwcVJtWnVlV2hvWkc3N2Vp?=
 =?utf-8?B?dTUvbjhXRjc4SEk3bnI5MERwUDA5S1hSNU9IZmcwQ1JXVHRXWUw1Y0N6ZHdM?=
 =?utf-8?B?QXJ5ZFVEMUJEeldlY25GQnFNUWsxUFI4UWVCek04ZzVIeFFsNFhxM3VTNWlE?=
 =?utf-8?B?TWkxaEhRMjZNRVlQMmIzbjdFejJMKzVZMmpsc3lqb3F2bDNyNnMwMk05aThl?=
 =?utf-8?B?cy9hdEg0RUJxTnQxcjlCT2w2NmlUNE5seDJzZVpYRTRaMHlodThZd2RFWE83?=
 =?utf-8?B?WktmZkIxSmhoY0FPQXBQd3liMHM1dHd5Ny9GWEptRlNkckxvaldFWXVjb2tq?=
 =?utf-8?B?RkdJR3BEaDhEZXdCU2RJcUYxZXBJMnVDQ09IZ2RRL2c3QVJPd1kydnFJVWcz?=
 =?utf-8?B?cFJnK0FZSmZhTnJJV0ZBYXhneWFrUGF1YWhqS1JvK3hnT0F3UkFqSk9LMHM1?=
 =?utf-8?B?OG5UQkZPRC9IR3dVUDN4WlJWVjhkYXVKT1Jia1YvY0NBOWtFcGJ4UFpPSzVt?=
 =?utf-8?B?bmxINnRTdzZ6QWJzTnJoUU84ajV0SWR1bFRKbFkyd0w3SDY4OElNNWkrdlE3?=
 =?utf-8?B?ZkdWSlk3aWdNY0tpMHc5eGhScnpUKzZTM1FrdXdjZG1oZ1A3ejZyaTc2V2Z2?=
 =?utf-8?B?NThXOXB3Ny9OQmVHd3pUekNsaVlMWk9Tbk0zNWpXQ3RlK3lUTXNRQ0pNdUhE?=
 =?utf-8?B?WlpEZTltR0h1M0h4cXFDNFExZXpJOG5qVkt4aHNOVG9VdGNIa2NYZ1lCTllh?=
 =?utf-8?B?QzhSZTl1cnNjaDhzYjU0S04wbUtCSjhyRm9WT1hLbUNqREVySTdyTXp2WnFN?=
 =?utf-8?B?NWw0WGpVaU9oUk51QVBwcGd1UzUrVmMvTHoyL2QzS0NiRFlBZDhjMEdnQmJa?=
 =?utf-8?B?R21ISlFicldvQTBtZHFkOG9IMkVOVGRRbTNZRnZFcldNMFNIazc4TFZXM1BH?=
 =?utf-8?B?blVHcFRlNzRsNFVBeGRDR2hJSGJ6YVoxNkdIMkwxZWg5NkpENmZiNnNidXFB?=
 =?utf-8?B?RXhudDdMeUhxQ2tTWUl1aVdITDA3alhjS0RiTFBlZk9DTk11bFV6SnBSd2x5?=
 =?utf-8?B?ZzF4VDM2L3N2N1h3N2pCZ2E3ejJ2UTlXbXpnSEV0Q01ZSnhsN3BoOGkvWGtY?=
 =?utf-8?B?b1h5cTVkZVd0dStsVmcyYm1wRmk3azcvcnd6RjZuUTIycUZ6c2xOQUg2Rmw1?=
 =?utf-8?B?dk9sNzNCVXJ1TVlsbENDbWNGaDluQitTdGxWREowa3NLK21IRXpjK2tDRmJX?=
 =?utf-8?B?QW4wOWxtY3FQMm5BSlFlV1RIZU5VcVNGcitrZGJQY3Z1Z2s3eUZzVk9JdVZ5?=
 =?utf-8?B?djlCbi81ZFNZcEVxaWVlakxMcWdnN2NWRkJydXprWXhud2VtVWh4dFVxTmRQ?=
 =?utf-8?B?U1YzTTl6cHRYdTZXV0l4V1lKbHkzSzR0Y2FibU0yUjNUQ0NLRkxhQ2F5S2V2?=
 =?utf-8?B?SWU4SkNLNVp3T2dFbDMvZ1FVUFE3RGVqWUg2dVhQQS9rV3pTNjdIM2pwVzM0?=
 =?utf-8?B?a2dqOW9wK0llUm4xV3NrUDhEbEhpbGFWT0V0d3BZNlEvSmJSbk5RSmtnLzNH?=
 =?utf-8?B?aUZEZjh6M0VKQ2ZvVXlvdGEzcjdFU2lJVnMxbisvcGRXL3RObzdsRW9QOC9D?=
 =?utf-8?B?a1FoQWl1TEdEOWdNNWtDRHRrc0llT1YzQ01TZy91QnVzWXFkREF4Y2h4eWVa?=
 =?utf-8?B?VU9qSWUxUHQ4OU55T2h6YXNJMWNSeWptcCtuV3pVUitrL2ZqYmZ2L1l0cjJj?=
 =?utf-8?B?SG94UnVHVkh3bUJFd2xZYUFRY2tkejA1VWUrempuK3ZmTWdWQi9PdFlON1Iy?=
 =?utf-8?B?UVZKeVhiSlo0bXRVaTJhdXVEWjRPWWZldng4ZWZXSzIwcmdZckpLY1ZFZkV5?=
 =?utf-8?B?Q2hVNUc3TEluM2k4YnRoSjNtKzl4Y0V2OXB5bS9rb0dOMXkySlJZbGVadVFM?=
 =?utf-8?B?YzV6ekJQOG1uMXhiOXRCUVU2SytXd1JhRnFxSC8xMjAxMytoYUJKemY0OUFo?=
 =?utf-8?B?a1JFald1aEYzcUF1VWNUTFNEaGlzSjBFc05QbUh2cjJvSEJTczlEZjZNaXhw?=
 =?utf-8?Q?6b1zYQ2uUEeHd1sCga?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3b2fa3-dba6-4701-e9eb-08df1433679d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 20:45:12.5621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yI18XxFxMBeKFOXUj5om/qn2kpgW1Jk3g7dw7hj1dI0PX34cnjyOQouZWh0VvkdW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS8PR12MB854423

Hi Reinette,

Thanks for the feedback for the series.

On 9/16/26 00:12, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/26/26 12:32 PM, Babu Moger wrote:
>> When memory bandwidth associated with a CLOSID is aggressively throttled,
>> and a task with that CLOSID moves into kernel mode, the kernel operations
>> are also aggressively throttled. This can stall forward progress and
>> eventually degrade overall system performance.
>>
>> AMD hardware supports a feature Privilege Level Zero Association (PLZA),
>> which allows the CPU's CLOSID association to be changed during the
> 
> CLOSID -> CLOSID and/or RMID?
> 

Sure.

>> transition from user mode to kernel mode. This allows the kernel to run
>> using a different CLOSID than user space, which can improve system
> 
> CLOSID -> CLOSID and/or RMID?

Sure.

>> performance.
> 
> "... and/or separately monitor the work done in kernel mode."?

Sure.

> 
>>
>> PLZA also applies to cache allocation and monitoring features and provides
>> flexibility to manage allocation and monitoring associations independently.
> 
> This reads like an afterthought. Are users expected to use cache allocation
> while PLZA is enabled? Since only one resource group can be assigned I expect
> there to be quite a few sharp corners when both are in use. Kernel work done
> on behalf of high as well as low priority work will use the same cache allocations
> and thus neither could actually get full benefit from having dedicated cache
> portions?

The best-known use case today is to leave both cache allocation and 
memory bandwidth allocation at their default (maximum) settings and 
enable PLZA on all CPUs.

Users can, however, configure both cache allocation and memory bandwidth 
limits. In those cases, there can be corner-case behaviors and trade-offs.

If you think the current wording is misleading, I can drop that text and 
rephrase it along these lines to include both cache and memory.

"When cache and/or memory bandwidth associated with a CLOSID is 
aggressively throttled, and a task with that CLOSID moves into kernel 
mode, the kernel operations are also aggressively throttled. This can 
stall forward progress and eventually degrade overall system performance.

AMD hardware supports the Privilege Level Zero Association (PLZA) 
feature, which allows the CPU's CLOSID and/or RMID association to be 
changed during transitions from user mode to kernel mode. This enables 
the kernel to run with a different CLOSID and/or RMID than user space, 
improving system performance and/or allowing kernel work to be monitored 
separately."

Thanks
Babu
