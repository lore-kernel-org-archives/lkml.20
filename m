Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012039.outbound.protection.outlook.com [52.101.48.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C7D47ACC4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790007507; cv=fail; b=QKnbbDyQ4SkO+/dbMsNdaU4ZmguPw0gnB2oFbZaAU3555IgjOYFE+vkyGiTPjtheiwtCy+3rHqGgXZAv/CFFlKKKdgGGQdefGz4Tf8y3nuNGFd26GroUfOSglGtDqxTBWZSZfOXFKom9QsW5v1EitHMKaql0w7JkXUNDOxmQex8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790007507; c=relaxed/simple;
	bh=vnAXQsANfoo7TAXBcjZb/52A56JJGjPJeYZsPIq2Br4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eRv5MWia2fWM0OP085cnMAXE9IV7kH5A7UEUmbjyxFduznsUh0mYOsR6iWCuSMftBzgtH3lW2eXuxEcRJEXfNb9sJE0ZVL9fbPBYMHUkDvPTKCpQvcJ6JXyXvgP7uaCM4+mO0uJY4skYP5b4nlXUl2mpPO6/oBMa24dDHP3m9w8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Hf8TL5qk; arc=fail smtp.client-ip=52.101.48.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hf8TL5qk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ka7QPKPqwaKmPp7EpWeB52chPwalikFUpXRQYdHD94YO44lIkrGgIyJROUeFbRiv4ORwjUFo7x4W9YwV3gUWC27TRo08CHV7r71OkdSh+KHXwh5zqPIbzfxq+aTmZfZMHYiMAlc8IGuz7V6wQ15k7dIor+9DCJB69854cKY2+Qb4pgnN1TbblKRze49GuQ0r/trIqVBXdLrAGSvOVHRJTOye+nLC8uCLzhDBcGObt7mtweSKVL6K2cZHlbalWGaX5d9F12PM5wgxLSrHFzwanEhxHqmvRkBnqFTitZOMYRzYFccR0VQXu9kvRFjv2Oh+qYr/3G5ahSMKCUjZ8zE+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6j3Gx+2s8BaYFzoXW0hHjDmoZn5hVdxcxjlzqJX7uk=;
 b=lLF+rZdF1VTSv38TIowazCB51kOJzp3gpB50N6JMgpC4kG4sTRkykjDt3iC/5/tOl1pVFjl5r5KR7eHp7SR78BQ5jqS1YdbcT/G3MsoOA4YGlStiWhDlhmySgh35+JXDTEHdOLuJvcE+BPnDvWfKvosdQwLaGXSlcBB19LZjksaf87VZJBcjP759p38Qy87WqxGXijj6ExSMk3ZmU9Xz9iTL0QcILK5l6LJH/fVWJtyBPknhEcn8iglv0ezVPd4fBHRiCD6GIWt20WkjWsFWLJtfipKfg2ENQ6phmo4WeirxQLDr4u7Ip/ZjZSlAh+PHWho6FNzsi6c2gnrrTS1DlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6j3Gx+2s8BaYFzoXW0hHjDmoZn5hVdxcxjlzqJX7uk=;
 b=Hf8TL5qk0ATp25JraRJ2RstlpfOSEEXcYxSUVursECaq7i6U0QguYUfNxX3U7Z1epMyAr14Mll9LkLtMhl5gs4o9OFR0/gflFHjvej5fvPPuTQVqVFs6HL+z0Qd3HcrSFv9hxNlJe0+utEZs7USLkj8+M+YpdcR5jwdAw0ODTZMTDOENYP2KbfX21sFlOlIw/UXU8NmfIEcB1vLXV/jt6M9B/GLV2q7/ZHsXigG6mEDXQxAUpYbMGmIs/8KRi5LzVVrmpnxO2i3qrsQRErtL/bNz/43mRTlALdUwJquyh7Du2vVzcjlVFAvHDiMW7W1QpDFPMKpiDi9t4lXhqCCDeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by IA1PR12MB8263.namprd12.prod.outlook.com (2603:10b6:208:3f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:18:14 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:18:14 +0000
From: Zi Yan <ziy@nvidia.com>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, brendan.jackman@linux.dev, hannes@cmpxchg.org
Subject: Re: [PATCH v2 2/2] mm/page_alloc: refactor build_node_zonelist() out
 of build_zonelists()
Date: Mon, 21 Sep 2026 12:18:12 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <C7A2977A-CDD8-4EEF-9448-A130411878B6@nvidia.com>
In-Reply-To: <arCeH_aD5PUM1tNE@gourry-fedora-PF4VCD3F>
References: <20260912030424.2889731-1-gourry@gourry.net>
 <20260912030424.2889731-3-gourry@gourry.net>
 <DLKNHNP6LH59.3MEEBCAJGFEVK@nvidia.com>
 <arCeH_aD5PUM1tNE@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MS-Reactions: disallow
X-ClientProxiedBy: BN0PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:408:e4::11) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|IA1PR12MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: 671e75d8-e61d-4461-cc40-08df17fbf037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|23010399003|5023799004|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	35M4bVUxS6xHm0HVdle32yQ/42rEmGMQHKJiG7pJzxwZaD5pq1pivrnvaWFanUVyL+UCm+IsPl12f1PGGycrKUindHeitVlMWsg0RGVpZkxO/gImCpC2T3K/BZQ4S0vt+Z9n5V2TEIRp/kuU65Vm4EL7faYalHD+dmSCcZByIWEdD4xy+f9PaiE7S2MFmE0oMxUVH811yljO2SKoxiDhVRLhFGzAj5dPMQhTEzek1Vis5hpECBU6QsrFv9AX51/HEnr0fKJScTqPM6hucJv5wCbn7zkdGC3DgVJcbseupaIHzDbLOolK4Fu+1hwOjYXUU/v8oebzz/jMQifjM2/+lmpeUIu+lbmM9Vl2dYo1Njfzw4gq5OTqlqkfqDDZLEtZ3Vad+G9y/VfddLE4uh65Vux4+hzVD2Jngahivg6GrAResrpqEtgMs+A8kdKWoZ93/pREn769vLoDkUiIGNRcG1o0ATy5ZMlbXSLUw9Oj5x7TZm4RpELoGqhMFz7S0mlcgQjfeYsuAG408Tjlk/SFo2snMLaIcOImaPUY+c5URtux6hw39dDhI52Ctegb8ATGYtqGgZNfo/GzwJNfjbxJ/p38dUakkj+jnxv6IiN6200cNy+alvybVdGvmfHvld6qWKK/sRWvWR4ZWzTMwTB45je33cGJ0h485oqGgiqT4/A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(23010399003)(5023799004)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZitoVHhBQ0JZMzZlbldLRFdQU09FSmMwV282bGQ0ZUgvb0RjMDBTbnM3WHQ4?=
 =?utf-8?B?ZTJkTHdSQWZZakhIR2grY2xiWExPR0UrSlQvV1NoczNhQWdiVmFIVjNoL2pQ?=
 =?utf-8?B?UkR6TTEydUdWcUZaOGcrb3IxeHkveGZBMktwR0wvcWRzMlI4VTkwSG1XNUZD?=
 =?utf-8?B?a01kYXJEYWkzTHJhQkExWkx0a09jamsrLzNtTUltQlpuWlFST3I3NG1IYmNy?=
 =?utf-8?B?SXdJanhnVjJsL2ZwMDRRWGNMS0NhRitDS1NCVUd2NUJIVGFBenZkMGN0dW1k?=
 =?utf-8?B?YnRIL0k2T2ZnWlF5cm9QeUdPYSt0R2htMG83WmFzenF5aTA5cXB3dzJaa0I4?=
 =?utf-8?B?Wlg2MVRRWDVXb0o0dHU2UnJScHFQSmFNY25RMWs2dzNlSmdPbVVDZG05OFU4?=
 =?utf-8?B?YTRxMVdHT2FqK2QwcVdMcXNhZVBSMUh0Q3QwNmN3VFVrL0dNWEUzdXQrZnNR?=
 =?utf-8?B?TWdMdDlrOVlSbHFLQk50OERiVE13UDZ0S0s0UXdNZk5oVW1Gdnk0VlZWMXox?=
 =?utf-8?B?TEVPY29NdEVRcm5LS25DZFFwMmRpckdOaVJnbldPa1F5QjcrVWdrZmdTb0c3?=
 =?utf-8?B?SUlLL3JDajFFVnljaHlEWnNXWG5nYkh0Nk9rVDlCNFArVDdheGFnaVpyVE9F?=
 =?utf-8?B?emZnY3U5ZzZHYUhzbndSUG92c1ZMT1dQcFZSQXZvRGlnaTFXUm1aYjF4dnQ5?=
 =?utf-8?B?L1RoNjZTdWZGSlVqTUpRNjhzSWM2ZFNNVjIrUnAxdzV4bWZ5cnlUVENQa1A1?=
 =?utf-8?B?SEtiUEo2SWsxQUVvbEZqVExGWTJoSTZKM2tQS1pNd1pSWnBLakY5RXZLWUQz?=
 =?utf-8?B?NCtManp4UzdKa3lZcFd2V0xQMmZRUnYybGd1eUd5QXlVUHgwTnhiYzgzQ3Fp?=
 =?utf-8?B?Nnp1Z05UYmlCMDFaWndvQ0QzSElwNTFZcnlNVTZ2OUpreTJXY1Rmc2N4U1NG?=
 =?utf-8?B?NEJsMXlBOE51UXlJRWJJRVFGejQxOFgyUEtvOFZpeEdIYlI5RzZYem5oRHhQ?=
 =?utf-8?B?Ly9ucWZ4bmlHNVo4NFZVcVZxNzZ3MW85RTFQaUNjYW11Qk0yUlJOQStlNTlR?=
 =?utf-8?B?ZDRnVEVxUEgwOFA1bnF2dmhtQ2MyenVhSFJVQm40N1JRUGs0NkV1Wk1vVktJ?=
 =?utf-8?B?akJjMFZ4Z2t5QjVFOERjOWQwblJ5eEJnTHFCSFZmeDJjdWwvQW9OWEZzSTFw?=
 =?utf-8?B?MHNVNnU1V25Tdit0cnZnVXhlMkwybWlRUE9MK0paSVpGUHFoY3RQSkkrc1gr?=
 =?utf-8?B?bCtHZDloNThlMW5ZanRZcmxsaXVpL3JxYTMvN2dRQWIrdnNiTjNDUDFibExJ?=
 =?utf-8?B?QnZLRTJTZTFMbzNiUTZOYmxMd3g4YnZMRk85Nk5rR1VaM0JwZ29SOW5JaWxo?=
 =?utf-8?B?aC90bkJkNUZXdWtjZEFhUmlZR3RhTTZaeHYrUkNBUHR6ajMrTUNjMkV4YU5l?=
 =?utf-8?B?ZnhkL2YvYkoySWFiRnFRbTg0YlE3RUUyN1haUFVsRnFQNGFGaDJteXUrQzA5?=
 =?utf-8?B?QWVWZHZEZEVCMm9BWjNtYm1ObGdlSHRaRUJDMjlyMS9JK1pFMnIreERWNUFW?=
 =?utf-8?B?ZkVWaS9FYkh3QzlEZWI3QkJVbmdJZkJDUmZOSmNzWGpnMC9UN3dldDE4M0NX?=
 =?utf-8?B?aWhDWXk3TlJrWWJqMGE3MWExdW1ydUZRMkszY2hHdnVzaklFZlpHWXRrODFM?=
 =?utf-8?B?cGI4QVpYS1IwbzhuWnNZM1hQcVdRRjR4K0k3cU5iWDFpUnh4R09ySGRvNk5N?=
 =?utf-8?B?SnA3WEVmR0pyMjM2NGlCTDBhVEQxcjFSZHR4c1RRaFRKeXZCTmRYVExRR2l0?=
 =?utf-8?B?RkhadlltaFM0TEZ1dGxtUGVZRng1SUZhZERQV1M0emFXd2YySHBsN2xJWlly?=
 =?utf-8?B?ZExaL0RETlhhRmdTWk5ZS1JKMThkTHpvbEJDRFFic1BBSEtEZHl4Y1pVNlZG?=
 =?utf-8?B?L3h1d1NpcU5FQXNyeitsRGtPRVYrRzd2Y1ljMy9Cd0RDdDNzaUc1QzF1MHdx?=
 =?utf-8?B?bGx4R0htU1Zrak1pRnB1VnVZU1VZdUpwT0FIb2o1blNZMndkaUJxazZxWHNV?=
 =?utf-8?B?SkhhNm4rbi83b0JKUEloSDZlQkU1L0R5eWpCd09sbkV3NHNMLzVlRTdjUERD?=
 =?utf-8?B?NmpwWDdsWjlKbjhFYVQwMkZ4dXcxV0orR0p4TmhYMDkvSy83cks5ZzhNeG00?=
 =?utf-8?B?aHNCUjNsMVhSUWFKQUQ3a1NFTXlKNkVuWkx6TkM4MkdkTzNmdFkrcW11R1Z5?=
 =?utf-8?B?eFdlV3BxL2lvY0pucUZqYXhqWFBwV0lCdDVxUytTK2RCcjRhZzUxYVJUVzdH?=
 =?utf-8?B?VUR6M3R5NytkS2lNZU94WWtkTDNPUklrWWRiV1ljYVdUNWJzZnZ6Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 671e75d8-e61d-4461-cc40-08df17fbf037
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:18:14.5743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KC5Liim3WJORtd90J+1+zfm/OjrdUcoJES8JPeEIrdlhm1fFZPc3yiJ4ugQ3dz8f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8263

On 20 Sep 2026, at 23:29, Gregory Price wrote:

> On Sun, Sep 20, 2026 at 10:49:05PM -0400, Zi Yan wrote:
>> On Fri Sep 11, 2026 at 11:04 PM EDT, Gregory Price wrote:
>>> +static void build_node_zonelist(pg_data_t *pgdat, const nodemask_t *candidates,
>>> +				int zlidx)
>>>  {
>>> -	static int node_order[MAX_NUMNODES];
>>> -	int node, nr_nodes = 0;
>>> +	struct zoneref *zonerefs = pgdat->node_zonelists[zlidx]._zonerefs;
>>
>> Why does build_node_zonelist() need to have a new zlidx instead of using
>> ZONELIST_FALLBACK like build_zonelists_in_node_order() did?
>>
>
> The intent is to build new zonelist over a set of candidate nodes, and
> it's also just clearer: build ZONELIST_FALLBACK from N_MEMORY.
>
> With this we get:
>
> build_node_zonelists(pgdat, &node_states[N_MEMORY_COMMON], ZONELIST_FALLBACK);
> build_node_zonelists(pgdat, &node_states[N_MEMORY], ZONELIST_PRIVATE);
> #ifdef PAGEALLOC_KTEST
> nodemask_andnot(&private_only, &node_states[N_MEMORY],
> 		&node_states[N_MEMORY_COMMON]
> build_node_zonelists(pgdat, &private_only, ZONELIST_KTEST);
> #endif
>

OK, ZONELIST_PRIVATE and ZONELIST_KTEST are not upstream yet, right?
In theory, the new zlidx can be added when you add new ZONELIST_ types.

I am OK with adding it now, but you could mention this change in
the commit message to avoid confusion. Something like,
for bulid_node_zonelist(), use ZONELIST_FALLBACK explicitly.


>
>>> +static void build_zonelists(pg_data_t *pgdat)
>>> +{
>>> +	build_node_zonelist(pgdat, &node_states[N_MEMORY], ZONELIST_FALLBACK);
>>> +	build_thisnode_zonelists(pgdat);
>>
>> If build_thisnode_zonelists() means ZONELIST_NOFALLBACK, why
>> cannot build_node_zonelist() imply ZONELIST_FALLBACK?
>>
>
> thisnode actually means ZONELIST_X+1 as opposed to ZONELIST_NOFALLBACK.
>
> Since folks are adamant about not allowing another GFP flag for zonelist
> selection (beyond GFP_THISNODE), the result of this is that all future
> zonelist additions must carry a FALLBACK + NOFALLBACK variant.
>
> The question you actually want to ask is why build_thisnode_zonelists()
> even exists - it should be part of build_node_zonelist()
>
> I can probably follow up this series by just folding eveything into
>
> /* build zlidx and zlidx+1 (nofallback) */
> build_node_zonelists(pgdat, candidates, zlidx);
>
> And add a BUILD_ON_BUG/ASSERT that forces any CONFIG_NUMA to have
> balanced zonelist additions.

Got it. Thank you for the explanation. Are all combinations of
{ZONELIST_FALLBACK, ZONELIST_PRIVATE, ZONELIST_KTEST} x
{N_MEMORY_GENERAL, N_MEMORY, /* private only */} allowed?
Any enforcement if not? This is more related your “private node” series,
instead of this patchset.

>
> But I don't think it's strictly necessary for any of this, and we're
> just shuffling code from one place to another.  Probably I can just add
> that improvement when we add the next zonelist.  In the meantime - this
> makes it easier to add new zonelists as-is (and just makes the code more
> readable).

Sure, no rush.

Feel free to add

Reviewed-by: Zi Yan <ziy@nvidia.com>

after you add some text on the added zlidx in the commit message.


Best Regards,
Yan, Zi
