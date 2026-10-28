Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180607;
	b=5jlNwVgbPu6zxcf3ioAzzOxHygxM9DrKl3hXbKkqp+psWT4tcpyv0ubBhrdJwN27zpzE
	 ej0BkA4aC6g8scpplzdUVutjCbuNnitjWlegwdcds2aUHxLIa1uLS+IVVwu2ZYSUrFU8f
	 kSf796CkTEUPg2dSsKKUUGoqNXJXu9C57kPCu0HkZEoSwC8sMrUnKR+1Bpy6Z6vXQofGR
	 CMqzaFrB+Vf+hdScwgzX4LdZHsIEBAqdMd5XjUAdSpHdq70ivi8OlP3TF9hfpUQQi6/4O
	 oTB3A/587suGZZUPY3HBK8nEFz2eL2Y3Wu5GOmOSnBAeAzH1rp9i3JJcgtS/Y992qGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180607;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=535aXf9H9rC26a6zJhJ1r2DGySEkl3W8qtDu8csDPOg=;
	b=jA92kTdVb4GNMX3of/p6QzhK0NiFWoMgu2SsWawN7eYZ+R1CfiSge5J/n6PrhpibjaOl
	 J03fz4WjyBksvFkEnCblV9DdXmpEz9v192kPC7zTpx4AV1WWY2blfbK6ViAF+6QKhgm72
	 Xm7dHzZX0g1wKlqv2UY38Kob3qIEIao3iLno13n+/mbQyXA1o/2poC4GLNt1/9IBT330P
	 xWiheOdjvZyK4I1iRwgV8A0Xavrg/50PWkx3QrDvkhuB8zZ6POkskT0JGWnoRmf8pOt8Z
	 feAtqIQCxuayP53vId3PCjzAWTPHZMPCH33+rnseeT3MtOLx2bmxysbYVthlIzpmlpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=a7d59F50;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2777606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2777606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=a7d59F50
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261028094322euoutp01b09f111e91b16b6dd593f354009c2d24~iqEHdm2Jc1621216212euoutp01u
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:43:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261028094322euoutp01b09f111e91b16b6dd593f354009c2d24~iqEHdm2Jc1621216212euoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793180602;
	bh=535aXf9H9rC26a6zJhJ1r2DGySEkl3W8qtDu8csDPOg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=a7d59F50iU2RybF1FZVJqqGsE3wBZnUx83olzWf9UshxkFtBkMZrd0pWcCFJO28T1
	 y21F90VMdNgopBhMFS6MCvjzrzjfAW/IjeWOlktb3ToXTWBDwdco3WzX9hyNYuYEB9
	 KLBtztKS/jn9c4RuVm5YYsSPQ1xaeQi55awmhSMA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261028094322eucas1p290e530066640b90b39ad9d5066c4e273~iqEHDwUBM1968019680eucas1p2Y;
	Wed, 28 Oct 2026 09:43:22 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261028094321eusmtip243f9cf93d775eb983c0129e973fe4e33~iqEGJK6bi1976119761eusmtip2D;
	Wed, 28 Oct 2026 09:43:21 +0000 (GMT)
Message-ID: <6b89446c-c1a7-42c2-a557-53059cef03a8@samsung.com>
Date: Wed, 28 Oct 2026 10:43:20 +0100
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
Subject: Re: [PATCH] media: exynos4-is: fix DMA memory double free
To: Guangshuo Li <lgs201920130244@gmail.com>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin
	<peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Hans
	Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261027145313.136305-1-lgs201920130244@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261028094322eucas1p290e530066640b90b39ad9d5066c4e273
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261027145330eucas1p1b07eaac7858482b12d90a342fae36f2f
X-EPHeader: CA
X-CMS-RootMailID: 20261027145330eucas1p1b07eaac7858482b12d90a342fae36f2f
References: <CGME20261027145330eucas1p1b07eaac7858482b12d90a342fae36f2f@eucas1p1.samsung.com>
	<20261027145313.136305-1-lgs201920130244@gmail.com>

On 27.10.2026 15:53, Guangshuo Li wrote:
> fimc_is_alloc_cpu_memory() frees the coherent DMA buffer when its
> DMA address does not satisfy the firmware alignment requirement,
> but leaves is->memory.vaddr non-NULL.
>
> Because firmware loading is asynchronous, this error path may run
> after probe has returned successfully. A later remove can then
> attempt to free the same DMA allocation again.
>
> Set is->memory.vaddr to NULL after freeing the buffer so the
> existing NULL check in fimc_is_free_cpu_memory() skips the
> already-freed allocation.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: db47622c13ae ("media: platform: exynos4-is: remove all references to physical addresses")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

but I would relax a bit the severity of this issue. I'm not sure if it
makes sense to bother stable team with it and I would add 'potential'
word to the subject. In practice this case would not happen.


> ---
>  drivers/media/platform/samsung/exynos4-is/fimc-is.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> index b7d9bfedd590..9fdc352abfe4 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> @@ -346,6 +346,7 @@ static int fimc_is_alloc_cpu_memory(struct fimc_is *is)
>  			(u32)is->memory.addr);
>  		dma_free_coherent(dev, is->memory.size, is->memory.vaddr,
>  				  is->memory.addr);
> +		is->memory.vaddr = NULL;
>  		return -EIO;
>  	}
>  

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

