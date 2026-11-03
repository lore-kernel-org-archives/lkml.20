Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703428;
	b=VfEp+Zq4iUDkgSlNAk0yx4CpeLcxHbDLWqXwhiBkNpUM4HTcf//APyuKrJsj5azcAP3U
	 tzFCLNYP7Q9sGRlDh8CtnMlfNo9+WtaoyFS3EZUIW45NEfjvMaUpyTeeIfD7ta0J/Ynce
	 NClViC23mMdZk73tRs2O058e6VKSEfhmy/LcutJVLduoYlTNScGF4rLJx8TdfeY2LfM+l
	 ORTMQvWRDSudqfYtrgEZ5Z/e0Jc5b9255JfDV3D3ZZnXiVfYxVY5cr66nl1vPNi0R64vD
	 KxOXG2NhtEwGDLDQ+wN7Ze9MNGFqbLCYIsS3/jJMcYCjXVL8KdYk4kpEIfYr7ZhkmJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703428;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=cFdQ6prKPN0fVpDGNOM9j75u/A7Rwlpi6Mh1u9hdWiA=;
	b=SUT1d13JL+/sBeJpMUFBKjSsk+wUmnSx0bH5mgQ5y/QfwHKepB9XO3KLIpUht1W0HpPU
	 g1vP64x8CRZV0gU9DXrwWgh1+0J8VjgiUoweWscKz8yCz8W9jMgE03W8Ud5E15yEdTL3F
	 kte80dN477y49Zvz1cZQovaCFjEzMyu7Yh5KpAMv4djA+Q2CfsN8s4uJ6mNcLxo6Fp9SR
	 1ma4axe9cNetjzndHGpAuzbm71QJgZ+OC7ghtbjfC+zloFQ59IFBrpB4vtdKMluJftUDB
	 7tbwxgFyf2tMcdPso/L4obS8Xg1KApGEu3umzUKvt33X/w56UcNUs1uYOtFVXmbLRFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=ajY4zP2U;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40EA606F7DA
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E40EA606F7DA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=ajY4zP2U
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261103105659euoutp02877cb7ddfa13e0054f4f1528ff34fc00~kg8HF7E821283512835euoutp02M
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:56:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261103105659euoutp02877cb7ddfa13e0054f4f1528ff34fc00~kg8HF7E821283512835euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793703419;
	bh=cFdQ6prKPN0fVpDGNOM9j75u/A7Rwlpi6Mh1u9hdWiA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ajY4zP2UxM2JFV5HrXBDx4ECGZq/ZnrC5yg91GsYcRX7X3ar4Uq64UWNQ9hPgXslM
	 Wy3f6oMrSAY2E34y/m7WQ7x/+qNnqxLJlIN0aEl5u33i7deRWVPQo48N8+HEZV5Vo2
	 E7tzlf7AAqyGCxrj8qUPWb7KFvewb69tzSxoFlO4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261103105659eucas1p13666e7692d2b66477f7226dbb9ff0714~kg8G8z4GM0743307433eucas1p10;
	Tue,  3 Nov 2026 10:56:59 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261103105659eusmtip2db0935c8ac86b48bb9ade39923c4d8e0~kg8Gm_qSB2162521625eusmtip27;
	Tue,  3 Nov 2026 10:56:59 +0000 (GMT)
Message-ID: <eaa6bd75-d81e-4432-a950-e38cf98e1d06@samsung.com>
Date: Tue, 3 Nov 2026 11:56:58 +0100
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
Subject: Re: [PATCH] dma/pool: eliminate CMA alloc warning in
 atomic_pool_expand
To: Maximilian Heyne <mheyne@amazon.de>, stable@vger.kernel.org
Cc: Robin Murphy <robin.murphy@arm.com>, Nicolas Saenz Julienne
	<nsaenz@kernel.org>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261030-ghent-tubes-5abba7d2@mheyne-amazon>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261103105659eucas1p13666e7692d2b66477f7226dbb9ff0714
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261030100043eucas1p195785d2a92ca9ff72ce7dab2fc397f20
X-EPHeader: CA
X-CMS-RootMailID: 20261030100043eucas1p195785d2a92ca9ff72ce7dab2fc397f20
References: <CGME20261030100043eucas1p195785d2a92ca9ff72ce7dab2fc397f20@eucas1p1.samsung.com>
	<20261030-ghent-tubes-5abba7d2@mheyne-amazon>

On 30.10.2026 11:00, Maximilian Heyne wrote:
> atomic_pool_expand() allocates with decreasing page order first from the
> CMA and if that fails via alloc_pages(). If the cma allocation fails a
> warning, such as the following, is printed:
>
>   cma: __cma_alloc_frozen: reserved: alloc failed, req-size: 4096 pages, ret: -16
>   cma: number of available pages:
>   cma: range 0: 1024@0
>   cma:
>   => 1024 free of 1024 total pages
>   DMA: preallocated 262144 KiB GFP_KERNEL pool for atomic allocations
>
> In this case the allocation succeeded via alloc_pages and therefore,
> printing the warning is not necessary. Therefore, similar to commit
> 463d439becb8 ("dma/pool: eliminate alloc_pages warning in
> atomic_pool_expand") silence the warning also for the CMA attempt.
>
> Fixes: d7e673ec2c8e ("dma-pool: Only allocate from CMA when in same memory zone")
> Signed-off-by: Maximilian Heyne <mheyne@amazon.de>

Applied to dma-mapping-for-next. Thanks!

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

