Received: from mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3CA2857CC
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987559; cv=none; b=AJmcFUvcyvgPjrrrf7J6Pjs1nZa5cK1U2PFNARqf0rOGYZQqWNCEeal0U6mfnkcky2QJcFUUlXm/OR4ovP+h1bk+gvEQ8jn+ICgkwzehAs2ZWe0b2Wsaqan8jhOamw+clKLQCspJTBdz4mTwOOYZoE2JKQubPEJDP2gLRduh/s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987559; c=relaxed/simple;
	bh=HHtyEKNd6nuteyUJZTgWqovxilT7JFXpVs0Oqg6iYYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=M8CmJuBb43ck6YcYTkvt/hoVKJumws2A1aKt+S+7Zo0UYGuZmvxA4ZqtS8IH0GA3rBqiHsA1mxs6RjzV5aHErBbhAShMMeWDXA0KAW6NCDDfI81dyE8N2R/PDQoAXQdlMNre+PLQqh6j5himvLHcfoTAWS3J5M7voY31amATDWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 5c89744b9029ea2d;
	Sat, 03 Oct 2026 00:32:35 +0000
X-Mizu-Trace-ID: 5c89744b9029ea2d
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v4 07/14] mm, swap: free backing pages in xswap_unmap_clusters
Date: Sat,  3 Oct 2026 08:31:29 +0800
Message-ID: <20261003003136.750633-8-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261003003136.750633-1-hebaoquan@kylinos.cn>
References: <20261003003136.750633-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

vm_area_unmap_pages() does not free the backing pages that
xswap_map_clusters() allocated, so they leaked on every unmap.

Collect the backing pages from the PTEs before unmapping and free them
after the PTEs are cleared.  The collection array is allocated with
kvmalloc_array(GFP_KERNEL), which falls back to vmalloc() and may
reclaim; if it still fails, unmap in bounded batches with a stack array
instead.  The unmap therefore cannot fail and the callers do not need a
retry loop.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 95 ++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 86 insertions(+), 9 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index b8572f301d31..7c062e772f5b 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -84,6 +84,14 @@
 
 static bool xswap_should_grow(struct swap_info_struct *si);
 static unsigned long xswap_grow(struct swap_info_struct *si);
+
+/* Batch size for the fallback unmap; keeps the stack array small. */
+#define XSWAP_UNMAP_BATCH_PAGES		16
+#define XSWAP_UNMAP_BATCH_CLUSTERS					\
+	max_t(unsigned long,						\
+	      ((XSWAP_UNMAP_BATCH_PAGES * PAGE_SIZE) /		\
+	       sizeof(struct swap_cluster_info)), 16)
+
 static int xswap_map_clusters(struct swap_info_struct *si,
 			      unsigned long start_idx, unsigned long nr);
 static void xswap_unmap_clusters(struct swap_info_struct *si,
@@ -3341,9 +3349,8 @@ static void free_swap_cluster_info(struct swap_info_struct *si)
 			}
 			spin_unlock(&ci->lock);
 		}
-		/* Unmap all mapped clusters and free the VM_SPARSE area */
-		if (si->nr_clusters_mapped > 0)
-			xswap_unmap_clusters(si, 0, si->nr_clusters_mapped);
+		/* free_vm_area() drops the mapping without freeing the pages. */
+		xswap_unmap_clusters(si, 0, si->nr_clusters_mapped);
 		free_vm_area(si->cluster_vm);
 		si->cluster_vm = NULL;
 		si->cluster_info = NULL;
@@ -4026,21 +4033,65 @@ static unsigned long xswap_grow(struct swap_info_struct *si)
 	return nr_new;
 }
 
+struct xswap_page_data {
+	struct page **pages;
+	unsigned long nr;
+	unsigned long max;
+};
+
+static int xswap_collect_page(pte_t *pte, unsigned long addr, void *data)
+{
+	struct xswap_page_data *xpd = data;
+	pte_t pteval = ptep_get(pte);
+
+	if (!pte_present(pteval))
+		return 0;
+	if (WARN_ON_ONCE(xpd->nr >= xpd->max))
+		return 0;
+	xpd->pages[xpd->nr++] = pte_page(pteval);
+	return 0;
+}
+
+/*
+ * Free the backing pages mapped in [vm_start, vm_end) and clear the PTEs.
+ * @pages must have room for @max pointers.
+ */
+static void xswap_unmap_range(struct swap_info_struct *si,
+			      unsigned long vm_start, unsigned long vm_end,
+			      struct page **pages, unsigned long max)
+{
+	struct xswap_page_data xpd = {
+		.pages	= pages,
+		.max	= max,
+	};
+	unsigned long i;
+
+	apply_to_existing_page_range(&init_mm, vm_start, vm_end - vm_start,
+				     xswap_collect_page, &xpd);
+	vm_area_unmap_pages(si->cluster_vm, vm_start, vm_end);
+
+	for (i = 0; i < xpd.nr; i++)
+		__free_page(pages[i]);
+}
+
 static void xswap_unmap_clusters(struct swap_info_struct *si,
 				 unsigned long start_idx, unsigned long nr)
 {
 	unsigned long start_addr = (unsigned long)si->cluster_info +
 				   (size_t)start_idx * sizeof(struct swap_cluster_info);
-	unsigned long end_addr = start_addr + (size_t)nr * sizeof(struct swap_cluster_info);
+	unsigned long end_addr = start_addr +
+				 (size_t)nr * sizeof(struct swap_cluster_info);
 	unsigned long vm_start = PAGE_ALIGN(start_addr);
 	unsigned long vm_end = PAGE_ALIGN(end_addr);
+	struct page **pages;
+	unsigned int noreclaim_flags;
+	unsigned long npages, idx;
 
 	mutex_lock(&si->xswap_lock);
 
 	if (vm_start >= vm_end) {
 		WRITE_ONCE(si->nr_clusters_mapped, start_idx);
-		mutex_unlock(&si->xswap_lock);
-		return;
+		goto out_unlock;
 	}
 
 	/*
@@ -4052,11 +4103,37 @@ static void xswap_unmap_clusters(struct swap_info_struct *si,
 	flush_percpu_swap_cluster(si);
 	synchronize_rcu();
 
-	vm_area_unmap_pages(si->cluster_vm, vm_start, vm_end);
-	/* vm_area_unmap_pages() clears PTEs but does not free pages. */
-	/* TODO: free backing pages via page table walk or tracking bitmap */
+	npages = (vm_end - vm_start) >> PAGE_SHIFT;
+
+	/* Reclaim here would re-enter xswap_map_clusters() and its lock. */
+	noreclaim_flags = memalloc_noreclaim_save();
+	pages = kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
+	memalloc_noreclaim_restore(noreclaim_flags);
+	if (pages) {
+		xswap_unmap_range(si, vm_start, vm_end, pages, npages);
+		kvfree(pages);
+		WRITE_ONCE(si->nr_clusters_mapped, start_idx);
+		goto out_unlock;
+	}
+
+	/* No memory for the array: unmap in bounded batches instead. */
+	for (idx = start_idx; idx < start_idx + nr; idx += XSWAP_UNMAP_BATCH_CLUSTERS) {
+		unsigned long batch = min(start_idx + nr - idx,
+					  XSWAP_UNMAP_BATCH_CLUSTERS);
+		unsigned long addr = (unsigned long)si->cluster_info +
+				     (size_t)idx * sizeof(struct swap_cluster_info);
+		unsigned long bstart = PAGE_ALIGN(addr);
+		unsigned long bend = PAGE_ALIGN(addr + (size_t)batch *
+					       sizeof(struct swap_cluster_info));
+		struct page *batch_pages[XSWAP_UNMAP_BATCH_PAGES + 1];
+
+		if (bstart < bend)
+			xswap_unmap_range(si, bstart, bend, batch_pages,
+					  ARRAY_SIZE(batch_pages));
+	}
 
 	WRITE_ONCE(si->nr_clusters_mapped, start_idx);
+out_unlock:
 	mutex_unlock(&si->xswap_lock);
 }
 
-- 
2.54.0

