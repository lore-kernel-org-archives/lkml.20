Received: from mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD0843C047
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823946; cv=none; b=BCRqG+6MY+BT1ckZY4g/NO1HGkFPbIga2vpJncIr/QqHwjM0q66v4N6OK008bRr4dnYiklEDkO+LTKcx+CRb/gRO8OOkydw8MogxKq8TsJRvKnhaV8iMnyhi4JD+DrMmQ8wdfov0nVlO0BPY46UDLYo2Ndwwr8lnr4W56XP/m4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823946; c=relaxed/simple;
	bh=ey5U/PuPZPdotpA02SEuRSTEvmhhBXPcArcddp0S1lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=hJtGA6ld3G+wwc6J48NTvk/pmvSNyPWOhtgjAxRtfBaO+EIrg5oAtNdmohddZ8wEUek+OfvPlpRn7rDPkcKBSLAC5JCRnwSTRNriPTRZ5NMH77c7IO9isOSMycEr24knd4kVBjjuRBhfNF1ae7apzgHH78ufaIacmg0yO5px6CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 2a4b554164bb7d6c;
	Thu, 27 Aug 2026 09:45:40 +0000
X-Mizu-Trace-ID: 2a4b554164bb7d6c
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
Subject: [PATCH 05/16] mm, swap: add xswap cluster grow via VM_SPARSE vmalloc
Date: Thu, 27 Aug 2026 17:44:55 +0800
Message-ID: <20260827094509.1016740-6-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Implement dynamic cluster_info array growth for xswap devices using a
VM_SPARSE vmalloc area:

1. xswap_map_clusters(): Allocate physical pages and map them into
   the pre-reserved VM_SPARSE KVA region via vm_area_map_pages().

2. xswap_unmap_clusters(): Unmap pages from the VM_SPARSE area via
   vm_area_unmap_pages() (used by the error/teardown paths, shrink
   comes later).

3. setup_swap_clusters_info() xswap path: Use get_vm_area(VM_SPARSE)
   for the cluster_info array, lazily mapping only the initial chunk.

4. free_swap_cluster_info() xswap path: Unmap all clusters and
   free_vm_area().  Built on the refactoring in the previous patch.

5. wait_for_allocation() xswap guard: Skip shrinker-unmapped clusters
   beyond nr_clusters_mapped.

The grow path avoids emergency reserves via __GFP_HIGH|__GFP_NOMEMALLOC
and wraps allocations with memalloc_noreclaim_save().  A per-device
mutex (xswap_lock) serializes concurrent map/unmap page table
modifications.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |   1 +
 mm/swapfile.c        | 259 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 258 insertions(+), 2 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 35d357a393c6..c2744fa8a009 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -252,6 +252,7 @@ struct swap_info_struct {
 	struct vm_struct	*cluster_vm;	/* VM_SPARSE area for xswap dynamic cluster_info */
 	unsigned long		nr_clusters;	/* total cluster count for xswap */
 	unsigned long		nr_clusters_mapped; /* currently mapped cluster count */
+	struct mutex		xswap_lock;	/* serialize map/unmap operations */
 #endif
 	struct list_head free_clusters; /* free clusters list */
 	struct list_head full_clusters; /* full clusters list */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index cd7e889f073d..06f73c0a504a 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -49,6 +49,25 @@
 #include "internal.h"
 #include "swap.h"
 
+#ifdef CONFIG_XSWAP
+/*
+ * xswap: dynamically grow the cluster_info array via a VM_SPARSE area.
+ *
+ * XSWAP_GROW_CLUSTERS is the number of clusters to map in one grow
+ * operation.  It is set to the number of cluster_info structs that
+ * fit in a single page (at least 16), so that the vmalloc page table
+ * overhead is proportional to the number of clusters mapped.
+ */
+#define XSWAP_GROW_CLUSTERS \
+	max_t(unsigned long, PAGE_SIZE / sizeof(struct swap_cluster_info), 16)
+
+static int xswap_map_clusters(struct swap_info_struct *si,
+			      unsigned long start_idx, unsigned long nr);
+static void xswap_unmap_clusters(struct swap_info_struct *si,
+				 unsigned long start_idx, unsigned long nr);
+static int xswap_check_mapped(pte_t *pte, unsigned long addr, void *data);
+#endif
+
 static void swap_range_alloc(struct swap_info_struct *si,
 			     unsigned int nr_entries);
 static bool folio_swapcache_freeable(struct folio *folio);
@@ -2715,15 +2734,27 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 					unsigned int prev)
 {
 	unsigned int i;
+	unsigned int end = si->max;
 	unsigned long swp_tb;
 
+#ifdef CONFIG_XSWAP
+	/* xswap may have shrunk and unmapped the cluster_info tail. */
+	if (si->flags & SWP_XSWAP) {
+		unsigned long mapped_end;
+
+		mapped_end = READ_ONCE(si->nr_clusters_mapped) * SWAPFILE_CLUSTER;
+		if (mapped_end < end)
+			end = mapped_end;
+	}
+#endif
+
 	/*
 	 * No need for swap_lock here: we're just looking
 	 * for whether an entry is in use, not modifying it; false
 	 * hits are okay, and sys_swapoff() has already prevented new
 	 * allocations from this area (while holding swap_lock).
 	 */
-	for (i = prev + 1; i < si->max; i++) {
+	for (i = prev + 1; i < end; i++) {
 		swp_tb = swap_table_get(__swap_offset_to_cluster(si, i),
 					i % SWAPFILE_CLUSTER);
 		if (!swp_tb_is_null(swp_tb) && !swp_tb_is_bad(swp_tb))
@@ -2732,7 +2763,7 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 			cond_resched();
 	}
 
-	if (i == si->max)
+	if (i == end)
 		i = 0;
 
 	return i;
@@ -3048,6 +3079,13 @@ static void wait_for_allocation(struct swap_info_struct *si)
 
 	BUG_ON(si->flags & SWP_WRITEOK);
 
+#ifdef CONFIG_XSWAP
+	/* Skip shrinker-unmapped cluster tail. */
+	if (si->flags & SWP_XSWAP)
+		end = min(end, READ_ONCE(si->nr_clusters_mapped) *
+			  SWAPFILE_CLUSTER);
+#endif
+
 	for (offset = 0; offset < end; offset += SWAPFILE_CLUSTER) {
 		ci = swap_cluster_lock(si, offset);
 		swap_cluster_unlock(ci);
@@ -3064,6 +3102,19 @@ static void free_swap_cluster_info(struct swap_info_struct *si)
 	if (!cluster_info)
 		return;
 
+#ifdef CONFIG_XSWAP
+	if (si->flags & SWP_XSWAP) {
+		/* Unmap all mapped clusters and free the VM_SPARSE area */
+		if (si->nr_clusters_mapped > 0)
+			xswap_unmap_clusters(si, 0, si->nr_clusters_mapped);
+		free_vm_area(si->cluster_vm);
+		si->cluster_vm = NULL;
+		si->nr_clusters = 0;
+		si->nr_clusters_mapped = 0;
+		return;
+	}
+#endif
+
 	nr_clusters = DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
 	for (i = 0; i < nr_clusters; i++) {
 		ci = cluster_info + i;
@@ -3560,6 +3611,150 @@ static unsigned long read_swap_header(struct swap_info_struct *si,
 	return maxpages;
 }
 
+#ifdef CONFIG_XSWAP
+static int xswap_map_clusters(struct swap_info_struct *si,
+			      unsigned long start_idx, unsigned long nr)
+{
+	unsigned long start_addr = (unsigned long)si->cluster_info +
+				   (size_t)start_idx * sizeof(struct swap_cluster_info);
+	unsigned long end_addr = start_addr + (size_t)nr * sizeof(struct swap_cluster_info);
+	/* Round to page boundaries for vm_area_map_pages(). */
+	unsigned long vm_start = PAGE_ALIGN(start_addr);
+	unsigned long vm_end = PAGE_ALIGN(end_addr);
+	unsigned int noreclaim_flags;
+	unsigned long npages;
+	struct page **pages;
+	unsigned long i;
+	int err;
+
+	mutex_lock(&si->xswap_lock);
+
+	if (vm_start >= vm_end) {
+		/* All requested clusters fall within already-mapped pages. */
+		for (i = start_idx; i < start_idx + nr; i++)
+			spin_lock_init(&si->cluster_info[i].lock);
+		WRITE_ONCE(si->nr_clusters_mapped, start_idx + nr);
+		mutex_unlock(&si->xswap_lock);
+		return 0;
+	}
+
+	npages = (vm_end - vm_start) >> PAGE_SHIFT;
+
+	/* Prevent recursive reclaim during vmap page table allocation. */
+	noreclaim_flags = memalloc_noreclaim_save();
+
+	pages = kmalloc_array(npages, sizeof(*pages),
+			      __GFP_HIGH | __GFP_NOMEMALLOC | GFP_KERNEL);
+	if (!pages) {
+		memalloc_noreclaim_restore(noreclaim_flags);
+		mutex_unlock(&si->xswap_lock);
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < npages; i++) {
+		/* __GFP_ZERO: cluster_info pointer fields must start NULL. */
+		pages[i] = alloc_page(__GFP_HIGH | __GFP_NOMEMALLOC |
+				      GFP_KERNEL | __GFP_ZERO);
+		if (!pages[i])
+			goto fail;
+	}
+
+	/* Detect racing grower that already mapped these pages. */
+	if (apply_to_existing_page_range(&init_mm, vm_start,
+					 vm_end - vm_start,
+					 xswap_check_mapped, NULL)) {
+		i = npages;
+		goto fail_nounmap;
+	}
+
+	err = vm_area_map_pages(si->cluster_vm, vm_start, vm_end, pages);
+	if (err) {
+		/* -EBUSY: defensive, the page was already mapped. */
+		if (err == -EBUSY) {
+			i = npages;
+			goto fail_nounmap;
+		}
+		i = npages;
+		goto fail;
+	}
+
+	kfree(pages);
+	memalloc_noreclaim_restore(noreclaim_flags);
+
+	/* Initialize spinlocks for newly mapped clusters */
+	for (i = start_idx; i < start_idx + nr; i++)
+		spin_lock_init(&si->cluster_info[i].lock);
+
+	/*
+	 * Pairs with READ_ONCE() in shrink/grow paths.
+	 */
+	WRITE_ONCE(si->nr_clusters_mapped, start_idx + nr);
+	mutex_unlock(&si->xswap_lock);
+	return 0;
+
+fail_nounmap:
+	/*
+	 * The concurrent grower already mapped the range, initialized the
+	 * cluster spinlocks and advanced nr_clusters_mapped.  It may still
+	 * be holding those locks while adding clusters to the free list, so
+	 * do not touch them here; just free our unused pages.
+	 */
+	while (i > 0) {
+		i--;
+		if (pages[i])
+			__free_page(pages[i]);
+	}
+	kfree(pages);
+	memalloc_noreclaim_restore(noreclaim_flags);
+	mutex_unlock(&si->xswap_lock);
+	return 0;
+
+fail:
+	while (i > 0) {
+		i--;
+		if (pages[i])
+			__free_page(pages[i]);
+	}
+	memalloc_noreclaim_restore(noreclaim_flags);
+	kfree(pages);
+	mutex_unlock(&si->xswap_lock);
+	return -ENOMEM;
+}
+
+static void xswap_unmap_clusters(struct swap_info_struct *si,
+				 unsigned long start_idx, unsigned long nr)
+{
+	unsigned long start_addr = (unsigned long)si->cluster_info +
+				   (size_t)start_idx * sizeof(struct swap_cluster_info);
+	unsigned long end_addr = start_addr + (size_t)nr * sizeof(struct swap_cluster_info);
+	/* Round to page boundaries for vm_area_unmap_pages(). */
+	unsigned long vm_start = PAGE_ALIGN(start_addr);
+	unsigned long vm_end = PAGE_ALIGN(end_addr);
+
+	mutex_lock(&si->xswap_lock);
+
+	if (vm_start >= vm_end) {
+		WRITE_ONCE(si->nr_clusters_mapped, start_idx);
+		mutex_unlock(&si->xswap_lock);
+		return;
+	}
+
+	vm_area_unmap_pages(si->cluster_vm, vm_start, vm_end);
+	/* vm_area_unmap_pages() clears PTEs but does not free pages. */
+	/* TODO: free backing pages via page table walk or tracking bitmap */
+
+	/* Pairs with READ_ONCE() in shrink/grow paths. */
+	WRITE_ONCE(si->nr_clusters_mapped, start_idx);
+	mutex_unlock(&si->xswap_lock);
+}
+
+/* Return 1 at first present PTE to signal range is already mapped. */
+static int xswap_check_mapped(pte_t *pte, unsigned long addr, void *data)
+{
+	return 1;
+}
+#endif /* CONFIG_XSWAP */
+
 static int setup_swap_clusters_info(struct swap_info_struct *si,
 				    union swap_header *swap_header,
 				    unsigned long maxpages)
@@ -3569,6 +3764,66 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 	int err = -ENOMEM;
 	unsigned long i;
 
+#ifdef CONFIG_XSWAP
+	if (si->flags & SWP_XSWAP) {
+		unsigned long size = PAGE_ALIGN(nr_clusters * sizeof(*cluster_info));
+		struct vm_struct *vm;
+
+		vm = get_vm_area(size, VM_SPARSE);
+		if (!vm)
+			goto err;
+
+		cluster_info = vm->addr;
+		si->cluster_vm = vm;
+		si->nr_clusters = nr_clusters;
+		si->cluster_info = cluster_info;
+
+		/* Must be initialized before xswap_map_clusters() locks it. */
+		mutex_init(&si->xswap_lock);
+
+		/* Map the initial chunk (at least cluster 0) */
+		if (xswap_map_clusters(si, 0, min_t(unsigned long,
+					XSWAP_GROW_CLUSTERS, nr_clusters)))
+			goto err_free_vm;
+
+		/* xswap: only cluster 0 slot 0 is bad */
+		err = swap_cluster_setup_bad_slot(si, cluster_info, 0, false);
+		if (err)
+			goto err_unmap;
+
+		INIT_LIST_HEAD(&si->free_clusters);
+		INIT_LIST_HEAD(&si->full_clusters);
+		INIT_LIST_HEAD(&si->discard_clusters);
+		for (i = 0; i < SWAP_NR_ORDERS; i++) {
+			INIT_LIST_HEAD(&si->nonfull_clusters[i]);
+			INIT_LIST_HEAD(&si->frag_clusters[i]);
+		}
+
+		/* Mark mapped clusters: cluster 0 has 1 bad slot, rest free */
+		for (i = 0; i < si->nr_clusters_mapped; i++) {
+			struct swap_cluster_info *ci = &cluster_info[i];
+
+			if (i == 0) {
+				ci->flags = CLUSTER_FLAG_NONFULL;
+				list_add_tail(&ci->list, &si->nonfull_clusters[0]);
+			} else {
+				ci->flags = CLUSTER_FLAG_FREE;
+				list_add_tail(&ci->list, &si->free_clusters);
+			}
+		}
+
+		return 0;
+
+err_unmap:
+		xswap_unmap_clusters(si, 0, si->nr_clusters_mapped);
+err_free_vm:
+		free_vm_area(si->cluster_vm);
+		si->cluster_vm = NULL;
+		si->cluster_info = NULL;
+		return err;
+	}
+#endif /* CONFIG_XSWAP */
+
 	cluster_info = kvzalloc_objs(*cluster_info, nr_clusters);
 	if (!cluster_info)
 		goto err;
-- 
2.54.0

