Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825067;
	b=WKBmSPRFqew0hywMf9/2nHfSLiVm2wHFV3ACN6axDmx8GWDKIVKixVza4UBz6BLQd8pZ
	 8efHsTdeZWxtjnUgk3Eb7uD05XSvOR1xWgBK6AOcn/0Zwg4W4z4izl8QZ5wpBGgqiN7J3
	 NMsJYmJXDdlcGeM+c2V3I38HjOBc6CPZREBaYmTnWvq0EoYjQUYNePB3WSrZjrTyQqyfE
	 FuJ5Y1uuxOn/GHV2KioVEg9KbA7AANvzUq0g0WtZGf5BSFCkA955nDW8wyrwpxSG61Vb0
	 K5Ag0MAhFUiFJtUAiUHQm1swoqBhjTxnZ/7kclgOh3fB6z7zR/E404nc/15KwW84xIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825067;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=uNOpllo5XvmHxbQubQwPdNd+q8BidbrN9AGJD2HAR/8=;
	b=S7dqISmKdK2t9JU8c1F1kMFhC6IY6lFcbWAHTgO13rLVjvavruzKSFEmiv6oB6jrj0q2
	 /oP4om4+0WecUxVzAwz1DqERTRZZcRKRlqYDX8FIspbh82h0emRg16BjAkPiBfgQ+mh5v
	 hi1ruzX4sf1NaQ08PTiavYc5G44rfeNlChmyOwbzs79SYlBNO9iT/Tvj8mPofkukGSOgN
	 nfVn1HYV4R592KUmovhWr+mBmdpUjtSnCZr/QAp6TC5IJU1AvkgQY7neHBRrrEBuKWp67
	 sNOHH8mMBZ3vWgLWE1Gqky6qdzd1BHjczJBgGdS3h5FcuGzxyQC7veKdZnAjK8KDbwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Ip0nbOh6;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529FE606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 529FE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Ip0nbOh6
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261116103103euoutp026204c76aa7c3f5f624f5fb2571a2cc99~of_LhzAnz2683926839euoutp02r
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:31:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261116103103euoutp026204c76aa7c3f5f624f5fb2571a2cc99~of_LhzAnz2683926839euoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794825063;
	bh=uNOpllo5XvmHxbQubQwPdNd+q8BidbrN9AGJD2HAR/8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Ip0nbOh6qvOR4lJQZzIsdjanHDzjL4Vl6XcdmOUfKlLA1M+ySnzuuQYQQ72ZxUZ/v
	 QW1Pyqfe+sRmogKKI6mDHERIHhAd+lHOoBSjcYTyg0eHs8duuzDebDuaYaNnt5rK5/
	 1IzoeOC4PP8Jhaiw5nhLAHhfaqSMe9+WmFHNyJKk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261116103103eucas1p1b1d1b73f614168f64fea898e558ec8d8~of_LXhMea0737407374eucas1p14;
	Mon, 16 Nov 2026 10:31:03 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261116103103eusmtip21cb3987701e28a22d7af3b6f18dba8ec~of_Kr3hBm2720627206eusmtip2b;
	Mon, 16 Nov 2026 10:31:02 +0000 (GMT)
Message-ID: <94d4ca0a-40d0-49ac-97dd-0cf88238667b@samsung.com>
Date: Mon, 16 Nov 2026 11:31:02 +0100
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
Subject: Re: [PATCH v2] dma-pool: decrypt pages before creating the shared
 remap
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Robin Murphy <robin.murphy@arm.com>, David Rientjes
	<rientjes@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K . V"
	<aneesh.kumar@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261109230830.1707975-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261116103103eucas1p1b1d1b73f614168f64fea898e558ec8d8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261109230841eucas1p1ee97e7adcdac763c19145f604e4f11a7
X-EPHeader: CA
X-CMS-RootMailID: 20261109230841eucas1p1ee97e7adcdac763c19145f604e4f11a7
References: <CGME20261109230841eucas1p1ee97e7adcdac763c19145f604e4f11a7@eucas1p1.samsung.com>
	<20261109230830.1707975-1-m.szyprowski@samsung.com>

On 10.11.2026 00:08, Marek Szyprowski wrote:
> atomic_pool_expand() creates the pgprot_decrypted() remap of the pool
> pages before calling set_memory_decrypted() on them. The error path
> when gen_pool_add_virt() fails does the reverse: it re-encrypts the
> pages and only then tears down the decrypted remap. In both cases there
> is a window where a decrypted (shared) kernel mapping points at a page
> that is still private, i.e. encrypted, to the guest.
>
> dma_direct_alloc() gets this right: it converts the pages first, then
> creates the remap, and on error removes the remap before re-encrypting.
> Do the same in atomic_pool_expand(). The pages are now converted before
> arch_dma_prep_coherent() and the remap, and the error path unwinds in
> reverse order.
>
> If set_memory_decrypted() fails, the encryption state of the pages is
> unknown (the conversion may have partially succeeded), so they must not
> be returned to the page allocator or CMA and are intentionally leaked,
> as before. No remap exists at that point any more, so nothing else needs
> to be undone. Add a comment explaining this.
>
> Closes: https://sashiko.dev/#/bug/linux-9212d9b5-4a56-43e2-bc00-6e69b724078b
> Fixes: 76a19940bd62 ("dma-direct: atomic allocations must come from atomic coherent pools")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied to dma-mapping-fixes.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

