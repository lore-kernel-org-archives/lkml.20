Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C143FE362
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750313; cv=none; b=EM2YOY/01O2PQw37JY05ucyi9Z9/0vC+2qskfyPCAMAW3tGI6RK73TsxbrkOQeMtT5GkvlW1zWRdqBd5glTlWe1GWuZbeTkAKhysD6TUXOPsnSkRQPDO011qI0823rqT8XgsJGNuqGpNdhfnDUyqVfqWb/YGughg7FtLZoOXNRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750313; c=relaxed/simple;
	bh=5sCwFpjIBiNcXEVcGqgEH4ryR9b1QDnywMhMWNFCidM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=HueCT45prChAYa++K62gKz+SjZorxdU7Hf52czauBTRmt6z+/W124CqEmE+Y+BecojhvCVmu3RVZSXZV337t666rbhwvio09EGbjgRAP+5FPR2ORYJE0HbQtlWkO5l8Fb+9m6k+RXBcigg+gjjZuKItjBraqmRgj+Y0LK4Wv5RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cptM55Wd; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cptM55Wd"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260826131826euoutp0151f99cce5092d93092da408eba99814f~PXW6gyKbC0216802168euoutp016
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:18:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260826131826euoutp0151f99cce5092d93092da408eba99814f~PXW6gyKbC0216802168euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1787750306;
	bh=rw0+g5eoKmahgtE3CqR+4VOpRqHEDZMoAaxPRmz5Fvs=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=cptM55Wdq3sMeNOoEAR2ynQcJThhoMnGBKRBzr9uCY0ycpNq/GnjNrsGnTMeYDWFQ
	 zFKq+MdvUuB9EaQ2BLvBkgHviwBbs0TsvFFM0TYIKIKWk0aD3nWdFpWcMbXRdLdQ35
	 XayFhH7ICIF7Ax4Yrd8o5ZmBRvwcdYLu0NR0+nsA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260826131826eucas1p21156d47d87f5b0f5206e81457ae63092~PXW6KCuYl2176621766eucas1p2g;
	Wed, 26 Aug 2026 13:18:26 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260826131826eusmtip2a69d2b2f4487d00ec98febb8fe8a669a~PXW5wXy-E0873808738eusmtip2V;
	Wed, 26 Aug 2026 13:18:25 +0000 (GMT)
Message-ID: <cb8a910d-a1e8-46a3-bd3a-bf56b2a2848b@samsung.com>
Date: Wed, 26 Aug 2026 15:18:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 5/5] of: reserved_mem: retain static no-map memory on
 init failure
To: Wandun Chen <chenwandun1@gmail.com>, robh@kernel.org,
	saravanak@kernel.org, rppt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260818092420.2859026-6-chenwandun1@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260826131826eucas1p21156d47d87f5b0f5206e81457ae63092
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260818092456eucas1p14bc953974fe7bb755d530829af4060cc
X-EPHeader: CA
X-CMS-RootMailID: 20260818092456eucas1p14bc953974fe7bb755d530829af4060cc
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
	<CGME20260818092456eucas1p14bc953974fe7bb755d530829af4060cc@eucas1p1.samsung.com>
	<20260818092420.2859026-6-chenwandun1@gmail.com>

On 18.08.2026 11:24, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
>
> Static no-map reserved-memory regions are initialized after paging_init().
> If initialization fails, MEMBLOCK_NOMAP would be cleared, and the memory
> is available to the buddy allocator even though it was excluded from the
> kernel linear mapping.
>
> Clear MEMBLOCK_NOMAP only for dynamically allocated regions, which are
> initialized before paging_init() and can safely be made available to the
> kernel linear mapping.
>
> Sashiko found this issue in [1].
>
> Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Link: https://protect2.fireeye.com/v1/url?k=b169dca9-d0f63c99-b16857e6-000babe403ab-705f8403a3aaee16&q=1&e=a8dd8ad7-74ca-479d-8b2d-d49b0225734b&u=https%3A%2F%2Fsashiko.dev%2F%23%2Fmessage%2F20260814090305.4C8741F00A3D%2540smtp.kernel.org [1]
> ---
>  drivers/of/of_reserved_mem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index ac5db19dcc93..0090fa86dd10 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -709,7 +709,7 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
>  		pr_info("node %s compatible matching fail\n", rmem->name);
>  		rmem->name = NULL;
>  
> -		if (nomap)
> +		if (dynamic && nomap)
>  			memblock_clear_nomap(rmem->base, rmem->size);
>  
>  		if (dynamic || !nomap)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

