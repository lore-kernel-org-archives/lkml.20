Received: from mta1.migadu.com (out-150.mta1.migadu.com [95.215.58.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFFE43B3CC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823975; cv=none; b=Sv302d1fxjXyT3adTFdv+Zu8QCAMNPWCFNqca+MqBBcsyW9Wo+bBdDCraNh5PhrxO3DeamvXqCJx/y+/zBLbDYWNfgqzCUnKIs27AE3VpIbWVMwK/QGMrJ7tuIFm2VC7h/TgaDL2e1/WKn4/GLG7Ws2NQNYx5KMMrH2om4BkmLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823975; c=relaxed/simple;
	bh=SxYywDe3Iu0NSS2rwpnfD1i8VOZHWdZ/DIUSU0ZnM7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-type; b=eDCVYJV0OW6g3j6bNUMF1BUQ7R3y0rKFKYQjfIWr38UTQaMx4moJyUyEiFQ5KZYgpNFCghMoRMnmUmJGsfsa7Gtgh+JoZFAADyFlOGoBhab60ZgyddBh1UcP0EDi/pd0ZYbMO4pHqn35Ypumfds+GzOPX33b4AKevGdq1i64Rxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 79c451e103023864;
	Thu, 27 Aug 2026 09:46:10 +0000
X-Mizu-Trace-ID: 79c451e103023864
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
Subject: [PATCH 10/16] mm, swap: add nr_free_tail for O(1) xswap shrink detection
Date: Thu, 27 Aug 2026 17:45:00 +0800
Message-ID: <20260827094509.1016740-11-hebaoquan@kylinos.cn>
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

Track contiguous free clusters at the tail of the mapped range in
si->nr_free_tail, maintained across alloc/free/grow paths.  This
eliminates the backwards scan on every shrink check.

Three paths maintain the counter:

1. xswap_update_free_tail(): called on cluster free.  If the freed
   cluster is adjacent to the existing tail boundary, increment and
   extend backwards to include already-free clusters now connected.

2. xswap_trim_free_tail(): called on cluster allocation.  If the
   allocated cluster lies within the tail free region, truncate the
   count to end just before it.

3. Grow path: nr_free_tail += added - only the clusters actually
   added to the free list extend the tail; a concurrent grower that
   lost the race added none.

xswap_try_shrink() simplifies to a threshold check:
  if nr_free_tail >= XSWAP_GROW_CLUSTERS -> unmap

Setup initializes nr_free_tail = nr_clusters_mapped - 1 (all but
cluster 0 are free at the tail).

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |   1 +
 mm/swapfile.c        | 128 +++++++++++++++++++++++++++++++++++++------
 2 files changed, 112 insertions(+), 17 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index c2744fa8a009..fea0005b9f51 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -252,6 +252,7 @@ struct swap_info_struct {
 	struct vm_struct	*cluster_vm;	/* VM_SPARSE area for xswap dynamic cluster_info */
 	unsigned long		nr_clusters;	/* total cluster count for xswap */
 	unsigned long		nr_clusters_mapped; /* currently mapped cluster count */
+	unsigned long		nr_free_tail;	/* contiguous free clusters at tail */
 	struct mutex		xswap_lock;	/* serialize map/unmap operations */
 #endif
 	struct list_head free_clusters; /* free clusters list */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 0fe4834eadde..5235c6d07ab2 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -71,6 +71,9 @@ static int xswap_map_clusters(struct swap_info_struct *si,
 static void xswap_unmap_clusters(struct swap_info_struct *si,
 				 unsigned long start_idx, unsigned long nr);
 static int xswap_check_mapped(pte_t *pte, unsigned long addr, void *data);
+static void xswap_trim_free_tail(struct swap_info_struct *si, unsigned long idx);
+static void xswap_update_free_tail(struct swap_info_struct *si,
+				    unsigned long freed_idx);
 static void xswap_try_shrink(struct swap_info_struct *si);
 
 #ifdef CONFIG_SYSFS
@@ -701,6 +704,7 @@ static void __free_cluster(struct swap_info_struct *si, struct swap_cluster_info
 	move_cluster(si, ci, &si->free_clusters, CLUSTER_FLAG_FREE);
 	ci->order = 0;
 #ifdef CONFIG_XSWAP
+	xswap_update_free_tail(si, ci - si->cluster_info);
 	xswap_try_shrink(si);
 #endif
 }
@@ -1049,6 +1053,9 @@ static bool __swap_cluster_alloc_entries(struct swap_info_struct *si,
 	if (cluster_is_empty(ci))
 		ci->order = order;
 	ci->count += nr_pages;
+#ifdef CONFIG_XSWAP
+	xswap_trim_free_tail(si, cluster_index(si, ci));
+#endif
 	swap_range_alloc(si, nr_pages);
 
 	return true;
@@ -3918,37 +3925,124 @@ static int xswap_check_mapped(pte_t *pte, unsigned long addr, void *data)
 }
 
 /*
- * Try to shrink the cluster_info tail: unmap contiguous free clusters
- * at the end of the mapped range.
+ * Maintain si->nr_free_tail, the number of contiguous free clusters at
+ * the tail of the mapped range.  Called when a cluster at @freed_idx is
+ * freed.  Provides O(1) shrink detection: if nr_free_tail is non-zero,
+ * the tail can be unmapped without scanning cluster_info[].
+ *
+ * Only increments when @freed_idx is the cluster immediately before the
+ * existing tail region.  Then scans backwards for already-free clusters
+ * now connected to the tail, bounded by XSWAP_GROW_CLUSTERS at a time.
  */
-static void xswap_try_shrink(struct swap_info_struct *si)
+static void xswap_update_free_tail(struct swap_info_struct *si,
+				   unsigned long freed_idx)
 {
+	unsigned long nr_mapped, nr_tail, tid, i;
 	struct swap_cluster_info *ci;
-	unsigned long last, idx;
 
 	if (!(si->flags & SWP_XSWAP))
 		return;
-	if (READ_ONCE(si->nr_clusters_mapped) <= 1) /* keep cluster 0 */
+
+	nr_mapped = READ_ONCE(si->nr_clusters_mapped);
+	nr_tail = READ_ONCE(si->nr_free_tail);
+
+	/* Protect against concurrent shrink that races past us */
+	if (nr_tail >= nr_mapped)
+		return;
+
+	tid = nr_mapped - nr_tail - 1;
+
+	/* Only the cluster immediately before the tail region counts */
+	if (freed_idx != tid)
 		return;
 
-	/* Find the last non-free cluster from the tail */
-	last = READ_ONCE(si->nr_clusters_mapped);
-	while (last > 1) {
-		idx = last - 1;
-		ci = &si->cluster_info[idx];
-		if (ci->count || ci->flags != CLUSTER_FLAG_FREE)
+	nr_tail++;
+	WRITE_ONCE(si->nr_free_tail, nr_tail);
+
+	/* Extend: include already-free clusters now connected to the tail */
+	for (i = 1; i < XSWAP_GROW_CLUSTERS; i++) {
+		nr_mapped = READ_ONCE(si->nr_clusters_mapped);
+		nr_tail = READ_ONCE(si->nr_free_tail);
+		if (nr_tail >= nr_mapped - 1)
+			break; /* reached cluster 0 */
+		tid = nr_mapped - nr_tail - 1;
+		ci = &si->cluster_info[tid];
+
+		if (READ_ONCE(ci->count) ||
+		    READ_ONCE(ci->flags) != CLUSTER_FLAG_FREE)
 			break;
-		last = idx;
+		nr_tail++;
+		WRITE_ONCE(si->nr_free_tail, nr_tail);
 	}
+}
 
-	if (last == si->nr_clusters_mapped)
-		return; /* nothing to shrink */
+/*
+ * Trim si->nr_free_tail when a cluster in the tail region is allocated.
+ * @idx: index of the cluster being allocated.
+ */
+static void xswap_trim_free_tail(struct swap_info_struct *si, unsigned long idx)
+{
+	unsigned long nr_mapped, nr_tail, tail_start;
 
-	/* Only unmap if we can free at least one full page of clusters */
-	if (si->nr_clusters_mapped - last < XSWAP_GROW_CLUSTERS)
+	if (!(si->flags & SWP_XSWAP))
 		return;
 
-	xswap_unmap_clusters(si, last, si->nr_clusters_mapped - last);
+	/*
+	 * nr_clusters_mapped and nr_free_tail are read locklessly;
+	 * concurrent updates may cause nr_free_tail to be trimmed
+	 * slightly less than ideally, which is harmless.
+	 */
+	nr_mapped = READ_ONCE(si->nr_clusters_mapped);
+	nr_tail = READ_ONCE(si->nr_free_tail);
+	tail_start = nr_mapped - nr_tail;
+	if (idx >= tail_start)
+		WRITE_ONCE(si->nr_free_tail, nr_mapped - idx - 1);
+}
+
+/*
+ * Try to shrink the cluster_info tail.  Uses si->nr_free_tail which
+ * is maintained incrementally during alloc/free — no scanning needed.
+ */
+static void xswap_try_shrink(struct swap_info_struct *si)
+{
+	unsigned long start_idx, nr_unmap, i;
+	struct swap_cluster_info *ci;
+
+	if (!(si->flags & SWP_XSWAP))
+		return;
+	if (si->nr_free_tail < XSWAP_GROW_CLUSTERS)
+		return;
+
+	nr_unmap = round_down(si->nr_free_tail, XSWAP_GROW_CLUSTERS);
+	start_idx = si->nr_clusters_mapped - nr_unmap;
+
+	/*
+	 * Verify the tail clusters are still free before unmapping.  Count the
+	 * contiguous free run first, then detach it in a second pass once the
+	 * whole run is confirmed long enough.  Detaching while counting would
+	 * leave a partial run off the free list if it proved too short to unmap.
+	 */
+	spin_lock(&si->lock);
+	for (i = start_idx; i < si->nr_clusters_mapped; i++) {
+		ci = &si->cluster_info[i];
+		if (ci->flags != CLUSTER_FLAG_FREE)
+			break;
+	}
+	nr_unmap = i - start_idx;
+	if (nr_unmap < XSWAP_GROW_CLUSTERS) {
+		spin_unlock(&si->lock);
+		return;
+	}
+
+	for (i = start_idx; i < start_idx + nr_unmap; i++) {
+		ci = &si->cluster_info[i];
+		list_del_init(&ci->list);
+		ci->flags = CLUSTER_FLAG_NONE;
+	}
+	spin_unlock(&si->lock);
+
+	xswap_unmap_clusters(si, start_idx, nr_unmap);
+	si->nr_free_tail -= nr_unmap;
 }
 #endif /* CONFIG_XSWAP */
 
-- 
2.54.0

