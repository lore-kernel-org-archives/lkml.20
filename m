Received: from mta1.migadu.com (out-169.mta1.migadu.com [95.215.58.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3520D47126B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252852; cv=none; b=SAbdNR3R5VgqCGRHsreckMhEGHxwoT3Ti1a2UK0QrpbwOc+3wbi2AsPB247IMUcgveXP09jV7JgNKVcsIoAs1xSZcuivpdN4XL4ONqtRvqjkQsIe8kC/Lrqvx0sdR9VR9Db2NCsGqdsNRXZnQl1kr5JSeSduUItaDooHbRcYBfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252852; c=relaxed/simple;
	bh=g8f2dez90PDz4Ck0r4rT5yrBdapilOB4Xhu/hGJhOsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QBInN2tjxrL7+a9TpdTSS+9zBkaFSO/w6eGbRKtplb72Qjm/E9LudOJG722+Yqfhz5o8Eq3NxYBVS+F6h3bJiBvzQe/mBVc/LR7oYTxnXBL5ZNFp1fDB/AVhNKZ9Y/tef/zatzz8ULpiORbDELrR80wQzxCKqbQo6JFZppTgwkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dUxTrN4z; arc=none smtp.client-ip=95.215.58.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dUxTrN4z"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=g8f2dez90PDz4Ck0r4rT5yrBdapilOB4Xhu/hGJhOsQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788252848; v=1; x=1788857648;
 b=dUxTrN4zCb+9bk6Yhc8UuEprcwz2HQK5ufyJH5eoFx+vN/jLUbBmlNv1txZiyJQZ+Pclzfcn
 vZEADnf4Y260fnCoigtm96lrVTPrM3Jj3auLojk2PX107HkidFYz3DGHR/nR4w/LletfRREBgpr
 vnbo8ejy/XBdcr/HDOu7l+EQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 01307ef19bc2d902;
	Tue, 01 Sep 2026 08:53:58 +0000
X-Mizu-Trace-ID: 01307ef19bc2d902
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Qingfang Deng <qingfang.deng@linux.dev>
Subject: [PATCH] dma-mapping: use exact allocation for DMA pages
Date: Tue,  1 Sep 2026 16:53:47 +0800
Message-ID: <20260901085348.53140-1-qingfang.deng@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DMA page allocation fallbacks use alloc_pages_node() with get_order(size),
wasting the unused tail for non-power-of-two requests.

Use alloc_pages_exact_nid() and free_pages_exact() so that a buddy
fallback retains only requested pages.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 drivers/iommu/dma-iommu.c   | 10 ++++++----
 include/linux/dma-map-ops.h |  2 +-
 kernel/dma/contiguous.c     |  6 +++---
 kernel/dma/direct.c         |  8 +++++---
 kernel/dma/ops_helpers.c    | 11 +++++++----
 5 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 58c624513cd4..8f262c83802c 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1628,10 +1628,12 @@ static void *iommu_dma_alloc_pages(struct device *dev, size_t size,
 	void *cpu_addr;
 
 	page = dma_alloc_contiguous(dev, alloc_size, gfp);
-	if (!page)
-		page = alloc_pages_node(node, gfp, get_order(alloc_size));
-	if (!page)
-		return NULL;
+	if (!page) {
+		cpu_addr = alloc_pages_exact_nid(node, alloc_size, gfp);
+		if (!cpu_addr)
+			return NULL;
+		page = virt_to_page(cpu_addr);
+	}
 
 	if (!coherent || PageHighMem(page)) {
 		pgprot_t prot = dma_pgprot(dev, PAGE_KERNEL, attrs);
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 8fae2b7deb20..3ef3003713a6 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -143,7 +143,7 @@ static inline struct page *dma_alloc_contiguous(struct device *dev, size_t size,
 static inline void dma_free_contiguous(struct device *dev, struct page *page,
 		size_t size)
 {
-	__free_pages(page, get_order(size));
+	free_pages_exact(page_address(page), size);
 }
 #endif /* CONFIG_DMA_CMA*/
 
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 66093460584e..90937dc7c627 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -451,8 +451,8 @@ struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp)
  *
  * This function releases memory allocated by dma_alloc_contiguous(). As the
  * cma_release returns false when provided pages do not belong to contiguous
- * area and true otherwise, this function then does a fallback __free_pages()
- * upon a false-return.
+ * area and true otherwise, this function then does a fallback
+ * free_pages_exact() upon a false-return.
  */
 void dma_free_contiguous(struct device *dev, struct page *page, size_t size)
 {
@@ -476,7 +476,7 @@ void dma_free_contiguous(struct device *dev, struct page *page, size_t size)
 	}
 
 	/* not in any cma, free from buddy */
-	__free_pages(page, get_order(size));
+	free_pages_exact(page_address(page), size);
 }
 
 /*
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index da665ca22d5c..ea64453d7370 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -120,6 +120,7 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 	int node = dev_to_node(dev);
 	struct page *page;
 	u64 phys_limit;
+	void *va;
 
 	WARN_ON_ONCE(!PAGE_ALIGNED(size));
 
@@ -133,9 +134,9 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 		dma_free_contiguous(dev, page, size);
 	}
 
-	while ((page = alloc_pages_node(node, gfp, get_order(size)))
-	       && !dma_coherent_ok(dev, page_to_phys(page), size)) {
-		__free_pages(page, get_order(size));
+	while ((va = alloc_pages_exact_nid(node, size, gfp)) &&
+	       !dma_coherent_ok(dev, virt_to_phys(va), size)) {
+		free_pages_exact(va, size);
 
 		if (IS_ENABLED(CONFIG_ZONE_DMA32) &&
 		    phys_limit < DMA_BIT_MASK(64) &&
@@ -146,6 +147,7 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 		else
 			return NULL;
 	}
+	page = va ? virt_to_page(va) : NULL;
 
 	return page;
 }
diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
index 6b5f9208d31c..5cdf3f60cf47 100644
--- a/kernel/dma/ops_helpers.c
+++ b/kernel/dma/ops_helpers.c
@@ -67,10 +67,13 @@ struct page *dma_common_alloc_pages(struct device *dev, size_t size,
 	phys_addr_t phys;
 
 	page = dma_alloc_contiguous(dev, size, gfp);
-	if (!page)
-		page = alloc_pages_node(dev_to_node(dev), gfp, get_order(size));
-	if (!page)
-		return NULL;
+	if (!page) {
+		void *va = alloc_pages_exact_nid(dev_to_node(dev), size, gfp);
+
+		if (!va)
+			return NULL;
+		page = virt_to_page(va);
+	}
 
 	phys = page_to_phys(page);
 	if (use_dma_iommu(dev))
-- 
2.43.0

