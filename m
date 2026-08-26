Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDA83F8251
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750191; cv=none; b=axK2tychtVSUCQwV2zPonaJdDjTG7VKCImxW4dvdJCEq2kYKT5qCfz4QFGyYNQ0suj777sL9LiKz7kjMuW9U/4UHdWLKbliU0SGrJDmV3qjKIuvhDEL/okmynQtP9C8072zYHO3NgtWHsgS/a21L8zUFPORxB6O270CYaugbo9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750191; c=relaxed/simple;
	bh=3CFSK9d7oFF1lyFoHzxL5BXuoLl6eBpFbfPBoRFgD0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=VZKxPvkGctaNvYfCG+FWNw+Pz92yD6htVyIyeDLTTA1rNW0dTa8o8OlUad1JDLepTYAdn3TVTetcQW5lLA02N17+JiTvRQVjBKyvaAHpGUk0gizm1BmgAo/wR5sbMgZGA5qluo/tzlbHTarEYSxAXmEqCEJb+Ju/tZdy9EP+DlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SDP1qw3M; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SDP1qw3M"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260826131621euoutp02b2cc4cd5c239f28c3227d01853626aba~PXVGRF7Q-0618806188euoutp02s
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:16:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260826131621euoutp02b2cc4cd5c239f28c3227d01853626aba~PXVGRF7Q-0618806188euoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1787750182;
	bh=Rx3zqcOgBMNdvWRHnyDvlfZnynx8EEyzAHso3JsbmAA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=SDP1qw3M5ntmu1AwgewRnrgU3G3D77HeUMw5ytAvw+g6S4Rrj8ylptGzd5VVopwrL
	 Ibl4RLC3ddXE2EQ7oPKonvufswM9/YRoXoPBFkXPoq1ezFTqElimEYGMBp6IrdETWd
	 JF0RCZ/V9Jzsx3JKcDr4PibFx+Z6G0dzcHU6yWBk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260826131621eucas1p252dc76f83701618d60b3713500c10a2c~PXVF5uMMi1135311353eucas1p2U;
	Wed, 26 Aug 2026 13:16:21 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260826131621eusmtip17e59151fa7014cb894754f178bade425~PXVFie79E1334913349eusmtip1K;
	Wed, 26 Aug 2026 13:16:21 +0000 (GMT)
Message-ID: <aa0fc15c-eb46-4abc-9260-7aaa8a39c040@samsung.com>
Date: Wed, 26 Aug 2026 15:16:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 2/5] of: reserved_mem: reject static regions
 overlapping no-map memory
To: Wandun Chen <chenwandun1@gmail.com>, robh@kernel.org,
	saravanak@kernel.org, rppt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260818092420.2859026-3-chenwandun1@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260826131621eucas1p252dc76f83701618d60b3713500c10a2c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260818092441eucas1p1fde9b887efa0fcfb6d158623c47d7d99
X-EPHeader: CA
X-CMS-RootMailID: 20260818092441eucas1p1fde9b887efa0fcfb6d158623c47d7d99
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
	<CGME20260818092441eucas1p1fde9b887efa0fcfb6d158623c47d7d99@eucas1p1.samsung.com>
	<20260818092420.2859026-3-chenwandun1@gmail.com>

On 18.08.2026 11:24, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
>
> Static no-map reserved-memory regions are marked in memblock.memory rather
> than memblock.reserved. So the reservation overlap check does not reject
> a static region that overlaps existing no-map memory.
>
> Both regions can then be initialized and hand the same physical memory to
> different reserved-memory drivers. So reject a static region that overlaps
> existing no-map memory.
>
> Sashiko found this issue in [1].
>
> Fixes: 86588296acbf ("fdt: Properly handle "no-map" field in the memory region")
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Link: https://protect2.fireeye.com/v1/url?k=c110879a-a8abef28-c1110cd5-905a08a8515a-5165b48469b02786&q=1&e=6166144c-5cef-48c6-9f6f-b36a72f258ac&u=https%3A%2F%2Fsashiko.dev%2F%23%2Fmessage%2F20260814084718.29C341F000E9%2540smtp.kernel.org [1]
> ---
>  drivers/of/of_reserved_mem.c |  3 ++-
>  include/linux/memblock.h     |  1 +
>  mm/memblock.c                | 14 ++++++++++++++
>  3 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index c6e73d710ee1..9fb2e4c29443 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -152,7 +152,8 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
>  		 * if the region isn't memory as it won't be mapped.
>  		 */
>  		if (memblock_overlaps_region(&memblock.memory, base, size) &&
> -		    memblock_is_region_reserved(base, size))
> +		    (memblock_is_region_reserved(base, size) ||
> +		     memblock_overlaps_nomap(base, size)))
>  			return -EBUSY;
>  
>  		return memblock_mark_nomap(base, size);
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index d62db9e776cf..27d68fbb3157 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -148,6 +148,7 @@ int memblock_physmem_add(phys_addr_t base, phys_addr_t size);
>  void memblock_trim_memory(phys_addr_t align);
>  unsigned long memblock_addrs_overlap(phys_addr_t base1, phys_addr_t size1,
>  				     phys_addr_t base2, phys_addr_t size2);
> +bool memblock_overlaps_nomap(phys_addr_t base, phys_addr_t size);
>  bool memblock_overlaps_region(struct memblock_type *type,
>  			      phys_addr_t base, phys_addr_t size);
>  bool memblock_validate_numa_coverage(unsigned long threshold_bytes);
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 9ce86349a29f..4cabfe365ac4 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -202,6 +202,20 @@ memblock_addrs_overlap(phys_addr_t base1, phys_addr_t size1, phys_addr_t base2,
>  	return ((base1 < (base2 + size2)) && (base2 < (base1 + size1)));
>  }
>  
> +bool __init memblock_overlaps_nomap(phys_addr_t base, phys_addr_t size)
> +{
> +	struct memblock_region *region;
> +
> +	memblock_cap_size(base, &size);
> +	for_each_mem_region(region) {
> +		if (memblock_is_nomap(region) &&
> +		    memblock_addrs_overlap(base, size, region->base, region->size))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  bool __init_memblock memblock_overlaps_region(struct memblock_type *type,
>  					phys_addr_t base, phys_addr_t size)
>  {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

