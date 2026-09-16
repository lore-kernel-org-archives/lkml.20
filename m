Received: from mta0.migadu.com (out-56.mta0.migadu.com [91.218.175.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DEB4D0A16
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554068; cv=none; b=aOJ1vADvMg9BsDgmkNByvsRZdG0uvInVyzHxLtEFAZUWLJiq47+rQ0Zqu+hDe+DZSd5wzJZL9C/3tRd/+dmz4vOPTUe/nLDYvDv2Uyn2CyOvc6aLNcId6mFCQgkBYLY+LV+ogiI6+LVzZg+HdtV66V7zOpf6FfMj4k58j3N1iJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554068; c=relaxed/simple;
	bh=hQFm+ztyqfHm4WmBVA5k4KCVpvALbCnKJ1xGUud3S2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=fQ1HN9RglFCCtPl0hyrour98n09BSTRqYQabEpoFmJS3GIE+cADUvF8oo3BZYy9CJphCQa8UF1NUxqxRABRRgGTkSUTouuO9r7iLU8TipRUfPaei3MZ+bHx+r2UllkD3I+pircmF5Y4xmU3tMSMEq40fcJcxiDYWVX7+eWrtN/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id ae7a14221eb78435;
	Wed, 16 Sep 2026 10:20:57 +0000
X-Mizu-Trace-ID: ae7a14221eb78435
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
Subject: [PATCH v3 09/14] mm, swap: defer xswap shrink to workqueue to avoid lock recursion
Date: Wed, 16 Sep 2026 18:19:16 +0800
Message-ID: <20260916101929.149106-10-hebaoquan@kylinos.cn>
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

__free_cluster() called xswap_try_shrink() while holding ci->lock, but
shrinking unmaps the backing pages and the subsequent unlock faults on
the unmapped address. Run the shrink via schedule_work() instead, so no
cluster lock is held. The work is only scheduled for xswap devices and
is cancelled on swapoff.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |   1 +
 mm/swapfile.c        | 123 +++++++++++++++++++++++++++++++++----------
 2 files changed, 97 insertions(+), 27 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 8c62a53667bb..30642bb481df 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -246,6 +246,7 @@ struct swap_info_struct {
 	struct vm_struct	*cluster_vm;	/* VM_SPARSE area for cluster_info */
 	unsigned long		nr_clusters_max;/* total clusters in the xswap address space */
 	unsigned long		nr_clusters_mapped; /* currently mapped cluster count */
+	struct work_struct	xswap_shrink_work; /* deferred shrink trigger */
 	struct mutex		xswap_lock;	/* serialize map/unmap operations */
 #endif
 	struct list_head free_clusters; /* free clusters list */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 5b31aacb3ec5..351c68bcd70b 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -699,7 +699,9 @@ static void __free_cluster(struct swap_info_struct *si, struct swap_cluster_info
 	move_cluster(si, ci, &si->free_clusters, CLUSTER_FLAG_FREE);
 	ci->order = 0;
 #ifdef CONFIG_XSWAP
-	xswap_try_shrink(si);
+	/* Only xswap devices, and not while the device is being torn down. */
+	if ((si->flags & SWP_XSWAP) && (si->flags & SWP_WRITEOK))
+		schedule_work(&si->xswap_shrink_work);
 #endif
 }
 
@@ -3328,6 +3330,7 @@ static void free_swap_cluster_info(struct swap_info_struct *si)
 	if (si->flags & SWP_XSWAP) {
 		unsigned long nr_mapped;
 
+		cancel_work_sync(&si->xswap_shrink_work);
 		/*
 		 * Cluster 0 keeps the bad header slot, so it never empties
 		 * and __free_cluster() never frees its table.
@@ -3452,6 +3455,11 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	spin_unlock(&p->lock);
 	spin_unlock(&swap_lock);
 
+#ifdef CONFIG_XSWAP
+	if (p->flags & SWP_XSWAP)
+		cancel_work_sync(&p->xswap_shrink_work);
+#endif
+
 	wait_for_allocation(p);
 
 	set_current_oom_origin();
@@ -4011,8 +4019,9 @@ static int xswap_collect_page(pte_t *pte, unsigned long addr, void *data)
 	return 0;
 }
 
-static int xswap_unmap_clusters(struct swap_info_struct *si,
-				unsigned long start_idx, unsigned long nr)
+/* Caller must hold si->xswap_lock; -ENOMEM leaves the mapping intact. */
+static int xswap_unmap_clusters_locked(struct swap_info_struct *si,
+				       unsigned long start_idx, unsigned long nr)
 {
 	unsigned long start_addr = (unsigned long)si->cluster_info +
 				   (size_t)start_idx * sizeof(struct swap_cluster_info);
@@ -4025,11 +4034,8 @@ static int xswap_unmap_clusters(struct swap_info_struct *si,
 	unsigned int noreclaim_flags;
 	int i;
 
-	mutex_lock(&si->xswap_lock);
-
 	if (vm_start >= vm_end) {
 		WRITE_ONCE(si->nr_clusters_mapped, start_idx);
-		mutex_unlock(&si->xswap_lock);
 		return 0;
 	}
 
@@ -4049,10 +4055,8 @@ static int xswap_unmap_clusters(struct swap_info_struct *si,
 	xpd.pages = kmalloc_array(npages, sizeof(*xpd.pages),
 				  __GFP_HIGH | __GFP_NOMEMALLOC | GFP_KERNEL);
 	memalloc_noreclaim_restore(noreclaim_flags);
-	if (!xpd.pages) {
-		mutex_unlock(&si->xswap_lock);
+	if (!xpd.pages)
 		return -ENOMEM;
-	}
 
 	xpd.nr = 0;
 	xpd.max = npages;
@@ -4066,10 +4070,20 @@ static int xswap_unmap_clusters(struct swap_info_struct *si,
 	kfree(xpd.pages);
 
 	WRITE_ONCE(si->nr_clusters_mapped, start_idx);
-	mutex_unlock(&si->xswap_lock);
 	return 0;
 }
 
+static int xswap_unmap_clusters(struct swap_info_struct *si,
+				unsigned long start_idx, unsigned long nr)
+{
+	int ret;
+
+	mutex_lock(&si->xswap_lock);
+	ret = xswap_unmap_clusters_locked(si, start_idx, nr);
+	mutex_unlock(&si->xswap_lock);
+	return ret;
+}
+
 /* Track the end of the run of pages that is already mapped. */
 static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data)
 {
@@ -4090,6 +4104,16 @@ static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data)
 #define XSWAP_SHRINK_SLACK	XSWAP_GROW_CLUSTERS
 #define XSWAP_SHRINK_MIN	(XSWAP_GROW_CLUSTERS * 4)
 
+static void xswap_shrink_work_fn(struct work_struct *work)
+{
+	struct swap_info_struct *si = container_of(work,
+			struct swap_info_struct, xswap_shrink_work);
+
+	if (!(READ_ONCE(si->flags) & SWP_WRITEOK))
+		return;
+	xswap_try_shrink(si);
+}
+
 /*
  * Try to shrink the cluster_info tail: unmap contiguous free clusters
  * at the end of the mapped range.
@@ -4097,14 +4121,16 @@ static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data)
 static void xswap_try_shrink(struct swap_info_struct *si)
 {
 	struct swap_cluster_info *ci;
-	unsigned long nr_mapped, last, idx;
+	unsigned long nr_mapped, nr_tail, nr_unmap, start_idx, i;
 
 	if (!(si->flags & SWP_XSWAP))
 		return;
 
+	mutex_lock(&si->xswap_lock);
+
 	nr_mapped = READ_ONCE(si->nr_clusters_mapped);
-	if (nr_mapped <= 1) /* keep cluster 0 */
-		return;
+	if (nr_mapped <= 1)	/* keep cluster 0 */
+		goto out_unlock;
 
 	/*
 	 * Reclaim on our own, but only once the mapped range is at most
@@ -4113,27 +4139,69 @@ static void xswap_try_shrink(struct swap_info_struct *si)
 	 * an RCU grace period.
 	 */
 	if (swap_usage_in_pages(si) * 2 > nr_mapped * SWAPFILE_CLUSTER)
-		return;
+		goto out_unlock;
 
-	/* Find the last non-free cluster from the tail */
-	last = nr_mapped;
-	while (last > 1) {
-		idx = last - 1;
-		ci = &si->cluster_info[idx];
-		if (ci->count || ci->flags != CLUSTER_FLAG_FREE)
+	/*
+	 * Count the free clusters at the tail of the mapped range.  Scanned,
+	 * not tracked: the count must be exact to size the unmap, and an
+	 * incremental count falls behind on out-of-order frees.
+	 */
+	nr_tail = 0;
+	while (nr_mapped - nr_tail > 1) {
+		ci = &si->cluster_info[nr_mapped - nr_tail - 1];
+		if (READ_ONCE(ci->count) ||
+		    READ_ONCE(ci->flags) != CLUSTER_FLAG_FREE)
 			break;
-		last = idx;
+		nr_tail++;
 	}
+	if (nr_tail < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
+		goto out_unlock;
 
-	if (last == nr_mapped)
-		return; /* nothing to shrink */
+	nr_unmap = rounddown(nr_tail - XSWAP_SHRINK_SLACK, XSWAP_GROW_CLUSTERS);
+	if (!nr_unmap)
+		goto out_unlock;
+	start_idx = nr_mapped - nr_unmap;
 
-	if (nr_mapped - last < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
-		return;
+	/*
+	 * Only shrink a run that reaches the mapped end; otherwise
+	 * truncating nr_clusters_mapped would orphan the active tail.
+	 */
+	spin_lock(&si->lock);
+	for (i = start_idx; i < nr_mapped; i++) {
+		ci = &si->cluster_info[i];
+		if (READ_ONCE(ci->flags) != CLUSTER_FLAG_FREE)
+			break;
+		if (!spin_trylock(&ci->lock)) {
+			spin_unlock(&si->lock);
+			goto out_unlock;
+		}
+		spin_unlock(&ci->lock);
+	}
+	if (i != nr_mapped) {
+		spin_unlock(&si->lock);
+		goto out_unlock;
+	}
 
-	last += XSWAP_SHRINK_SLACK;
+	for (i = start_idx; i < nr_mapped; i++) {
+		ci = &si->cluster_info[i];
+		list_del_init(&ci->list);
+		WRITE_ONCE(ci->flags, CLUSTER_FLAG_NONE);
+	}
+	spin_unlock(&si->lock);
 
-	xswap_unmap_clusters(si, last, nr_mapped - last);
+	if (xswap_unmap_clusters_locked(si, start_idx, nr_unmap)) {
+		spin_lock(&si->lock);
+		for (i = start_idx; i < nr_mapped; i++) {
+			ci = &si->cluster_info[i];
+			WRITE_ONCE(ci->flags, CLUSTER_FLAG_FREE);
+			list_add_tail(&ci->list, &si->free_clusters);
+		}
+		spin_unlock(&si->lock);
+		goto out_unlock;
+	}
+
+out_unlock:
+	mutex_unlock(&si->xswap_lock);
 }
 #endif /* CONFIG_XSWAP */
 
@@ -4197,6 +4265,7 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 			}
 		}
 
+		INIT_WORK(&si->xswap_shrink_work, xswap_shrink_work_fn);
 		return 0;
 
 err_unmap:
-- 
2.54.0

