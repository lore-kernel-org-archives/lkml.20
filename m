Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348063;
	b=ceebsZHJmX798zsPR5Sg6XOXio91/xrl7sieyWnCN2kOJbVuMCXnoLdIZy4uEyFT8DTQ
	 Lsr31irJG6H3sZ63WyzcLVo+6hA0E/mHnJa7pK0FLHJSyl4+LqGqsaMqvH7jJy3kuRQUV
	 AQHAfvA1QTZZRHKmV28XlwVbHxs9L0TC9OHWUQP2sN1m6pAexh/bgo4v2TYs6rJhNwHzR
	 Zh/ANofovKqfb+3QHls9NAqBH3MtLZFP2MTIjarmCeiKDKSOJIJ6qQdkL2AIBSMRLc0kr
	 Mdr8Fj7uRzzWaVrWVTsHHY6x24zpNtW6AWiM5p4LiUTZT/3ZceCPCA6qmXpVZYII8lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348063;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=gu3WDc59a1hi8TKSBxLBKANAAP4yeqf1lNEU+Yxmkyw=;
	b=leK7tKQwLK5OHjPesOQTuJ6IsTmTZ3SCqtmKsjF6PUXCGZz9rrYQGrsOa6RHQN4WlgoX
	 H3abDrKGPTMYEOgYhUc5e1JdHqmTcHnuYvlSMY+wIkJtCknt0EUIKAWoG/cpw5aU1Wu/2
	 PcvaYxDupQCdUTdv1Vi/GdzayMslHX2scLUM/zIxtpUouC+EWi5rYC8RwB9bPq3pjPNU6
	 lgcQGbU7wU1ex7wD2QpXaR0JJOk61qc4lQV6Sy/4m5Rs0Ou4JNSfRnEjFpHsx5Ca++T87
	 hxJgdcT7pcb1KsuL63JQekS5J393awl/3eGfV+SIEaitmbsT9VuLP5DV6aiaCILWoZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Z9K9CO0V;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51A1606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B51A1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Z9K9CO0V
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261030081419euoutp01e63490605c1cddf847a2d3903f1c1dc3~jQI8N4uaI2282122821euoutp01Y
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:14:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261030081419euoutp01e63490605c1cddf847a2d3903f1c1dc3~jQI8N4uaI2282122821euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793348059;
	bh=gu3WDc59a1hi8TKSBxLBKANAAP4yeqf1lNEU+Yxmkyw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Z9K9CO0Va/v7gZBgkS0DUY899rLqH3dtIsFOjM6OQ9gzQe+cvMNoulHJgn2oEg4LW
	 rz682PJQ+q2eWwNLfDMJJxukW5yecxRwOmUqAU8nrAe3vFwV5FnUn3IFSlj72mojio
	 2pIWdilYm0wFcyGSv3nGjmk3kWDd1u/2Eq4IdRzA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261030081419eucas1p2b83bf1763b5f45fa83a381440d9ca260~jQI7-hnsc0143101431eucas1p2t;
	Fri, 30 Oct 2026 08:14:19 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261030081418eusmtip2609af88f01ad0a91d0eabb01a9b136a8~jQI7PJIYA0992309923eusmtip2W;
	Fri, 30 Oct 2026 08:14:18 +0000 (GMT)
Message-ID: <7fa2730a-87e7-47f3-a053-a9fc43fca787@samsung.com>
Date: Fri, 30 Oct 2026 09:14:18 +0100
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
Subject: Re: [PATCH] swiotlb: fix out-of-bounds read in
 swiotlb_release_slots()
To: Michael Kelley <mhklinux@outlook.com>, Giorgi Kobakhia
	<gkobakhi@asu.edu>
Cc: "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Xiang Mei
	<xmei5@asu.edu>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <MN2PR02MB6863E09805FBA39C6779D209D46E2@MN2PR02MB6863.namprd02.prod.outlook.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261030081419eucas1p2b83bf1763b5f45fa83a381440d9ca260
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261029173949eucas1p125e51931c2e65b18cd68a6d46cc4cf29
X-EPHeader: CA
X-CMS-RootMailID: 20261029173949eucas1p125e51931c2e65b18cd68a6d46cc4cf29
References: <20261026032007.1957949-1-gkobakhi@asu.edu>
	<CGME20261029173949eucas1p125e51931c2e65b18cd68a6d46cc4cf29@eucas1p1.samsung.com>
	<MN2PR02MB6863E09805FBA39C6779D209D46E2@MN2PR02MB6863.namprd02.prod.outlook.com>

On 29.10.2026 18:39, Michael Kelley wrote:
> From: Giorgi Kobakhia <gkobakhi@asu.edu> Sent: Sunday, October 25, 2026 8:20 PM
>> When buffer is freed, swiotlb_release_slots() tries to merge it with the
>> following free space by reading the list value of the next slot.
>>
>>     if (index + nslots < ALIGN(index + 1, IO_TLB_SEGSIZE))
>>         count = mem->slots[index + nslots].list;
>>     else
>>         count = 0;
>>
>> If index is in the last segment of the pool and the pool size is not
>> multiple of IO_TLB_SEGSIZE, index + nslots becomes equal to mem->nslabs
>> leading to out of bound read.
>>
>>  BUG: KASAN: slab-out-of-bounds in swiotlb_release_slots
>>  Read of size 2
>>
>>  Call trace:
>>   swiotlb_release_slots (kernel/dma/swiotlb.c:1653)
>>   __swiotlb_tbl_unmap_single (kernel/dma/swiotlb.c:1734)
>>   dma_unmap_phys (./include/linux/swiotlb.h:262 kernel/dma/direct.h:102
>>                     kernel/dma/mapping.c:218)
>>   dma_unmap_page_attrs (kernel/dma/mapping.c:236)
>>
>> The commit 0b84e4f8b793 ("swiotlb: Add restricted DMA pool
>> initialization") makes it possible to initialize a pool with an
>> arbitrary size. Before it nslabs was multiple of IO_TLB_SEGSIZE and no
>> OOB occurred.
>>
>> Add overflow check.
> I can see that this is a legitimate problem. But I'm not sure this is the right
> solution.
>
> All other paths for creating a swiotlb pool ensure that nslabs is a multiple
> of IO_TLB_SEGSIZE. The better solution may be for rmem_swiotlb_device_init()
> to round-up nslabs to be a multiple of IO_TLB_SEGSIZE. My concern is
> that there may be other places in the swiotlb code where there is an
> implicit assumption that there are no partial segments at the end of
> a pool. It would take some effort for me to re-immerse myself in the
> swiotlb code to see if that's true, and I haven't done that. But my
> guess is that there's a good chance of such an assumption.
>
> What are the implications of potentially allocating slightly more memory
> for a restricted pool than is specified? It wouldn't be much additional
> memory since the segment size is 256 KiB.
Frankly speaking it would much easier to round the pool size down to match
the multiple of IO_TLB_SEGSIZE, waste some memory and issue a warning.
It is not that trivial to allocate "slightly more memory" if the size of
the restricted pool is statically specified in device tree.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

