Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865811;
	b=mgK2AYPebF7KfHQFHPdM0MhuSUoAg3wB98d6+bVsPrLZyqwaweoXImIwVCBShQ2es1fR
	 qDsfEOBm4p6AfRp0EU9gHGbeTUD1CAJppPePJn5iLb4ro2+GhREzgwIh2Mxo4LQE13PAw
	 xZBp95R/APMILzWQseTDc+UQmnFXD8JghhPkKA41CbQhnUDlZPgCFyif3QYiX015OqsBr
	 o8Gs7cfD2B3GmW2UsKxNJ6VlrDwA3yIC4kYvFvTh9QED0UHxH+75dA39A8tmqGLX2cWWo
	 aR3RU4w1/KeB0F53zL4RX7Fv18LnWpPS8LNseTx7jmgdybyr0u/rObWknOdq9zRuYdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865811;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=/R6SjvlIEakmX2LCOEwbTiKWcwW/bEJjJXxzK8ev4Gk=;
	b=ugxua8Rp2siInY0gpKkis89r7Lnu1jjJSxqRb4ro+Egs7bf9oos1kqsEzZNz0NkaBXA1
	 8J/GoZzfc/O5/6xPj7W+RsON145E++JczcOMHW7k5S1h7L2z7zBDC2tBS2eUc4UmR9Dj+
	 7dutRKIgsn3xXqbfZTCIjOsacSMHUoDhnb6ZjaYFhwVyBxHMQ9wsjGQjUD7oSin/OLkLA
	 +Zee42Euc1RrE2GTNz+ePeNgqR5O9NPky9o943pAXsdMgrxFjSnOxlUcUcTXOSeSJ1fJ4
	 +LT+jfPPM7gDYzsDnMVfEMTbszm5vnG/bwNrHCHgGVb6g+daajZC+5/4Aos/TMf5bSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=T4OMYUYd;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B195606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B195606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=T4OMYUYd
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261105080329euoutp0107aca1d27c0ddcd8d1b9ba93be02c8ab~lF3MQu7Tq0550705507euoutp016
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:03:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261105080329euoutp0107aca1d27c0ddcd8d1b9ba93be02c8ab~lF3MQu7Tq0550705507euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793865809;
	bh=/R6SjvlIEakmX2LCOEwbTiKWcwW/bEJjJXxzK8ev4Gk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=T4OMYUYdo4ZjlXwESJaabPslfVlDhslwZoZdj/C6h91T6fT6tkW79fPbXFFrYb81X
	 Uwv7dkqkoc9WZ3pPmGcBfhE/7aC5kXHllwYcmbINWbOJ01fAi4+v+grEe7KKjNnbYM
	 7tX0eyg81vcZNMPQyNJyGGT6o9bexR6BjRXxhsbI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261105080329eucas1p1386a0920ebaf45ff525de8361501bdf1~lF3MJHMDI2293122931eucas1p1b;
	Thu,  5 Nov 2026 08:03:29 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261105080328eusmtip23f9ebfe62c4c6fea3cc323dfc91f24b4~lF3Lc2JLn1089310893eusmtip2h;
	Thu,  5 Nov 2026 08:03:28 +0000 (GMT)
Message-ID: <286d09f6-0fd6-46be-9290-a7d89af18892@samsung.com>
Date: Thu, 5 Nov 2026 09:03:27 +0100
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
Subject: Re: [PATCH 0/5] dma-mapping: assorted sashiko.dev fixes
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Robin Murphy <robin.murphy@arm.com>, Andrew Morton
	<akpm@linux-foundation.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Claire Chang <tientzu@chromium.org>, Petr Tesarik
	<petr.tesarik.ext@huawei.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Lucas Stach <l.stach@pengutronix.de>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261026095423.966856-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261105080329eucas1p1386a0920ebaf45ff525de8361501bdf1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261026095434eucas1p29408e916eda327a5e9c83f64b0df4e66
X-EPHeader: CA
X-CMS-RootMailID: 20261026095434eucas1p29408e916eda327a5e9c83f64b0df4e66
References: <CGME20261026095434eucas1p29408e916eda327a5e9c83f64b0df4e66@eucas1p2.samsung.com>
	<20261026095423.966856-1-m.szyprowski@samsung.com>

On 26.10.2026 10:54, Marek Szyprowski wrote:
> This series collects fixes for the DMA-mapping code, developed while
> analyzing issues reported by the sashiko.dev automated review. All
> patches were prepared with LLM assistance and then reviewed manually.
>
> Best regards
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
>
> Marek Szyprowski (5):
>   dma-coherent: serialize reserved memory pool initialization
>   dma: swiotlb: Serialize restricted DMA pool initialization
>   dma: swiotlb: Remove default pool from the pools list on exit
>   dma-pool: release CMA pages on atomic_pool_expand() error path
>   dma-direct: zero memory allocated with DMA_ATTR_NO_KERNEL_MAPPING
Applied patches 1,2 & 4 to dma-mapping-fixes. The remaining two patches
need more work, I will post v2 soon.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

