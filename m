Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98E14963D2;
	Mon, 14 Sep 2026 17:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406231; cv=fail; b=lHkvRT3/UAkf+UsdFxTpu4zN3yummKyLcX2v3MbAWIo43XMDuxIZ7cHj8L8ajo0tDACkRNk53kUWmm1RpFrrbTZGgeJFEKrxe1RrcX52+oqgBTvZ//JPmxz9FaeSl3ZhHvF4gUveh/R40rVYH3BDTf9oNC2rAPxApvjh0E2H/5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406231; c=relaxed/simple;
	bh=+PH45/sOdbHE+AiG5o2WRtsizWTXyrVMVznDj9QlstQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nABguEWBXVZU/88xpOvR7qwFAzWlv0nmOqIbVsJBLahY9ar+XURGx/qLWfjDqMCUcoHdGtarNrt7I/bt3eOivDo2GlEMxiFY7B4Y2sGlR+DJJob4zBdJ5ZPMMFmZQd7zuiFO3ttDEl4zDqyscxHusX+d0HWCj9ZFiwgKfoNtUg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gN5R3siU; arc=fail smtp.client-ip=52.101.43.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gN5R3siU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0cC1nBcQxsVCsn8AFCvmp/bSLmIetjpS1QerzyvBqWeRZt4Pca/80MzssfPefRgTD/2wrR4ByHhpYvSN8J1MuZvXq886OflSA+/Vh595yCZ0mkrOADuGH6kh7LVsCRHBRp1BZIsResYPiYN/O4LhOn4uE6zVmskSEOO6eY6Z//e8nlegrlo/P+Yid3ei8kXFimuPrLqJsxmZoGKhBAoz71EFqBrIItg5NfQtXcAM1Jx8rNiUBsJZV1qT6WX16OVBC3wHQ6+pG6eOJuzpjnxjrTWu9C6qQJcYiTp6EzKSxAeD78hQvAwpvWzmwPWbRlH03O1wYurRMNuKb096478pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9RNv3YalbpP07okG+bt5y0Kj7j3+E4Nd1yb0U7cAFQ=;
 b=IxkcjpG0+PiqtC9hwrlw9rKhN4rQcMTZCfxVLLa4MGjKV5A/NrCrbwNfgJ8+C4biTHsMmb2HRl42Hy9S7aUXlT46OotmgV9rieURzUiA+UYBQ5/M0CXr0STlPA+qKVNFua8iF868Yzoq2DQuc3aG3L4PDeoIhijyF19weTZ6o3YrPBkgw3XrnDaswURezsIlMN0thsi4hNIAivUVqupCtGC/2demfiOJuLwAxDtRFcMyGrWTot6LUX+YbiW/8sL3+6CspI4HMXOhPEIUb8br9/G1Q/7InUBhqJZEYaoxiCYKyDS5Pf8mRbg4M6an+I8YobFRw1nEEM3CX1xBeLiYvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9RNv3YalbpP07okG+bt5y0Kj7j3+E4Nd1yb0U7cAFQ=;
 b=gN5R3siUHGTeRZ/ihxyuWFBmzAZHgaHqs2LQA5rX/suFm3S2K9coMhL4pnsaS8dxgRq4rX6Bp1mjpy6nFyclNNMNZlxoR3YNHzuU8ppzz9vG7jvzALZjUf4e9/MxD5vSExGyEEbushx6O17aygDcs8St2NIEarlpl2RWXNfWLeA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SJ0PR12MB8613.namprd12.prod.outlook.com (2603:10b6:a03:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 17:17:05 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 17:17:05 +0000
Message-ID: <10240e0e-6879-4378-8763-cb1a9baf1f2d@amd.com>
Date: Mon, 14 Sep 2026 12:17:03 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 1/3] x86/resctrl: Fix ABMC counter programming for
 extended counter ranges
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 bp@alien8.de
Cc: x86@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, eranian@google.com, peternewman@google.com
References: <cover.1788545152.git.babu.moger@amd.com>
 <9e85f67add9ac84f55e4b0fced92ed8994f8419a.1788545152.git.babu.moger@amd.com>
 <afd86b47-d508-4739-ba6f-fd1c341e09a8@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <afd86b47-d508-4739-ba6f-fd1c341e09a8@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0430.namprd03.prod.outlook.com
 (2603:10b6:610:10e::15) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SJ0PR12MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5feb94-0804-4ffe-2850-08df1283fff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|6133799003|3023799007|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	K9vrTD8VN5G+5O0+6Cq6gry9xGECsk7itKYy7CJAUZvrvIFkevQXYa3TNC6vTOCRiv5Wv7Yqree2s9iQ4W6jUSfEJVJ0B+2YbnminB6/P3vwRw88xWv3vf9b2d9or4kmfpwrrGAhG3nm5RPp7fDmL2E2Qdmu07+lmwN8tJguPrGaRmVR1TUEUPixPUh51iw1n/6i6bT3g+hyTEy2acseqWk6rqxkzsyu+LMLJ3GuDeOY3yqaaoK20sxRWnWxHq5IJlKqvRHQJ/6iMrhgcTPOsz1WMZzwzbjBtom3vcoRsohsyuBc+oD45F6kfAttsyK8i0iqUXLbG9b9o3Y7rD62PsG1P3CVZ6PxuRho74oZh6MswtcYZ4wekwpyFAn2Z+r2U/0FhkpIRXLwi3OVTbF6uX7JBssOSGx1gi0gCaaDt74Lotwg6leGuyIVt0i51mJoSDSIlCx65NQJ+h4t9539SvIX5UKrCb3OlgqozLj4lxbnPUr39HESXeOrI4BaBEtuvq1kUsQqfdDGwKvDY3+SVNQCwXzbydhgfNxBOuEcrF/64wTHQMjYrHN81JqVbfmpcB9HG8NRlPWQjhN2Ib2UdsXPodvt0FYF2+BDYEen3ZRG5y3l8+/yLsSCvbDnrII75CXNzmTocpLODC9gjDsXwtZ9cGERWa/gS6/98aAOuJY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(6133799003)(3023799007)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXBPbC9saVp1TUNqK0F4bVdqUmhlSEJyeDJEQjA4a3dQWFlCVkkvTmdEU1Rn?=
 =?utf-8?B?dU1GNXgxbUVwN3VrbFE3dUtlTGFFcmE3T0ZOUDIyUDhzTVhzcjJLNmI0c3RG?=
 =?utf-8?B?b1BLS2lTZkhzTlBBWXlhQnJOb1QwOEcvOWhuWEZ0R3pNQkpVWHdyckY1UHk5?=
 =?utf-8?B?L1FwVC9kM2ZFcDBKalZyU2dDc1hhRmQzVk54Q0src2I0clNQYmNiZ2NPT0Yz?=
 =?utf-8?B?M1h0cEllQUFPcHpnQld5ZFdzcjNvdlNxemh5OU5IV3QzTjh1Y1FOS1paT0Zv?=
 =?utf-8?B?REM5VGlLbjJXdVE5N09DUkVrTHBXd1lzSlZGR1Y3ZzIwSVFOZ0VLT0F4RnFU?=
 =?utf-8?B?dUJMcjUvRFd5UFpCaFRKSDlram5vUy9QYnYxSVY2clN3NnUyeXJpVVBON0FS?=
 =?utf-8?B?RHlwcWpldUlFUHhCenhzOStnRlBHMmt5RmpZRllQdm1yK2xPR2MxSjUwMjZS?=
 =?utf-8?B?YTI5c2NXTkJFaFpramcxSDI0OGt5WXg3VHlyeFNOUjF4ZnBZUWhjWlorM1NT?=
 =?utf-8?B?WDljdkFocEVHTVdMa0YxVmcySjR3TkNTWDhod1l5TjlQcmJQR0NDSzNSTCtI?=
 =?utf-8?B?dkowSlExWXVORGRERGlPT0tHYVFFcmlWZ3hDdXBFaGdIdDdYd1UwNGNSOTFh?=
 =?utf-8?B?YVJkQk0vRjFvZWpJK0JzNWVUNGd1SG92T0NlL0hiRXNscXovNEswRlNXQzh1?=
 =?utf-8?B?ZlVOdlZHaVV6VXlXazdFMUJ2WTVndG1TQUE4aGtRYjlTT0hwVWhvVEdFQlRl?=
 =?utf-8?B?R2RycGh2eW5tWm91ODkrV3FqMFBUU2o1ZmJvYUs5aTRGNkx4SzFoNjJpdmp6?=
 =?utf-8?B?bmJTK25ydzlQUEgzRXhnWnlzU0VMRGw3RTdqYUVGb3BQWHNJd0FOSVlQVWUv?=
 =?utf-8?B?a1pDL1UvY05BcXVsUXNxa3JISFc4N0tjM1Zocm42OHZ6cDRLSG1Kc3IvUGp2?=
 =?utf-8?B?bjJjWUw0RUdyb1hlZ1BFcTNzOE1Lb2NPV0hyWDJTb3B4bXErc3EvVTkydzVL?=
 =?utf-8?B?QzRrdEtQSDQ1bnZMdXgwWEN3VGZVc1ZnR1VhaTNQMEFJRVZwQjNXNGpSWE4z?=
 =?utf-8?B?cWpZeDNaTDFPamZqVGZoNmxCSmNVeTJlTXlHZ3pWdVFMZ2FvUkFtclM5R2t5?=
 =?utf-8?B?Y3NmVy9FOEFoZUhCQXcxODcwVmZZOS9DNS9kc1g2alBEM0M1Yi9zK2M3UGsx?=
 =?utf-8?B?Tm1halNWSXJla0ZlRmlkeUdpWS9MTnU5YzlwbnVUcFNDZnZvSDdMMXpuQXlM?=
 =?utf-8?B?eW1zbGhNSWpmWjc0bnowSzFGa3Y3bXk2UGtqdTZablZWdmZFb1NaN2xNMnRH?=
 =?utf-8?B?K2RGNUNReWNkSTVDUThsOGxqZ3kwa3NGOTJRTGFTSkVLcFhLd3hnZWw1VWp0?=
 =?utf-8?B?YVgwT3BRWmxEVFN1RFpxd1Z0Nmo1QUdDY2g0Q0tmSjlIUk5nMTRsZkVlNWpm?=
 =?utf-8?B?TjlqK3V0UnpoaW5mdHZwKzdSdW0vR2lSY1E0cDdBWHc5aFZFNEdjN3ZCWlVQ?=
 =?utf-8?B?NTlGb2VERWU3czgwUVdtaWV2OEMvN3pUY2dkeEhoL3N2bTFpbW5QbG1tbjR3?=
 =?utf-8?B?WXFPOHRSUEltRW45cjFWOStuVW9DVE5wa1YzNXNXNVI2QWF5bC8yTVNyTCta?=
 =?utf-8?B?TjB2dHFBeVJLSkQ0Y3JMcG5McXc4dG9VYVVqZnJBYU5zRmVoTlJWc0dZa3N2?=
 =?utf-8?B?c1phVHQrUk41ZCtLMitnR09SZUpRWE9YVitYNHdpcVdEc292aTk4NWk0ckdJ?=
 =?utf-8?B?bHBLME1IbVZPZGJxc2ROeFhmd2Z4SFM3UHFHY3grY3JLN1A5NlRMbUczMVow?=
 =?utf-8?B?bE85TjE3NkpQb0VFc3hQMDZNYmsrTDVEZTRrSkJsMDArOExDKzR2UkdFVjZw?=
 =?utf-8?B?aHlibTRqcnNjYkUzb1JHSlNwbThTREhOeTJnUjNOR1ZIMDZmeXZ3cnZaK3Za?=
 =?utf-8?B?UytHbXJtWWYwbk1wT0hpZFcyVFhZRitYV1d4T2Vxa0NzTkx0d1NVaDRpQnJL?=
 =?utf-8?B?anRmMnVSSWVtVWxJVlZiYTVXVG9jcGE4V0EvbjZVcDN1cGVnd2JFS3JYVWJ2?=
 =?utf-8?B?Zi9SckNaYTRubXBrQk0ySHE5Qm51UHZEb2FNYldpN2s5UnorNFJ1NVpZL1po?=
 =?utf-8?B?YXZGQlRKUVUwR2VFSnkxWURmcVJaUUZLakJsMnBXTXRwY0FKd3JTblNTKzR5?=
 =?utf-8?B?QnNlbmpmK2ZPNitoTWJTZmpmbnlOS3d1UTVxMGtvUTJnNk0vOWhHYzc3RklN?=
 =?utf-8?B?Q2lqWVl2V096RlJ6TjB6eUdGMzZDTzVTYWdvWE5tWG9zU3R3S1N6RTQzTlk3?=
 =?utf-8?Q?/cAtthHk6ykxFczV8g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5feb94-0804-4ffe-2850-08df1283fff7
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 17:17:05.5427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kO3kZwkVM6EPUf4iFtCfyfIWaJf4T4zd2+Dd9MTQxus0nhEAkHUB2HhELgkyRAh5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8613

Hi Reinette,

Thanks for the quick response.

On 9/11/26 17:03, Reinette Chatre wrote:
> Hi Babu,
> 
> What does the "for extended counter ranges" in subject refer to? As I understand
> "extended events" is another term for ABMC so this seems redundant?
> "counter ranges" also just seems to refer to one "part" of this patch so perhaps
> it could just be:
> 	x86/resctrl: Fix ABMC counter programming

Sure.

> 
> On 9/4/26 11:06 AM, Babu Moger wrote:
>> Memory Bandwidth Monitoring (MBM) can report incorrect values when ABMC is
>> enabled on systems supporting more than 32 ABMC counters. As the number of
>> active monitoring groups increases beyond the range supported by the
>> existing counter ID encoding, programming an ABMC counter may inadvertently
>> affect a different counter, resulting in unexpected counter resets and
>> abnormally large MBM readings.
>>
>> The issue originates from the ABMC counter programming interface in the
>> L3_QOS_ABMC_CFG MSR. The counter ID field is currently defined as 5 bits,
>> which limits the addressable counter range to 32 counters. On systems
>> implementing more than 32 ABMC counters, counter IDs above 31 cannot be
>> encoded correctly. Consequently, programming a counter ID beyond the
>> supported range may target an unintended counter and reset bandwidth
>> statistics associated with another monitoring group.
>>
>> While updating this logic, it was also observed that the bw_src field,
>> which encodes the RMID, is currently at its 12-bit limit with support for
>> 4096 RMIDs. This field also needs to be updated for future expansion.
>>
>> Also found one more pre-existing issue. This union structure can truncate
>> data on 32-bit x86 systems when unsigned long is used.
>>
>> Fix the issues with the following changes:
>>
>> 1. Update the cntr_id field handling to support the full hardware ABMC
>> counter range and ensure that counter programming does not interfere with
>> unrelated counters.
> 
> Sashiko's assessment that this statement is not accurate looks correct to me.
> 
> Looks like the enumeration needs a check to limit the number of supported
> counters if the hardware supports more than what can be configured? It seems
> awkward that such hardware could exist and unclear why the spec has a mismatch in


You're right. The spec overlooked this scenario. I've notified the 
concerned team.


Do you want me add this check?

-               r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
+               r->mon.num_mbm_cntrs = (ebx & GENMASK(12, 0)) + 1;


> the number of bits here. Even if cntr_id expands further to use the remaining
> reserved bits it would still not be sufficient to configure all the numbers
> that hardware may claim to support. Are there perhaps more field width changes
> in this upcoming spec update?

Two fields(ctrl_id and bw_src) in here are changing for this register. I 
dont know about other changes yet.

> 
>>
>> 2. Expand the bw_src field to 15 bits.
> 
> Do the comments describing the RMID field width when reading the monitoring
> data (__cntr_id_read() and __rmid_read_phys()) need an update also?

The RMID field width is expected to change. We can revisit this when 
that happens.

> 
>   
>> 3. Change "unsigned long" to u64 to fix truncation on 32-bit x86.
> 
> Sashiko found that this change by itself is not sufficient to address issues
> with 32-bit. What do you think of dropping this part of the patch and instead
> adding your support to:
> 
> https://lore.kernel.org/lkml/20260831174421.13921-22-tony.luck@intel.com/ ?

Yes. I agree and support that approach. Looks like all the maintainers 
are inline with dropping 32. Will drop this change.

> 
>>
>> The AMD64 Architecture Programmer's Manual [1] available at [2] will be
>> updated accordingly in a future revision to document the expanded cntr_id
>> and bw_src field definitions.
> 
> This changelog uses a lot of text to describe one of these spec updates and then,
> seemingly as an afterthought, describe two more changes in a way that hints that
> these should be separate patches.
> 
> Could the changelog be simplified (after dropping the 64-bit change) to something
> like:
> 
> 	AMD's Assignable Bandwidth Monitoring Counters (ABMC) are configured via
> 	MSR_IA32_L3_QOS_ABMC_CFG. The architecture [1] received an update that
> 	increases the width of two of the MSR's fields:
>                                                                                  
> 	1. The counter ID (represented by l3_qos_abmc_cfg.split.cntr_id) increases
> 	   from 5 to 12 bits.
>                                                                                  
> 	2. The bandwidth source (represented by l3_qos_abmc_cfg.split.bw_src), used
> 	   for the RMID, increases from 12 to 15 bits.
>                                                                                  
> 	Use the new field widths. The number of supported counters and RMID are
> 	enumerated separately. Designate this update as a fix to original enabling
> 	to avoid misconfigurations resulting from truncating the counter ID and RMID
> 	on hardware that support a large number of these IDs.
> 
> The changelog is just a suggestion based on its current form - other potential changes
> like the comments and enumeration checks are not captured by it, but should be if/when
> they are added.

Looks good. Thanks. Will update if required.

> 
>>
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming,
>>      Publication #24593, Revision 3.41, Section 19.3.3.3 "Assignable
>>      Bandwidth Monitoring (ABMC)"
>>
>> Fixes: 84ecefb76674 ("x86/resctrl: Add data structures and definitions for ABMC assignment")
> 
> Is this a stable candidate?

Yes. It is. Will add it in next revision.

Thanks
Babu
