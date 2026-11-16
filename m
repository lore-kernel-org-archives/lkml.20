Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824547;
	b=xvPr/E1R3wgqDhphMG8u9nVOzesUudo6tagLEAJBQeV7sse9JF7P0RiT0RMIVyO4TjNR
	 s5tJfklgdnAJBawYDGfdWisul1TRkQ9bxyricDoqMA1x/lymsEYuDph/EMMbcfVjq2jjT
	 0ayAHyctIUvYJRoX7tghvOQrfz7MNCy5njzosI9SAeYzlZZNwDfFkN4fHSKHpK7MRkzOT
	 4HjjLZViSrT7TueVCVckvmEDzhRP/mZd6lp4TG0dJVF7vbuUqiDi3fsyEUcqWWihCUkdF
	 jvgd3BhtjJuKMaVjWGfXPVPxnz550WbtY7h9AudQ/bgL3lepQ6iFfIPFA5fAugQ+gwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824547;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=98BxGy+EY2PtkdBhklkFFDQXfrGDUIZtHV6N0rsAFIc=;
	b=bHXCe4LlDuFIUa+ExCIZM2PMSrIEUVhLqMn/+UtI+WZ8r6vGR5EwMkaKDCw1FpGqsqJ9
	 oYoy75gDYTHkpLC7N8MPpokWtc562ZqeiMeTgGBrJXBFNXEpDNJ5hqShUXiMWxXcZwA65
	 hvS4v7aVj2eDcMpYqkOPWxpumZG3K2P4jpLhkLdWiz7lDGU3BRPoydmtY8E5NNBJ31M5G
	 2ErxX9UFetyrWUx6ESFIlAgqT1yPhf+OnwgYuSMDaCHpC1TMG0JBpKP3ECiJb/XokpClC
	 wc609LzZnoJ8BQyiQfEJWGzDJFgvfnWXyqbuHQ6wNiFgGS5BtNaYHGUBb32b4xinlXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=n167T6d5;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5C6606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C5C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=n167T6d5
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261116102223euoutp02f858666642662b92ffcf0ba73f2206ab~of2mcmn3G1548715487euoutp02L
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:22:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261116102223euoutp02f858666642662b92ffcf0ba73f2206ab~of2mcmn3G1548715487euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794824543;
	bh=98BxGy+EY2PtkdBhklkFFDQXfrGDUIZtHV6N0rsAFIc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=n167T6d5NegScgbzNeuzm6ja9FogEIAzpGu8PUf5npWfK3lrQmrOq75kb6RySybQZ
	 JTwGEPLOXo5wCycAhibwMkHTVSJCQq0XCex7iMA3ZSA7hn5OMeJ+KqgiuCC980rBLx
	 c9qUZPgdg22OuW7qnMVBy+e8K12BgWUmHUeJmAyE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261116102222eucas1p28765a35cf3a43f9e8c045187db3940b2~of2mUc1Uh0590505905eucas1p2k;
	Mon, 16 Nov 2026 10:22:22 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261116102222eusmtip190c65b7e812b976e4769d0eb31098e6b~of2lsw1K20503605036eusmtip1I;
	Mon, 16 Nov 2026 10:22:22 +0000 (GMT)
Message-ID: <09a8aeb6-a62d-4402-93ef-3eb4fcf9a6be@samsung.com>
Date: Mon, 16 Nov 2026 11:22:21 +0100
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
Subject: Re: [PATCH v2] dma: swiotlb: Properly tear down the default pool on
 exit
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Robin Murphy <robin.murphy@arm.com>, Petr Tesarik
	<petr.tesarik.ext@huawei.com>, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261109170603.385791-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261116102222eucas1p28765a35cf3a43f9e8c045187db3940b2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261109170611eucas1p2366f6f6462a0178990e401e35849edd5
X-EPHeader: CA
X-CMS-RootMailID: 20261109170611eucas1p2366f6f6462a0178990e401e35849edd5
References: <CGME20261109170611eucas1p2366f6f6462a0178990e401e35849edd5@eucas1p2.samsung.com>
	<20261109170603.385791-1-m.szyprowski@samsung.com>

On 09.11.2026 18:06, Marek Szyprowski wrote:
> With CONFIG_SWIOTLB_DYNAMIC enabled, the default memory pool is added to
> the io_tlb_default_mem.pools RCU list during initialization. When an IOMMU
> takes over DMA translation, swiotlb_exit() tears the default pool down and
> clears it with memset(), but leaves its node on the pools list. The list
> then contains a zeroed entry with a NULL next pointer, and any later walk
> of the list, for example mem_used() when reading the io_tlb_used debugfs
> file, dereferences an invalid pointer and crashes.
>
> swiotlb_exit() also leaves the io_tlb_default_mem fields that describe
> the pool. io_tlb_default_mem.nslabs and can_grow stay set, so
> is_swiotlb_allocated() and is_swiotlb_active() keep returning true, and
> swiotlb_find_slots() can schedule dynamic pool allocation after teardown.
> Without CONFIG_SWIOTLB_DYNAMIC, a later mapping can reach the zeroed
> defpool and hit BUG_ON(area_index >= pool->nareas). Before the pool data
> was split out of struct io_tlb_mem, swiotlb_exit() cleared the whole
> structure, including nslabs.
>
> Clear can_grow and cancel any pending dyn_alloc work, then remove the
> default pool from the list and subtract its slots from nslabs, and wait
> for an RCU grace period before clearing it, so that no reader can still
> see it. Without CONFIG_SWIOTLB_DYNAMIC, reset nslabs directly.
>
> As a result, with CONFIG_SWIOTLB_DYNAMIC swiotlb no longer silently keeps
> working through dynamic or transient pools after an IOMMU has turned it
> off, so for example dma-iommu bouncing for untrusted devices reports that
> bounce buffers are inactive, as it did before the dynamic pools support.
>
> Fixes: 158dbe9c9a3d ("swiotlb: separate memory pool data from other allocator data")
> Fixes: 62708b2ba405 ("swiotlb: add a flag whether SWIOTLB is allowed to grow")
> Fixes: 1aaa736815eb ("swiotlb: allocate a new memory pool when existing pools are full")
> Closes: https://sashiko.dev/#/bug/linux-f75998aa-65ea-4596-9bb4-fa83773012a3
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied to dma-mapping-fixes.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

