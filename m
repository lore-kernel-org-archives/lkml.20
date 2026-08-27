Received: from mta0.migadu.com (out-212.mta0.migadu.com [91.218.175.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF4F35B64C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823971; cv=none; b=ZwYxWP28/MuguBFiXri+eV3oOCd5hhxIc/kCJ6SNcQ7JJ+NegTSpMMAeUVOQDHkMhJGQe51J2l5zgJAA7S94Z7DpELHdz6xDuwe2DbcJzZsHFAnuhOD0EmBSIWFveCG+7+xXMzh2jvYy1ge6ww0NDxn6GQVdLcZvfmq79T/1P/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823971; c=relaxed/simple;
	bh=zdmdvT8IZGLUh2fy4Fbzd3FDyh0A/G9meMtVGVwBBvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-type; b=XoUVOcmsbe+jf56Lnwu8UHGk9WggS/oSJzE9J9rfy6YqHqv1yIvbnlLGCm/J9aYude7LmUjJ4MVqpSndEs3ovsvVh2iMoJZz3OwEkKKDxtteSf2v58PcFKhrn4MKKmauHxWzRVHdj08Ivkt7T1E8PtSuq7O0cuWnP1qtQscxOLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 24f83e8c77bff038;
	Thu, 27 Aug 2026 09:46:06 +0000
X-Mizu-Trace-ID: 24f83e8c77bff038
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH 09/16] mm, swap: free backing pages in xswap_unmap_clusters
Date: Thu, 27 Aug 2026 17:44:59 +0800
Message-ID: <20260827094509.1016740-10-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit

vm_area_unmap_pages() only clears PTEs and frees intermediate page
table pages - it does not free the backing physical pages allocated
by xswap_map_clusters().

Fix this by walking the page table with apply_to_existing_page_range()
before the unmap to collect all struct pages in the range. After
vunmap_range() clears the PTEs, free the collected pages via
__free_page().

Use a simple xswap_page_data collector callback: for each present PTE,
collect pte_page() into a dynamically allocated array. The array is
freed after the pages are released.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 41 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 6b18c1b21adc..0fe4834eadde 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3847,6 +3847,23 @@ static int xswap_map_clusters(struct swap_info_struct *si,
 	return -ENOMEM;
 }
 
+struct xswap_page_data {
+	struct page **pages;
+	int nr;
+	int max;
+};
+
+static int xswap_collect_page(pte_t *pte, unsigned long addr, void *data)
+{
+	struct xswap_page_data *xpd = data;
+
+	if (!pte_present(*pte))
+		return 0;
+	if (xpd->nr < xpd->max)
+		xpd->pages[xpd->nr++] = pte_page(*pte);
+	return 0;
+}
+
 static void xswap_unmap_clusters(struct swap_info_struct *si,
 				 unsigned long start_idx, unsigned long nr)
 {
@@ -3856,6 +3873,10 @@ static void xswap_unmap_clusters(struct swap_info_struct *si,
 	/* Round to page boundaries for vm_area_unmap_pages(). */
 	unsigned long vm_start = PAGE_ALIGN(start_addr);
 	unsigned long vm_end = PAGE_ALIGN(end_addr);
+	unsigned long size;
+	unsigned long npages;
+	struct xswap_page_data xpd;
+	int i;
 
 	mutex_lock(&si->xswap_lock);
 
@@ -3865,9 +3886,25 @@ static void xswap_unmap_clusters(struct swap_info_struct *si,
 		return;
 	}
 
+	size = vm_end - vm_start;
+	npages = size >> PAGE_SHIFT;
+
+	xpd.pages = kmalloc_array(npages, sizeof(*xpd.pages), GFP_KERNEL);
+	if (xpd.pages) {
+		xpd.nr = 0;
+		xpd.max = npages;
+		apply_to_existing_page_range(&init_mm, vm_start, size,
+					     xswap_collect_page, &xpd);
+	}
+
 	vm_area_unmap_pages(si->cluster_vm, vm_start, vm_end);
-	/* vm_area_unmap_pages() clears PTEs but does not free pages. */
-	/* TODO: free backing pages via page table walk or tracking bitmap */
+
+	/* Free the collected backing pages */
+	if (xpd.pages) {
+		for (i = 0; i < xpd.nr; i++)
+			__free_page(xpd.pages[i]);
+		kfree(xpd.pages);
+	}
 
 	/* Pairs with READ_ONCE() in shrink/grow paths. */
 	WRITE_ONCE(si->nr_clusters_mapped, start_idx);
-- 
2.54.0

