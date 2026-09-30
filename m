Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D93A4D956E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776693; cv=none; b=bKSPgLFoZr57Sh/XpcVaWrVnxM2rWuhIXOaCtfUVejIWWFizVx0GcrNN6DKxH/8OlkcOq06PZSu5ZEOCFHb+PCy8/gWnXpJlhVjZJHNoCU8x2HIhKsMuIMRo40SpNOmHFa9mgZFHWtfkWRgQIbJP/kMU/dYzQL+CaiFroXzm8Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776693; c=relaxed/simple;
	bh=ql6jljx7EIXvNLsO+PA8rs+SAQq6guMdJk7jjxYMXvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=QJJ73CI5yy5w1BI5fWxwUV9nSj2gl1hxqwyhtnaKh3qFDoRKEaShB3mQ9wzGuTBfBVWI5KjZbh7hcXur6BSv5Ke+8kIPLYp6SyO6Nq0rIkwJ/59y1f0K/G/qXDeV/L4PYSHVoz2zYe1a1m4FjvBMl932XszFtN/rqmqst4tkTJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RYn0wow4; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RYn0wow4"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260930135751euoutp0159ea2a2c60b83e4df32913ef8e6a006b~aHeUSwg9F2471724717euoutp01y
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:57:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260930135751euoutp0159ea2a2c60b83e4df32913ef8e6a006b~aHeUSwg9F2471724717euoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790776671;
	bh=d5uhQBfMA9Bzna2lrXnXP49LmGR65Hwnuf+fvI59R6I=;
	h=From:To:Cc:Subject:Date:References:From;
	b=RYn0wow4k+GSnYkmQCsYEXlyTUhg7UQOTv8JtUMd+qJifKSJ8G5Fs636vRmxanzgS
	 gql6GS829w9bQ1pnaZq1n+Vqz9GTqx9aw7PXynk7nAkbgtktq1lJOJWPAxNGazyIRH
	 a2NCFQiL69OheRnqS31kchts8KdsS6jWpJPhnkHQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260930135751eucas1p1c3b8b79ed87c3bf6f473d26e4663e7e4~aHeUAc8mI1283412834eucas1p1t;
	Wed, 30 Sep 2026 13:57:51 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260930135750eusmtip2515e5cd38c347fe5f4bced4f58a9f9df~aHeTk2AOZ0736807368eusmtip27;
	Wed, 30 Sep 2026 13:57:50 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, "Aneesh Kumar K . V"
	<aneesh.kumar@kernel.org>, Russell King <linux@armlinux.org.uk>, "Claude
 Opus 5 . 5" <noreply@anthropic.com>
Subject: [PATCH] dma-direct: Restore arch_dma_alloc() for the
 DMA_ATTR_NO_KERNEL_MAPPING case
Date: Wed, 30 Sep 2026 15:57:32 +0200
Message-ID: <20260930135734.1013905-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260930135751eucas1p1c3b8b79ed87c3bf6f473d26e4663e7e4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260930135751eucas1p1c3b8b79ed87c3bf6f473d26e4663e7e4
X-EPHeader: CA
X-CMS-RootMailID: 20260930135751eucas1p1c3b8b79ed87c3bf6f473d26e4663e7e4
References: <CGME20260930135751eucas1p1c3b8b79ed87c3bf6f473d26e4663e7e4@eucas1p1.samsung.com>

Commit 849facea92fa ("dma-direct: simplify the DMA_ATTR_NO_KERNEL_MAPPING
handling") moved the DMA_ATTR_NO_KERNEL_MAPPING shortcut in
dma_direct_alloc() in front of the arch_dma_alloc() call. Architectures
providing their own DMA coherent allocator (CONFIG_ARCH_HAS_DMA_ALLOC)
therefore no longer see such requests. ARM 32bit is one of such. Lack of
the call to arch_dma_alloc() results in the lack of proper cache
management on HighMem pages.

Take the dma-direct shortcut only for coherent devices or when the
architecture doesn't provide arch_dma_alloc(). While touching this,
move that check into separate function to avoid duplication in alloc
and free paths.

Fixes: 849facea92fa ("dma-direct: simplify the DMA_ATTR_NO_KERNEL_MAPPING handling")
Reported-by: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Closes: https://lore.kernel.org/all/yq5ams2akznl.fsf@kernel.org/
Assisted-by: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 kernel/dma/direct.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index da665ca22d5c..a31bd3129f3f 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -179,6 +179,22 @@ static struct page *dma_direct_alloc_from_pool(struct device *dev, size_t size,
 	return page;
 }
 
+/*
+ * Check if the allocation can skip the kernel mapping and return the page
+ * pointer as the cookie.
+ */
+static bool dma_direct_use_no_mapping(struct device *dev, unsigned long attrs)
+{
+	if ((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | __DMA_ATTR_ALLOC_CC_SHARED)) !=
+	    DMA_ATTR_NO_KERNEL_MAPPING)
+		return false;
+	if (is_swiotlb_for_alloc(dev))
+		return false;
+	if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_ALLOC) && !dev_is_dma_coherent(dev))
+		return false;
+	return true;
+}
+
 static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp)
 {
@@ -226,8 +242,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	if (attrs & DMA_ATTR_NO_WARN)
 		gfp |= __GFP_NOWARN;
 
-	if (((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | __DMA_ATTR_ALLOC_CC_SHARED)) ==
-	     DMA_ATTR_NO_KERNEL_MAPPING) && !is_swiotlb_for_alloc(dev))
+	if (dma_direct_use_no_mapping(dev, attrs))
 		return dma_direct_alloc_no_mapping(dev, size, dma_handle, gfp);
 
 	if (!dev_is_dma_coherent(dev)) {
@@ -374,8 +389,7 @@ void dma_direct_free(struct device *dev, size_t size,
 	if (attrs & __DMA_ATTR_ALLOC_CC_SHARED)
 		mark_mem_encrypted = true;
 
-	if (((attrs & (DMA_ATTR_NO_KERNEL_MAPPING | __DMA_ATTR_ALLOC_CC_SHARED)) ==
-	     DMA_ATTR_NO_KERNEL_MAPPING) && !is_swiotlb_for_alloc(dev)) {
+	if (dma_direct_use_no_mapping(dev, attrs)) {
 		/* cpu_addr is a struct page cookie, not a kernel address */
 		dma_free_contiguous(dev, cpu_addr, size);
 		return;
-- 
2.43.0

