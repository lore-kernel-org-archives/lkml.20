Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F533EB810
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750271; cv=none; b=tW4pAlOgtxYRJdf9QabxtLOhT12o1qXcZCnD42QtDzxVEA9tcDIIki9Zv8i8djBGnDHtFiM1t7oKSOIbYGAuG63s1Fb3pcoxWxq4obpNLkXo7LBYjqMagnDygzwA2C5gbCA5pUHbsUSOxWPP45AkEKsDQr4NkWLo5b56OzutgVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750271; c=relaxed/simple;
	bh=Z0F3RblIjphRJy+WnBKtm0+lqXYRgpAkDg2u+A5e4+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ofygkDGRZwuFMhdH4RK64CrD2FMJBG5fSznsJI+z6pRMH2jopLt/tggMu/2DSKTDjAMzGrSGVNkharPU2NJqd6OcMqSEDzMmDuuSTEIjtuQk5Klm9w8fsiRgapxQWs3Yah8/oPoxnHUyF7f5hAZJROqn0jfwxDz1KtPeGabn9Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=aMMrKVlr; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="aMMrKVlr"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260826131747euoutp01bb57b9a50800511314e63e933572bff9~PXWV7T2YK0263902639euoutp01e
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:17:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260826131747euoutp01bb57b9a50800511314e63e933572bff9~PXWV7T2YK0263902639euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1787750267;
	bh=Me0VmWoWAYHkVt/MT/VZKdgMLOyOPPoKW1qhK464E4Y=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=aMMrKVlr5oXAHFFawFLnkYgSa/sThUsBpW0oq1j/1ACdrYDGqS5Tb00SUGzaTMB5E
	 FK22rrgip4DS/1cEakMKGoLD/1kvYjSWDIJCXQQPEaIGe5PK9jNw17H/90gjr+MPWX
	 6K/XdbuAxnUrFfS9nBwInfUfPCLsKttBh0Lb6AYo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260826131747eucas1p213224e419e6b00c8c84b85a0bedc84e6~PXWVl6Ksu1479414794eucas1p2P;
	Wed, 26 Aug 2026 13:17:47 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260826131746eusmtip12f599e284d828f3483e2e6ed3c54a55d~PXWVCb-nm1351413514eusmtip1M;
	Wed, 26 Aug 2026 13:17:46 +0000 (GMT)
Message-ID: <8948e46d-bcc2-47e9-84de-dd6907cf0876@samsung.com>
Date: Wed, 26 Aug 2026 15:17:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 4/5] of: reserved_mem: release dynamically allocated
 no-map region on init failure
To: Wandun Chen <chenwandun1@gmail.com>, robh@kernel.org,
	saravanak@kernel.org, rppt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260818092420.2859026-5-chenwandun1@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260826131747eucas1p213224e419e6b00c8c84b85a0bedc84e6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260818092450eucas1p1f1d7f5ad5fc8d786580dd9dcad6ce196
X-EPHeader: CA
X-CMS-RootMailID: 20260818092450eucas1p1f1d7f5ad5fc8d786580dd9dcad6ce196
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
	<CGME20260818092450eucas1p1f1d7f5ad5fc8d786580dd9dcad6ce196@eucas1p1.samsung.com>
	<20260818092420.2859026-5-chenwandun1@gmail.com>

On 18.08.2026 11:24, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
>
> Dynamically reserved-memory regions are added to memblock.reserved by
> memblock_phys_alloc_range() during __reserved_mem_alloc_size(). When a
> reserved-memory region's driver initialization fails,
> fdt_init_reserved_mem_node() cleans up the reservation. For no-map
> regions it only calls memblock_clear_nomap(), leaving the range in
> memblock.reserved and unavailable for normal memory use.
>
> Fix it by freeing the region on init failure when it was dynamically
> allocated.
>
> Sashiko found this issue in [1].
>
> Fixes: 7b25995f5319 ("of: of_reserved_mem: mark nomap memory instead of removing")
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Link: https://protect2.fireeye.com/v1/url?k=37bb3269-68033acb-37bab926-000babff88b5-00648778f1201363&q=1&e=40542077-d5ad-41ca-88fd-1cf102a816c1&u=https%3A%2F%2Fsashiko.dev%2F%23%2Fmessage%2F20260806100605.2C2C01F000E9%2540smtp.kernel.org [1]
> ---
>  drivers/of/of_reserved_mem.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 767ef702392e..ac5db19dcc93 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -136,7 +136,8 @@ static int __init alloc_reserved_mem_array(void)
>  }
>  
>  static void fdt_init_reserved_mem_node(unsigned long node, const char *uname,
> -				       phys_addr_t base, phys_addr_t size);
> +				       phys_addr_t base, phys_addr_t size,
> +				       bool dynamic);
>  static int fdt_validate_reserved_mem_node(unsigned long node,
>  					  phys_addr_t *align);
>  static int fdt_fixup_reserved_mem_node(unsigned long node,
> @@ -352,7 +353,7 @@ void __init fdt_scan_reserved_mem_late(void)
>  			continue;
>  
>  		uname = fdt_get_name(fdt, child, NULL);
> -		fdt_init_reserved_mem_node(child, uname, base, size);
> +		fdt_init_reserved_mem_node(child, uname, base, size, false);
>  	}
>  
>  	/* check for overlapping reserved regions */
> @@ -567,7 +568,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node, const char *unam
>  	}
>  
>  	fdt_fixup_reserved_mem_node(node, base, size);
> -	fdt_init_reserved_mem_node(node, uname, base, size);
> +	fdt_init_reserved_mem_node(node, uname, base, size, true);
>  
>  	return 0;
>  }
> @@ -676,13 +677,15 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem,
>   * @uname: name of the reserved memory node
>   * @base: base address of the reserved memory region
>   * @size: size of the reserved memory region
> + * @dynamic: whether the region was dynamically allocated
>   *
>   * This function calls the region-specific initialization function for a
>   * reserved memory region and saves all region-specific data to the
>   * reserved_mem array to allow of_reserved_mem_lookup() to find it.
>   */
>  static void __init fdt_init_reserved_mem_node(unsigned long node, const char *uname,
> -					      phys_addr_t base, phys_addr_t size)
> +					      phys_addr_t base, phys_addr_t size,
> +					      bool dynamic)
>  {
>  	int err = 0;
>  	bool nomap;
> @@ -708,7 +711,8 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
>  
>  		if (nomap)
>  			memblock_clear_nomap(rmem->base, rmem->size);
> -		else
> +
> +		if (dynamic || !nomap)
>  			memblock_phys_free(rmem->base, rmem->size);
>  		return;
>  	} else {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

