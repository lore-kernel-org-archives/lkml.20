Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794005816;
	b=SrmvnsZhLNGSBxgM4T8dmv8Gi3UdnUbft8dJtqNwbERASCkGZ5SPBMQ0oNNSKZLGbDzM
	 WDlUwbt+w6TY6Dg3Pd/Zw8PE5roEHIKGfuGTRmdRliL6A+CXmbc52IZSAb0hy6P916oTm
	 e51RlNEkN2Wb4F/BwWBeF8OeypczpsP1JUKQYy8QLJqMKXw7HXdflvGTG/leP5URjqI6h
	 hFSwqPxdrHqD94hEOTu5qs2HTV8RM+PKmHUXgHGOyoB6ao23gRvpJtWm+6AE2ZuAKI+BJ
	 0SWpw1EzlXkczWHSCjigPleS3Gbx0sRgfWOr8/J6M3r2Va97fLfrCUUdFMxrvcKfnbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005816;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=sqRiL704sMluKdRvVQ4zewuJOHUjmkrlRuUBPJbDhvE=;
	b=DTxX9IKrbaZ1yN4VY7bLRGs0qPlQ0z+j9YsM63pqQRnHDTOrekywBeZEfTvWqC6pJv2L
	 fQbBoTi8sQB1XVZAYkNAPF350BMQtnkuBeaYp4RC7EzoYGB8asMwQxLHyONkorxpkZ2f0
	 ctTmlFHwTdu50lYn9lCu5L9hBpEuWxYzBHs/THC24cXdI+7NWJA+xO00QpHrcr/yS+CgH
	 WG3k3P2HpdhmE2bRdW12cnve7cUs3vMhpffVOALI8iaIvIAig1vvn3G+gs1vLQomT8nie
	 FNFVarppP/VeT3JYypscvdMOy9gU2Tr/X0z07TlN6lUzs03SwbgCGTZr1fQ32PVlb7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="j/fgjsYG";
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0F1606A337
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E0F1606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=j/fgjsYG
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106225652euoutp02f4b373080d8c45710577ee9a12de40b6~llsghmUMC0402204022euoutp02F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:56:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106225652euoutp02f4b373080d8c45710577ee9a12de40b6~llsghmUMC0402204022euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794005812;
	bh=sqRiL704sMluKdRvVQ4zewuJOHUjmkrlRuUBPJbDhvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j/fgjsYG25Dr8LLRjgDua2IIhxtYzvZkR0LFi+LTfCvj5vAmxos71iwGw0kfjGqyE
	 e8UVGKPVyvvN2U6FKuxh3oJVx3lYKgnRIYgI5iQIj35Mz2EwcE71zQdxTaonViWWaD
	 S4BJ11hM+nDIiGdDfmzKXMblqF6kURWqVRsYXjkk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106225651eucas1p2d038403b190875c1dd698da959eefbd3~llsfi4ujJ1972019720eucas1p21;
	Fri,  6 Nov 2026 22:56:51 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261106225651eusmtip2199876749caa2da8966a40ca82a8889d~llsezs8wl2228922289eusmtip2T;
	Fri,  6 Nov 2026 22:56:50 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
	Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
	<chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH/RFC 4/7] powerpc/mm: handle highmem pages in
 arch_dma_prep_coherent()
Date: Fri,  6 Nov 2026 23:56:24 +0100
Message-ID: <20261106225628.215319-5-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106225628.215319-1-m.szyprowski@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261106225651eucas1p2d038403b190875c1dd698da959eefbd3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106225651eucas1p2d038403b190875c1dd698da959eefbd3
X-EPHeader: CA
X-CMS-RootMailID: 20261106225651eucas1p2d038403b190875c1dd698da959eefbd3
References: <20261106225628.215319-1-m.szyprowski@samsung.com>
	<CGME20261106225651eucas1p2d038403b190875c1dd698da959eefbd3@eucas1p2.samsung.com>

arch_dma_prep_coherent() performs the cache maintenance on the address
returned by page_address(). On 32-bit powerpc with CONFIG_HIGHMEM that
is NULL for a highmem page which is not kmapped, so the flush would
operate on the wrong virtual range and leave the dirty lines of the
buffer in place.

The generic DMA code may pass highmem pages to this hook:
dma_direct_alloc() handles a highmem page returned by
dma_alloc_contiguous() by forcing the remap path, which calls
arch_dma_prep_coherent() on that page before creating the uncached
mapping. This cannot happen on powerpc today only because it does not
select HAVE_DMA_CONTIGUOUS, so dma-direct never gets a highmem page
there, but nothing in the hook's contract rules it out.

Use __dma_sync_page() with DMA_BIDIRECTIONAL, which the
arch_sync_dma_for_*() hooks already use and which kmaps highmem pages
one at a time. Without CONFIG_HIGHMEM it does the same
flush_dcache_range() on the linear mapping as before.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/powerpc/mm/dma-noncoherent.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoherent.c
index 30260b5d146d..e646256365d5 100644
--- a/arch/powerpc/mm/dma-noncoherent.c
+++ b/arch/powerpc/mm/dma-noncoherent.c
@@ -118,7 +118,5 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
-	unsigned long kaddr = (unsigned long)page_address(page);
-
-	flush_dcache_range(kaddr, kaddr + size);
+	__dma_sync_page(page_to_phys(page), size, DMA_BIDIRECTIONAL);
 }
-- 
2.43.0

