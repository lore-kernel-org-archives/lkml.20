Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013034.outbound.protection.outlook.com [40.107.201.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00043322A1C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792118840; cv=fail; b=p2w4pxSiJDT4+Fh0IIcgvrTaov/cFsW1yihhpqdVurSEtaVB57i4EOgRMbEeqE0tXVBCMPegYEIx8PhNzzOFDsojT4i6AcCDl3D9a3CiV+PHVtILOnz0Alh9u0HrTppql7WXGXchw7ALL8NmRn8Bioxh9X7C3VLakQKNnX6bt0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792118840; c=relaxed/simple;
	bh=HSHUFOgCMC/DguV6bQPoeDcRhsazt0sN2yi+ac74SKI=;
	h=Content-Type:Date:Message-Id:From:Subject:Cc:To:References:
	 In-Reply-To:MIME-Version; b=UWLEaFRFiQiZrgZnpN+uffnJBPEq+IJMJz1MAD8/4n7gqMmU2QKyX3N5GK5OVF89bla2w0KbqTzAxqjJxHu0/9qVXcA7X0Cfd6Jt61kDHCMUV23LGboOG2TyiwiBy2wsbYcQnxUGFdzK8IzWaiBd07tCqBaHTgEXfnigWMKMQzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FTqAzh0e; arc=fail smtp.client-ip=40.107.201.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FTqAzh0e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrvJ4gwJBxzpqHMBcYTAVgKje9UFfwltAwn18qrULoOevzjXE6Fomu1EXC8NPe9OW36q7fdv81QPaNMdvXmEt21fK6gbeHpeXWHZHvQxG6VPymTnUmBPi/N9t1f5FePmrAugMWs+3g+AxfubMP1EBFTlvJZogBsXqpZOgIz5A3trKP3t9GzGnm2wkwQeQwZclPDBBJot8HJWmcaBgWV1cPhFJC4hAlrepRAxR0RUJmI8bT+B5PH1WIs/kNxGjLdNxZi0Eh3Lu0v+c7VkIilWOYANh8nn0DaFPLHkeW040zKM7RYqlctfZCMcHsXNoZffuwuzxroVE5G7JSb62PXZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gd+wJ8e/raeP/kYrCpqeiQEpUNcMrUpqW5ZvvKS2Rs=;
 b=DYxhHgmfor7Nt1BKvoqToSGy3NLajuK3DkdeUZ1tHA5qyWME88quBC/sWwwj+2VXJTjYTQufv44KvtoalhIE04YCfZaCFxCNhg+njwR6JBlJAYHqIH33zwEPCN+HlvnDMhCJAmYsFNNkXI/FTBZdxBK3DW7kXYVzfAt0z/JlZ7X+Bl4Y6ivK7eiuSExpzHCym9V4HRN9JTClkn5MGURdrg/+8wQZ6vtOhKI8lDq3L34PsaTBRS4yjr6fGbWrFdfAyIrZdiX1l8vbHoTBf2M/hK7SUgiQlSf8/1XGdxRiXRBAdZ3nSWExofTZsXNJqEbs0cLDpeKtKQJ2ZAE8O5HjUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gd+wJ8e/raeP/kYrCpqeiQEpUNcMrUpqW5ZvvKS2Rs=;
 b=FTqAzh0eoHtfHa84KS84sbt9TpcXbmAjmqfiJGfnp8JSxiXMWmIjweIjT82sFchl7JFjJO0QPldWqRMRUX9Lug2Df+RATTHLCCxcFsR4yEYHbWGCc1hBHePYhetO6UD8+a0i7HJnacQAZvgigrmX8PlOHamg8snrNGhH8t9Ib7Eiez0y8LnFIMes3bfB++x7f1bIl0fbaxYYi3Y9hCrRpc1C7g1XiYNRUQHh6ieBP+oPp6+l8eV9y2blLq0iVubxd2kBRQyayUGLZkLrunMPr5lg5ho6kTH/UNlo0EBTxtLvH+boeiB/X6t3uYbdHyXIlBo5sIv4ks0lD396sbMKAQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DM4PR12MB7765.namprd12.prod.outlook.com (2603:10b6:8:113::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 02:47:10 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Fri, 16 Oct 2026
 02:47:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 22:47:09 -0400
Message-Id: <DM5X3STSH0MA.334PCP2CJFVG3@nvidia.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH for 7.4-rc2+ 7/7] mm/rmap: re-enable discarding lazyfree
 THPs at PMD level
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, "Zi Yan"
 <ziy@nvidia.com>
To: "David Hildenbrand" <david@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Dev Jain" <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance
 Yang" <lance.yang@linux.dev>, "Usama Arif" <usama.arif@linux.dev>, "Kiryl
 Shutsemau" <kas@kernel.org>, "Lorenzo Stoakes" <ljs@kernel.org>, "Rik van
 Riel" <riel@surriel.com>, "Vlastimil Babka" <vbabka@kernel.org>, "Harry
 Yoo" <harry@kernel.org>, "Jann Horn" <jannh@google.com>, "Kyle Zeng"
 <kylebot@openai.com>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.22.0
References: <20261015-anon_vma_uaf_fix-v1-0-7b977303b42b@nvidia.com>
 <20261015-anon_vma_uaf_fix-v1-7-7b977303b42b@nvidia.com>
In-Reply-To: <20261015-anon_vma_uaf_fix-v1-7-7b977303b42b@nvidia.com>
X-ClientProxiedBy: MN0PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:208:530::24) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DM4PR12MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d5fd1cd-4167-478d-0af9-08df2b2fc698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|261009223027099003|10067099003|921020|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	002UsCpMs/qgrEUVY16oyLK0ASnAKEH1oIk5RAVnxAMIKXsEhPZy2qbSbqFbA407IFOsBeAiUhIs9Ld9NrglauFgcvMa+wmEr9Etw3/AzONKHpRKrvva5PKtDAY2mJx0C6GdUVLzILkXipLROgcWm8d+rpX1nkYvfWMr44M4/V7LCTxl0bc4EEvs0sSBkfV3lWzRCGl7UkakCchLTZMco1Yo/WJTlpEORQXdYk0lOHT/g7PHdrygXG0p1r+AniKuLLKLiGyqnIb+RP5LEtMXrBh8QFqQupYNvnqKnR7glTpZE5eZofF/G3Hi3CFO4RMSpjv/3vq9xOQhQZsAM6odOfHJ95UpCABTzvC95bN4kTiRTMiWt5vptGcshw6BM/Op8lMoW3lXN834eVaq81YylguCpFjcRFOdKgM8r9nAH6PeJE8wp9qHTPN7awlvNoPu7+Ac2Bjn8OYBMZjTyvjzxMidGy+T2hGDNKq5IGxEs02B/0mdukKsA2s2NtmyqZ3e5Rd1Io8wYlTD8c7t0BpwJpVDE9RQ/CbK0lNGlV3lg2SIg0aolcT5uD9OVhq9zo36hyF2kb6AYdaA+HU9W4t4a5hJVdVXIi9ys+pbr3zUGnhXuhK76e+mKrFQ/cfT96IecI3uccNi3uq6EE1gh/lvUM7zaTpBKUp9ISl2Ufj0+wQqfAPxqSTNwXkiE7cCnpQadgUzeHxO+jVTdjaNaS+uRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(261009223027099003)(10067099003)(921020)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WE4zaXFONWpkY1ZwYlN0ZlVmT21yTWh1Zmo5bEdaNndXbGJuMkpEWHJGSmJB?=
 =?utf-8?B?RVdCelM5N1liMitaZ0VvV0diVWM3TWVmeUlPMVNTQTU1TTZiM1ZpNjlaTVpm?=
 =?utf-8?B?NVl1amw1QkRyQXQ0SEFqcTFRWFloeXE4cWR2a2o0dlkvWk5kZmFHOG5XTzhW?=
 =?utf-8?B?UGhOVEFaNnNUQ3BpYzhQaVRndFFIV2VxYVFsVTVSN0FDWlh5OC9KS0ZPZXd4?=
 =?utf-8?B?djUxZWxRQnVzZDFqNmF2N2FRMzQ0N2lCMVFOc2lQVUdMOVFYUmZwdWlyNTly?=
 =?utf-8?B?MDlSM0RJRUUzeURvMnZqRXhzWWx5VERUd1JhRVZTTkFVTnlRMEY2ZU9hZmZT?=
 =?utf-8?B?MVVGT1VYMDZNWHduWm5POFp3MVBKRkNUczl6Z29tTkxXOFlhREJWWklKdkg3?=
 =?utf-8?B?ZmE2MDY0OWQ1YzdZVTVQNndZeTFVd0NFZXNQdnRTT09oSzN6WXpwQnppb0Zs?=
 =?utf-8?B?ZHZ1NjVWdXZTcFpVU3pTRzh3bklQV3lLUCtSTytyRkh2cWZYNEVrTk14eGF3?=
 =?utf-8?B?MFRTVU8vWUVVQUFoNjg1U01ycHRXbEdrak1Od0NCUVRTekRiUjY2bjRLczB1?=
 =?utf-8?B?QlkvclZDVlltSWFuSXdUQ1dPWjk2WGp3WGpWcGd6Y1pCeW1PSXZ3UzJnbGlp?=
 =?utf-8?B?OEMwVFpZbnBNdzNGcDNrTXE3RS9INE1PWlN5NzhaS0FOWWJIQkRNbGVZaHp2?=
 =?utf-8?B?ZmIydGROWHUzZWRkMHRDaGQ0bzgvT2FTNHAvcXZWemZpS3VzK2RzUGdDakVT?=
 =?utf-8?B?T2U0bnJMQk1MVWJnMER0Qm8rR1BoSWwwZGs0VXRlSThmRW5ramUvK0Ntbytz?=
 =?utf-8?B?UllpWVVaWmhFd1VpaG5YS1B0dmU0QlBjR052QlJ0RnZEQXBBNWtMbjFEbyto?=
 =?utf-8?B?Mm5rM04vQmo2SFpiN0NtcHBvaWNPQUhjUjU5K2t2dm5JcGpCNVBHSVIvYmls?=
 =?utf-8?B?V0NLOGcxdnppL29oQ2JyK2pZMXpTLzAwdmdUSHFjMUtsTU5iQ3N1WEJDVWdy?=
 =?utf-8?B?TytlOWFoL2h5V1N4b012VnNVKy9IeDRUdTV3blVwZEYxbWtHZjlZNnZJYWZ3?=
 =?utf-8?B?enNGNHUwWWVLRUU1UDR2eGd5T3JYZmhFYVhjTEhUckNIVnIxUkNwNGtnTkJx?=
 =?utf-8?B?b2RTTlRQTU4yOUcxUjFSMUExSkxUYUVsWkE5aS91ZitiaThBekUrM1pNVkxv?=
 =?utf-8?B?RTRPZVhyd1RCNHZlQWMzQWJtb3ovQ04yMldVckk1UTdaa3JTT083NElEMjQz?=
 =?utf-8?B?cnNYb3dJZmI5MzZoMGdWQjJYcGtXVHk1MTRFdEFIRzNRaTIxaDlSNnhNWUNJ?=
 =?utf-8?B?cDBCYXV6MW5RRUNINm5COTVnTlFSM2NpZW1RbzhtZ2FpNnU4WjA1a2tGSysy?=
 =?utf-8?B?SzN5Y1IzRXJjL0FvRTRidGsvQ0pCUzhacEpncE9ZQ2F3Tm5DMjA2YWpYMmlv?=
 =?utf-8?B?MDhiWnk2VG8wcjFRaUpBNGEzRGwycDY2MXJ4THZnOWRVQWFDZlNCakZKd2VB?=
 =?utf-8?B?dkQ5K1UyeG11dXJabExIcUpuSWJ5NWNuWlBMc3ZVN0lZd3NWaHB5L1RqVkll?=
 =?utf-8?B?QXErVHIzMU5aUi93c3MwNlNRL0Y3ZnlNK1I4S1hkVzRXQ2FpeTdRcWlXb1lE?=
 =?utf-8?B?dEJRYUFuZFhEQmk0WmlsY1NDcnc0czR1a01KVkRGbkNIUHl1dTJPMU5pQnhj?=
 =?utf-8?B?TlFIQjd6eGh2a2dvWFp1dzZKNnRtYXFwRWdXdVFPV0RSeERBNWpCd2E2bDg3?=
 =?utf-8?B?TS9jSlJ6MW0xRzhEcEFQMENqY0llUnN6eFIyS3RpVi9HZ2grWmQydkNOU2Fv?=
 =?utf-8?B?Q3cwTStJUTVZekxIbzdGd0VkOFo2dVJ2L2dUanZQdTNKb0NRa1ZtUTc0OTJJ?=
 =?utf-8?B?akpQNjVPTGc3NXAwTktpUlpwSkxIYWppQzVzY3RHL0cyUFBLN3Z6Z0ZEYWZV?=
 =?utf-8?B?L3M3TGhQdWNMU3RzTmpId0RXY1c3cHVpTXpUYWp4Q3ZsbjFlcnZMKzh3QlpI?=
 =?utf-8?B?NGQ2V2hTYk9aaDBvNmI0alNqbW1RNnJQWEhBMHJEcERCUHEzSFo3RFdONDJy?=
 =?utf-8?B?cnQwVHpmSU1pQkcvV2RxR1VWd2cwNG53OStObjlld0JrNlhSd1JZZVRoakkr?=
 =?utf-8?B?cCs0c296dUhZTUNoWkd3Nm82RTE0cWJPSVVmNjU4YmhwemFOQ1Z4d3Z3bDZw?=
 =?utf-8?B?WEdNSHVzdHc4MzAzSXFsKzBYWkxodWVTaWh6alVtY3p1alpKcmNQSW1CTUtL?=
 =?utf-8?B?dkxIcGQyR3EzdjJXTjZOYTl3b1lqMnFOYldlUDBUN1dSTkQ1NHZyb1RpRkp1?=
 =?utf-8?Q?iSu8CsbvG/GHV6H6x3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d5fd1cd-4167-478d-0af9-08df2b2fc698
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 02:47:10.6055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNR9uwq7DVmd9VWb5T9OynntOwX4BB2VlAUBagEiLPKimOKhng3ftJicr04irULi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7765

On Thu Oct 15, 2026 at 2:13 PM EDT, Zi Yan wrote:
> The patch "mm/rmap: don't discard lazyfree THPs at PMD level" disabled
> the PMD-level discard, because it cleared the PMD before checking whether
> the folio could be discarded, and munmap() or mremap() could skip that
> transiently none PMD.
>
> __discard_anon_folio_pmd_locked() now keeps the PMD invalidated, not
> cleared, until the discard is committed, GUP-fast no longer follows an
> invalidated PMD on any architecture, powerpc page table check no longer
> counts an invalidated PMD as mapped, and sparc64 keeps thp_pte_count
> balanced when an invalidated PMD is set again or cleared. Discard lazyfre=
e
> THPs at PMD level again.
>
> Assisted-by: LLM
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> To: Andrew Morton <akpm@linux-foundation.org>
> To: David Hildenbrand <david@kernel.org>
> To: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Rik van Riel <riel@surriel.com>
> Cc: "Liam R. Howlett" <liam@infradead.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Harry Yoo <harry@kernel.org>
> Cc: Jann Horn <jannh@google.com>
> Cc: Lance Yang <lance.yang@linux.dev>
> Cc: Kyle Zeng <kylebot@openai.com>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  mm/rmap.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 1131b76bbbc28..805db93fe0428 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2275,6 +2275,17 @@ static bool try_to_unmap_one(struct folio *folio, =
struct vm_area_struct *vma,
>  		}
> =20
>  		if (!pvmw.pte) {
> +			if (folio_test_lazyfree(folio)) {
> +				if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd, folio))

Sashiko mentioned that unmap_huge_pmd_locked() does add_mm_counter()
without calling update_hiwater_rss() first so that peak RSS can be
under-reported.

Answer:

yes, I fixed it locally by calling update_hiwater_rss() before
unmap_huge_pmd_locked().

> +					goto walk_done;
> +				/*
> +				 * unmap_huge_pmd_locked has either already marked
> +				 * the folio as swap-backed or decided to retain it
> +				 * due to GUP or speculative references.
> +				 */
> +				goto walk_abort;
> +			}
> +
>  			if (flags & TTU_SPLIT_HUGE_PMD) {
>  				/*
>  				 * We temporarily have to drop the PTL and




--=20
Best Regards,
Yan, Zi

