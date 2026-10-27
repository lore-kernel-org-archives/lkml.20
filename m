Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793113071;
	b=NqC9d2JP7faYkc09DKKMJtYVH874Ei+l5C56/ZbLl2kXYbHh9DNDFNFfoIrPaqpYP04V
	 4keXc1YNQxfo4ogrLVvd13QvQtdAmReIgosvSIvq9OfCnuZTGcYR0jCzTr2/PfYRxDMl+
	 20M0p/GXGP01jyNErGvNTDlkFVU4dlZHEg9xbNdDq7tO57jCdfcfUCp1LQSUlgfZzZTRI
	 m6cN/PDbvgC2K+UB+fgHCFIwnGPlTPKknax7m/qZOLYkffGoADi6Digb3g4LwSHuwaj0H
	 X7QRGAiwGOVmsj1EOdRJQot55BaV1drx1TupY8AjGWqyqZKL8q4+SIYU8Iisq4V3T4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113071;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:X-Mailer:Message-ID:In-Reply-To:References:Content-Type:
	 X-MS-Reactions:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=E7kAyhjWyQ1BiZTz6J/b4VMlp8msICTkeq7uCPviZj8=;
	b=ufauVaFqvWYsUcbSWHYbhk6C5j2HW+Bm2Rsk/XjBYQ3Ltc8pQMXlPUL8OkNw9sZw/v4U
	 tso7iInEkS4ljxEeWdBEiQQESr/zCuQOdW/f+Yy5xrIav7REFK5nzH5DMFr4rBTp37aZK
	 37LVx7Je8EwtyiaNri8T6nIgSkbkCKEpoKPbVFgxVKkunaep6czfuBSp7bGSixmfqGMFe
	 CRW3pTHlJXwSvPIOtkADY+dUYqG8wT0+LRCcCEoJHm2uAlYn9CbHRMxc6KMgG3lghWNc2
	 pYspltAePxPvNaG9c1g2Gz0ImIU1Scs19Dt4X25oI5EI9hPx2/XRr5PST7csTXHbOzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FeGPJMsK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.68
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010068.outbound.protection.outlook.com [52.101.201.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F5B606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49F5B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FeGPJMsK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jy6USLn2oynhKKLOcVZaPrTLE4HUTNY4wMlOMbSb/w8txGV6ZxIxjEfCukH2o4z7bczUgNOnCnQ2thRZrs7MqmBMwLYAjYFau5rmpnU+f8SmeLCULbEmIu2pKz3Ea9t7Ndnp4kUBj2RoMZaDi/xPlRPi3mUmwk1fm1PZzdZ2D1KZE2wuqB7abcOviRJ00znU5nekL5Ds1mgQy+JG/+3i8y1OIz62KF6cz+YcSY3YQteyvM7K9oF33mhsF75gAQxC2qSjMvHyfMLiVhrojPdyLXXKOTKkyOUrHjWmLj9/8THOJT+bXjOxjKoQ46HCGFpbK73SsyJJKwZjouOjM5eqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7kAyhjWyQ1BiZTz6J/b4VMlp8msICTkeq7uCPviZj8=;
 b=sGm0WXW/k6TLWrhdeog6rEyABBR+4d2fxF4x6uAOBdelFwPGo6hm4RjbpS4mgtqGW0wv0+UOB3vU9ITTAryGWc6yrqSridKOxZLzvi5NkJzRzEWJRgn5PgcGiOU/s+AqdYo6l4F37E1u7BHp2+lnm/+KvGnJMRTfEuqfXFxPLjra3qO48eJ42K4zZugxziC78rXBdHBWMyBwLZOBpITZuMly3Be18hSOUIQw9KIfdGbaz34Uo5GC8OXSBhxxouda+zrOTtv+n9yrO3ahnZw/2/aGuy3cohgzZJXxcL1Z7lbHkLPcb3pS+T+58RLBlp6KG6bUg2NIT8t+fUCWJyQ72A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7kAyhjWyQ1BiZTz6J/b4VMlp8msICTkeq7uCPviZj8=;
 b=FeGPJMsKY5Gbw/FQc/8bVHQL+3uSE9Li3tFWGIQTE3MKPQQQ/KxM6F8RAABaRzNP+ER+0Jz9EFsK10WKcPKujhKK0G2+RAhM7lbEOeSa+8foZGzjLqPubcUVqS0O788m8SG1tQssui3uDRPrhOYyGc2Z3W7KR9Tr9+mqy3cYRqQer2RYmvWCGg+B6SQ6AVfME8eLeq4SPlG7aPxe/kMwcu20d7hf8fjWSncJnmxnCKXmrW4MNZyDFfkI3RIU+7ayCXfg80qkBIWT+8Aac//3CKJwNx7bLbfFZVUGaHR0I1B3U4kvUjNd4aA9Bn0QuZBdKipE3jG0A8cRDv1FZpcinA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS4PR12MB9681.namprd12.prod.outlook.com (2603:10b6:8:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:57:44 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 14:57:44 +0000
From: Zi Yan <ziy@nvidia.com>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
Subject: Re: [PATCH] mm/migrate: move NR_FILE_THPS on cross-node migration
Date: Tue, 27 Oct 2026 10:57:41 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <DB41BDCE-B28E-4CBF-AC22-971A09CF7179@nvidia.com>
In-Reply-To: <20261025110209.4105994-1-ridong.chen@linux.dev>
References: <20261025110209.4105994-1-ridong.chen@linux.dev>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BN9PR03CA0985.namprd03.prod.outlook.com
 (2603:10b6:408:109::30) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS4PR12MB9681:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a7d7a1-8ad9-4de4-f97a-08df343aa7cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|23010399003|11063799006|56012099006|261026121527099003|10067099003|261022075727099003|261021121427099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5zLseNvUF2j7ZPrKsT3pXpBQj4/MVqsVwjq3/bh08cfqZnJUDVAFeIAHQci9wbDIQ96rl0qkc54FkJNVzb9c1AjcSa/0BGbiff+zpokcyfxjLljpmsSBXtT6nBSHLUBJaQJnFHjTv08w97WlOQaPbru2mhft3F1UVN5G6905q9RhyeNI4EiW7Xm0wrNl+gEXK4wZeleAZ92H3jFxntWZYV0dORImIxUtdUOc8lVIz96KykYtx+izMOVkWYrCB4vDRkNjfzB9JqynwWNcYBIcDoXIif/Jx3TDZsEpT4uwn1tPyyA5ySRbez1R1S7qv9alwVgoqhewqbFm5pM1mvIyYz4wqveHbbV+FbJrY3jrQK6FJ4x+VrpWirgi1b+QmSDPsDGzIa6PZkf97bSql5YteaGcmKjHQHDZFak9BmrcljajWBjDUmwZD4woR7SHVWCHaDakORgKGaQLD6AUGY4/cVemwBhdF5L16ffqYvR+zw4cJawWq54iZFBIe7D5zBwmARJ8eSNXplbTOhWXIs2hihK6vwmSQeNmUjlWhfWU3qOZDt7E7Gnqq/4IQHOanVYEYf91s+C5WhkIDf+VF43PanNXKNlmgo2IWh/lS5RrAQTDQ48kCO6/L5weZsMn1MgbeHAOB11T4EnT0eT37nwyf3Zt3eHHdYBzPFRHcOAb3SU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(23010399003)(11063799006)(56012099006)(261026121527099003)(10067099003)(261022075727099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?soQO+LlAj7X+wANRYPwOQjtBRMvutbHdw2CFmRrI6rSWurS7LA1q4BPVzS/7?=
 =?us-ascii?Q?qAEoqjm7dlSZRtt9WnBStFdmTGUVMXUmIRh7gCwdtJODSDBihyj1lb4RWxnd?=
 =?us-ascii?Q?a/FDatv5zedgqiELgdU8nrW9r9CgyuBKYwlesPBplutiQyFxLhcl/Bfrc4uf?=
 =?us-ascii?Q?d5lgt2qXYzqkhfXi6dHR53wiYjpVfzgK2zCrepzbg6DECJWwJrmi2RaDrDhw?=
 =?us-ascii?Q?XGUyKtYGm5hekO7EhfzyjM9JdtCh+NHL+7qym1hOLGbDU1i7ohk80y1lchqu?=
 =?us-ascii?Q?xYEshEV28ETwgI+il7eFIdV01SZnO26jyh0XUNHb/2RzvJH6nKdmYX0pJNmw?=
 =?us-ascii?Q?Q2ErTneMoh9DllDDKK5VYTJArQ3vWceoSHVikJk8cW1Kz+sbKv9Qpj4w48i0?=
 =?us-ascii?Q?R83J6M19RtB4f/nHoUM0pOJynciwwC6+pxOkdu/5J8FIKiNgdWZ4afvjlKSM?=
 =?us-ascii?Q?Pcjfz2qT89lK++SK3G570wdeShx88NZrRc5UDkIfxcEbk3Dnm77VcWZtGQP3?=
 =?us-ascii?Q?+2g7x6rNbG/S3GIBfAFidG3kzblA5K7rng/6BN+zvXFaUGQvSTUJi7oC04bp?=
 =?us-ascii?Q?IErXgeoDxnKpeIJs9cMki8VXPH/sKqRmLAg3wQKgDTTrAenabbDohZviV4PH?=
 =?us-ascii?Q?ujLfkhPUWU1ZhR4XOxxZadJN1Xk9i6iWDfSOC7tc7cLucntehqio6q7J6Qsi?=
 =?us-ascii?Q?CDrfRyRf9nq9ZntrH5o9nbqiRrNraJWM2UgRFYW4x0cgZk4Di/cQUdeCvGEr?=
 =?us-ascii?Q?IuFSzKCG3zmhn2tcudNfZ5A3DRKwSFOqxylSzWR8DqvyVlwIRXaWVoDxRCNO?=
 =?us-ascii?Q?Lw2DBWWAwK1cVUNR+JIHw8gksHABe7+YowilUKSa4MrYkShcPeVkwOhu/j7c?=
 =?us-ascii?Q?rN7GS5Gv23WutW25PkTdnecAq2YHb4p6/R22vZnxaNE3T3Abok0pp37sZ/u/?=
 =?us-ascii?Q?iHZFc9uk4D0kbpdda/dZOE8IYDRo968E6Yat50A7Et4UcRa8aNz/c6AlzAGu?=
 =?us-ascii?Q?4ZOfuXMQQnOsfFoqRzbgxwBI8BDwg2I0Go0wCFNNXqkTkwP+BoyT/7qLMlwo?=
 =?us-ascii?Q?Py20L7b3QMnYXjD56ROYO22ZKMkMinPCX7Ori5C8fBCbkXU0hL6xBZ9yrRiI?=
 =?us-ascii?Q?AGvhdH6z5QXM6ZZw/onHWJAJjJiNWWwQHiQln90h5njPXAEKhmxxOdpPWef+?=
 =?us-ascii?Q?AKHk4+pUzDyXLMTmawczwZFABMyNWe7A2aN600I5g7ynsi7F5yZjp4hvT/c2?=
 =?us-ascii?Q?Q1kq2BWOjEOW9b7Jh2UKQEyR8wc4K0eSDz1OpTgkxy3zdm06eDl0nT69sBpU?=
 =?us-ascii?Q?oRZJV5Q0/tvhvC01FvkkpQ9LirK6XhE+TUwUsTR7WTyQdeDtQKCTeZ5Wdifa?=
 =?us-ascii?Q?0rYjcmo39XOPLvjzKpPlQPiQ2DmNt8qwMGjEvVaLE6CzzjTzp3KXaKxTBGY6?=
 =?us-ascii?Q?OrRWPr3GIL/yUb3ylYwlEOi1Wz1zOM8/6sBwdYzJWLhH/sSM100sWK9pYGvQ?=
 =?us-ascii?Q?NaNqyQTqIgGpZL/lB3dO3jxat+Rif5OvLCR+5cwWMEfWmJ/iakGpQDvKK5z1?=
 =?us-ascii?Q?3fEbcB2DsNKneqgEhiKLY5SHJT25ZjaEyZj2e2MfW5hjxGIB/wZQo+8XoZRL?=
 =?us-ascii?Q?T3FmRgFYw1pzmF4fgyBPtfG7oCCSYjur5bREhmu1dQnWksVxSPcC8/trzMLY?=
 =?us-ascii?Q?LjKh6w+8uRIEk4wu6b/ASZ4UFuoHiDd9u/uRjw1fvNtjuES4HtXlzX+9LYQZ?=
 =?us-ascii?Q?9bnIn/Th/A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a7d7a1-8ad9-4de4-f97a-08df343aa7cb
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:57:43.9059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4n0yCeeEBrB054ltYdEB/3j7Mq37LKhknpr+hqZZUJ4gqT4iG8kt+m2VPFUvHypi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9681

On 25 Oct 2026, at 7:02, Ridong Chen wrote:

> From: Ridong Chen <chenridong@xiaomi.com>
>
> When a page cache folio is migrated to another node,
> __folio_migrate_mapping() moves the per-node and per-memcg counters
> that are keyed off the folio's node: NR_FILE_PAGES, NR_SHMEM,
> NR_SHMEM_THPS, NR_SWAPCACHE and NR_FILE_DIRTY.  NR_FILE_THPS is not
> moved, although __filemap_add_folio() charges it to the source node and
> filemap_unaccount_folio() takes it off whatever node the folio lives on
> when it is removed.
>
> Commit 0b52c420350e ("mm: fix shmem THP counters on migration") added
> the NR_SHMEM_THPS case but not its file-backed counterpart.  Now that
> ext4, xfs, btrfs and erofs can all have PMD-sized page cache folios,
> migrating them via NUMA balancing, mbind(), migratepages, demotion or
> memory offlining leaks FileHugePages on the source node and underflows
> it on the destination, in both /sys/devices/system/node/nodeN/meminfo
> and memory.numa_stat.  The global value is unaffected, which is why this
> went unnoticed.
>
> Reproducer, on a 2-node QEMU guest with THP set to "always":
>
>   1. read a 256M ext4 file through a MADV_HUGEPAGE mapping while bound
>      to node 0, so its page cache is 128 PMD-sized folios on node 0;
>   2. move the mapping to node 1 with mbind(MPOL_MF_MOVE);
>   3. unmap the file and drop its page cache.
>
> nr_file_hugepages in /sys/devices/system/node/nodeN/vmstat after each
> step (in units of PMD-sized folios):
>
>                     without this patch     with this patch
>                      node0     node1       node0     node1
>   1. cached           128         0         128         0
>   2. migrated         128         0           0       128
>   3. dropped          128         0 (*)       0         0
>
>   (*) the counter has underflowed to -128; negative values read as 0.
>
> Without the patch the 128 folios stay accounted to node 0 forever, and
> every further round adds another 128.  The same happens to the per-memcg
> per-node counter: after step 3, memory.stat of the cgroup shows
> "file_thp 0", while memory.numa_stat still shows
> "file_thp N0=268435456 N1=0".  With the patch both are 0.
>
> Move NR_FILE_THPS together with NR_FILE_PAGES, using the same condition
> filemap_unaccount_folio() uses to take it off, so that THPs in the swap
> cache are left alone.
>
> Fixes: d68eccad3706 ("mm/filemap: Allow large folios to be added to the page cache")
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---
> Note: prepared with help from an LLM-based assistant (Kiro, claude-opus-5.5).
>
>  mm/migrate.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
LGTM. Thanks.

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
