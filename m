Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011026.outbound.protection.outlook.com [40.93.194.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6934FDE41
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571027; cv=fail; b=qFBVLk8+0hDbuG8hCaoI/WlTzFjKq5OSgF8jQKUEvXzCoIV8m5miVLTWaQysaW3ytBn5sxbFx04UX2En5upK0b5VnEm2aAeTCBp/R8UQjt+ups5VNy9nom/tUaVGQF5XHEfxSM80vaP5OgnElEm2z9DvJXzzKQFN0CeMqbYN6RQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571027; c=relaxed/simple;
	bh=Fq6JF1lWlhKnGXCpsu5PMV8+HXW1WNOhzcrWx6fLyRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lhRERveMY+9nRHw2YB/+Deo+1uu+fvbz8zfZIwgpnlWaX32iezwT4/TQ4b7ZZIgsOXhRVfclt6sSXKr4WBKT1PLX/7OsVxnZYUFOiyyYejGYy86s7/+DVjl03EYicFvSkQkWvmf8h7EhrB6Y+UaJWmPTMywxR5+s0QBb1IFqD88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n+o+S6Ar; arc=fail smtp.client-ip=40.93.194.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n+o+S6Ar"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDlR/ZXbenvhSeUbX1kZ0HpCZ6LaGdbL1QG8gZyRy6tbe5lAxOTjdmxwnGQqYZ8L/s1kDo0T/kwBgRk6OcQ66uYuJBEE/cMrNqv57oBiINbOVfTG9p+bfSocBSbyjKocNvsKT28jDOlEU+nihjrJQQVgnaVmpaXWvE7528w4Lnv4sIhrVBDR+IcJRxkC+N0Tgi4lRn6FCEoog5BjpCPJWgs0AuPjd0QO/xdoYeL0Zq7lSIUaxFCzBVoHREPOC5X1ChSO1kGQoDIGQ6cMjMoUOgSHZnH5dDSMd/U3U5reXZ+MQ/xOg5UdAAWcJosX76tnGY7ltzA9ftui+ArGAw/HKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfNKJ8sCBjWvornIx0UlgvyXvNY6iQltqHxScjoCUZ8=;
 b=Mvv4pYmUlHjZBj6Ja0XCKaU/AFYrhUWFS+56fSCSJtapnhtcm98Y40yrn1+QpVQsjhhB7OymCshIW8Bi27UpPpf2bWD4mA4b83ssTxesphr/Kge21i/tgli5ojvMe4s/sFofBifHW/BlTs76ORlrulu1q3xMlHvDuIsZjrJaSDtAFgOn9mMxr7ulVHsFKbX37UkrdhiRRQ3Z0nPJT3vcR4j94js7N1But4LlqnpdnKgK4uypuL89J2JkVtW3E8T/19jl+ASaJL3in3JIO44aOUX+BdAWIws0PYg56GAkgL+oRxRoF++aoR52RSCoDOV6xxWkeOG6krz038OfUibNJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfNKJ8sCBjWvornIx0UlgvyXvNY6iQltqHxScjoCUZ8=;
 b=n+o+S6ArDZZiVnfICsy4CDXvMFt/Eu2VclsUSk5IlXbntBzz+ypxgIvH3gwJspRRPEM6MLIFT8ISMFEAoPB0upzstXRH3vKL2YKhmjVFaMnaB1wXXjyXkcZkWVCpApeqm9VN6qwl4dBzRA2kA0yiEQHl4Auh7BUNvtGLZxQd5/cwRG4k6GLsJFhfXVSuXeFDBQy+ato3DapWX7/bZETR9o72YwqbVjF+37H4ZMJFpxXVcjEz8H1D6tz/upTJUuwvdEkq4vyRZgf693nF+JidQ54+/2ql4ye2hIkyPpyZgTx+VXxvxntESVn49h/ja86BQluITvoD/qPjiBTjXyVWKg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by BL3PR12MB6570.namprd12.prod.outlook.com
 (2603:10b6:208:38d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Fri, 9 Oct
 2026 18:36:53 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 18:36:53 +0000
Date: Fri, 9 Oct 2026 15:36:52 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Russell King <linux@armlinux.org.uk>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dma-buf: heaps: cma: respect the device's maximum
 segment size
Message-ID: <20261009183652.GF13920@nvidia.com>
References: <20261005064640.7776-1-kmehltretter@gmail.com>
 <20261005064640.7776-4-kmehltretter@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005064640.7776-4-kmehltretter@gmail.com>
X-ClientProxiedBy: YT3PR01CA0123.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::23) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|BL3PR12MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: 021df5e8-696b-449a-10bb-08df26344a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|5023799004|11063799006|56012099006|4143699003|10067099003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oHIDvif8HkXFfwZBfxo5fMCu/ekyTInZ9oIIiSpQ4eOIAphFc3aBtaFv9GswJu9poYvCVUJGdJA+wHf+HK2y0e3EXsq4hhg8hEC2MmE4yiMOCtHfZTb8Eh0pb2xpBjltfo9poZAfzU4Ra9H0uhyy3qIHHz4Ig43IwkH2Yx4j1Zt7bsXu9OP93fADO7U3nmrJtjwxuphfysPitQby+E/tzSrkiWPsBDCr+cyRIw3sVLjt0yCG53yEy01HyKr0tFKWUazt5v+Nv7d0R9HUmMOmxwUPlLa1f0bTg9t8QWQO7fzG9pDvwJbG4kX6ygGyQ1jW4v6KKuXoO4pO8UoenIqA1c9iWl2Jz/xyHD/qimhHJMwO6XZ/hs2xe8m6Kbq/jFoC918esMKpK52eUU0yMzzc7L6vNlBo6frBYFFcO3mFXVoLjnwYTHCldM3zgRA4bPSOmibdDF6UFgO1R6RoRe0b0WidjfOKMDy8yY4NCSxYJmtkRvyPUTBMvBBo38dzxGrsd+TAx2BWWA5zDWwBTGA7QsIP9j1/RqS2B5/NAxjQ4Mm7dGoW6eNTJOjICDH2sv2NDUubYviBh1UURqDtcOK6OCBoMM9w5tIuFZ0DE0P3CflkF85KirP15kLiNsVkEMuzgX5gK5eDd7qm+FcJKxOKTMzNvhO4dExavOwTLIAHoOg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(5023799004)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D22Wjfh1m6z1oqRxhCKcIUykypHJ4GtnxEUKYnn0wkGCZtkwa847NNEopE4q?=
 =?us-ascii?Q?kbDkqaZzQU2XznOQeTRUfMkTWv4fH8eNz7S+EGHGCKXu9xR/hMuLwP0/MTmh?=
 =?us-ascii?Q?UtG2OZSGRDEPuCZjG1OXWYIObs0+RCAYOOci+u+sX5HviQEwVhGO1LFZz9R6?=
 =?us-ascii?Q?gboVd/KoRvVWvkrZwfO2GQC6WdatU38ZihTWDmUs9PZo4A7ZEGcPrNh+0XvQ?=
 =?us-ascii?Q?DqawJQluL7fcm/KA0GKgKl802hcoZyD6QDOReog1afq+ef0hTDniNxHiAX6j?=
 =?us-ascii?Q?hr7GsVFTRl7z9AU60rqS6ofWbrOlPgGl+HOR1ldvej/mNL+kxzm4kz2VmmCi?=
 =?us-ascii?Q?DhR43Q8IBYqxX7pza/6aFMKgxu5NOpNSZYnGuWXFHSvjMdr0D9rrBBV5Khs3?=
 =?us-ascii?Q?W/kBAxkFupj3FLudRyOcqvX51XDmD0dSaYDTNbCwNonHP2KxdzTFmNktbIkO?=
 =?us-ascii?Q?53wKk8tEDOhN5b3mS1yROp2B+slLDZwpaw3Vp/bkYbodxAnh2kPhm9d3F3vb?=
 =?us-ascii?Q?AmzXODuV7N50IHajgTY/FxKyNCZrfq+UMGIQx7uhLYSXY+oct7R8m7y+/h3N?=
 =?us-ascii?Q?D+ZSYYy6XUFEwl8e44LS/ntgG/ggpn5QVEvCAurruYeC13VdvmggD8TvNpLm?=
 =?us-ascii?Q?+xAGxPtg+36fBNSfvYb4sVTZmG348EKXkMD6wDir7c/jI/AUDff1l+6Q5tSA?=
 =?us-ascii?Q?QfHq0UPOBJq2av5S8zmaj/wodyxOsLdsZzbA8w0hb2Nwt2kpL7eKXB3lYS68?=
 =?us-ascii?Q?4FVGDle0+rba/UCF0Yuwno2M/o5yJy9XG5tVmqk4J5qa2yFz3yYTVnoH/ziE?=
 =?us-ascii?Q?6AuWQudYxJwJelrmcb50CBYDGeUz8KyCHel++DpoC8SWZTVtxlz2RBChUiDM?=
 =?us-ascii?Q?eRv7WzCIkq43t919K075GJZBGV5N0pAiKvlS0Vf48HBWlLmTHLij10Z0JOgs?=
 =?us-ascii?Q?AnKm/yiv9kyP32zHz1fzUcKAJ++rYI3xmDu7f15K/wZ2wyvwg7iVDkirAnBV?=
 =?us-ascii?Q?MTJxr1eNaVW5o/u2Yq7nD6ijVKWBlO4okx6Iep83RC4IMUhBpepNakOfnO7N?=
 =?us-ascii?Q?rI4Fd462yT/u/5rl/yPSnIEnyHPDeV85tpADX+E2Ju5QbQP2sQpzB9w4z/Az?=
 =?us-ascii?Q?3xpinzk/5555cYsQkr3KtzXcnH4xuV4AfR3t0ar0fcrZ41Ss5QdKTn2xbkeB?=
 =?us-ascii?Q?iK4fn50mT/spkYHRC2+Fj9PP/V518Q0tMigIyIu1DWdbBvJVueDAHDD81irs?=
 =?us-ascii?Q?mwvcRMAvKaZtHIXr3DjSIzRijKGv6mAOAhVIe409y/l4kA2FmBTXwASqzTyG?=
 =?us-ascii?Q?CTvpBim0mvATzOmER/2mCecWgiUZs/hbpwVJLJRRUtufJEJq13900zkJof6U?=
 =?us-ascii?Q?tX9HUFEqWg9lIfNkFK7X3LHOe/5XVSAt3j4N+pkBrbGNfM9uBEAWeMZnBk+N?=
 =?us-ascii?Q?yw18QFV7x5AeNR0c3CzaGeIFICo85B7LAXRvVVHn0sIDX1iOwWfZgj4AJObS?=
 =?us-ascii?Q?fXa29g6J3CzVurSlaIEhbSsMduDbjj1qyVCPz5Rws8LP1G57rj/62PophQpn?=
 =?us-ascii?Q?UFX34kz2frQ2LUFE7k+Ut2hMguT5I0MUoKS0R70xDshGCYn6H+gWZ9csWUXy?=
 =?us-ascii?Q?PON3kE/XdfOm9xgl6uiAPFkSnBJO11bHpTJlrSAuTY4jTnu2/253TOo/y1od?=
 =?us-ascii?Q?68YLjqmIEUXG4O1TOdWP1luOfZTjAv0zOhlF3EtTOB+G895a?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021df5e8-696b-449a-10bb-08df26344a2e
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:36:53.5852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpLNB+h/sLN+FBYEM4bK57GOb8mfpWHi2tUBvj6zGpKVBJgSkq4DY89vKofWu1qr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6570

On Mon, Oct 05, 2026 at 08:46:40AM +0200, Karl Mehltretter wrote:
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index 3fb4b946c91a..9d61d14688b8 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -58,16 +58,22 @@ static int cma_heap_attach(struct dma_buf *dmabuf,
>  {
>  	struct cma_heap_buffer *buffer = dmabuf->priv;
>  	struct dma_heap_attachment *a;
> +	unsigned int max_segment;
>  	int ret;
>  
> +	max_segment = dma_get_max_seg_size(attachment->dev);
> +	/* The SG allocator requires a segment limit of at least PAGE_SIZE. */
> +	if (max_segment < PAGE_SIZE)
> +		return -EINVAL;

This seems like unnecessary AI paranoia.. If something like this
should exist it should be inside sg_alloc_table_from_pages_segment().

I guess pretty much every DRM user has this latent issue? Given few
importers even seem to use the segment size, it would be nicer to
solve it by just not using segment size here.

This is possible with the new dma api, and adding a new
dma_buf_pages_to_sgt() using that approach looked OK from an AI draft.

However, the dma_sync_sgtable_for_device() in the heap doesn't seem to
have a straightforward conversion.. We never made streaming functions
for the new dma api, and drivers are not permitted to call the cache
flushing functions by themselves.

Something to think about at least.

Jason

