Received: from mta0.migadu.com (out-26.mta0.migadu.com [91.218.175.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCD74DF4AC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554055; cv=none; b=fPw2DM5TWq/a5DkkfWi9sV3Zs731ODzuGJojlHHJGJCnlXu59q3hh5T3kuESsOp1wcR/NNiLHubWWJ8n+d9dS/HK6EwhNAlY16xclnNeZMY9LMMLEcAmY44MLY2pXTcAnx+3H055GIdBFcsoqiVBDx3aE9suo1pxLR4qJYeJ7d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554055; c=relaxed/simple;
	bh=p1spLcHWbZIGQMljIGWtStjdi/jnP7xL0fS82Z2ENIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=sWVwN7zhM11h9DZJGpzlooFnlLcSrb/aChQYCmlV7IB8JFWxwcApC2rzaqPsYTCe0zg6zoZ7nUud+KxHWf6LoLb4dDveN+cvn7tcPONR6o2M6rZZLCagGXIfmikQ3VEAzxdMkzDy5QUnwAdil4zn712GDoOgVPdOpC59aXjFEe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 237cca9ece2c04ea;
	Wed, 16 Sep 2026 10:20:46 +0000
X-Mizu-Trace-ID: 237cca9ece2c04ea
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
	kunwu.chan@gmail.com,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v3 07/14] mm, swap: add xswap_try_shrink and shrink trigger on cluster free
Date: Wed, 16 Sep 2026 18:19:14 +0800
Message-ID: <20260916101929.149106-8-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916101929.149106-1-hebaoquan@kylinos.cn>
References: <20260916101929.149106-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Add xswap_try_shrink() to unmap the free clusters at the tail of the
mapped range. It only reclaims when the range is at most half in use,
leaving one chunk of slack for the next allocation.

Call it from __free_cluster() after a cluster is released.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 100 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 94 insertions(+), 6 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 17e482059d32..2a03b13c0ed2 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -54,12 +54,13 @@
 
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
@@ -69,6 +70,7 @@ static int xswap_map_clusters(struct swap_info_struct *si,
 static void xswap_unmap_clusters(struct swap_info_struct *si,
 				 unsigned long start_idx, unsigned long nr);
 static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data);
+static void xswap_try_shrink(struct swap_info_struct *si);
 
 static int xswap_create(int prio);
 
@@ -696,6 +698,9 @@ static void __free_cluster(struct swap_info_struct *si, struct swap_cluster_info
 	swap_cluster_free_table(ci);
 	move_cluster(si, ci, &si->free_clusters, CLUSTER_FLAG_FREE);
 	ci->order = 0;
+#ifdef CONFIG_XSWAP
+	xswap_try_shrink(si);
+#endif
 }
 
 /*
@@ -1063,6 +1068,9 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 	lockdep_assert_held(&ci->lock);
 	VM_WARN_ON(!cluster_is_usable(ci, order));
 
+	/* ci is used without ci->lock; an xswap unmap waits for this. */
+	rcu_read_lock();
+
 	if (end < nr_pages || ci->count + nr_pages > SWAPFILE_CLUSTER)
 		goto out;
 
@@ -1091,6 +1099,7 @@ static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 out:
 	relocate_cluster(si, ci);
 	swap_cluster_unlock(ci);
+	rcu_read_unlock();
 	if (si->flags & SWP_SOLIDSTATE) {
 		this_cpu_write(percpu_swap_cluster.offset[order], next);
 		this_cpu_write(percpu_swap_cluster.si[order], si);
@@ -1134,6 +1143,9 @@ static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool force)
 		to_scan = swap_usage_in_pages(si) / SWAPFILE_CLUSTER;
 
 	while ((ci = isolate_lock_cluster(si, &si->full_clusters))) {
+		/* As in alloc_swap_scan_cluster(). */
+		rcu_read_lock();
+
 		offset = cluster_offset(si, ci);
 		end = min(si->max, offset + SWAPFILE_CLUSTER);
 		to_scan--;
@@ -1158,6 +1170,7 @@ static void swap_reclaim_full_clusters(struct swap_info_struct *si, bool force)
 			relocate_cluster(si, ci);
 
 		swap_cluster_unlock(ci);
+		rcu_read_unlock();
 		if (to_scan <= 0)
 			break;
 
@@ -1506,11 +1519,17 @@ static bool swap_alloc_fast(struct folio *folio)
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
@@ -1522,6 +1541,7 @@ static bool swap_alloc_fast(struct folio *folio)
 	}
 
 	put_swap_device(si);
+	rcu_read_unlock();
 	return folio_test_swapcache(folio);
 }
 
@@ -2312,8 +2332,11 @@ swp_entry_t swap_alloc_hibernation_slot(int type)
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
@@ -2323,6 +2346,7 @@ swp_entry_t swap_alloc_hibernation_slot(int type)
 		else
 			swap_cluster_unlock(ci);
 	}
+	rcu_read_unlock();
 	if (!offset)
 		offset = cluster_alloc_swap_entry(si, NULL);
 	local_unlock(&percpu_swap_cluster.lock);
@@ -3981,6 +4005,15 @@ static void xswap_unmap_clusters(struct swap_info_struct *si,
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
@@ -3999,6 +4032,61 @@ static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data)
 	*mapped_end = addr + PAGE_SIZE;
 	return 0;
 }
+
+/*
+ * Automatic reclaim: leave one chunk of the free tail mapped as slack, so
+ * that the next allocation does not grow the range straight back, and only
+ * unmap once several chunks can go, so the unmap is worth the RCU grace
+ * period it costs.
+ */
+#define XSWAP_SHRINK_SLACK	XSWAP_GROW_CLUSTERS
+#define XSWAP_SHRINK_MIN	(XSWAP_GROW_CLUSTERS * 4)
+
+/*
+ * Try to shrink the cluster_info tail: unmap contiguous free clusters
+ * at the end of the mapped range.
+ */
+static void xswap_try_shrink(struct swap_info_struct *si)
+{
+	struct swap_cluster_info *ci;
+	unsigned long nr_mapped, last, idx;
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
+	 * half in use: growth is demand driven, so reclaiming on a smaller
+	 * dip would only map the same clusters again, and every unmap costs
+	 * an RCU grace period.
+	 */
+	if (swap_usage_in_pages(si) * 2 > nr_mapped * SWAPFILE_CLUSTER)
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
+	if (nr_mapped - last < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
+		return;
+
+	last += XSWAP_SHRINK_SLACK;
+
+	xswap_unmap_clusters(si, last, nr_mapped - last);
+}
 #endif /* CONFIG_XSWAP */
 
 static int setup_swap_clusters_info(struct swap_info_struct *si,
-- 
2.54.0

