Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012059.outbound.protection.outlook.com [52.101.48.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068182F619D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791567627; cv=fail; b=rd2DAmX2jv0HZXlYoOhDcE+Fd8JCtSAA/ArQzrAQd2kemEIPLn+nGAz3xVwYpiT7XqdlzxEQrtGk6TvNkguHSWSwvKvbzRPSBsqx5ErSv/2YNSd6aPfdn1HpFae+7iMyFjNG/wZPtMuF7ATaV2s4eT3V9GfCUGfJJIq5bCmn+cQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791567627; c=relaxed/simple;
	bh=AkHmywcqF/XWlLRn0NWctfCfat4qPDOpcC8pLE4nChI=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=tYpBzPouuyWczbpdkIbg+9SFUxBzZ9SPO5M64WGHlsqF9NsjdgDcArSqVNhMnVkaxHg0ydZRmkFhVRF/W/0lLimBlTXBDd4NQhC+7duIS8kR1n3wLkOK37fnpyBQXnIsmtjsMzpz9mM3Tswouji+0Bp9msVBnOdYkkyHo+A1nsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lUg5T4cH; arc=fail smtp.client-ip=52.101.48.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lUg5T4cH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kC0Dye9C3wZhvTB02X7OibAEiDExq++F1HGXUhYzqP8xQTVBQWfW+gIm3+djlQaa8prUQYBjnwAZh36EhtnkSZ3F4LjdVSKjUUk1HkbyXHXhu9Vd3W75rq8qs5nX1u9JO/sBmPNvp7DrB4mXRxmnEV6W3jKm92c+ojNzQpu0xDVfP3Lv9ESMilVbW5Q7KgncCxIksWVboLe0m1KHpE9CnnXCm6IJpsTohSpgjp63nv5kh+pJ9CMNW4Wcw3D8Mj2vDO+p7y4w0XOBEnSt6bcVco1vbGiYtVvKN/tN/+xoDIfe4gJdq/J1HM2ZIvdjjxM7lN1i7r+88FSDsr3uJHMzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcATiHbn3ycAGlktWFurD8VuO2DXbq0gcF/7+TfYiwc=;
 b=gqk0yCTO5hztQbWKtfytbxgrnlQAijVSLsO5X4gP95sYL1B4At6bazlZ2yduMnt5jVq2Kl1/LMb5PRjIKBp1Paew+yUgdEylDMXaTdF1KJiZ+U9s9cPFc4FmEqv2rVYm5AzXzCa67oa4Z5HBaszWVT+x9u0FTEDK9427ButUgJVGqL+wmSKGp/vqsqD3FuajQ3IbIWiv7tg4fU/Jc7l94eW8gpkh3R1/B8xSp6R7iWLPVZOz7vTQ6eTKQ3gl9yzuVd0YO9tKq94lHJW4o66pqOFGl0y4Hw+rvYt1JHj8jNgYpzoE5Z35+ik0R9nIODaZVZ/dRDxi4Priq3AiaFbCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcATiHbn3ycAGlktWFurD8VuO2DXbq0gcF/7+TfYiwc=;
 b=lUg5T4cHktsPqcngWJb04PJ58KqEcx5XzLtxUxGI2AS3t2Ryv0FrMXFAao3eXmyvpeWtHv/k1rVD2JU4ubQ2rAeUUMwAst48OPgqr6bDfGCX8fSzr/WM3ueKDPegsB2oDqkRuwcmTg7BQha1Oylb9eVfPzhiFYzT13WrC22kheRUP/YHS9mbUWQWCqdQMle9dx8VoakBcRjAUXKVi8nXqA/syXbqcEVtRqygkrvtCIed4E9MCsh9krqGcm/I5FWWBq2WYe7W/kJxSPyvQl0gdEouh6Da2+4+/L2Sb73oi46eH320Pcufn52WUW98nVrXeymxHQtdBPuyAnynoZMHmg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SN7PR12MB8058.namprd12.prod.outlook.com (2603:10b6:806:348::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Fri, 9 Oct
 2026 17:40:19 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 17:40:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 13:40:17 -0400
Message-Id: <DM0HPT9WBHEM.1XEFJ6BZ7PPWL@nvidia.com>
Subject: Re: [PATCH v8 13/30] mm: handle PMD swap entries in fork path
Cc: <ying.huang@linux.alibaba.com>, "Baoquan He" <baoquan.he@linux.dev>,
 <willy@infradead.org>, <youngjun.park@lge.com>, <hannes@cmpxchg.org>,
 <riel@surriel.com>, <shakeel.butt@linux.dev>, <alex@ghiti.fr>,
 <kas@kernel.org>, <baohua@kernel.org>, <dev.jain@arm.com>,
 <baolin.wang@linux.alibaba.com>, "Nico Pache" <nico.pache@linux.dev>, "Liam
 R.Howlett" <liam@infradead.org>, <ryan.roberts@arm.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, <lance.yang@linux.dev>,
 <linux-kernel@vger.kernel.org>, <nphamcs@gmail.com>,
 <shikemeng@huaweicloud.com>, <yosry@kernel.org>, <qi.zheng@linux.dev>,
 <luizcap@redhat.com>, <kernel-team@meta.com>
To: "Usama Arif" <usama.arif@linux.dev>, "Andrew Morton"
 <akpm@linux-foundation.org>, <david@kernel.org>, <chrisl@kernel.org>,
 <kasong@tencent.com>, <ljs@kernel.org>, <linux-mm@kvack.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20261002095503.3585565-1-usama.arif@linux.dev>
 <20261002095503.3585565-14-usama.arif@linux.dev>
In-Reply-To: <20261002095503.3585565-14-usama.arif@linux.dev>
X-ClientProxiedBy: BN9PR03CA0485.namprd03.prod.outlook.com
 (2603:10b6:408:130::10) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SN7PR12MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: a019b054-508f-4dec-e22b-08df262c62e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|366016|376014|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m0wmP/pnA6TooFeo53F0pThzlal+J8rumCnlKzM/3HYe2wl3NZNtlreHBAMI5aYOCx73YHgnA4VyMttqH47eI5xWFb0gdmY6jG1KUu4XcTwJR7uFK3gZNiV6GOAJ651ZK2mS6WTid4JG9GgGcWxCLtReuQZsNwzHsUo5QQE3okwUFhCCeCmiVI361WosSVcCXLhxjMJGh63cG23yZt/lHRCaY1+hgc5FsjRbfP1jY+b7PX2ya2LmPy6brZiQOev+ESCGGBSj5bI4Szn/0ZF/J0Gk9R0/AQmbEoyypIYrJcSd/hnumIczGVMGjJMMreKtbBZlrZ9WlBnU+fof+h1kRgtZic5HZddc0LyFCwS+ay7GoWkNOyv+zQlsrxl4kJvsDSbgDWt/GhkAEgTkcAEGVqqcJW38j8/ZIlS8VmYxETSuEitpiKVIDfTDj9LHG0MFiZ3Gt5wsBLRXssvjdPn8qI0Uz272BybUiee6QSMt6tKWGgjwYPp4lTjmkM9ZaMICcpodVTO3GqR/YH+dgwW6pi3LWEer5CwOSD+/X4+UP/E1eRT35CAiigVQ01EdIkwabVhF7rQram39MxsTa9fj0AzleIQGf2jR2uj3oggXvnz5IT1plrw1blvtNVA+D1ZjmuagQj1Ke9QzzxxzYaUDj0gp+k3BTaBn3UAM68r/lps=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(366016)(376014)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWVDdHowcCtrV0VQWVVYdjFWbEthWTFVY3BNNnRlSWF4WUdwUTkvU2cvWVBV?=
 =?utf-8?B?cHFDa25jY2RCL1hMekc2WWNnRndUK1RWdHEwSGFrRVU4MDU1SHd4SlBQNDBI?=
 =?utf-8?B?eTU0RUJVUWRJUlZnZC83UndzaFJUY0kyV2RURFFpbzRoZ2YzQTF6SW8yUzdn?=
 =?utf-8?B?TVhOT0E2bTBsQUFyY2UyZmwwMkhwdzFzcmxqdG5PYTJUN0ZzOXBISWZXN3dr?=
 =?utf-8?B?OGd5TjBwd2dmcnowMnNZWFBNUTF0THFqQVZCd1hiWDQ0bzZZVGJXakdQUzJ6?=
 =?utf-8?B?bWZrSnFTVCtKR3hXUmQ0ZklHUkJQeGhPRllnNUJ3OVhRTXJYb0pkQjdZSS9E?=
 =?utf-8?B?SzcyWFJlSnp0TSs2czduK3Z6MkxSeWdmcHJrSktuSGFVOGZEM1JQNkZtRUox?=
 =?utf-8?B?V1gzaDAxOTQvUXBheEVXaEJ4UkxLZ3B0MGIzeHNLakhpSk5wVnNRN0k3aHZW?=
 =?utf-8?B?Vy9VMVFzSFpMZlNhSGVuTzJ1R2hPaGJ2T0VQdURTUDA2eXF6Rnhma3FBU0J5?=
 =?utf-8?B?SWxPcStua2t0TmRRMXJiVWQyWTNiMFdWN2FQa3NUN21ZZURSdnkrZnVQaHA2?=
 =?utf-8?B?YTdTTlhjK2VKWDJKMjAzdWlDa2pxVm44K1FrZDZ1OEtkWHpOTU9LWkJOL2Nl?=
 =?utf-8?B?RHNHdk9GOFV5NzVzS2ViR2JhY01vbVdVRFZ5Tk8zU2xHVnNRNXZpWEdqODNI?=
 =?utf-8?B?U3Q0dlI5SFdsdzRpak0zQ2J3dmdOb3Z0R0twNzluMFpNSnhMdTNKYmhZNUgr?=
 =?utf-8?B?bG1yeUs2dktnV3dxcHVGcGtDYlE2dEp3U1VVdU9DcTJtYW1DSUNGdVFNL28v?=
 =?utf-8?B?OGFtQlFJWm5rdnNCMWlTOUNKWStjS0IrcUpaMWEvZUJ1dEtCV0tObHd6bits?=
 =?utf-8?B?OFFCWkZKdVplc0xNVjdZbnZVMU4reVpBZ1pWUEg0RmFLZTFDRmlCSjFSREJZ?=
 =?utf-8?B?aXpsZ2o4SVB1N0N5QUNuN0t2NVNvUUU2amxkazNLS2w5RThjN2hjNDBmQ3Br?=
 =?utf-8?B?clZBeEtsSmN1UFI1aHRpVEIvSDVKQlUxajBBRjgvcys5VHVrYnlGdjFNN0Ix?=
 =?utf-8?B?aXlXTXg4RmVodGUyd2FPNXJnZ0lCekhJTlNTOUIva2RidVM1ZnRhT0ZtbUQ3?=
 =?utf-8?B?TTIyMllCSnB5L1ZlMUI4SzlWRFcva0paRlFkMUlQV3FZL2pLeDR0YVVCTGJQ?=
 =?utf-8?B?MFZQeVMxMHlFODlhaXVxL2d2THVHc3VCdVpDVjNLbWdneDBzQkx0bDNQQ04r?=
 =?utf-8?B?T2s2K3YyL25tdzRTT1FGZzd0QUhmbS9Hcm92azByWG0xc04wT2hDR1BwR3ZR?=
 =?utf-8?B?eS9pVkdYY2Rxd1oxTXRvU09ZNlZTaHVmZllHdVZ1UGNTTlE1NU9JNmJQUG40?=
 =?utf-8?B?Zmh2R3V3YlZhYTB1YndEdmJ6bXFRU0pWZzJ3eG9qd1N0a0dtaTZPUnRsM1VD?=
 =?utf-8?B?ZjJud2hrVGRRVEl3VFFEUzBIWkhxaGZPN3B4dDJSTXpiWklGUHN6dFVyMnBI?=
 =?utf-8?B?QmVDYm9OMGhTdWtrYzNmZmgrVVpXZTZlbk9tam5VdStNOUcrbk0xY3dFYkFu?=
 =?utf-8?B?ZjN0aVJmbE1CaE5LVi9SUTJBbjRjalVRV1N4UitGMEE4QW91QUg0a1M0MnFT?=
 =?utf-8?B?M0FCa0Y1RFRqbWhNaWlYQnhRWENjdlNqMXE2U3RnNXZJNGVtODVmY1N0enRQ?=
 =?utf-8?B?UThHT0ppcGFqUDIzdFhkcUpRS3VTQ0R4YXNHMWVBa2RXNDJoYmJ2Qnd5eDB6?=
 =?utf-8?B?M2dudE9WRWRGSC9ldmgzam5OUU9qMFo3WWIvekZSc1I3T3pLSkVJbGZ2V1pP?=
 =?utf-8?B?VE1yM1BEWDJBZFpqNzJzdHFaT2pxaklQRDBlVURUTzVvaXBjdkxLY2lyT2xO?=
 =?utf-8?B?anlTOXNUa1RTV2JVVEFBZ3crb3Yrd1FKZVIwd29tNjlVNXh0MVFEcFdPeTdN?=
 =?utf-8?B?ditJbGF5SnpLQ203WHBKN2p4WEVDV3h3NEtta3RaRVhoVUpWRWpFb3pZTWdE?=
 =?utf-8?B?U1BJVXRKbzJkdFBycWtHNlVRUFlVUFpuNVFqR3E4NUlOaEtHUzY5TlFTSnVN?=
 =?utf-8?B?MEt1Nm1VbmtYazQwMm1YTktVV0lrTFIyd2duU1RJK3pjZXM2RDBhaWZIbUls?=
 =?utf-8?B?em41OWdTOHQ3ejArUHo5WUZWVTB6aW5hOVczZHE1L3JscDNJUmpjZlcvTUtE?=
 =?utf-8?B?LzZCVnVlWmxQSTNrYi9zU3EyZkNKYjJxRnZ4b0xSOXkvRUdDS1g4VWhTTlRi?=
 =?utf-8?B?VDFFMEpsTEI2Sm04SVBjTzlHYkJwOEQ0VDg0OWZXeEJMbVJTVWlOeUVwWGtK?=
 =?utf-8?Q?U9TNvmt4JOWTU3lIEh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a019b054-508f-4dec-e22b-08df262c62e9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 17:40:19.1206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mh1NPu17GVnHNOpR3pxuT0rk3DYPOp482uPOj85Z0Q+hk0S46iycclMsWPKEwraL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8058

On Fri Oct 2, 2026 at 5:52 AM EDT, Usama Arif wrote:
> copy_huge_pmd() only knows about migration and device-private PMDs, so a
> PMD swap entry would fall through to the present-PMD path and fork() woul=
d
> duplicate it without taking a reference on the slots it points at.
>
> Copy it the way copy_nonpresent_pte() copies a PTE swap entry: duplicate
> the swap references, clear the exclusive marker on the source, put the
> destination mm on mmlist, and account the child's slots to MM_SWAPENTS.
>
> The GFP_ATOMIC extend-table allocation inside the dup can fail. Report th=
at
> as -EIO and let copy_pmd_range() retry with GFP_KERNEL, as
> copy_nonpresent_pte() and copy_pte_range() already do for a PTE swap entr=
y.
> copy_huge_pmd() hands the entry back so the caller knows which range to
> allocate for.
>
> Only -ENOMEM is reported that way. The other failures mean the entry itse=
lf
> is bad, and swap_retry_table_alloc_nr() returns 0 for those, so collapsin=
g
> them into -EIO as the PTE path does would spin in the caller's retry rath=
er
> than failing the fork.
>
> While here, move the mm counter update into each entry-type arm, as the P=
TE
> version does, so the swap arm can account MM_SWAPENTS instead of
> MM_ANONPAGES.
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  include/linux/huge_mm.h |  3 +-
>  mm/huge_memory.c        | 62 ++++++++++++++++++++++++++++++-----------
>  mm/memory.c             | 12 +++++++-
>  3 files changed, 58 insertions(+), 19 deletions(-)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 8205e83f27771..7aa63d982af07 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -10,7 +10,8 @@
>  vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf);
>  int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  		  pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
> -		  struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma);
> +		  struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
> +		  softleaf_t *entryp);
>  bool huge_pmd_set_accessed(struct vm_fault *vmf);
>  int copy_huge_pud(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  		  pud_t *dst_pud, pud_t *src_pud, unsigned long addr,
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 24d116ae1fc30..80d18ca972ecf 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1894,7 +1894,7 @@ bool touch_pmd(struct vm_area_struct *vma, unsigned=
 long addr,
>  	return false;
>  }
> =20
> -static void copy_huge_non_present_pmd(
> +static int copy_huge_non_present_pmd(
>  		struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  		pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
>  		struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
> @@ -1902,18 +1902,41 @@ static void copy_huge_non_present_pmd(
>  {
>  	softleaf_t entry =3D softleaf_from_pmd(pmd);
>  	struct folio *src_folio;
> +	int err;
> =20
>  	VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(pmd));
> =20
> -	if (softleaf_is_migration_write(entry) ||
> -	    softleaf_is_migration_read_exclusive(entry)) {
> -		entry =3D make_readable_migration_entry(swp_offset(entry));
> -		pmd =3D softleaf_to_pmd(entry);
> -		if (pmd_swp_soft_dirty(*src_pmd))
> -			pmd =3D pmd_swp_mksoft_dirty(pmd);
> -		if (pmd_swp_uffd(*src_pmd))
> -			pmd =3D pmd_swp_mkuffd(pmd);
> -		set_pmd_at(src_mm, addr, src_pmd, pmd);
> +	if (softleaf_is_swap(entry)) {
> +		/*
> +		 * A PMD swap entry only exists under CONFIG_THP_SWAP, where
> +		 * SWAPFILE_CLUSTER =3D=3D HPAGE_PMD_NR, and it is cluster aligned,
> +		 * so these HPAGE_PMD_NR slots are exactly one cluster - which
> +		 * is what swap_dup_entries_direct() requires.
> +		 */
> +		err =3D swap_dup_entries_direct(entry, HPAGE_PMD_NR);
> +		if (err)
> +			/* Only -ENOMEM is worth a GFP_KERNEL retry. */

Is it better to say "if swap_dup_entries_direct() cannot allocate
memory, return -EIO so that the caller can retry with GFP_KERNEL. Fail
the fork on any other error"? It clarifies why EIO is needed.

> +			return err =3D=3D -ENOMEM ? -EIO : -ENOMEM;
> +

Otherwise, LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi

