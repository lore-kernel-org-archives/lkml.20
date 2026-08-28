Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013041.outbound.protection.outlook.com [40.93.201.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862FE382F35
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787886877; cv=fail; b=ocXJ7vX2iGU8dQPO97AWIsliO17E8s/xkwiqQzk8MMDTS+QYt14gf1NGPRwXFZlqoMG9kTdFGsbDFNWktqFG8KvDROlnBzAxH7745htafx6KYqEzuLxlUIsZ5MOLvskPd4AiNA4vXjuZzsN70Tzg50M0hwwvRv+a/A+Az9z88qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787886877; c=relaxed/simple;
	bh=DSqDdPq3VokGWCVv0ZKbW18IkZlJnrokFKUEX2xv7vg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=doOgRYkDTKShYPaNGa60MyCsHdnsSq/5umXyCQ+VQ+7xzEwvF+q5AZM6FXC4vVfk7FCRO7b2ZTqdGX6zopMXQ+UiGlp0rqB2OxLhayXRTyzh2pGKtBdDfSok0euyZg1kRHCppxSTny/QayQ4TdQEpvfZtLtgTiqN61haGEFMrNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IsTECDtB; arc=fail smtp.client-ip=40.93.201.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IsTECDtB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjEvtl+dSgTckjxrz1pS9hb+9tjT0ia+H0buqIFtC4159ymtcgcFT9kgrzo8s5p96+2IGrnxuQkiuSQO54fPhFgpOhLbuEzonJO1NadHgzg2lrA8G68qMprCdQ0u+9F9rp8UksNpTLnM0g2zR8/NVaCtJZW8HKP9gPYDHGqiFAHcsCT8fO0dDEYYswCp2JItFAhpDEakS4xAznjD95Yid3wFhhba2HywYavJEZx80aSxyJLXAMfQGKmVV/gOpAviOsDqJd5pyU2OEhaPIAQIWpGtCpeBPUR2EBlTyX6Pe+h0eUWDLKE2yzvAk143n7CYmE1ns0Lr64Hxt5JCIQ+OCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9R9WpVMdzziylro7QQR88l79scfqvKFp1lPOi5f9RY=;
 b=siJk7kI6t+eEpcxwMwBDFGjfjJU/STqFcoTXcGzNGdYpbKDgUAB6N3Qpj4ttcz6FPhTWfyV8sXsyqD79vTnrKGrIDuPylG2j5m4Aa5sA5iICsohdxetqwRJba6AATthinZgeYrgHKhI5sgnmWocaH2zDWp1Gsow3ZSGC5fDn6wgCFmziOq9gaEeKhCfh40qy8vpZqY8j/hmQeozfSAHq8eXvhAawgnX2ZEwHoUd1BU10mfho9/PNYV5jmhXuoutS9of3Fd9U68lsE9L0v0UUH6rx8lPyi1D3ayfyqpVQVvMVEPX+zT7lUWXuuDj0vRLMasZct/lZMK2HHKXHcJxFBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9R9WpVMdzziylro7QQR88l79scfqvKFp1lPOi5f9RY=;
 b=IsTECDtBw82Aa6xWRLj+s5PYD30uwaMPbeyHXA/DDWQnrVdFmywozqNyh25ms4tk6B8sX3RU1WgX7cFGNXBjNe1xssicKgAExDlm67RU86V+eesZE7n3svZ0flt7co0G4FcNAjtzs19cxZ3RewHvh8B2ZxckQ9jy/oOZxzWi69DhXO2CS5wttJEGnq7hrpQWmI98bsnPsno+LKLckLc64KotMotgOT3S8xHeGQD/TFZCUG0A8rkACaU6an+Fbah9wzjfbe6qccsegbKn3xePBJKvqKT0aKm/Gd5n0bt15SV85DoqhfaGr+b6npAFzSYW+4NAu+Ih/3Ijg/HT9PZT7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY1PR12MB9651.namprd12.prod.outlook.com (2603:10b6:930:104::8)
 by IA0PR12MB8694.namprd12.prod.outlook.com (2603:10b6:208:488::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 03:14:13 +0000
Received: from CY1PR12MB9651.namprd12.prod.outlook.com
 ([fe80::b893:49b6:a5ce:6744]) by CY1PR12MB9651.namprd12.prod.outlook.com
 ([fe80::b893:49b6:a5ce:6744%6]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 03:14:12 +0000
Message-ID: <2662e4be-3581-4162-94b7-e027067b2320@nvidia.com>
Date: Fri, 28 Aug 2026 13:14:02 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Fix deferred_split_isolate() and clean up
 __folio_freeze_and_split_unmapped()
To: Kiryl Shutsemau <kirill@shutemov.name>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, hannes@cmpxchg.org, usama.arif@linux.dev
Cc: lance.yang@linux.dev, ziy@nvidia.com, hughd@google.com,
 baolin.wang@linux.alibaba.com, baohua@kernel.org, liam@infradead.org,
 nico.pache@linux.dev, dev.jain@arm.com, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <20260826162101.1314941-1-kirill@shutemov.name>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20260826162101.1314941-1-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MEVPR01CA0038.ausprd01.prod.outlook.com
 (2603:10c6:220:1ff::11) To CH1PR12MB9670.namprd12.prod.outlook.com
 (2603:10b6:610:2af::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9651:EE_|IA0PR12MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: b225e626-556f-4624-a754-08df04b26eac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|23010399003|376014|7416014|10067099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	yfcPv4ErW7KBB9uvo6h9fRzueTq5MwHuNwnJ/bX+C4pcKwoEivqHcztHk4a7co2k/5fhXlNRtxapvcDsPVyNeLUZUnN9n47sr7cvqE9+2nVxglbL6eZGZ2nsOdqXVHej2gAOrEZUsR75cFzevQO0g/Fy5wRtQVmF/vGSIMkrAnX2x50lMRz3+ynw90FyQVQ0+nYfvW9UD0rGmSpehd/Bagbwa8kyQJRju4e2Y34IufcvSQbbeDLjGxbk5XVWc6MFttyhONg/EFuJ1z97InK5MX2VqvBjlH7GZ1moI2nXf1nvmixzsQiPmj4WVXSb6rhHOljlJ9gCNdgn4Zz8yX0BV+zM3ojI1rsDKXFw2k5kOw8APe1yj9NFqoGqr42R+QSDJTeH7rwuB7+2krBG4WXbWK/NxWoXD0BF4GCFkG9XU5pRCykSPHdu3u/7BDdZ8aErzpq30Ttf2N6mpzi/kQ9ewObtOrgvhaMN4RYdYMSDwehB+SaHLvwhhgSJoDodOEHPSutjmIoI059hlCb1yIGM7j2W+Nzmq8EDNwTXXwerEJRzOUfcdEkdLVftza/z5Fls6FvylQiDNLuJ+aJHLZiOp3tQ3UkHYKohLqatbLuk5pmNZI8cGLgfUF6mEJv35/EcKEudCzT/NNHIc7Sstzzq+qmyzQto4yZRDR3X9E2Wgu4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9651.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(23010399003)(376014)(7416014)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2dTS0d4ck80Uis0eHhiUlpKY3kxWXlyaUdvRkhoZjF1RUU3L2lxcFVBNjFG?=
 =?utf-8?B?MUxpOVA3MXB6S05ROHdabldZSkVDZ0VEZVpBSEtEclkyd1pLenR1c01ScU9t?=
 =?utf-8?B?bnkxblR2eDZ2VEN2REUyTExvNUYwM01yOERHbG1qTEU0SHpGNlplZUNiOEZn?=
 =?utf-8?B?emJucEUxbFNPNnQvUG92dkkyTXU3NXJxZU4zb1NOTVdqd2tBWTVvUTNxWkZr?=
 =?utf-8?B?b1B5c1FpN3MvTmZybExFSWpaSFhORzBOWWRMeHhjTlVndCs2M2hnUE1BcWhT?=
 =?utf-8?B?U0dWMGY3S0ZRTjVHc0R1VmhZcC9YenEzaTlHbWJvMVI3WXQ5NThFL3UxYjZk?=
 =?utf-8?B?Lzljd1FpaGNnbW0xWFBtejFhelVsSnFXckJkcmpLR1JXSm1sRGx0UXprSTZR?=
 =?utf-8?B?YzNsWVd1TVRjVGF5Y2d6VUpsN0dLM1BRZUcxUitwRy9lOHU5aWpvdVBSRVJS?=
 =?utf-8?B?cFo3Y3FxK3ZpYlE5M3o3bDJLeXhEZlByakZ0OUJTMHNMTnZ6ZW42c3hSRTBT?=
 =?utf-8?B?SDhrQTBLS3NuNVUyK1h1NCsrczkzL2ZoZjhCaEh4anN5UThJM1NVdnd6Rmk1?=
 =?utf-8?B?b2R3aFhkclNtdTA5ejg1NTdLZUhtaU5pb0s1RFBvYW8zV1Bzam15V2wva1NL?=
 =?utf-8?B?NXlwQUtqcXVpNVZGNmxzS3FWWHoxSlRLd1BvT2NKc25LWm85RWtiU1FFNE5r?=
 =?utf-8?B?b2ZsRGZUQ0RlcGRBT242Vm5pR3Z3QTBTYkhZc0dtc2lvZjB3SnNVdXdubWFp?=
 =?utf-8?B?QWI2MGw4RkZLaDRrTnMyTjRkdWoyODBhMEM0ZkFoaGJVbWJrOHV3dmNYL3h1?=
 =?utf-8?B?eXNObFN0WFZvVnMrRlZmaDFlQm1aL20zTG9MV01mbjFEOU5SMWZFKzVHSjc0?=
 =?utf-8?B?VXJIalFqakpxTmFJVkNhdHVpbUFQeUVDN1c5ZlpIRThDbGl2d0pka1Nkekdj?=
 =?utf-8?B?WmsvN0w1RElCbXlMNTFkQ1BNdkRHVTNaVVRMbk1BNDNWeW1rSlVtbWtzZ3Bk?=
 =?utf-8?B?WGtDd1BSaWF6Zkw1Zm12MmxybXMzOVdUK2o3T1lVU3p1WkxOTXdoQnBGV0gv?=
 =?utf-8?B?VWVRWkFLbUpSRGNqZnhJZDNiYlRld2xQTStJNVhWSGtQQVQxR0Y2TlFHMlJw?=
 =?utf-8?B?a3V6WXNJanBZMmRLQWp2ZG9NS2VEU2Ywc0VTM0tLVitpMmcyQzQ2K2dOTUgr?=
 =?utf-8?B?bmlLb0VuS0lxaHZGbDVvQUMzU3VnaUxjdVkzQVZuL2s4OVRHaVJpeHhPU0E0?=
 =?utf-8?B?SkZjNjgyU0lxR0xUbzFTRXphQUo4eHVPN0hua09XeHZmOGdBV2U0ZW9zNnhZ?=
 =?utf-8?B?TnorUkJNMUtlUHZ3VjZMbStqMG5lWmpCb1Jvb2xGS3lkQTdWOHpMZ1BCOTlO?=
 =?utf-8?B?SEtGVFZwL1pLMncyNUxJMGYvRXFqOEV3RTZHVjdiVWRTMnRoRGxKK2ZqbWd0?=
 =?utf-8?B?d21xcFlGY3ZHaW1PMHNkLzBhZW5nOXpLSmRrR1JhNWE1Z0RocWljWFpFbGFQ?=
 =?utf-8?B?N1g4RFpNakFGZ3FXb2oyQnRhRG5kT05LR0Y5d09lUUNMYUZLYlk3WUpIWTYr?=
 =?utf-8?B?dUp1LzRkRjcyMnlYNmtWNE1YUDBpd3pkdHhERjNtN1F2RkF5K1hQOWM1U1Nx?=
 =?utf-8?B?d3J3Y3JHaXltN3ovV1dDWjdDekVxQTRoNW5ibWNOMmhpM3gxU2hCK01jajE0?=
 =?utf-8?B?MmlCY3JnVG84aThDblhsY2RjMkUzaTZYdWh5b0dlbHczOEJaNlhOc1kvNkpx?=
 =?utf-8?B?alZyNHFvWFBWdStmMXRwT20zTHBKRVl5VVoweC9ha2R6dnhTVHZuRnI2dTRM?=
 =?utf-8?B?SkJaT0FwQnVrV2VPNFdoMnRGc3pYRi9MZHc2MHVPRkVwRytyemQ2TitLYm4v?=
 =?utf-8?B?YitBUHVNaXc3MUlhZXpESmoxaUVweVZKMGZxczdrRWxrTVMzVXAxTHpRcUZt?=
 =?utf-8?B?MVdRelpTRk9FNmpXVi9USVZmTmk0SzZpWjMwMTRQNHFtcUgxeVJXL1ZuWVdG?=
 =?utf-8?B?c3BteUxUSzEwVlRKSkF1UFZXcHVvcDR0Z085cjFJdU13VzFuSjZpYm5RTHUr?=
 =?utf-8?B?T0RqK01BbWtXcXFPL25tK3E4VENqUzNNbjhMNG1ycFVpekFENC9NRVJac1pa?=
 =?utf-8?B?WCtoU0E2TjNUd29Ia00rb3pxMlNOSy8zdTFTVm1sQVNRSW5saXpGa2U2RFBi?=
 =?utf-8?B?cjAzdmxUZENFNU4xVS9qQ3pOazcxNlA0Q3VDR0tXZkhJajdIYVdoZ2d3emVm?=
 =?utf-8?B?clgwWk5HQ1lmMTVkTkUvbGhVNEx1Ymw4RFZDbm5qVHhxZjBKZjR6ajdJc2oy?=
 =?utf-8?B?NXFjeE03WmRyVnpWTnd1dTR4TkJsSEY0SXd1bW11ZkwxT2VzeEoxTVdWOVp4?=
 =?utf-8?Q?Fqum4I32DMWVkV+zFyE9lpPOOkmtlQSeHAHUlq2YEjwkQ?=
X-MS-Exchange-AntiSpam-MessageData-1: ulGbNQ/ef4vDkQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b225e626-556f-4624-a754-08df04b26eac
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9670.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 03:14:12.7659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgn6MCn5Wa5IDwfUiREA5Sf70k//PhVxAE/vVH5Uur0C120hPeARA8GrqLKARwlEsVmvRBthLkJ0IedLjiyqtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8694

On 8/27/26 2:20 AM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> deferred_split_isolate() probes each queued folio with folio_try_get().
> folio_try_get() failure is treated as a lost race with folio_put().
> 
> It leads to wrong results when !folio_try_get() was not caused by
> folio_put(): for a frozen folio, PG_partially_mapped gets wrongfully
> cleared and the folio dropped from the queue.
> 
> It came up in the review of my collapse RFC series:
> 
>   https://lore.kernel.org/all/20260824131224.73344-1-lance.yang@linux.dev/
> 
> The bug is inert in upstream code:
> 
>   - __folio_split() works around it;
>   - __folio_migrate_mapping() freezes a folio it is about to replace;
>   - reclaim freezes only what try_to_unmap() already unmapped.
> 
> No stable@ needed. But my collapse rework steps on it, so it is worth
> fixing.
> 
> The first patch fixes deferred_split_isolate().
> 
> The second patch removes the workaround for this deferred_split_isolate()
> behaviour from __folio_freeze_and_split_unmapped().
> 
> The other three patches are trivial cleanups in
> __folio_freeze_and_split_unmapped() that I stumbled on while looking at
> it.
> 
> Tested in a VM: split_huge_page_test, folio_split_race_test and cow pass.
> 
> Also ran a test that leaves 16 partially mapped THPs on the deferred split
> queue and drives thp-deferred_split through debugfs, checking
> nr_anon_partially_mapped.
> 
> Kiryl Shutsemau (Meta) (5):
>   mm/huge_memory: do not touch frozen folios in deferred_split_isolate()
>   mm/huge_memory: dequeue the deferred split after the split freeze
>   mm/huge_memory: reduce indent level in
>     __folio_freeze_and_split_unmapped()
>   mm/huge_memory: fold nested ifs in __folio_freeze_and_split_unmapped()
>   mm/huge_memory: turn the swapcache-with-mapping error case into an
>     assert
> 
>  mm/huge_memory.c | 260 ++++++++++++++++++++---------------------------
>  1 file changed, 109 insertions(+), 151 deletions(-)
> 
> 
> base-commit: 33f61b12d297562321533c048e034b1fb21c1cf3

Thanks, any chance you ran hmm-tests on these? If not, I can run them and
provide some testing coverage from a zone device folio perspective

Balbir
