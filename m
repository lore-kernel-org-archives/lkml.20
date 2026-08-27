Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010064.outbound.protection.outlook.com [52.101.56.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0990A4749F0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787845139; cv=fail; b=ByvexL9TvOsfGtAiQMTer7lAgYIMYAEXnCeOGpgHyTH+RsvqFYUuBxIZq5xkOpTeOeubCAbirKHiaPdWx7gYlcqmM4X2/vbFj+wYeMSEjzTaJZFSSb1lLF9cwx0Ur8TjeJ6d+O4fAJ1NlAfZtNcL5gWGIVpE0ET6Eig3xavsnPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787845139; c=relaxed/simple;
	bh=/cs0bNXvO59NGRpRYXJkqxZj4FSGEBvddo6M+44+hyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IZ68FhumqJgQyD6VA1/iPMSsvmI4Kp/NdNByuuWpqrGE4ZaoN0gqJrJPxOIY2HASZtO9z2y3K0TVYFrLZyOetGAv46HDeRtVBUNr0a3xKfuN0/Cdoa/iw5YcRAQbpeMzeCNxDqLQGF/TwPA03llqoCWCqGxF5cM5JyRKevpnWbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L6p32YtR; arc=fail smtp.client-ip=52.101.56.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L6p32YtR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vadX95kZVOrIL48SSlzPd34XDgoWuevmOM0kTRYujRsncervx9tnnlBjCnybsjcYtt48vuyZ7VDN2IvTAkDrDwKVbU4VR7gcrV/P40PpOFrmUZUqGrmHM6PStV/9msVe+vEo/D3Q46AP6GjoRaRwbhNMmWBY3TAfeCDWbDXUqNGnTIBls1BJ0kzrn5SMBB7ktb+MhgVrZZJ6Rv0vzyi6Mir5IeE/w8svl2QFKRTIqvzN8VyLHsfS6DMsfsyDuQMLSARHHdD2VfUI5TkeF7Us/jFBfyepZsbqIUdBRlPhcP/baldx9i+3+HKTG+m1QSncy1aLsTdZN8ceQ3Gc59nM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFatwpLJ3wuT3UO7t4Mt4XxYFCr/8qeij9gI8Q78dBE=;
 b=JzaHumqJOzm8fQPaEDsZ5p9ExKexNMpo9oE9SC4fv5VsdE9+PugFPgXSQVhauylnIm+vBe3v3dIybjQaGZhLQt1NvyD6iOIP8AziK/k4m4ORMk/hZd/PIK0y3wyDgPcqKpwJTo4GRntM8o8yO/RzjyAYQHc0bhum/ITPkLaYSflnD+AYWwd1Ol2aLFVyqlS3i65kR/I3EFmSMpZmo83/stz5/8sUM26Paa75VM9f/O4EqOgHYEEW335iTsAruYDTOJAUumTc+yo3qDbVliBZEMZPM1lP0C9ffgMY19Hpo+OGC63Xj3a7dOZPK35JTKM0JFcXnktJiFPgjxZ0nKfTIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFatwpLJ3wuT3UO7t4Mt4XxYFCr/8qeij9gI8Q78dBE=;
 b=L6p32YtRTzpKUfOqL/omHsMClt/3LmmO7xwR+DP39fNwY0xnXSDyWxZp7adYP3RlDlzkLwpVRlL9xLbPV66bpG7a/jPUblD5BnHmOpf54GbSbbJPC9MfIMd1CpLogiCtUgq8SGixASdqnsxbg2cjj6b/nbMeuH973Xhk0HqvsR0/4mB6pdnoANeiYzfEUoEuDJK7H1TatRtw/4Wm+1AdnADcGXkQJhwQWxjGynkNGRAd9FuswZYBnSL5xzWkUNXmZF6uMcmN907KM6iVAYa7DenVGraz6RD9YUPutn9dbZcOQVzIcx8qU43MmugaBMOu266T1eD9RHGGRIABnWk17w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS5PPF23E22D637.namprd12.prod.outlook.com (2603:10b6:f:fc00::647) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 15:38:50 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 15:38:47 +0000
From: Zi Yan <ziy@nvidia.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kiryl Shutsemau <kirill@shutemov.name>, akpm@linux-foundation.org,
 ljs@kernel.org, hannes@cmpxchg.org, usama.arif@linux.dev,
 lance.yang@linux.dev, hughd@google.com, baolin.wang@linux.alibaba.com,
 baohua@kernel.org, liam@infradead.org, nico.pache@linux.dev,
 dev.jain@arm.com, ryan.roberts@arm.com, balbirs@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: Re: [PATCH 1/5] mm/huge_memory: do not touch frozen folios in
 deferred_split_isolate()
Date: Thu, 27 Aug 2026 11:38:45 -0400
X-Mailer: MailMate (3.0r7024)
Message-ID: <50FDE99F-3E71-47B8-BD88-05AD771C4BDF@nvidia.com>
In-Reply-To: <c3f16d64-ffe3-46aa-9596-b233f9294fcb@kernel.org>
References: <20260826162101.1314941-1-kirill@shutemov.name>
 <20260826162101.1314941-2-kirill@shutemov.name>
 <c3f16d64-ffe3-46aa-9596-b233f9294fcb@kernel.org>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow
X-ClientProxiedBy: BN0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:408:e6::13) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS5PPF23E22D637:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e626c73-189d-44a0-2df8-08df0451490e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|56012099006|5023799004|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5oIaqptr7bIyqJDVuBZlQFgeTTyiHXXRts+uI+KJZ2rot0MrFkaayU4GnqUQtQV8zAnFNoTuvRi96eJNKZSGlKZ15baon/2foMfM2r0EtspwEbVzvWCZpLqXDZqsWotJXRZXU4rWXb+cb+HBmPGfpr+lnjGnSr5+Iyv5tye7VlKbFmyPxdyRGrHF/kYKKOIxoIWfug3xnGCAqyEqUyo98hPgsOXLJya4MVRbhyx7AQdeD1CnbWweeriiaQ2cDHhoCjIzcAdXKmMi9n6In2xRLZojQXda+5DWS+hIZHRfgztVed34Yq6O07LpCNmcRjYLNZjXOCG8tphHkldDlNaijT86ObReOdboVPCX8jONHV18BTyxg00FPdQIDGFDC6cwjCYLxSdYIDv6Vsi+7mnw1Duwb99Wbau55JxMHeHdJRZjipQvgZ95utjGqSrXsWoES2eHNt9Yl0hDadKmg8/z6o0hl0Yfq8lgUQTdhT142mG9bzZCYHNjmuTw7o6qkFxNbsgjnKxflLLaaRlKyQlsL7F3Y9plo4onq7i2AtiXJkGCABkCLgQeqNc9VuvGN8Kk4tScsanAfho8txF0mkq+Sfkfm1zqkZRAYJzVZ8HIb1n8ZxSWMe6LnmfPrxW3ME+0F+QTo99Nris5eSZ54NqDYkY9Kc0MJkfNhSJ6rLszRXI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PfY+hJGVmvkW9mBQaVl9jxs+6XG1EqxW7ZoTCLKnMc4V1dj8pUrcbKk/YixF?=
 =?us-ascii?Q?eGDBOUyhvAaU9BU7e+10P5cQZVK+2EFyOG1JM6bfX3furXfU5WjMmosBskxb?=
 =?us-ascii?Q?aCKyn1u4f8IDQOgLBkP9cw+iz4IZDArwJxPQGIrGsYvtfHhdVt9khRse8N0l?=
 =?us-ascii?Q?qAu/tl137vdLbCMFJGfZx0Sfsav2YD6ZGRjM2WI5UKTPNZInpoVF4lMb1V86?=
 =?us-ascii?Q?7BBKTj4SGKC5NPmgJpj/GbEnIvcMlcDoAP5uJ99+2yKlJuwHJk3S97V/TYLV?=
 =?us-ascii?Q?gOVI2ycv71eI4iWdB4SE5eNmYqskdfbmi52U6D6kTiraiMaFuS1HdR+2nMwo?=
 =?us-ascii?Q?3NnqWRCxye5LPtNfRDkSQxk5sEv3fW7LgWJvWXK+QSDmbcJahRIdQLMLnKWu?=
 =?us-ascii?Q?Q/gkYenF+0Y4B+CJr+pTh8idREHH2ZlAswas+25zS8GcpyMRo67b2hLzub0q?=
 =?us-ascii?Q?LBGG3EW+59+mbfeWUb7pSftApLDaLExuqRvBjVTkjPJxeYps01VMLA9jrf/d?=
 =?us-ascii?Q?MYD3nl0go66RFyvYX8FCByQFtcdafk2mZw6JsVm3hl30zBYW0MTH9xwfuCQj?=
 =?us-ascii?Q?nzneKV/MaPccG+ftgULuE48LBSs0LrokSzd2CPkMO6fbfhg2nJxVxZ3BkeA7?=
 =?us-ascii?Q?ZYuPlPRUjdJXO8TQVO/w65lmcHU+ifgYJRick1vmnCVTwEKLY3rhr4fEX/PV?=
 =?us-ascii?Q?XWfGY4mjn4uAqoYnvuFyd9S5YpNSoM4kzpdZU7EgyWUfRZozXZiD/TQlrPbl?=
 =?us-ascii?Q?j6lejPuStxiwbB4qdh4DCDikb3S9jyxHxHp54XgymPnkNTdk9tdHTnoo21cg?=
 =?us-ascii?Q?u3m37x2uolip8meuOLOkjWGC06MlLxlgGnW8C4T78ePDhPO11g1rjE91AFd2?=
 =?us-ascii?Q?bnf2BcQFuIvV79msHPz/leZlygzs5eKasm2bW8D7MwikFAAaRczT+yjDB3ZQ?=
 =?us-ascii?Q?IO+QCssJb3lx2dojnaRxdRupBAnkLGMKJLE+jGSP++q0aj3HIY8niiJ+sHig?=
 =?us-ascii?Q?4QofVRkWnFGx0tmvtyVf+DXMNbpu0EepehneG2QlB4NaAyRUUPulPe4iO8lX?=
 =?us-ascii?Q?VpySCFwpTMuL+ndBnm8UPl09Ekn0uAd3z1X2T2rOr8BQvrH0ewPAEhQlQ1jM?=
 =?us-ascii?Q?mth+3wjC9Urq9Dn/ZBzgZExmqm1OhD360rpax5XIYRVxTaQi/cXV/z2+IPZP?=
 =?us-ascii?Q?vSJGlfcQU0wQ8DjuGPWuN9uAhL1q3gKMcHGQn4UJP1kx4LRDad63lZg0U1jM?=
 =?us-ascii?Q?Q3+VO6C00QFAhVkLz39uixQTODZtzGHLLmjNwnCybyZXkmqb4sliLHXYiTSc?=
 =?us-ascii?Q?meD3b0GdLRWXfzmGYTBOQBSIRbYpwpUs/s4/LTww/IkShTSWIh/+YSmrd5HW?=
 =?us-ascii?Q?HanM4dv3YSnayZqTIifHwDV7LkToXV8O9rAsK+dcWL3McHpLtG5h3937rB67?=
 =?us-ascii?Q?nGIykltDJI/YyWHI5kLVAfHCj/hlWC+2rUukZE1tx6RVeORo1oagvnhdVdut?=
 =?us-ascii?Q?lwWKoWoyPp2TeJivr+u5UNUn44Ce+E9rFvKy34xWIIguSvShXiC+G2VQC3xN?=
 =?us-ascii?Q?yDuqhAr1gsuzdHzUtkg3XScPvDGQTk2qh3ZuPfW5yZXW1kA1H+XFrnU6680r?=
 =?us-ascii?Q?xnDFj5IuVbic14+AGvZOZ+KgF/kPOeiVCZEIkEm8mdZVxBhg7wIBZlRDkkQ4?=
 =?us-ascii?Q?GaYFKm+Pr8GkHe/dJ5w69HZ0XNJ3eb2ItYIHv0eiMrL84aV02uMF2SEjier1?=
 =?us-ascii?Q?gfsz9uHpOQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e626c73-189d-44a0-2df8-08df0451490e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 15:38:47.5913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIEDQ8wtVGr+29P1ZpolY0r9A74RuLTuLP+YauvXgcY9draP219EXjvj06JJe5iT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF23E22D637

On 27 Aug 2026, at 11:23, David Hildenbrand (Arm) wrote:

> On 8/26/26 18:20, Kiryl Shutsemau wrote:
>> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>>
>> deferred_split_isolate() probes each queued folio with folio_try_get()=
=2E
>> folio_try_get() failure is treated as a lost race with folio_put(): cl=
ear
>> PG_partially_mapped, correct MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, take
>> the folio off the queue.
>>
>> The folio_put() race is the most common case for !folio_try_get(), but=

>> it is not the only option. Another scenario is folio_ref_freeze().
>>
>> A zero refcount in such cases does not mean the folio is going away.  =
It
>> means "don't touch me" and current deferred_split_isolate() doesn't
>> respect it. It can lead to unqueueing folios from the deferred list fo=
r
>> no reason:
>
> Yes.
>
>>
>>     CPU 0                            CPU 1
>>     ---------------------------      ------------------------------
>>     freeze a mapped folio            deferred_split_scan()
>>       folio_ref_freeze()               folio_try_get() fails
>>                                        folio_clear_partially_mapped()
>>                                        NR_ANON_PARTIALLY_MAPPED--
>>                                        folio off the queue
>>     give up, put it back
>>       folio_ref_unfreeze()
>>
>> The folio is still partially mapped, but it is no longer a split candi=
date.
>> Nothing queues it again until part of it is unmapped once more.
>>
>> Skip the folio instead: whoever freezes the folio, owns it and owner i=
s
>> responsible for its fate. It also covers the folio_put() case:
>> __folio_put() unqueues the folio via folio_unqueue_deferred_split().
>>
>> Reported-by: Lance Yang <lance.yang@linux.dev>
>> Link: https://lore.kernel.org/all/20260824131224.73344-1-lance.yang@li=
nux.dev/
>
> Fixes?
>
>> Assisted-by: Claude-Code:claude-opus-5
>> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>> ---
>>  mm/huge_memory.c | 19 ++++---------------
>>  1 file changed, 4 insertions(+), 15 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index ced400f72d43..6281ed993243 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -4590,22 +4590,11 @@ static enum lru_status deferred_split_isolate(=
struct list_head *item,
>>  	struct folio *folio =3D container_of(item, struct folio, _deferred_l=
ist);
>>  	struct list_head *freeable =3D cb_arg;
>>
>> -	if (folio_try_get(folio)) {
>> -		list_lru_isolate_move(lru, item, freeable);
>> -		return LRU_REMOVED;
>> -	}
>> +	/* Lost race to folio_put() or the folio is under folio_ref_freeze()=
 */
>> +	if (!folio_try_get(folio))
>> +		return LRU_SKIP;
>>
>> -	/*
>> -	 * We lost race with folio_put(). Read folio state before the
>> -	 * isolate: folio_unqueue_deferred_split() checks list_empty()
>> -	 * locklessly, so once removed the folio can be freed any time.
>> -	 */
>> -	if (folio_test_partially_mapped(folio)) {
>> -		folio_clear_partially_mapped(folio);
>> -		mod_mthp_stat(folio_order(folio),
>> -			      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
>> -	}
>> -	list_lru_isolate(lru, item);
>> +	list_lru_isolate_move(lru, item, freeable);
>>  	return LRU_REMOVED;
>>  }
>>
>
> Who will clean up the stats that we used to clean up? That should be me=
ntioned
> in the commit log, otherwise it looks like some piece of the puzzle is =
missing.

It is kinda implied in the last paragraph in the commit log (copied below=
),
but I agree that stating it explicitly is better.

|> Skip the folio instead: whoever freezes the folio, owns it and owner i=
s
|> responsible for its fate. It also covers the folio_put() case:
|> __folio_put() unqueues the folio via folio_unqueue_deferred_split().



Best Regards,
Yan, Zi
