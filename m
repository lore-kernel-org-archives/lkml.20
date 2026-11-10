Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304135;
	b=XCSmsqJbNndvtA99ONa/QPDTOIYxrM98SjKTMuz8d6IU2He9lPExhiFKzDj+ePoybofU
	 NTN65Cftfc5uoErO0uBwjVdzuocuC71npEdV7Ny3LirboYA7xT/iAV2pRv4oUpJENq8z0
	 FQv7aqOTM6tDiqNOQOONRMVB6pNU9PEDTde6nG40Vb0acmiplp3ox5lZFgx1HQqPlILKE
	 7sfhYln3jL4UoXME5TARjXMLT8O2KbxQymXXywt7KrXrd1eGA7bQFIQaPrde5bhKJaz8b
	 1xPqW32O+47JGWzgZ0PIczpX8k4t9K5n1neqnZuFAYCQ+Ae3U2qw/EaJXzABrUdCKoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304135;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=a7hoW57Gyr9CSOcHzQjMhTzQYXncvMF6awqNiCCmApc=;
	b=p1M6Xbjla9wPDhAWa1+w5fg1l5kHgZtKJMHp6oJvSOCOHOQi19li7waz8Pnom68c6Ukf
	 Oz7qjcrm8XE8I1qOZWAjMt9k3LNjVUqjXNDvxsY4bQFJu2ZErXuhTV+Rb3Pme78rWcGG4
	 tuBFZQ1IvIxSI7QJzpyaVpTUjtTdiZpeIwS0GAdOm3EfF87CsM8OyU458Lkgrl19Bva5K
	 FxivYsabMPnNyhJz+Pp0YzwO7uTocX+e0pmcz3/IpUybYrsJ5qTOivYT/Zv6g1lhwAIxb
	 hrJev8FSUqzeuNAeF6wXjCokQbJPOxwcMeDI3N0zneeppjz6Uy3DtQM9iu6/TZy87PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cpkZnkyE;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06EB606F947
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C06EB606F947
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cpkZnkyE
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261110094853euoutp01695c96a0e4020e94a7e5f1e7fff1b5fa~mphpKEhdG1103211032euoutp01W
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:48:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261110094853euoutp01695c96a0e4020e94a7e5f1e7fff1b5fa~mphpKEhdG1103211032euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794304133;
	bh=a7hoW57Gyr9CSOcHzQjMhTzQYXncvMF6awqNiCCmApc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cpkZnkyEWq5tdZW2OxbmfzZyYDTSuq3K7U1VMizmvqXfKWwkhDxO4f7UBfDl/pz7p
	 uG6pMU9Nk87oPDddjEsUSibu03z2zIjEylR05Rz++YA79+gFqhdlafcJ/wjRz/bqPG
	 jAu1NgOBhP+cpO881H+N2D07bCk8DKOofbbQVS9U=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261110094853eucas1p2c89af10eb0d4611c4fc080d559696015~mpho1llTk2792527925eucas1p2d;
	Tue, 10 Nov 2026 09:48:53 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261110094852eusmtip11f47aa0f918b8bd66c28bd3240ed212c~mphoG_q5g3192331923eusmtip1X;
	Tue, 10 Nov 2026 09:48:52 +0000 (GMT)
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
Subject: [PATCH v2 7/7] dma-direct: zero memory allocated with
 DMA_ATTR_NO_KERNEL_MAPPING
Date: Tue, 10 Nov 2026 10:48:27 +0100
Message-ID: <20261110094830.2081847-8-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110094830.2081847-1-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261110094853eucas1p2c89af10eb0d4611c4fc080d559696015
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261110094853eucas1p2c89af10eb0d4611c4fc080d559696015
X-EPHeader: CA
X-CMS-RootMailID: 20261110094853eucas1p2c89af10eb0d4611c4fc080d559696015
References: <20261110094830.2081847-1-m.szyprowski@samsung.com>
	<CGME20261110094853eucas1p2c89af10eb0d4611c4fc080d559696015@eucas1p2.samsung.com>

dma_direct_alloc_no_mapping() explicitly clears __GFP_ZERO before
allocating the pages, so buffers allocated with
DMA_ATTR_NO_KERNEL_MAPPING are handed out with stale contents of the
previously freed pages. Such buffers are typically passed to devices or
mapped to userspace, which may expose old kernel data.

The mask comes from the regular allocation path, which always zeroes the
buffer manually through its kernel mapping once it is set up. The
DMA_ATTR_NO_KERNEL_MAPPING path returns early with only a page cookie,
so it never reaches that memset(). This has been the case since the
attribute was first supported in the generic remap code in commit
e440e26a0251 ("dma-remap: support DMA_ATTR_NO_KERNEL_MAPPING") and was
carried over when that handling was lifted into dma-direct.

All other dma_alloc_* paths always return zeroed memory, so do the same
here. Passing __GFP_ZERO to the page allocator is not sufficient, as
__dma_direct_alloc_pages() first tries dma_alloc_contiguous(), and CMA
ignores __GFP_ZERO.

Closes: https://sashiko.dev/#/bug/linux-c4421083-e44e-4373-a2c2-45649ea49c0b
Fixes: d98849aff879 ("dma-direct: handle DMA_ATTR_NO_KERNEL_MAPPING in common code")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 kernel/dma/direct.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index fea0dd36dd25..4bfb3e76cd76 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -6,6 +6,7 @@
  */
 #include <linux/memblock.h> /* for max_pfn */
 #include <linux/export.h>
+#include <linux/highmem.h>
 #include <linux/mm.h>
 #include <linux/dma-map-ops.h>
 #include <linux/scatterlist.h>
@@ -201,11 +202,16 @@ static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp)
 {
 	struct page *page;
+	unsigned long i;
 
 	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO, true);
 	if (!page)
 		return NULL;
 
+	/* we always manually zero the allocated memory */
+	for (i = 0; i < size >> PAGE_SHIFT; i++)
+		clear_highpage(page + i);
+
 	/* remove any dirty cache lines on the kernel alias */
 	arch_dma_prep_coherent(page, size);
 	/*
-- 
2.43.0

