Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012025.outbound.protection.outlook.com [40.107.209.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ACC4A8FD8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368559; cv=fail; b=pwjy5MdWDbYsJao2QV4EYK1F5iJRIBnbu/MiIuBWTJF4GG5zSZTSHHZchhjkHP2qDnDsTZcaBBMyrbxLqiCfTGgTyslis8lFI4hepSzIiwzfzAGBFsUD0s4b+ewpyRgxJw9e9QzMOVc4z37XvvqpiB5XHW/Mk+bm2feCl+QzVSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368559; c=relaxed/simple;
	bh=1s1uh6maCSfv3JEKRCmrS17J1LzPnrdnwxTxntIeUq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oX7eKqUPVZ6uruAjGCXzPl8j35Es1wfpeCKMRjdmojeA+XAYHMwjTSdyoS2N9Ksrvn301dMlUA7tUi5d0lIfXyaxS7PRoEs4jQyM8lkV36maZq5kXoGNWWRb7vrhnrHt5OFf1F+Sp0cc5TwRUqoKdnxRlNYJDhnIte/qPC5h/FI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FGW5OAap; arc=fail smtp.client-ip=40.107.209.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FGW5OAap"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKqFIj95N00K1VOFceoHwlolK4mhmL/f+KjzRSrZBbNgksRlOucuRujo78Z+CIVrlQ4P5wJdGLyDDfHwnWAD+1G0yIyahVigigijSEI45DQ+Fwa/GIvg/52rNjeLsR5v+Sd2yvLEChI/6I2RSsjQvyZNJuGPzARjSJx2mi2rLf7V95G68wOfJWUysIDOIII02x7MrHU8rhKV1+tgTO8uu9jdFh7mbA+IKOEyVqLXEA+cXG446Kffn8wFMrK1Je+PCvgE596pfUAKocGPztUTOFZMwqm5ij0rLsYcE8lfbTAyGetwBk8/Dc+56iXPsVdgw6XdSHSngElqDvlODAwbHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ykq+x+bVasKPYf2IiPSl+IrgBFv5mOW2J5YDbo5U/pk=;
 b=PUnfqmFIDyUgVHNONahA6FaZsC2fTZH3a1dLHnrReSkT1g21OB8kdc7JcesvEy/OalOmcvctcj07/k4UI5VhggF0zOfP9yoIMtwU9q7z7uzOBaxwFzCoSWpYP9JKQXW+oiYfER5K+cgueJKhVb+C0nzXTfHSnK2mTDWSY3ecS8YxFaL4xLL3flX5NNAhwyZUSI2A20bwqPhRhyWi6A+VmYHz2HwLTYMfX3jpUCwqiT6hajC5AwYrXJG+UvZ2E1HQHlNCKonSFI7TVmnSTeW3eF2JfizOrNCBRqBOuKovU3PoVUrmQCLof8wFFL6rR3D4Ei2HXGMl7b+e5FWfdapKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ykq+x+bVasKPYf2IiPSl+IrgBFv5mOW2J5YDbo5U/pk=;
 b=FGW5OAapKhsObx7O+8o0asnTKiNcFYYPOJADWeZvNWrALU9LiNM2h5Hx5geNr7ygvA5Yl3mMNE/42h/nNBfVODu2fkLZcyrzTzY4lKVuNZcE+GRJG8QRivhTuKfVe4jylC4ZdYAFpY1AChHyxXSAN5OA2eLi/p2kww2uNgYdU6EG6zhmvb76nUkpri27ypIVh7mvlzqTF0VUQlBrmjpG9N71zvPV9doZMilhISmeifMvjmWJBKLMtxzeXB2TDXKj7a+NJV0/STd1eE8u4pBi7toUv8u663jooyUns9ob6kPD5MWLL+A/1mpYTSPCmzsl+DhDUEJc0o8zyW0nrYZNSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by LVUPR12MB999184.namprd12.prod.outlook.com (2603:10b6:408:3a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 17:02:31 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 17:02:31 +0000
From: Zi Yan <ziy@nvidia.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nimrod Oren <noren@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
 Hugh Dickins <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>,
 Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Date: Wed, 02 Sep 2026 13:02:29 -0400
X-Mailer: MailMate (3.0r7027)
Message-ID: <A36CC394-0954-437A-B408-359C548DA3E1@nvidia.com>
In-Reply-To: <583c4718-f763-41f0-b757-02b46655c0b5@linux.dev>
References: <20260901190123.3511535-1-noren@nvidia.com>
 <20260901204449.GK3004@cmpxchg.org>
 <C8541A2F-D6A9-41B0-A3FE-52339A6601F0@nvidia.com>
 <20260901220917.GM3004@cmpxchg.org>
 <69C018F5-A1C8-47AD-9567-3497AA6808EC@nvidia.com>
 <20260902160417.GN3004@cmpxchg.org>
 <583c4718-f763-41f0-b757-02b46655c0b5@linux.dev>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BN9PR03CA0651.namprd03.prod.outlook.com
 (2603:10b6:408:13b::26) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|LVUPR12MB999184:EE_
X-MS-Office365-Filtering-Correlation-Id: 54132fcd-b8b7-4cf1-da10-08df0913f9ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	TCFaz73f4IXtAl6rHzMxR8nFG/ym5lTSordbGx+Wu0IznVwOKp7LEMLVzjC5tKpKS09CRyRi6yFwQZkM85/pct20v7yP90CaN55DjNP5mX4oL1EtzA28qwbiS8A745HSFExgt7b8PgCxPvfRV9NkRH0zhnMSnjWjEUibFgvxQYSp98fJ/5Fw4mkoF/rdk5U2LFAL/z9PUOgPZMT/rWNmU6Ychicw0+egq5WI3y7S0mpGA8vtLUPYownpxtH6wbyS8O/FNN18CKFdt3JypXZC7Vvah+NWS7hX52S7ocgR3eGAR+OA7nzkNELPtqXoVDpQ85cMYXUJ+bK/7HnUiaR2irpAHqSrvYR/vNwJxlIQfl+NlpI23CeNoougziB/GMEWbKcrXKS5qKDhIE5ZMc/FP17wJ5lYJWiv+qTydIFJ1yQqqvQXIY3dvMFLxET8gLpPE4SycaV5iIvjSrls/jGdmRdMVn3YoMG0tQpWbmKdbJzdPNjx9vr/uzFcHz6PLFdaemr4GqEwngKokuKnJnGOVTtOKUjIg7t+C20KzrO1c9iBcf2Pw4C2WVzf8Etzdr7avjRIHwcgCiPUhz781/pTKPsSv3smOQ+NXpA0GX25e+yg/cJxwkLV57tXtWoWPtRPP8IYrE8YvVi1L3+JzTi+R9SpDQOU/GLI8BrzEY/DdtM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZUlLlE10bSBGjVw3TzpeTT+39Dxw9Td165p1kR1VNbBkXF+Il7vuRzQF4t1C?=
 =?us-ascii?Q?0D0wKGPhA1Ez8HcDQ42o6rbamiuznOEKw/ItNizLIMTcAuvy7PakwZA0BzrY?=
 =?us-ascii?Q?KEAEteMmXvZ+46oF4buaK9tG5z86sfyUj59ZbDY+fHyquVFAkjGwZC+e2pAG?=
 =?us-ascii?Q?8fR+zmifOnZF+BV8HJOGpf9A+XIH7yYsSRFu0Er7jc+gfx6ZrcdGxc1sZXdF?=
 =?us-ascii?Q?XkGcnBR/SHYvBhtBhnxP9+gHk67lmyD1h00C07u7sRChAN0LkGjGdd4O4L+q?=
 =?us-ascii?Q?+7b8OoiPuofbO6QjoG28+XXvdc7nOg++ZS0wEQvNbO4kyvG57NuL/tW4QQDv?=
 =?us-ascii?Q?yw4M9GaeUnysYGCLFqEymLyikGJafR/6x+KBnNrxgSms/t4xv8GHLcf3QVy0?=
 =?us-ascii?Q?3KtuHDtiKtwoDDseE4KsyCpfUycsd2sRZ3cl4qtq5smRmcNdrW9mtpaviKLY?=
 =?us-ascii?Q?EzwvdmOcwXA2ViisKV08GlUIeG0HiWFNfo9VUlfEuWJ/KhUWNlhM3Bowuuyx?=
 =?us-ascii?Q?RCuWIKM6G1Rl7LaVENqO4VOswUJ2Epqn3QB79iPKnJUf2dwxxHMspLrMOPlZ?=
 =?us-ascii?Q?TjnrazrT2jdwZjRGAqz2j9SEHiH0qqjsZG3jlYXy4FfeSmi3TCXm634X9tgN?=
 =?us-ascii?Q?hC1a2bd46+4Nj0/d1fijQztJ8RuAXBDRf7kzyVTkenzgPrekLitlQ6BnSiMs?=
 =?us-ascii?Q?Jit4Xam+J1UCNgxWVxFIkg9iXm9Avk9RMl4RiSGv1rgY2UNeincTBxiUhvXy?=
 =?us-ascii?Q?Fh1pw1EbWdWa6UhKenfJDopXcOr0WaT9jS8z30NePf+mgAutwDxu+khp4Z1F?=
 =?us-ascii?Q?nH6xwTzQTR7b04+3cuB7YnBi50/O1znmxXN1o4fHoN3TPocDqGXaxKRbgTFk?=
 =?us-ascii?Q?Hr64q3ip7qDBPzeMKmZ3rCJa6sgSpIR532wk5eMWh8BHsHC6b7JiK4OO7NIL?=
 =?us-ascii?Q?2kOiJMy9PTh+UPIKEGLhbi/W4LTHWulPllpEzzq7auI5JoN9sT7Je/swDAss?=
 =?us-ascii?Q?kwT7Gz8ZGDAUEe2Esxq+5+YfXjPnxN0vpfTpPoL6ckQuKfchE864XcznjsSB?=
 =?us-ascii?Q?IFGW3iCNHv/4GMQYRceSF6wocEszNzwhzMUva5u2cq9MxprFMvH/svzJ6lyp?=
 =?us-ascii?Q?a7yRl8IH89+pZSlgOjSNl7TLuoQ/uVyCV5tGj7NOkt1LwwqQyiZqo6QGyTbv?=
 =?us-ascii?Q?5Y1N8Jm1+pTKCld09auKnDJyRO7nf3Bcj1VYJorg1EyRz2+XTlOUj0MsOKkb?=
 =?us-ascii?Q?jzgMkRIkrY4havmO6xMfNsfmvu3nC53moHBUNailmb6ihPmfnWF7C/wJf6w+?=
 =?us-ascii?Q?Fveojc7KjFR8/P+rOFQspEG9YS1/TTwJPh4VvQ3UOaTSXdkbQT6jbQ3ar96F?=
 =?us-ascii?Q?ZWu7048IIqJPW/krOx1inMzrVWxDfPiuQa93AVksyWsmw+1s3ZF2Z7Kr9YYY?=
 =?us-ascii?Q?OCsePCEoTzQLLG3Wg20lvhU7memZKHTkVnva08wQqce7kAO5DWsWORpYzw+Y?=
 =?us-ascii?Q?9zuuPefJjZ0QwNQ6+cnTYcM42teL4XnDTG7zztiKaBb5w3enAaRCUB3chjSX?=
 =?us-ascii?Q?3F8GWIvnU0gQTw25smFY1EebFCz7QrMejeIL3dc+rBvFwazD53j/WyXy2q6D?=
 =?us-ascii?Q?5WmIcE3qrlSRvKNjddhne3x8RMgNS5i1fP77RVJR9Y7DGW5bqNsijwijXYAz?=
 =?us-ascii?Q?9Nsd+tuWyJJflabtv2Hm4TvCAT8pywj8jj1Vy1D3rDKfVo/wBX7KhvG6N0f5?=
 =?us-ascii?Q?QfJZ2wb3iA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54132fcd-b8b7-4cf1-da10-08df0913f9ee
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 17:02:31.3800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0ekAHIeBHZiRMuoPn6F6YT800XJjCrKeCruOgjJQSbVYIIhGDT1h5Y6odiEmcbF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999184

On 2 Sep 2026, at 12:47, Usama Arif wrote:

> On 02/09/2026 17:04, Johannes Weiner wrote:
>> On Tue, Sep 01, 2026 at 09:49:58PM -0400, Zi Yan wrote:
>>> On 1 Sep 2026, at 18:09, Johannes Weiner wrote:
>>>
>>>> On Tue, Sep 01, 2026 at 05:09:52PM -0400, Zi Yan wrote:
>>>>> On 1 Sep 2026, at 16:44, Johannes Weiner wrote:
>>>>>
>>>>>> On Tue, Sep 01, 2026 at 10:01:23PM +0300, Nimrod Oren wrote:
>>>>>>> When THP is enabled, set_recommended_min_free_kbytes() may raise
>>>>>>> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
>>>>>>> Commit f000565adb77 ("thp: set recommended min free kbytes") added this
>>>>>>> heuristic to help keep pageblocks free and reduce fragmentation for THP
>>>>>>> allocations.
>>>>>>
>>>>>> We've had problems with compaction before when min_free_kbytes was too
>>>>>> small on large machines. Competing free space scanners do a lot of
>>>>>> work only to fight over a very small set of possible target pages.
>>>>>>
>>>>>> So I'm a bit uneasy that you didn't include any benchmark numbers with
>>>>>> this that prove basic functionality on larger hosts isn't regressed.
>>>>>>
>>>>>>> The recommendation scales poorly with larger base page sizes. With the
>>>>>>> default arm64 pageblock sizes, the contribution per eligible zone
>>>>>>> before applying the existing cap of 5% of low memory is:
>>>>>>>
>>>>>>>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
>>>>>>>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
>>>>>>>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
>>>>>>
>>>>>> I question whether pageblocks need to be 512M on those machines to
>>>>>> begin with. After this patch, you're still asking the page allocator
>>>>>> to optimize grouping such that 512M pages can be allocated at
>>>>>> runtime. Only now you took away part of the mechanism to do so.
>>>>>>
>>>>>> If you're using 512M THPs, I would kind of assume it's on machines
>>>>>> with a memory size where 5.5G for defrag purposes isn't devastating.
>>>>>>
>>>>>> And if you're not, it would make more sense to lower the pageblock
>>>>>> size to the mTHP size you're actually using. And that would fix the
>>>>>> "excessive" min_free_kbytes issue as well.
>>>>>
>>>>> But lowering pageblock size requires a kernel compilation. That means
>>>>> maintaining two sets of kernels for different needs.
>>>>
>>>> That depends on whether anyone actually wants 512M pageblocks...
>>>>
>>>>> The ultimate solution is to enable better compaction to generate
>>>>> THPs bigger than a pageblock size, like Rik's super-pageblock
>>>>> proposal.
>>>>
>>>> ...or whether we can say, at that point, use gigablocks/cma+hugetlb.
>>>>
>>>> And then the static pageblock size for the fallback logic etc. can be
>>>> a smaller, saner default for everybody.
>>>>
>>>> Because the point you didn't address: it doesn't make really sense to
>>>> have 512M pageblocks on smaller machines, beyond the min_free_kbytes
>>>> issue: Fragmentation events will poison half a gig at once,
>>>> should_try_claim_block() becomes harder which results in less
>>>> conversions and more allocations falling through to stealing, page
>>>> isolation is more likely to fail, compaction locks and operates on
>>>> oversized chunks which is bad for latency and concurrency...
>>>
>>> I actually wonder why such a big pageblock would still result in a lot
>>> of fallbacks.
>>
>> If you look at try_to_claim_block(), you need half of a block to be
>> free or compatible with the requested migratetype in order to convert
>> it. When memory is full, LRU pages are scattered all over, and
>> compaction is not involved (order-0), this gets more difficult the
>> bigger the block is. You can get into a situation where LRU reclaim
>> will not clear sufficient room for conversion in any given pageblock
>> anymore and you're stuck with the type distribution. A large share of
>> buddy requests then go permanently through the slower fallback path.
>>
>> Usama knows more about this, but we have seen this on GB300 hosts, and
>> have JUST started to deploy kernels with smaller pageblocks (2M).
>
> Yes, just to confirm above, unfortunately, there were too many problems
> we were seeing in Meta production with 512M pageblock size for arm 64K
> base page size and just had to switch to 2M.

Do you mind elaborating on the problems? Johannes has given good arguments.
I would like to hear more from you, since he said you know more about the
issues.

Thanks.


Best Regards,
Yan, Zi
