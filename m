Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010058.outbound.protection.outlook.com [52.101.61.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE653CB55A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762769; cv=fail; b=oPtZM8kDnXRR6lfRyV+DjRFbJdHjkoPOpWmL4ObR/Tv7Ph9tZyFztQ0/KnIfoQRo/35Po22EcCYWdfb8p0LrLFi3WnBGGp3HZoez3ml1R9fI5vaKsX+FNqbsefFACAPvdWHB+sBF+b5iyMngVzSvWK/6DhCmnPLqf23GKaDg638=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762769; c=relaxed/simple;
	bh=3PPwu0n5FtYMqnEim1N5uN/ePfX1idzSdw7J1xdTWBQ=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=OBS/NwDQ2wdT45meqPWBzLHXQGscPW+k1FNhSIlxLYbJAzaFI/CclkLgA2eELP/Kra0WyRzkLsO+RjOLRI1jIM3zkzE1KnwCCDrsgwP6jLBeygpanVjpk+OgG0I7AjA4k4Hm8I19vUYxhPn5PNE6e52I5sVoGObr01EV/7n3CHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CJj1AsKQ; arc=fail smtp.client-ip=52.101.61.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CJj1AsKQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/W6d31Wb/ck8MDIpPCO1XC2pQ8v3mVpg+DmXI5lAJlR81MOa9euPbwsu+TtmfvQbZM7XFgrbKCbiyQFJFN0/8YeXgwBedS2PPigqD4l5iiLK3xpb7iVJO2HAeVQNMvdo7voJ1OKRKCqk7MnQzmt+yzJC5UNVQZj7A5B0pDdULdM2ld4fOW22L2fYHspjr3BrepYvH7JY+GFLN12EEp6QCbSFk/hLJlK4JohbCGKLIHOEi1vJ3NNxGdGVkQIoXmkhWXWmI10SOhUx8yhkrxpeKRdm3aTDZoBJfwIIYDzXXgZ+Po8QCajcgyE6Y/xd43cmaWxnxo78e8N+vif0eBbsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUUYMidovale9j1gyJJ0rTi+LQ4pMu02wZ3xFBrC720=;
 b=gYSgDPzOAh+PWBdwN0GJHReWRsyfAy99v+N0K6LoRA83w3Fn8Sxq3z7Zml8Lwx/l4So0XWoRbEOgtmLDMf9qWqfGYQSkqPYGDX6c2yNU8EzLjexE8RZeg9jqVGcpRAllmpRR6ZZHuLoAuoMv10bmxqxQP39KlBvYqwwn9RKkh+/cHJjQhAsUbYgdpLFjOgloN6l0CSkuw1Cc50JdL15xKxfKy8gOxQOJamloE6KAvU3Rbc9laMBqHavXoJ6iQobGvffJDNlcRyq1nGb2ZUJpTLsvVyf4z1NFoF51jQSFelgtt4N+GmRtb8Uoh23q8mfzHZhovW/aMqaVcuKn/1jRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUUYMidovale9j1gyJJ0rTi+LQ4pMu02wZ3xFBrC720=;
 b=CJj1AsKQwYnN/POmz78O1ravycp+fN1SmhMWyZQ5KbEPu0bc7ikjB6gotZhmjgWkFKihspCZ/dp0dL/7iSvJY9Np0gFYTM5+PssnvyWCloJ3r4OyBh2++vxmOudHtMbv2J+gfjzMjy6Bnp6y7HrykWzUCgOM5oaDK7SHQknBMiTRyHPmtDpz6coXFq9jdQ6/ylwsCnqSd2md07onz/M+MTSOgtZok52CtlFvBotqD+ANsqVwiAHUJg9xEc0kisLk/DOM8r4uwcXZBvt2efyKdVZyMAeYyQyrCz2C+qaQCNMNFmEeSF+O/BloVPk3BhJ6fn3/yhQz98tfJ5nP40TemA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH0PR12MB7960.namprd12.prod.outlook.com (2603:10b6:510:287::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 16:45:30 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 16:45:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 12:45:29 -0400
Message-Id: <DKZ0ZVTFFJAW.1EZR236WVK3IB@nvidia.com>
Subject: Re: [PATCH 1/5] mm/huge_memory: do not touch frozen folios in
 deferred_split_isolate()
Cc: <lance.yang@linux.dev>, <hughd@google.com>,
 <baolin.wang@linux.alibaba.com>, <baohua@kernel.org>, <liam@infradead.org>,
 <nico.pache@linux.dev>, <dev.jain@arm.com>, <ryan.roberts@arm.com>,
 <balbirs@nvidia.com>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: "Kiryl Shutsemau" <kirill@shutemov.name>, <akpm@linux-foundation.org>,
 <david@kernel.org>, <ljs@kernel.org>, <hannes@cmpxchg.org>,
 <usama.arif@linux.dev>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260826162101.1314941-1-kirill@shutemov.name>
 <20260826162101.1314941-2-kirill@shutemov.name>
In-Reply-To: <20260826162101.1314941-2-kirill@shutemov.name>
X-ClientProxiedBy: YQZPR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::28) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH0PR12MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: ee147d69-69d4-4acc-2ef2-08df039170c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|56012099006|10067099003|5023799004|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ubHIvY5eJyBDycKmF9fxArbBdgx6qrDXfY/UsYFVE/9rYfzHpGtZMtNoF6dCpZIDzDSgqZXZtp6s/icfZon2iVOc+Kpfk8lJW4oUrhOsSndMNPK1L31nGRE0+eSYpTzKtyVxl3Lr+zWP5N8Oku2jZm8PrGr2R9bRGrmo1YZkkvwf4NuTUM6EmQw8/1R5yMztLSA3SQ5CMfYAfW+IkTBo6lUotV2+xweXPggQA1t2At2Ls1FgVrROnZvgLESZHbY78OK5nfAsQmLDO4S+AMFahuVOxM8W6smfonYLI9J/csr5+cIVEk3gZFcbZUca3RP3Ib+DY0qFNS9EQFuHNYQLAlebmvgLkigwYM/fQYzqAayqGjxMHV6JhGnoojEDeA35Pm4ly4tlHeD66LCDBTAp5mGYk29z6AgVrE8018jePWR6jpE2V/Dg0Wlt916toCiyT823827UqoXzapFKDUIi3W/EpVbC8k8l4w4Ticyoy5XcItFp5uCln+/oyuNpWoEgPrKjJR+GIioRcDI7Y4DzLO9zhxzTbAgfmjLMaIxuzbaPLHcFcY+tJDaSb3Wa8mDfDXOq79uPg6Hi7sM2Shsg9qndLenRBrUUF9ZogG0xg/iie4+lyuVk/otQC0k7SNbWKWS8l79Ub7wCIMnDHY6FFsxEJqq++EP9kK29XCRoj8A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akZleVlxN0V4N05rSjRacG5ZdXNoNjF0eVQxN3dsYUtSMzJXelRMaXA3YWpN?=
 =?utf-8?B?aVd3VytER2ljbit2Q0FwUTZQVlpEcHkxWTVabjJ4R1k3UUFjUS9WQzdBL1k5?=
 =?utf-8?B?L21JUkhzSy9OcjQzTy92S3lScUllZDZad2Z1S2k2bW1rdTJVZ3QvNmNFenVS?=
 =?utf-8?B?TmkyWW9RUk1xT2hNSjVqZTVCL0g2N1drUEpibzBNL20vdWlqNGhrQWYvd3hP?=
 =?utf-8?B?STY4cTF5Q3BrZFJGQXgyeFc3SFVGOWs1UDJRcE1IaDY0N3VqRVZpZjdIUjVD?=
 =?utf-8?B?enYvZ1ZZU3p4cGxWNXh5a2xob0M3VmEvd3ZpNlVxd2xSOEd2SmwzcWN1dC9Z?=
 =?utf-8?B?MklTL09HaU53MUpTR1JlaGEzK3BOZ1NReExtbXVrV2ZyZWtsTUJkREVjZzdr?=
 =?utf-8?B?dit1NUZ2dHZTb29CQkcwYWtmL0paUzVkNDNSY1NoaytwU2ZLUFgyVTR1NU5U?=
 =?utf-8?B?Qzcvb3k2SkJCQlliS3BYRzlYSC8xSGVmOFRnbTllYTNVWEh3dUdOTlo5YXFq?=
 =?utf-8?B?ajByNEdWOVg1OTNCSXM1aEJnQ045elVtSTNDNkZKK3RlL1J4dWdMVy9TSEdo?=
 =?utf-8?B?UGh4azhXZEFrNDhqR2xCcHVFajZqMjBxYXRzYUFZOHRVNDVSWWFpUkJ2R2lu?=
 =?utf-8?B?YWhRMndtQnhnSXYrb1pUbTZCZi9qYXV0aUV6blNKMW9ieXFHL0EzcGNzdWdv?=
 =?utf-8?B?eG44YXZyNFoySDNtdXZmZ3ZyOTdzTEx3TWliNDU3QzZUcktuWCt1QXZYRHJq?=
 =?utf-8?B?QXFVeVgydUMyV2YxRkljWUMwcWU1bktiQXhDUnQ5aElrSFJvdDF4UTN3TGF2?=
 =?utf-8?B?K2ZzelpKYU1rL3pPTlZsRnhCbWwrOGgzU0xwVWR2WkF0ejE3WU1EUjBvd3dY?=
 =?utf-8?B?a3h5SnNCWkd6ZkhuRURhTVpvcndibG5YR1cyVzJxVTM2OXdnSjhCVGJzMU4z?=
 =?utf-8?B?Rm9iLzVGNTlRTVB3Ym5RV2pvQ3J6Ymc3bmNqWjJwRjh2NUdNaXgzUllkYzdF?=
 =?utf-8?B?ZW1xcC9EMCtOZTNCQkNMQUY0ekNPVHJ2ZXJCbWNZM3hKMzhJSG1IZHQ4T1FR?=
 =?utf-8?B?cUhCb0tqS1I5STlqRjFUK2lCRlVCbDNvekFENjJrY1RRdGlQaDhaRElWY20w?=
 =?utf-8?B?aGsrWXpvZ2lYNnF3cWlRaDVVc3B1ZDF1RnZhY0ZkTlZjY2VXL291TWwvc2E2?=
 =?utf-8?B?RkorR0txcDd1RUZiY1JhajI4dDNoVlpIUHRpL3pTY01tT3Qra0llRmNrbnlw?=
 =?utf-8?B?SmcwK0wwTlc5RHIwVldNY3FtRkNLck11S01TeHF0Q2lGY1V1czhzZHFkN0lk?=
 =?utf-8?B?dXM1elZRdjRzZ2VEeUZMeTNaRjBZdTVHMDI3eGxkT083bXI2VTFnUEtRM1NB?=
 =?utf-8?B?NzRIVjFvNzJZWng5SU05WUhRejlTMkZTZVRxUi9GRksySWRZQytZUzJ1QUdY?=
 =?utf-8?B?Vkl1MStTMjlFdmNRNWd3Um1RVXdmSklscDVBM25vQkQ2ZkJYeTl4S3lkK0Nw?=
 =?utf-8?B?dW1uRHpaWWdyT0NDaEgyU1g5bmoxbHFQSy9rVCtiN1BHNVJiWnA5Z09BUXpL?=
 =?utf-8?B?TVNRelE3bU42S0kybnhiek9UWE5ZSVljMHBSb1BDUU9QVEVHUDdLV2h6VXV5?=
 =?utf-8?B?WGlKOXJRVWY0MGxuWGhzRVNmQWt6MUNOYU9CQ0gyUXBXTlYvZXY4M05leUpm?=
 =?utf-8?B?OVdNWk4xL3pUNUdPQWQ2TytqeU4yTCtGRHNDVVpvdEdhbzZSbHgrRWdKVVNQ?=
 =?utf-8?B?RU1tKzhlRURRMk1MWXFYMWlIZGE5OVE4TzlTTTR2QkxKQXFGTytET1RPRzFn?=
 =?utf-8?B?c3MzMGR1TTRQWEdXeW43eEJQYWV0cllSSEtIV3pLaEdyVlNUYWRxRDI0T0V3?=
 =?utf-8?B?Zm44aVBPWitCYWdadG5uMzZ0UGhJNWR6aDRDaU1CZTc4N3IvNnQ4MkFXVlI0?=
 =?utf-8?B?VzJqaENJdG1mNzJ6K0FpTWgxajNxZ09lcG4zcHdYUjViZlVqcVFqc3pGVWNC?=
 =?utf-8?B?cExYUlZFSVMwUXFjOXhqS1pFQmhpZGwrUEh6cWF3OFpqeEVMYko1ckZhbFAv?=
 =?utf-8?B?YjZidkR1VmJvbWVlMXhyRUVweGRMYjJJTjNDNEtPM1hCc3hodXZLb0tsNnBK?=
 =?utf-8?B?cktVTVpwNlZDVW4vbGVHamF4Z1F0bVkrVXBhRncydFQxSnRtaXJodXJnbWcr?=
 =?utf-8?B?NHZVeFBvS2ZNNU4waDdkaHlEbFJabkQ0b2hqZ1RvYUVuSHBtT0Y2OUdRQ3hp?=
 =?utf-8?B?cXhlNm1yM0tNc0FuQUJOenBVRHJ5N3JKNngxMWplVGxuS24yemZrUS9BTFVV?=
 =?utf-8?Q?y2il/Xi816vrZS92xT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee147d69-69d4-4acc-2ef2-08df039170c1
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 16:45:30.7829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vt1qXxw0AyPtNXPhO7G2TZkvj/RaB09M84y0tN2xVqfFj8NGbaRXe/tB5SHgg55L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7960

On Wed Aug 26, 2026 at 12:20 PM EDT, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> deferred_split_isolate() probes each queued folio with folio_try_get().
> folio_try_get() failure is treated as a lost race with folio_put(): clear
> PG_partially_mapped, correct MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, take
> the folio off the queue.
>
> The folio_put() race is the most common case for !folio_try_get(), but
> it is not the only option. Another scenario is folio_ref_freeze().
>
> A zero refcount in such cases does not mean the folio is going away.  It
> means "don't touch me" and current deferred_split_isolate() doesn't
> respect it. It can lead to unqueueing folios from the deferred list for
> no reason:
>
>     CPU 0                            CPU 1
>     ---------------------------      ------------------------------
>     freeze a mapped folio            deferred_split_scan()
>       folio_ref_freeze()               folio_try_get() fails
>                                        folio_clear_partially_mapped()
>                                        NR_ANON_PARTIALLY_MAPPED--
>                                        folio off the queue
>     give up, put it back
>       folio_ref_unfreeze()
>
> The folio is still partially mapped, but it is no longer a split candidat=
e.
> Nothing queues it again until part of it is unmapped once more.
>
> Skip the folio instead: whoever freezes the folio, owns it and owner is
> responsible for its fate. It also covers the folio_put() case:
> __folio_put() unqueues the folio via folio_unqueue_deferred_split().
>
> Reported-by: Lance Yang <lance.yang@linux.dev>
> Link: https://lore.kernel.org/all/20260824131224.73344-1-lance.yang@linux=
.dev/

Should this be Closes: ?

> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  mm/huge_memory.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
>

Otherwise, LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>



--=20
Best Regards,
Yan, Zi

