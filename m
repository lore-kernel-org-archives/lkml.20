Received: from mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E1E18C02E
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987554; cv=none; b=jY83hrfBJcbqR/yebba4y7KG+BwjUSXza0Uj4Gwxhazt0xZwwFjuwWCOR8+q19gPUxbfBEQg+ZHYHbaOgHgTdadMfW18EzlTA3RuHcuiYCA3BNKJFXnIF4QX/afthT9we/yNnz4Hr8xQygQU9Cy58JlmvRLCENk+1NZT26655P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987554; c=relaxed/simple;
	bh=2bA0KTdWBuRBgVXx8lBIitC7axxbrvnMmLHrLiZ8G4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=J+Qej0OKjzRCZki6wEgw8CiKKicxdIF30me3RuTbMwHLuTKeazcA/Ko7rkCyABau3DHRmGUtUFdp9CnaOS89wis3GkvQOsVW0hQG0zC4qoJBseJOLeECaB51o/p3DUDhAFD/yvZ35qg7ruuiHJ0NNQKliVCFstb4yIr1pbNIr8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id ccd8864debaf321a;
	Sat, 03 Oct 2026 00:32:29 +0000
X-Mizu-Trace-ID: ccd8864debaf321a
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
Subject: [PATCH v4 06/14] mm, swap: add xswap_try_shrink and shrink trigger on cluster free
Date: Sat,  3 Oct 2026 08:31:28 +0800
Message-ID: <20261003003136.750633-7-hebaoquan@kylinos.cn>
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

When a cluster becomes entirely free, the mapped range may now have a
free tail that nothing is using. Reclaim it: unmap the tail clusters
from the cluster_info VM_SPARSE area.

Only reclaim once the mapped range is at most 50% in use. Growth is
demand driven, so reclaiming on a smaller dip would only map the same
clusters again, and every unmap costs an RCU grace period.

Stop at 70% in use rather than at the end of the free tail. Unmapping
the whole tail would leave the range all but full, and the grow, which
starts at 85%, would be straight back for it; 70% is far enough below
that the workload has to do real work before the grow can fire. Keep at
least one chunk of free tail, so the next allocation has somewhere to
land.

Unmapping fewer than four chunks is not worth the RCU grace period, so
leave the range alone in that case.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 114 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 108 insertions(+), 6 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 45050f8a2ed8..b8572f301d31 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -60,12 +60,13 @@
 
 #ifdef CONFIG_XSWAP
 /*
- * xswap: dynamically grow the cluster_info array via a VM_SPARSE area.
+ * xswap: dynamically grow and shrink the cluster_info array via a
+ * VM_SPARSE area.
  *
- * XSWAP_GROW_CLUSTERS is the number of clusters to map in one grow
- * operation.  It is set to the number of cluster_info structs that
- * fit in a single page (at least 16), so that the vmalloc page table
- * overhead is proportional to the number of clusters mapped.
+ * XSWAP_GROW_CLUSTERS is the number of clusters to map/unmap in one
+ * grow/shrink operation: the number of cluster_info structs that fit in
+ * a single page (at least 16), so that the vmalloc page table overhead
+ * is proportional to the number of clusters mapped.
  */
 #define XSWAP_GROW_CLUSTERS \
 	max_t(unsigned long, PAGE_SIZE / sizeof(struct swap_cluster_info), 16)
@@ -88,6 +89,7 @@ static int xswap_map_clusters(struct swap_info_struct *si,
 static void xswap_unmap_clusters(struct swap_info_struct *si,
 				 unsigned long start_idx, unsigned long nr);
 static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data);
+static void xswap_try_shrink(struct swap_info_struct *si);
 
 static int xswap_create(int prio);
 
@@ -716,6 +718,9 @@ static void __free_cluster(struct swap_info_struct *si, struct swap_cluster_info
 	swap_cluster_free_table(ci);
 	move_cluster(si, ci, &si->free_clusters, CLUSTER_FLAG_FREE);
 	ci->order = 0;
+#ifdef CONFIG_XSWAP
+	xswap_try_shrink(si);
+#endif
 }
 
 /*
@@ -1083,6 +1088,9 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 	lockdep_assert_held(&ci->lock);
 	VM_WARN_ON(!cluster_is_usable(ci, order));
 
+	/* ci is used without ci->lock; an xswap unmap waits for this. */
+	rcu_read_lock();
+
 	if (end < nr_pages || ci->count + nr_pages > SWAPFILE_CLUSTER)
 		goto out;
 
@@ -1111,6 +1119,7 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 out:
 	relocate_cluster(si, ci);
 	swap_cluster_unlock(ci);
+	rcu_read_unlock();
 	if (si->flags & SWP_SOLIDSTATE) {
 		this_cpu_write(percpu_swap_cluster.offset[order], next);
 		this_cpu_write(percpu_swap_cluster.si[order], si);
@@ -1154,6 +1163,9 @@ static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool force)
 		to_scan = swap_usage_in_pages(si) / SWAPFILE_CLUSTER;
 
 	while ((ci = isolate_lock_cluster(si, &si->full_clusters))) {
+		/* As in alloc_swap_scan_cluster(). */
+		rcu_read_lock();
+
 		offset = cluster_offset(si, ci);
 		end = min(si->max, offset + SWAPFILE_CLUSTER);
 		to_scan--;
@@ -1178,6 +1190,7 @@ static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool force)
 			relocate_cluster(si, ci);
 
 		swap_cluster_unlock(ci);
+		rcu_read_unlock();
 		if (to_scan <= 0)
 			break;
 
@@ -1502,11 +1515,17 @@ static bool swap_alloc_fast(struct folio *folio)
 	/*
 	 * Once allocated, swap_info_struct will never be completely freed,
 	 * so checking it's liveness by get_swap_device_info is enough.
+	 *
+	 * The cached offset indexes si->cluster_info, which xswap can
+	 * unmap; cover both the read and the use with RCU.
 	 */
+	rcu_read_lock();
 	si = this_cpu_read(percpu_swap_cluster.si[order]);
 	offset = this_cpu_read(percpu_swap_cluster.offset[order]);
-	if (!si || !offset || !get_swap_device_info(si))
+	if (!si || !offset || !get_swap_device_info(si)) {
+		rcu_read_unlock();
 		return false;
+	}
 
 	ci = swap_cluster_lock(si, offset);
 	if (cluster_is_usable(ci, order)) {
@@ -1518,6 +1537,7 @@ static bool swap_alloc_fast(struct folio *folio)
 	}
 
 	put_swap_device(si);
+	rcu_read_unlock();
 	return folio_test_swapcache(folio);
 }
 
@@ -2308,8 +2328,11 @@ swp_entry_t swap_alloc_hibernation_slot(int type)
 	/*
 	 * Try the local cluster first if it matches the device. If
 	 * not, try grab a new cluster and override local cluster.
+	 *
+	 * Same RCU requirement as swap_alloc_fast().
 	 */
 	local_lock(&percpu_swap_cluster.lock);
+	rcu_read_lock();
 	pcp_si = this_cpu_read(percpu_swap_cluster.si[0]);
 	pcp_offset = this_cpu_read(percpu_swap_cluster.offset[0]);
 	if (pcp_si == si && pcp_offset) {
@@ -2319,6 +2342,7 @@ swp_entry_t swap_alloc_hibernation_slot(int type)
 		else
 			swap_cluster_unlock(ci);
 	}
+	rcu_read_unlock();
 	if (!offset)
 		offset = cluster_alloc_swap_entry(si, NULL);
 	local_unlock(&percpu_swap_cluster.lock);
@@ -4019,6 +4043,15 @@ static void xswap_unmap_clusters(struct swap_info_struct *si,
 		return;
 	}
 
+	/*
+	 * A per-cpu cluster cache can still hold an offset in this range.
+	 * Invalidate those references, then wait out the readers that have
+	 * already loaded one, so that nobody can dereference cluster_info
+	 * past this point.  swapoff() needs the same before it releases.
+	 */
+	flush_percpu_swap_cluster(si);
+	synchronize_rcu();
+
 	vm_area_unmap_pages(si->cluster_vm, vm_start, vm_end);
 	/* vm_area_unmap_pages() clears PTEs but does not free pages. */
 	/* TODO: free backing pages via page table walk or tracking bitmap */
@@ -4037,6 +4070,75 @@ static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data)
 	*mapped_end = addr + PAGE_SIZE;
 	return 0;
 }
+
+/*
+ * Automatic reclaim: leave one chunk of the free tail mapped as slack, so
+ * that the next allocation has somewhere to land, and only unmap once
+ * several chunks can go, so the unmap is worth the RCU grace period it
+ * costs.
+ */
+#define XSWAP_SHRINK_SLACK	XSWAP_GROW_CLUSTERS
+#define XSWAP_SHRINK_MIN	(XSWAP_GROW_CLUSTERS * 8)
+
+/*
+ * Try to shrink the cluster_info tail: unmap contiguous free clusters
+ * at the end of the mapped range.
+ */
+static void xswap_try_shrink(struct swap_info_struct *si)
+{
+	struct swap_cluster_info *ci;
+	unsigned long nr_mapped, last, keep, idx;
+
+	if (!(si->flags & SWP_XSWAP))
+		return;
+
+	nr_mapped = READ_ONCE(si->nr_clusters_mapped);
+	if (nr_mapped <= 1) /* keep cluster 0 */
+		return;
+
+	/*
+	 * Reclaim on our own, but only once the mapped range is at most
+	 * SHRINK_WHEN in use: growth is demand driven, so reclaiming on a
+	 * smaller dip would only map the same clusters again, and every
+	 * unmap costs an RCU grace period.
+	 */
+	if (swap_usage_in_pages(si) * 100 >
+	    nr_mapped * SWAPFILE_CLUSTER * XSWAP_SHRINK_WHEN)
+		return;
+
+	/* Find the last non-free cluster from the tail */
+	last = nr_mapped;
+	while (last > 1) {
+		idx = last - 1;
+		ci = &si->cluster_info[idx];
+		if (ci->count || ci->flags != CLUSTER_FLAG_FREE)
+			break;
+		last = idx;
+	}
+
+	if (last == nr_mapped)
+		return; /* nothing to shrink */
+
+	/* Below `last` has to stay mapped: the free ones in between are
+	 * not part of the tail, and unmapping them orphans what is above.
+	 */
+	if (nr_mapped - last < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
+		return;
+
+	/*
+	 * Stop at SHRINK_UNTIL rather than at the end of the tail, or the
+	 * range comes out full enough for the grow to be woken.
+	 */
+	keep = DIV_ROUND_UP(swap_usage_in_pages(si) * 100,
+			    XSWAP_SHRINK_UNTIL * SWAPFILE_CLUSTER);
+	if (keep < last + XSWAP_SHRINK_SLACK)
+		keep = last + XSWAP_SHRINK_SLACK;
+
+	if (nr_mapped < keep + XSWAP_SHRINK_MIN)
+		return;
+
+	xswap_unmap_clusters(si, keep, nr_mapped - keep);
+}
 #endif /* CONFIG_XSWAP */
 
 static int setup_swap_clusters_info(struct swap_info_struct *si,
-- 
2.54.0

