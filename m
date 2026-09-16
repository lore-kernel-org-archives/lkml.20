Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012065.outbound.protection.outlook.com [40.107.200.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6E24DE70A;
	Wed, 16 Sep 2026 20:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592020; cv=fail; b=u0dRc2GIJjYiUDDsuGvu2guTosScBmJwCSmhOW1JhvfMVb8vQegOIdQAJFt+H4YN2wuf50TfZEFzYNYTp0GMczw9k/KMQneQV2PfQlwge8rS9HfYN2iZw29IjnfcN61z1MDLxZ29q+4SPKMmZNAHyIQfkdH/XDPg4P56492ROWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592020; c=relaxed/simple;
	bh=8NKNahbMOWDEmbIcWiG4h1FQZKTBNbT82GsaSbdvu0M=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ILLCRMd/MPVlJd4Z3C4YEruDhSiCM5AVmL8lz5+tT0diuUBqDyKHVUiJzEv6HIIYrL9Ewvw/zhe/Ah4L/IqHWKZUANCU1mG+ZZ7QumL5yWK6WjxaORTO9WHvwEMCaHtfbr0Cx3G3vpgxhn3Ssx08H77xx9iFwQNbo18Ql38QGJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NMuBRMwc; arc=fail smtp.client-ip=40.107.200.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NMuBRMwc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pofll8ZeweYt9xUnULP2o+nJDeEngg5ttiCD5ATvwUPKsyvv4EKhmaYwJbWZgGOEX4xIx9REdn7MCIUL5/c/pAjh3R+aKKSAC1C3BYyZ0EkFKFLkzo9gk4aRbZwvipRTqrNcTlW6lmVXnmrmDaaxvV3uocHSmVhdYH4CIbRRziikrq0koZDuI9YntlNFwlHH8zufS+2igQbB8jsge2718CunVI777BuHQs59icc+xGmapoS91eDGRS47t94fANUJdSTIFM3cUr4jYKDEOIPLWS7j8e8aOjzwJGVvTHAItzW7GKPbeMr8X9jyRsofFmeDSiYdjRdZuHGdSE3wqGg3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/7HvxLsSbeI9Clq7k+PI/hXkXG6EM09UUWruqE4yx0=;
 b=bIrIU+ad1sZLmoaF2Dnm8cC3ER0v9au20JKLJ4h15WtQcoPtMarqMn/NsPpjDasXLqV1gocIvlBtpb+O4buhsdduZXPIB56T4zZFZD6M4EKQbLp3hw0i8+/YDzaNBrWOP29x9whj/k1rHvTOrwEyQi8/Dc3ztciAUZcVPzpochy/a4ZvXqxZUA6o+Ng2DnSoR+vnSBZ6sTEZRfpkxxK9YurxHzWTVcAY1ZOtdJMZDh7eGuhTcEI5oStsshmpnJ4/RFNFri2VJaZtBa67QDdVdJyg3FMvm6kiAVuDn1GqNinZwoPApdyPKidSL5dD9e7NE6rfuQKEDYf46vyw88M/7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/7HvxLsSbeI9Clq7k+PI/hXkXG6EM09UUWruqE4yx0=;
 b=NMuBRMwcOygehttOgNFgAJbV7+C5NBsxZZoszEheUWhzROLex3nVODUtD8vA2J19uxKdaZwGH1VsqFgGq7fpNU5A4qL8tFN9B4LIHvYwmlNvlsIGZMeeJDsL31X93o3Q9CfngXkmOSlzqa8Ey1CaqWllGp4Ig3TWSDlSBxENikg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DS7PR12MB6005.namprd12.prod.outlook.com (2603:10b6:8:7c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 20:53:21 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 20:53:21 +0000
Message-ID: <869e48d2-f6be-48e4-95ea-31526d692be6@amd.com>
Date: Wed, 16 Sep 2026 15:53:17 -0500
User-Agent: Mozilla Thunderbird Beta
From: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v5 03/16] x86/resctrl: Add PLZA configuration definitions
 and data structures
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
 <702b88901bc62f07829144a96cc887471b427da8.1787772750.git.babu.moger@amd.com>
 <bd1fb563-15b7-480f-b80c-823c006d91b5@intel.com>
Content-Language: en-US
In-Reply-To: <bd1fb563-15b7-480f-b80c-823c006d91b5@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:610:e7::6) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DS7PR12MB6005:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a9290a2-a6a4-436f-9e60-08df14348aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|18002099003|22082099003|3023799007|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	3bfNK6JQgYzFtJ+3+WmN9FA/Dq6tNQhpFfxuHKndl37Gla75ECMs96i3KzJX42q5XoF5v85A3iM5F1tX2L0/hNUcXw0HLZN6P77yJqfjlhPRaC3Z8VFXOTx7qSEEdZ4N5hkhZ/a36cqqO3rGx+WhFGAPXIHbNcHdr/fhASHcC6KWSMy3IusxLrBrELlV9blZ6udoU28X4Xtg9xTnZPi9dmV+pOb1fWZmmokeiRU29QK+Wv+TCD1wAKY2+zy/b6z++TCfK0qOV0Ygo2SIjrt/alqo+PlHvZjIpcjTbY1Fn3PiUzsr2xnPPPLkFtr/HzyW9PLI0QRNg8d45BmFAX1g3m1my2rTxstbIglZW1U58KYaPG4le0K89WHbqRdhISO4cLWPR9ERX6IhinJ/DKZNdG2xyt0RS3ZNnIUQY4DhIT/KmhpafwybnM2HVWklKuj51dq8yol70HFv13n0eTMCmjX8wr8eHNudnS2tz1m8Sf3wV0kleR0ZfqvLLApslvM2UM/epVeRrdycCq+VtGhH5S88wLFy4MUBQIxCHRBF6iWDdHvcQMo+Ie66Ww7D89OX7y3Lr8RtouyuDnpaUl8gMU30ueGbaAIod05daXjVUjKuP6YzDqhYQUZojJA+O3/hoPgsW6q+j0Q0ZKJhlQZkDaoK0bS3FjPja0KMWDJp+Is=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(18002099003)(22082099003)(3023799007)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bktZUkxzL0ZZb2loRG1ldjNLYjBUVEZ6TENPQkRjSDZ2ZUNiRE1aOTI5STIz?=
 =?utf-8?B?NTNXNCtpWXd6ODltMHFnNjl4YTQ1YmdiY2RqdjVqclBmdE5mdDh6dDFCOStM?=
 =?utf-8?B?UDBDUlBrRXkxV3p4VWsrenBCQ1FHSnlDK3ZzaG9CdmlzUHQyRjUzbW5RNFJL?=
 =?utf-8?B?dXFPSGUyb2ZlNEZaM3ZMc2ZTZ3MveE1NU0lDdk5SNjlyRXdoMUtrRmlMdkNK?=
 =?utf-8?B?TDlDMCtZUWh5MGZTNXZMUDRXMlBJWmlZRXJ2Nm1GMEJBbXd2UVdsSFg1MVBr?=
 =?utf-8?B?S3FPMWJFU0FmMm9kOVM3d0piK2VsUE5HeXoveFBLRHl2WHdUODBHUndPM21h?=
 =?utf-8?B?TktTK1pFNnc2ZzNtY1NDR2lzZk43UWtHZGRMeFN6Vnh1ZVQ1TDdsVjFqWWpv?=
 =?utf-8?B?SXBsRTdlemI5Y3J5QWRJWEs1dTRDd0ovanJ2bzUwck1kcnJ3OGE3Q1h1TTVa?=
 =?utf-8?B?ejEwMjc0L3dyWUx5MTdLQU1XelN2VCsrOVZJdmlWemh4TStHalBWZ0xCTUUz?=
 =?utf-8?B?YTRzL3RDaG1md0FmcGJQZjZVL3hrdG1nZXZYT3NmMFYxU3N3OVJpZ3ROSkV5?=
 =?utf-8?B?QjlTV1F5ZlljaG04cmVLU0dVQ1VxT0tCYkgwdGJTR212UFZlbFd0bGVTM25Q?=
 =?utf-8?B?cndEbEF6WmNTcU4rOTYzTXNxVjNyaEtqN0Y4dkNJMVNyZlI1aUR6WjNHVCs5?=
 =?utf-8?B?YjZrTUdoSDVlRWlzbUlSSUR6RXJnTm5MbkVMckFEKzE5OTJuVDQvMWZ3WnR1?=
 =?utf-8?B?Y0FEZnI2dmFjMjEvSG5ndVdwNVFvUGQ4TWhDZnJxNVhKbzlHTEYrZ2FoL3Fw?=
 =?utf-8?B?MTZZU2wvZzNJVEJPTWRJN2VOenJMQVF2N0FNT2JMMnJIYVRRRTdSeXhvRUpZ?=
 =?utf-8?B?czZub0tkNXBiZDBOZ01GM3FzWDhnOVh4eXBCTVdZM3FIVVpOSEliT3lkUW9S?=
 =?utf-8?B?U1FTN3AwL3ZvMzZGcGFkaXJXV2RNNUdXVW1xTk45czAyYzIxa3RyT1VIaHlx?=
 =?utf-8?B?amQ5bVpvWXdJYXUxYTJOUHRtVzVSaTVPVWNIM05XdFVYYjdHWWh0VW9PSTlH?=
 =?utf-8?B?U2wrTWpab204Z3hnOWNRUTZxTnJTVVhFS3NQT2dCY1RIKzRLRlc3blJiSHNG?=
 =?utf-8?B?VXVrUjNLQzA4bnJHZ3FkeTd2b3o4dFdUOGk4a3RmbVVsNlR4M0NYcFNDYm94?=
 =?utf-8?B?S2s3UWE3cHpSTzQ3Uk03NFJGdEN0bWkzblBmQUdTNWNJd1JVeGx0NlBCRmJk?=
 =?utf-8?B?T0hLblJjQnZORUx5TzljaDVTT0M2T01sZ29DZ0VsdjJSUEhEaEw1NDY3MWJD?=
 =?utf-8?B?SlJmc2t5V1lXUWVsOGxDUjBqZy94K21DZUtJaGdlTEM1T2lHU09QL2NScm0y?=
 =?utf-8?B?My9DNktHVXRZV1hmUFpxY0c3QmNGK29SRUtjbE8rVkFYRU1iVnBQMjBudXBH?=
 =?utf-8?B?d1RJVGlqa1F3MkQxazJ3K0llcVNTc0ZKd3JpcmlrOElocjJ2QWRTUlV2YTJ0?=
 =?utf-8?B?WXVxaWdDZkEya2dRRWphWXAyLzVheENiTy85RS9rSnZMU3c2NmF6KzBsbmls?=
 =?utf-8?B?SHFFNVRFRDE4c0p4Y01ZSjJtdWQzeU5LQ0hUWG5NdTVSaDMrZ05uZjlIN3Vy?=
 =?utf-8?B?ckJmVlpMZkkrUDdRYmRIQk5HeEpZTjRjMDhqWDFNUG5KWFFYM3o4SUhHc3RI?=
 =?utf-8?B?QVZSSWlvWTU0NmRNMFlaVzNweElQV1NDQW1kWUZHVlZJZjF3QWl5dXJpcTF1?=
 =?utf-8?B?NFlJOWFUYVBPOWlzVi95RFhhOTFDaFZZbEIyU2EvR1lmV2tKbnpWZVN4dEZI?=
 =?utf-8?B?eUN6bk93RUVwZ2E5N2FtQmtlbW8yeGkvTWVjcHAvbmdBVWNOei9SV1cwOG1U?=
 =?utf-8?B?UkpJUmN4UzVlcU1VMkhXaWFFS1BZSFZ0RzJIbDV0MlU3T2tMZ0duMG8yYnVw?=
 =?utf-8?B?c05YVDVEcXlQZTd5Q0ZUTTVtbHROYms3QnZkVDNmdndkbGVDUnVXb01hUlVi?=
 =?utf-8?B?VHJuYnZ3TTBla2R0eU5jR2pKQ3dvMURhOUhkemtSbWJuT3lKZy9MdE9icENz?=
 =?utf-8?B?T0w0Q0owVXZ1a2d6SldKZXQ1bGhUR3liQkZwaGhNejhSSFNrcXhhWmREMnNQ?=
 =?utf-8?B?TWk2Q2Q5Uk9wZ05uK0NuT1BBNlkwd0p5bmprL1hnZ0pWVFVnV2htVHovTVo1?=
 =?utf-8?B?ZkRRYnhOVHlkR2dvR1M2ZExRKzB3SkZXN2ZISkxTeUw0bVpWV0tKVG9aODYy?=
 =?utf-8?B?Qm1ycUFNM2ZRa2pEb3YvUThkdndzdnVpNnRhZE1pMUFaNDJvTWVJY1A0dWRY?=
 =?utf-8?Q?jCVbUeMIFRUz5JFO7w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9290a2-a6a4-436f-9e60-08df14348aec
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 20:53:21.2803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZGvO/kAsgdQ3++bPitIADFDB5X8Mjtgz2GfDXQRwb+s8EyqzNizX0YFvJX/fLnt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6005

Hi Reinette,

On 9/16/26 00:16, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/26/26 12:32 PM, Babu Moger wrote:
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index e3cfa0c10e92..2f4c60487a5d 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -222,6 +222,53 @@ union l3_qos_abmc_cfg {
>>   	unsigned long full;
>>   };
>>   
>> +/*
> 
> I understand that this is not specifically kernel-doc (since no /**)
> but it clearly follows the pattern and also needs to match the
> style used in this file. Considering this, please use custom that
> describes members first before the long description? With members
> described first the long description can then use @ when referring to
> the members.

Sure.

> 
>> + * Privilege Level Zero Association (PLZA) is configured via
>> + * MSR_IA32_PQR_PLZA_ASSOC. This MSR must be programmed on every CPU in
>> + * a QoS domain. Each domain supports a single PLZA CLOSID and/or RMID
>> + * association, and all fields except PLZA_EN must be programmed
>> + * identically across the domain to ensure consistent behavior.
>> + *
>> + * RMID and CLOSID selection are controlled independently. When PLZA is
>> + * enabled (plza_en = 1), CPL0 uses CLOSID and RMID values from
>> + * MSR_IA32_PQR_PLZA_ASSOC depending on the corresponding enable bits.
>> + * When PLZA is disabled (plza_en = 0), the CLOSID and RMID are always
>> + * taken from MSR_IA32_PQR_ASSOC regardless of privilege level.
>> + *
>> + *   - rmid_en = 1: use the RMID programmed in this MSR.
> 
> "this MSR" -> "MSR_IA32_PQR_PLZA_ASSOC" or keeping text similar to the
> rmid_en = 0 scenario may make it easier to follow what the bit accomplishes:
> 	- @rmid_en = 1: use the RMID from MSR_IA32_PQR_PLZA_ASSOC if
> 			@plza_en = 1

Sure.

> 
>> + *   - rmid_en = 0: use the RMID from MSR_IA32_PQR_ASSOC.
>> + *   - closid_en = 1: use the CLOSID programmed in this MSR.
> 
> same comment as for rmid_en bit:
> 	- @closid_en = 1: use the CLOSID from MSR_IA32_PQR_PLZA_ASSOC
> 			  if @plza_en = 1
> 

Sure.

>> + *   - closid_en = 0: use the CLOSID from MSR_IA32_PQR_ASSOC.
>> + *
>> + * This allows PLZA to override only RMID, only CLOSID, or both. If both
>> + * rmid_en and closid_en are clear, the effective behavior is the same as
>> + * when PLZA is disabled, with RMID and CLOSID derived from
> 
> "derived from" -> "used from"?
> 

Sure.

Thanks
Babu
