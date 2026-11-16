Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848595;
	b=Zhxw+4EVdEWS9EUgRGymyn5lXba2EbMstMCK71X+Z4/n+IkBMSJKwnuj4lQretDPqyJV
	 9pEhnD1br9gTYe/sV+3ZfiV//6mI0WL/dsbMyCFVqtD4yohZakJD9MzC67EcZSJGYvOw7
	 Sdtuq+dgod+AyHRsCyrqncRdAzG7wwooITG/E8d5gYPn250o3a10JmqeHBVEHQ2PLDw0/
	 nenat9ziLtqcIoZiaQMuawX/f84kdEJ2oNtEJoTPAh1X+P/Oly9bs5AsADrhxouRndRkB
	 VhKmSvhESKp/oc8YxWGSLobNUwTnjOqXGiWAw7kQlmMvlHrbXaZmzZeu1LO+FXVACEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848595;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=Xlu2/XYe7EswtPi8pz+Q2mqJjvsACMdsf2ljlMzSs80=;
	b=HJ1fwBaJ2+K7eJCFuap2RpCDE+VffntRrJvOMCClGqItOZC67DyDDKv6VNCsMWncIwAj
	 NcjMgCGKLZWQB1HPZZnaU8BID1FPVmkbonRmQvoZmobssAjIOWZo5o42mx/FOTkp4ZxN+
	 mo+C/zlyNeeyDFf/9TtHrKtqJBwSTG2iohcRZjeINuK2MVDi+TiX69s9Lg1ZWI6BG/O5N
	 xCnxC9X0OnaFf4PnLv0hD+w3wqJaeWd308AHW84vN7zlSRy8npwlQqrKahoLob1LtyYd5
	 r8wAde1mbQch74ZNcloLo/i2vJbd0RtJFnDfrGa5gVlZnhqRNFrpQFhP3yHJTVGhs5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=ruwynwGp;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D83606A8B6
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19D83606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=ruwynwGp
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261116170310euoutp01705bbe9b7bb6b956965f9a31ba5addcd~olUiD6d4e3191731917euoutp01J
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:03:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261116170310euoutp01705bbe9b7bb6b956965f9a31ba5addcd~olUiD6d4e3191731917euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794848590;
	bh=Xlu2/XYe7EswtPi8pz+Q2mqJjvsACMdsf2ljlMzSs80=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ruwynwGp0S3C1HS8M6dReLS7oashLtwnkk97SGfyB7CSDysLMVg/Dupb8+uCiUyzb
	 DAu7TXvai1Kbrr+wbxEpv2TzkktSLhLL0+DYwjsWEMxSq2ilZvJJpE/+lgu0piEdVy
	 JQ1jWcDYbjzSu+p+CnlF5E13AnrFqw1hQvtmnHc0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261116170309eucas1p151c1b0b2d7e7269bb2d9d3ff5c615b8c~olUh4f9xz3059630596eucas1p1H;
	Mon, 16 Nov 2026 17:03:09 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261116170309eusmtip21a2347bea4b2aab0270c24a181c6ca4e~olUhaA1XW0959509595eusmtip2j;
	Mon, 16 Nov 2026 17:03:09 +0000 (GMT)
Message-ID: <717f8848-99c5-46eb-bffa-aaa17db2adb8@samsung.com>
Date: Mon, 16 Nov 2026 18:03:09 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] dma-contiguous: reserve NUMA CMA areas after default
 reservation failure
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Feng Tang
	<feng.tang@linux.alibaba.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261115120534.2331911-2-thnkslprpt@gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261116170309eucas1p151c1b0b2d7e7269bb2d9d3ff5c615b8c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261115120547eucas1p227eb5bfbcb903d677f033dd69643f44b
X-EPHeader: CA
X-CMS-RootMailID: 20261115120547eucas1p227eb5bfbcb903d677f033dd69643f44b
References: <CGME20261115120547eucas1p227eb5bfbcb903d677f033dd69643f44b@eucas1p2.samsung.com>
	<20261115120534.2331911-2-thnkslprpt@gmail.com>

On 15.11.2026 13:05, Avi Weiss wrote:
> dma_contiguous_reserve() returns when reserving the default CMA area
> fails, skipping independently configured NUMA CMA areas that might
> still be reservable.
>
> Register the default area only when its reservation succeeds, then
> continue with NUMA CMA reservation even if the default area fails.
>
> Fixes: 7e6ace2535d0 ("dma-contiguous: add kconfig option to setup numa cma area if not configured explicitly")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>


When reservation of the default CMA area fails, there is something really
wrong with system configuration. I don't think that it is worth trying to
setup NUMA related regions in such case.


> ---
>  kernel/dma/contiguous.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index 90937dc7c627..0b6500bb6cd9 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -287,8 +287,6 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
>  						  selected_limit,
>  						  &dma_contiguous_default_area,
>  						  fixed);
> -		if (ret)
> -			return;
>  
>  		/*
>  		 * We need to insert the new area in our list to avoid
> @@ -305,9 +303,11 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
>  		 * but we also need to insert it in our list to avoid
>  		 * having a default area but an empty list.
>  		 */
> -		ret = dma_contiguous_insert_area(dma_contiguous_default_area);
> -		if (ret)
> -			pr_warn("Couldn't queue default CMA region for heap creation.");
> +		if (!ret) {
> +			ret = dma_contiguous_insert_area(dma_contiguous_default_area);
> +			if (ret)
> +				pr_warn("Couldn't queue default CMA region for heap creation.");
> +		}
>  	}
>  
>  	dma_numa_cma_reserve();
>
> base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

