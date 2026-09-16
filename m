Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011008.outbound.protection.outlook.com [52.101.57.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BF23AC0CE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789523892; cv=fail; b=ktJcGn7SOo+eg8axfpzyPs5eKN/6OjPwTil4MyLbADiBMlVXi9cwGB0Z7qPc5+Ya30l+iq8nZ8/FNMqbr9683mXm5mKkIKEpg9/gVX1D1lHPd8D4XWQE0D5vURwLhdfoTasJBYuqW4Il3eLeQDyflhrADrZZfC1w4h9iLLaYiRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789523892; c=relaxed/simple;
	bh=1SsGlU2gMF4PZNs5jpvFdhhrc+Bfsy45xBsAXb5hSfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WnLrksMIaDxSvjp3OelG44jv48b1FpvTpsISX6l5y31ChHMIEykz80vuWJny7TZte9TAvnDU9sNteMiGg8MzuwYXGlTXwKEE8hM2pOdUZaFPpcIYmcbvR9W6ruIi0PF1jzTNMvtKhmw54HGgDr281LDAf/RM/mldX0AfdMwoA2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f7avWR8n; arc=fail smtp.client-ip=52.101.57.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f7avWR8n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpNLLzLuZqhg5oTb6hC+Az8osOZpD14/yxmLmjvGfrD62QePkvYirDEE1yJbagImIampB3xhjJZIStIE1/+YL1/z8fCB/yl5iHL8180d85QFcPehCyBdSSHQXvBaR9bST3tZqqhPKo+MEECsDz83Zej3trNcPaO3r0UBr9w8WKUGNtFxz+osIhhj+yjPxM45CW6prtWsxyXP6CBNalRuqOedCUeddZlx19t/tjZ2ZKlglIB5CpwZeSgt90q7L08DzPdEe3hBNB46CRUd2BeLO4Vfeb1e6Sb5OeepyAJwGbzvbr0r3GV4sZBQFx2xjoGLVD+5BMyVjp3Nga5vvrBTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/6Bn2cq/QAl+rGeOhDpar4ujaO8yga+50o93S+uRcE=;
 b=y9uo0f3mnlS6lnRRvXmzCm8VeFQN4BNaLWrmsvXC4xJXb6IVwaeTEMKDkp2pj3X4nHh+RhoLSaINBkp/tAyUYrcs/uu4EYo6wsx8+j8hnvnt27XV/lE5sc4jltKfdll8SesurmkcWJnISQt82+Mjb19i32DoVI7WkrXcTiF/o3V7AVbprjDj5FcPO2FMEmg5ywLAopdFzOqCedzAR+PLH0E9RXyntL12s43iqltLTX6+u+M8zwgx3Ws0cHm1PvFWXEVROaw6ARpYWV8Ygx7hmO08nXI/z+Hak1cwz2gylWZoWa02YMPF7n6/4o/AqAc6X7EChWoOttpMKPDn7uMysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/6Bn2cq/QAl+rGeOhDpar4ujaO8yga+50o93S+uRcE=;
 b=f7avWR8n/T4eIjUzMWT/EfrtTHBVRc/WrZaddp9EO3MeGrhATgRSihhSU/UKoMM9XYgyXo1wjPZEqBRwHwaC335H4ww3m1Sk/ZaTQ+9ZEwvh2+gObFFqJ9exUwxUoPG4n1XEbXZoWMOvn/X8Tcw7UNI+aVy6gL9Sb5wLAP/OG6mLgikmxjts49Cx5ZOK2pLOEVV5Hz0i+eTHK2QiLq8VeRl/YmCx2ji36TqfWeYRUKFyq3JDrf3NA1z1ZpK2J+I9Dxj9KpYyCfaCkMEdVqiwN9uyNqNGYxkUd+mmRsGd36Oblq7YwtjCylE0VPgLDI9zv3FlorWJAZ30hhh/zlcvFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) by
 DSVPR12MB999308.namprd12.prod.outlook.com (2603:10b6:8:423::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.9; Wed, 16 Sep 2026 01:56:44 +0000
Received: from DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a]) by DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a%3]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 01:56:44 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Kairui Song <kasong@tencent.com>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v4 05/16] mm/hugetlb: use direct assignment instead of
 folio_change_private()
Date: Tue, 15 Sep 2026 21:56:43 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <CC279633-6F0F-440C-BCDF-1D5362C4CB7B@nvidia.com>
In-Reply-To: <20260913-remove-pg_private-v4-5-848550f7574e@nvidia.com>
References: <20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com>
 <20260913-remove-pg_private-v4-5-848550f7574e@nvidia.com>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BL1P221CA0039.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:5b5::17) To DS7PR12MB8371.namprd12.prod.outlook.com
 (2603:10b6:8:e9::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB8371:EE_|DSVPR12MB999308:EE_
X-MS-Office365-Filtering-Correlation-Id: 738c665a-7cea-4b24-3e9d-08df1395c264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|10067099003|18002099003|56012099006|11063799006|4143699003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	w2PEMzzg3RUcyjnzsGvTUXzCWh3y76u9nAn+MZ0RsYLgW/Ng8Ty0NsJ40zuA0ufUS6Ifvh8aQfDMccIA2tzRbmeH9F8fCpVMJ5yVmfob0+3LjaJgJaXv0oex341/A/RyzieA8GhBaMQmTM8tVx2vYVVUqsFkkO8NdwxuUVPl1n1jqEytn1C84vnL22R8aR3+suIv+MoxTPz84wqGZ3TmNsPsyp1voAAkWZVHlk58SOH69TpQG9cIKT0svV76Z1FLXopwMCtXZBq23J4lfx+X4qjJaSajg0u9snylcQsPNHXu8gFl/S55CNbskxx5alK7AKSrburH1Qmvf7KB4geN2fq+0gYwH4eJ6TVntbDfgBTsaXwSjoKJjQaINNR3S+spNTOTOXQA/DdZ7JmdxDPTI8wvLc9qrDyE/0uqgm3Qc65plSqs+fc1bDr3AxqvSzvDP/EDcmdoTJaTuALyryuDF9YP91NLAjpxdfUD9f4SBYs6fluCtfVZa/VcMjYMHSrWMruD5EAhVQPd8PlSay0S85HBOjkWzrCVvdyvDnl7oTsT/s9JcxFR8Mjt3+jGBIxhQPb9qKRfGLZ6BiY2zTwY/RFwMORJO1+gI4CbviLdbWqZQ6JE9/Lfl7NK0+qFLk6Qxi31MOyoex1B723vQwM3jl82UqGwiypg9IyZiYp6RcnF/ktEX8NIdBIGe2YrwqNwU2C/ZxckRDVQyyM0e2cHAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB8371.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(10067099003)(18002099003)(56012099006)(11063799006)(4143699003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CHfPBgBpR4JRZHcnH3BU/sTQQGCTPBF2MjrfJPj/cCPuVs+dhHHSbwxz/Xds?=
 =?us-ascii?Q?6wviDKWRjM3X0Rjteh5Zsl+J3R9gO3xmwWsvVLy8eptG4ZnQbr4YQcozUJ/P?=
 =?us-ascii?Q?KxAvarycpVT1duCwg1b/Kgfu5JP7o+vsOxhWCIMDGeoYh/cKo9nIitI73Jvy?=
 =?us-ascii?Q?VXYXv8UEVZtTlFmWXHXhwaRSWoJcntHHbpMy/1U64SU0qs34RCZsyV6N6CGT?=
 =?us-ascii?Q?k8jC57ebv0GG8gHX3Hdm+XGbgT+MdctrvVKkF9cdGYToOxsjLt8tbFOsJKqX?=
 =?us-ascii?Q?94Om1YwJRBHvXMyhhtJnji7wYZOqpH4rtwsLe/elK+4fUN+CAEkN8GGl+NUf?=
 =?us-ascii?Q?/jvWzfWqXQfS8d4a7bh9WpmJi8Y1a3xXgrs7yGMC1JYLEHM1OirVvVIKMgPI?=
 =?us-ascii?Q?LiN0nhIodn1QRSJEZ/9VbLwJql69waLwoCa9ocXTuGOrawid95AFon/Ki/L6?=
 =?us-ascii?Q?f0wotOGltCHUegcWm7uTmaMFe4H5eWI8n+4BFu5MH0s1qzVu4ZIpyNM0Demj?=
 =?us-ascii?Q?Rnaa/qqPGLsEkrjMnY3N/8uRsoIcLvYMWryNMqlzqijIzsN0fLshbCGDQ4b4?=
 =?us-ascii?Q?L7VdDYKu5pTSYsra33JwIrP9NakeD98icLKGM7M1FA3oCB/fAMdV6Ga1Di+5?=
 =?us-ascii?Q?isfxRamp3pfHrCZGYoKG0HNx4jo0Dii8GPWFs5KR7hK8MXs8+ffsIld+K8zB?=
 =?us-ascii?Q?wW3I9lGjVOnvSD2QCCJJObPn+94J7Bn48sNAvNk81RLnGcGF1M0ObbCsItsb?=
 =?us-ascii?Q?6CkDBlIpKAhY00ox294GO3AkB77DdnHYSXP5recowFjULyZvPtWUrEcmRQy4?=
 =?us-ascii?Q?RG+Ct6goilnDrUsFcDcrtPS5dFrYgFuHNQ93r8sFRmSlIzDt3ubrBz9FV0zc?=
 =?us-ascii?Q?51VUAZg3voK263YKlM156VuVKbuw3+jXbU0qpjSwGKayy8YkaD73/mXV9FX4?=
 =?us-ascii?Q?tmJ0UWA/J5nt5hyvkt6r9HZyb1IeofN/GAgeX9vrORxWDrZ+K9Ex7pftHIwU?=
 =?us-ascii?Q?xFVLtcWaszFOS7cdR6s8wbAUyy/+sqYExCj5qFf8fd4BX1vMB6HR/hXTc5LG?=
 =?us-ascii?Q?2DLP/LMpsUCZdWnpPcTYsnQNZ+zOBLM+FMjFJfFYZdDnTjjpizFcmwx5JXDg?=
 =?us-ascii?Q?ZEqdotLAzBt74XsHISSC+Vc00sV9/9wwNvnyBe/plsBGnGjXaJyqz0IAFkR4?=
 =?us-ascii?Q?D320xXNOE5+ehwesfRvJED4Ij7tKjbqI+BVfkb4mAxDriH4gJuXbHg8kE8kV?=
 =?us-ascii?Q?3kNfns6xs5y9iDIf5UDPFWcX2PldSuw4HmTf8MPUieLPUuqpsRtD+6R1Tmac?=
 =?us-ascii?Q?IrzWWJMQ9NWk052KcFERrMHuY4zUiW6lDZen8ndVIFfeYdNgWpXdjoOtz1vf?=
 =?us-ascii?Q?4MfXAZI/YAC3vX24Q1STmsyHg6XftusGskpQV2HU58t0EKsJ2KKYnrbZRprm?=
 =?us-ascii?Q?E6KujXHy6R0qh38ICAigV8VragTQAZAXYLdbIFW810656yZfpg12PxSOmmya?=
 =?us-ascii?Q?upkv/Q6l7lMZwbVZd0gJq3S728FnvyUB1o7ySDOvmeM0U611oRWnEMiKJeCz?=
 =?us-ascii?Q?8ti6jlN1bMUq5wuHe1aHnYEw2Gr8ifyslRcoq9Ywv1ky1v577KnKzgJR2ihs?=
 =?us-ascii?Q?OTS8Yf3bJM5+tix2Hvo89sm82JwJXSlTX01DJlWRn1rebWdnhm6ldvGVsw1p?=
 =?us-ascii?Q?5T7DhVWyvrnWOIU9oMCkVurV1sptF5jvM+YAkmt9ob0eqopv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 738c665a-7cea-4b24-3e9d-08df1395c264
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8371.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 01:56:44.4498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5v3GYPwjeqWseymVVEoyEgBswm/qYrvwkhRmWSVc4ca/9qOTmVM2Ks8orTqynHG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999308

On 13 Sep 2026, at 22:24, Zi Yan wrote:

> folio_change_private() should be used along with folio_attach_private() and
> folio_detach_private(), where adding and remove ->private content requires
> folio refcount change. add_hugetlb_folio() simply sets folio->private to
> NULL without refcount manipulation. Change it to direct assignment to avoid
> semantic confusion.
>
> It prepares for a future commit that remove PG_private.
>
> No functional change intended.
>
> Assisted-by: LLM
> To: Muchun Song <muchun.song@linux.dev>
> To: Oscar Salvador <osalvador@suse.de>
> To: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  mm/hugetlb.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index d3a0650ff6905..8d551cdaef9db 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1446,11 +1446,8 @@ void add_hugetlb_folio(struct hstate *h, struct folio *folio,
>  	}
>
>  	__folio_set_hugetlb(folio);
> -	folio_change_private(folio, NULL);
> -	/*
> -	 * We have to set hugetlb_vmemmap_optimized again as above
> -	 * folio_change_private(folio, NULL) cleared it.
> -	 */
> +	/* Clear all folio->private flags except hugetlb_vmemmap_optimized. */
> +	folio->private = NULL;
>  	folio_set_hugetlb_vmemmap_optimized(folio);
>

Sashiko[1] said when a CMA hugetlb folio is freed but fails vmemmap restore,
add_hugetlb_folio() clears HPG_cma. It either bypasses
hugetlb_cma_free_frozen_folio() due to the missing HPG_cma flag, or
skips cma_release() and causes a CMA memory leak if it is free directly
to buddy allocator. Sashiko also asked if HPG_temporary should be preserved
as well HPG_cma.

Answer:

Missing HPG_cma is a real issue. It can be fixed by checking
folio_test_hugetlb_cma(folio) at the beginning of add_hugetlb_folio() and
setting HPG_cma after folio->private is assigned to NULL.


HPG_temporary does not need to be preserved, since the folio is added
back to the surplus pool.

I will send a patch to fix the missing HPG_cma with
Fixes: d2d7867140806 ("mm/hugetlb: enable bootmem allocation from CMA areas")


[1] https://sashiko.dev/#/patchset/73521?part=5

Best Regards,
Yan, Zi
