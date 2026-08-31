Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012023.outbound.protection.outlook.com [52.101.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFA339B975
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213479; cv=fail; b=uz5eiGuvO6Ep2bsuIhDGHix5IgA5vxEXyleLb036QHkJRZQQrE5rJOASV0xKSazquV/WpDWTMW2jIJnhvyd0YPTbxx4Cn/vM8wXRosXWHr8Iizn1n+0W4TCIqmEXGuAHUYLHc6c4T0VuwdChnm6UECoASmzHWPdftX9jQ3m2Iss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213479; c=relaxed/simple;
	bh=5szoCtuMqWlBnfpshUTGmUyOOrJcuNHJa6wQlbflWh0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RtnjxjGI3hRZBhUmdNJ9ZSum+ucxvqD3jMy730hfQbZei5+44FzreUaLO00+X77KvUBfLRaMVJJ7QT1EzgiV9MyvEb7xQ2XL4/nCuRWTs38mF/FpoGlkA6elva/KWo9ztVvmCRb8uc7A9rzjgsChnnVrKOtxIJ+aMTzecH0hYd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oKVZ7Cy3; arc=fail smtp.client-ip=52.101.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oKVZ7Cy3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pt/LwjsjPz17+olQ58fZ1UV+nPlkcYBzSW6ktIpIxE9GO4lVf5RbX6sXx4IrehxO1KSKUtx+jyVC4XW1A6qi0dMikIHKH8DVEkHGqrLZ/yolz7sQMiYHf+ud2814YIbeGI92qZub+kmpn2V8WG1bjmcuMxIOPTFC0Ncwo7+KSuHSm4to4Q3v/e+iZFF0qLf4eUUEguK36t9KlQlmPsRe84kgN9yP2XitptCFTgeHusm8BQx1dYw6bXaU48aXlB1v7+ZOkzqd+JJFzR9aX2iMVJAZ+rAhQI5pjLJqE3pO5cdKj9TUD3WKS0Ln9NsTBOdgfSPAx8Z4QIRHrNqAvGT1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvR4958tdasmRxHWEs94RCPHwN/HxaAnbQAfywggxhs=;
 b=BSW6mDB+v54+q8+MWZPA+Ih8ERClX992X5iwNDuXgKRZlCG7+QqUJgoPlC9CdC+q65NeQPSF/MZ4ksGhHJlfmuqGzYDKcNuucf3FVvYv7Qza5fL0Gsroho65XmDZUgl3yVgFQGvS9uR1j7/aEax1Sc5GqQyA8ZLb80S6FA6cbR5+R6XdNGxHefrDDSiaJ+HEq6hwcull4uquZlpET7kW7sB0xvXi/Roh7Wk7Uh19aeAuLUMtqE2CbwbciwC+8lszhs2fuxw5G9Qj3kAWiZRePFi4elJ9Pig042ua1iulJvifw3FOhsqHLXjHEofaFfYHGvhY4iUdA1BhSDq/p7Eb/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvR4958tdasmRxHWEs94RCPHwN/HxaAnbQAfywggxhs=;
 b=oKVZ7Cy32eWOZPzw9Im9jZgocCT+J4S/K/76yp8mDV1vpnKaOTUSLhMYZTJxlaJjWTbYDuIhcgIExRVrUDk/53uOsHCjN/n2VBEwjiLvF2x8kvPJ753Uj3zSvGYNPCvwoM9IyQ4u9ein9WVPp6yNVN6YDC5dxqpeZL9ktP3i4avFvRDDB9mQht9AA3Upq/2iLxWWS1NnkOIVcdQcF0HzIv0m3e+JBk8Iq69RkFQZD3ivj36v5Qcxy6Wa6tT/8lVmMi8KI3xe+bceGk/pNgI9K0yvlF/jca+z3bgRy45oADamQ2ps2r1jhspEocd3aNp627/Sw5cMG/gvKiZChgF1pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PR12MB9670.namprd12.prod.outlook.com (2603:10b6:610:2af::6)
 by SA1PR12MB999086.namprd12.prod.outlook.com (2603:10b6:806:49f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 21:57:54 +0000
Received: from CH1PR12MB9670.namprd12.prod.outlook.com
 ([fe80::416:ea1f:d17b:2811]) by CH1PR12MB9670.namprd12.prod.outlook.com
 ([fe80::416:ea1f:d17b:2811%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 21:57:54 +0000
Message-ID: <03fc6a4f-8393-4785-bf73-d1c9f2c202be@nvidia.com>
Date: Tue, 1 Sep 2026 07:57:43 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] mm: reject zone device folios in more folio
 walkers
To: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org
Cc: gourry@gourry.net, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com, david@kernel.org, ljs@kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 usama.arif@linux.dev, vbabka@kernel.org, jannh@google.com,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
 byungchul@sk.com, ying.huang@linux.alibaba.com, apopple@nvidia.com
References: <c2577ec5-acf6-466b-ba66-0b3bcabbef7d@linux.dev>
 <20260830074751.25370-1-lance.yang@linux.dev>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20260830074751.25370-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ME3P282CA0122.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1ca::20) To CH1PR12MB9670.namprd12.prod.outlook.com
 (2603:10b6:610:2af::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9670:EE_|SA1PR12MB999086:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf2ee0b-90cb-4b8f-1613-08df07aae8b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eyjnubPE6x2zipfIN+EVrN7s2jp7AAZAJT7w0KeCQKBwkeK4FnGki1h60oJKVJ6r9eNWLRBOWDjnGtlMwZX1fLk+dD2v3pwG83wVAEw5h+JB+HpuakHgNX4hIetpyBV3c5oDIFttLPFmuLwmh23lbmpJqw9W6e5rfb7DvyUHO4sPbhnObL/2+VopIgnWBZx+AdevJLArD8978YlD+M6dPWFc5ATHhw5GDkxVJCbw5iGdXexoZWYxgxkeYAF9e4Opng6kx8w6y6Ih3giNd9EVEcaIBhYUMWJGL+dR5QqDSSLtjwzuFcBN1JF7KbfAisANi2qenTZ5TzzV2OA1m01VlsO41zQjLvleN03SzTJUqtFZEMmqRjJ8VKe9JdvmbwKvAlvl4k/LIwwgXdsdhLtiV66s3tmMk18BoX3znsSflqZL/TJbv4lbpDVXVRKBkGI1F5al3ftkbj6hJPyxL0BHDiWS5gHTFnkxPr2KHh9Bdp5ZyDzy8rgMIJ+Naugz5eFnz8CeT64OCtezLguigOcts1ZwQRLazECbwJtY9IDMz46fLpM9lt7xcDV25u/G7IzyMUCQbsPQoFxyL+q77BzfCXk1hpoEZNxsc431q5aq1cBYwtBOdLodcCYK1mLZ73Ev36JBoVZlR3pkJ1TwMfCeOnBzdiPiv1VE1/nuEcxkLt0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9670.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmRWemRud3ZXOGxzSUVWNUM5M1lOcmRjR0ZLVm9tdEVOcGRuZUU4M1hQWXFB?=
 =?utf-8?B?WjUwRHVwT0U2SGNrZGV5SjRuWHdNYzdqWDBxRHVBMW0vQVYwR1VmQ0dXL2hY?=
 =?utf-8?B?blNHKzBNdWVSb1d4NENaQlJCanhKR0hvZHhNbkdWalVvQW5KU01yREtBbE1i?=
 =?utf-8?B?SWhaMVdVRXpZa1g4VVptc3M1YWZZa2lQNC9YTjVacnV5ZDI3UkhJUkJZdm55?=
 =?utf-8?B?U29QS2JsaWpKb2hSZlNTbHgxQUZZQUpRS1NCWGNKUEZ2ZlNvNmFrQ3BzWFUr?=
 =?utf-8?B?ZTgvMjZWa1VUcUh1bUpiSTNHWnlhcUdabUFVVGVEQ2cwMXUyRFdiNG1lQ3dW?=
 =?utf-8?B?QVFoN0JPbmJLeEtIOFE0aVltVWdnV1lTRG5DdHBZUjk2RFNKdDcwL3d4Mzh2?=
 =?utf-8?B?OENQME9DbTB0ZitRVmtHNEtJVUFQL016VTdRNjNKZzZYZW5LVWpCaUVaT1k0?=
 =?utf-8?B?YndORUxQZW4vTkNhVEF2dXlVYi96S0g2OFdzOGlaVTlZRG9NeWNOc2ljY0NQ?=
 =?utf-8?B?UHpnUFBwOUhCdXFBVVZtUlR2WUJDc0VBeDlSemNUNUViVGR1M3Foc1VXVVlV?=
 =?utf-8?B?azVtT1pHbGFSVU5icGY2NU5lNkdjcXltSllOZ1l5aUo0OE4rbVFia2p5cjV6?=
 =?utf-8?B?dmZLT0U2cHpkVjFWQkxhVXA3eS9pZVdnTUhLS05iOUxUK0VOWGVZbnpMZzFQ?=
 =?utf-8?B?RWt5bXZMMFNpQlIzRXdESXNCbld3aGlyYXFyd1VWYnhGUkFRMFFuMkhZSmky?=
 =?utf-8?B?Z3JOTkFlZzdRcGhzbUUvd2VzYTVaNGVocDFENWZlL2daNUF6REJSY0pYSCs0?=
 =?utf-8?B?MFlTWGVpS05Vc2Q3NGxDSHFTeFdTQytXOG50czl6Qy9RZTVmTjQ0QVZQdDB0?=
 =?utf-8?B?VGNlc2FUUkMvK0U0OUowOUdMSFozdWU3ZzVra1BRUkFrMlhkZXg3VHp6WGxH?=
 =?utf-8?B?RFR1b0JzTCtFY2Y4QkpNTGVJV0d5K01kaCtPNFcwUnl5dkphNDQvaERXYWo5?=
 =?utf-8?B?QW1rc0ViSlBwQ1pFYXRZandER2FKVmE0MjYxVUVTU1luV2VZenFMdU8zZ2U2?=
 =?utf-8?B?VWNKSjNRckh3eHVTdkNMbno3bkhHVmdhZ1ZvcGdrTDExa3Y1ZVBieXVndVpO?=
 =?utf-8?B?aS90Vks2a2wvM3RwVTdCUTk2MksxWGNxVUgrSEgxMVZmdlFmTWhOZEFuZlNE?=
 =?utf-8?B?RVhwOE5OSjYvYUhyWUtlR211WFdIY0wyZzF1eGRqWnJieFozTnVqaGJRcngz?=
 =?utf-8?B?cHcwRjA2NHhxUU1EOGlVWlI4bndETnc3ZWxHVDdDb0ZKWnM0SkJoT2tUNnR3?=
 =?utf-8?B?TEpSQy9LUlJBRnNxVkRUWlJiQU1NUnVreUZYNHVPMkplRkU0ZlZuT3MzRTRi?=
 =?utf-8?B?MENvWEpjNlQxRWNEZnExVWNwRE04UG1oQ2lhaGF2K0Q1azVxcE0wcTB6Q2NH?=
 =?utf-8?B?QVBhSk52WkJIUkdIWEx0WWJXMCt4SXZpOTNDK0dGUWlRR3BVRzZsZktzMnNV?=
 =?utf-8?B?c05CcWU2WHlROTlVWXdRVEU5MU5DNkd5UzZnUjZQK3pNNUtLeGN5ZGwwQzNL?=
 =?utf-8?B?L2ZhZkd6UTNaRmlwR1ZrT1RQMTFMbDExT0ZtQ1cveGNCMWZMZ29UMlN2MUUv?=
 =?utf-8?B?d2pHakJmcHJmK3h3blVOTkVSR25TSDhNUFVoYWlkU2lMOWVXOTBoQUYyTk5P?=
 =?utf-8?B?bGlzM2ZuOWk1aWV6U3U0MnM2Kzh3UWQ5OVFnMGtyZlQrZmhLcmxacWI3UVJZ?=
 =?utf-8?B?RG5wa0tZZkRBTm1DL3crUmJZb1pTeERCb2VYeXIrVXViVTIxSHR1aytESVZJ?=
 =?utf-8?B?aFNVbnR4YjhsWk9PT2RHeXRqeUZhY2k0Nk5aR0tiNCs0aVYrZ1kwelVsbXN1?=
 =?utf-8?B?OEpPME9oMnpCZ3Nnd1l4QUpDakVWdlY3Y0NZT1dqRlNHQ2g0MnJvbzA4ZzQ1?=
 =?utf-8?B?SXlkV21VOXlNRXBnYWFvck9GY3o3dU9YdlNqYW9rV05MRm1JdkxmVjMzYTNB?=
 =?utf-8?B?QWUyci9uRG81Y09LSU55dkp0c0YzbWtwbU9xbGFWWWNYWC8yUUtKazBFSDI3?=
 =?utf-8?B?QVZuRy9sc0FMQXhBSGg3ZzQzTWI0YkxaOUYwVmhCaWdwY3dWZ0FoM05vQmNX?=
 =?utf-8?B?dmd5MnNsc2FOSFVjbjZKQkE0UElnOUgxV1F0Q0JBdTVlR1VSalBaV092STVD?=
 =?utf-8?B?MnFiVTladlV4THZFT0ZzV3hFSUc0cW0ySklQdURmTWhoblNCWXV3dVkweEJK?=
 =?utf-8?B?K1ZQemxuY3JMcWtsRzZDeGdvSHRrTmlBeXVjWUZWWlJ1NFl0UEU4VHZvb2J6?=
 =?utf-8?B?bEV4NFF4dWlzRU9GVjhaU2xWMmlkTlVpOU1naXpxRFpGbTRRS3FVUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf2ee0b-90cb-4b8f-1613-08df07aae8b4
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9670.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 21:57:54.1430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JaxQPjWr2GfgxExyJQBKw1LkPZrYtcAbxXMFKCvrIHx+FfVWUYVUpUdufACK/6gjvpOuyvzpOndl34gC7mvlfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999086

On 8/30/26 5:47 PM, Lance Yang wrote:
> 
> On Sun, Aug 30, 2026 at 01:18:24PM +0800, Lance Yang wrote:
>>
>>
>> On 2026/8/30 08:18, Andrew Morton wrote:
>>> On Tue, 18 Aug 2026 12:31:43 +0800 Lance Yang <lance.yang@linux.dev> wrote:
>>>
>>>>
>>>> On Mon, Aug 17, 2026 at 06:08:07PM -0400, Gregory Price wrote:
>>>>> Several LRU-oriented mm walkers resolve the folio backing a PMD entry
>>>>> (or a physical pfn) and then reclaim, age, migrate, or lazyfree it
>>>>> without ever checking for ZONE_DEVICE memory.
>>>>>
>>>>> This series adds missing folio_is_zone_device() rejections, matching
>>>>> the checks that comparable walkers already perform.
>>>>>
>>>>> - mm/huge_memory, mm/madvise: the !pmd_present branch above these sites
>>>>>   only filters device-private entries (which are non-present).
>>>>>
>>>>>   A present zone device PMD (e.g. device-coherent) would still reach the
>>>>>   folio and be lazyfreed / aged / paged out. Add an explicit check.
>>>>>
>>>>> - mm/mempolicy: queue_folios_pmd() can see a present zone device PMD
>>>>>   (e.g. device-coherent) and queue it for migration.
>>>>>
>>>>> No crash reproducer - this is a correctness/hardening cleanup found by
>>>>> inspection. All checks are placed after the folio is resolved and before
>>>>> it is acted upon, on paths that already hold the relevant page-table lock,
>>>>> so no locking or refcount changes are involved.
>>>>
>>>> Cool!
>>>>
>>>> Gave the whole series a spin on x86_64 QEMU with a PMD-mapped
>>>> device-coherent THP. Without these patches, partial MADV_FREE and
>>>> MADV_COLD reliably hit a kernel panic in remove_migration_pte(), while
>>>> mbind(MPOL_MF_MOVE | MPOL_MF_STRICT) returned -EIO.
>>>>
>>>> With v2, all three worked fine, PMD mapping stayed intact, and data
>>>> checked out :)
>>>>
>>>> Note that both kernels used the same small change to the in-kernel HMM
>>>> test driver, allowing its coherent device memory to be allocated as 2 MB
>>>> folios so the PMD-mapped test case could be exercised.
>>>>
>>>> Tested-by: Lance Yang <lance.yang@linux.dev>
>>>
>>> Thanks Lance, you're so diligent.
>>>
>>> I'm wondering what to do here.  Gregory told us
>>>
>>> : No crash reproducer - this is a correctness/hardening cleanup found by
>>> : inspection. All checks are placed after the folio is resolved and before
>>> : it is acted upon, on paths that already hold the relevant page-table lock,
>>> : so no locking or refcount changes are involved.
>>>
>>> And you had to tweak the hmm-test driver to reproduce the bug(s).
>>>
>>> So when do we push this series out to -stable?  As a hair-on-fire
>>> hotfix, or as a leisurely next-merge-window thing?
>>
>> Thanks, Andrew :) Yeah, I'd say next merge window should be fine :)
>>
>> The crash is real once the mapping exists, but I had to tweak test_hmm
>> to create that PMD-mapped device-coherent folio, and I couldn't find
>> any in-tree production driver doing that today.
>>
>> So no need to rush this one, I guess.
> 
> BTW, noticed that the ZONE_DEVICE split handling only covers
> device-private folios, so device-coherent folios aren't supported ...
> 
> The call chains are:
> 
> split_folio()
>   -> __folio_split()
>     -> folio_check_splittable()
>     -> __folio_freeze_and_split_unmapped()
> 
> migrate_vma_pages()
>   -> __migrate_device_pages()
>     -> migrate_vma_split_unmapped_folio()
>       -> folio_split_unmapped()
>         -> __folio_freeze_and_split_unmapped()
> 
> And I added the device-coherent check to folio_check_splittable() and
> folio_split_unmapped(). See below. They can go away once device-coherent
> folio splitting is supported :)
> 
> If folks think it's worth having, I can send it as a follow-up :)
> 
> ---8<---
> Subject: [PATCH] mm/huge_memory: don't split device-coherent folios
> 
> From: Lance Yang <lance.yang@linux.dev>
> 
> The ZONE_DEVICE split handling only covers device-private folios.
> Device-coherent folios are not supported.
> 
> The call chains are:
> 
> split_folio()
>   -> __folio_split()
>     -> folio_check_splittable()
>     -> __folio_freeze_and_split_unmapped()
> 
> migrate_vma_pages()
>   -> __migrate_device_pages()
>     -> migrate_vma_split_unmapped_folio()
>       -> folio_split_unmapped()
>         -> __folio_freeze_and_split_unmapped()
> 
> Reject device-coherent folios in folio_check_splittable() and
> folio_split_unmapped().
> 
> Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> ---
>  mm/huge_memory.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 54494c3fa983..a5dd38e9a8de 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3937,6 +3937,10 @@ int folio_check_splittable(struct folio *folio, unsigned int new_order,
>  	if (!folio->mapping && !folio_test_anon(folio))
>  		return -EBUSY;
> 
> +	/* TODO: Support splitting device-coherent folios. */
> +	if (folio_is_device_coherent(folio))
> +		return -EOPNOTSUPP;
> +
>  	/* order-1 is not supported for anonymous THP. */
>  	if (folio_test_anon(folio) && new_order == 1)
>  		return -EINVAL;
> @@ -4354,15 +4358,16 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>   *
>   * anon_vma_lock is not required to be held, mmap_read_lock() or
>   * mmap_write_lock() should be held. @folio is expected to be locked by the
> - * caller. device-private and non device-private folios are supported along
> + * caller. device-private and non-ZONE_DEVICE folios are supported along
>   * with folios that are in the swapcache. @folio should also be unmapped and
>   * isolated from LRU (if applicable)
>   *
>   * Upon return, the folio is not remapped, split folios are not added to LRU,
>   * free_folio_and_swap_cache() is not called, and new folios remain locked.
>   *
> - * Return: 0 on success, -EAGAIN if the folio cannot be split (e.g., due to
> - *         insufficient reference count or extra pins).
> + * Return: 0 on success, -EOPNOTSUPP for device-coherent folios, or -EAGAIN if
> + *         the folio cannot be split (e.g., due to insufficient reference
> + *         count or extra pins).
>   */
>  int folio_split_unmapped(struct folio *folio, unsigned int new_order)
>  {
> @@ -4373,6 +4378,9 @@ int folio_split_unmapped(struct folio *folio, unsigned int new_order)
>  	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
>  	VM_WARN_ON_ONCE_FOLIO(!folio_test_anon(folio), folio);
> 
> +	if (folio_is_device_coherent(folio))
> +		return -EOPNOTSUPP;
> +
>  	if (folio_expected_ref_count(folio) != folio_ref_count(folio) - 1)
>  		return -EAGAIN;
> 
> --
> 

FYI: Device Coherent THP is not yet supported, support should be easy to add. it
is definitely desirable, we should get it working along with mTHP support as
well (TODO).

Balbir



