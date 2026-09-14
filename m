Received: from mta0.migadu.com (out-57.mta0.migadu.com [91.218.175.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607934718CE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389099; cv=none; b=tiu3M9Etgr4SUJPWWmvv8/l7pSrzKNE1acL8eyF7UqGJer9MfkTrpC5YCSopjqosCn38N8Fufc+rKMpULm4l8LsdrDjeGJVQuPvedhO0QgEV9aZuZcW7r62Gjx379KXxjJ10q04VvzmxILRFSG7IwWVBsTeSn8lNAeOZbCIFMVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389099; c=relaxed/simple;
	bh=yJ5rM0Ieb2+vVwyVMyaZBbRDWPGmbZFWmsl3JUm02Do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O+CamxoL7TOsVZeN6zWov5L6QQALDcdHAugiUGqx6AvPy7ZGti+cqE/LEuPMTW7m/LFjYqMV89kuOOFQ7DXv1uHTuAazS5MsoOIUCvFPUvzJdHIpjIJYL353uUZrtXb6yCIP6J8YhOGEtBpbmcJlgjjf4kofIhRo+DOvvL/AjKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Xxiozo3b; arc=none smtp.client-ip=91.218.175.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Xxiozo3b"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yJ5rM0Ieb2+vVwyVMyaZBbRDWPGmbZFWmsl3JUm02Do=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789389088; v=1; x=1789993888;
 b=Xxiozo3bVuBO5D8EXJEc7p4eHJE6tbf/RUN4MvMfV0wGDdnOBop90KknMog8EzV3dN9vfQXf
 co4sw0d/prByyUzE0DQjRYF1lwnmNUOG+zUwhxesyHqECQh3apGN03W0JI6Yjj1HY5fitlOQPaF
 ydw+Yd4vYayJfNUoO3JC2HHY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id acc2a20a9373363e;
	Mon, 14 Sep 2026 12:31:28 +0000
X-Mizu-Trace-ID: acc2a20a9373363e
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [RESEND v7 12/29] mm: handle PMD swap entries in fork path
Date: Mon, 14 Sep 2026 05:28:02 -0700
Message-ID: <20260914122950.3283997-13-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914122950.3283997-1-usama.arif@linux.dev>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

copy_huge_pmd() only knows about migration and device-private PMDs, so a
PMD swap entry would fall through to the present-PMD path and fork() would
duplicate it without taking a reference on the slots it points at.

Copy it the way copy_nonpresent_pte() copies a PTE swap entry: duplicate
the swap references, clear the exclusive marker on the source, put the
destination mm on mmlist, and account the child's slots to MM_SWAPENTS.

Duplicating HPAGE_PMD_NR slots one at a time would be wasteful, so give
swap_dup_entry_direct() an nr argument and rename it accordingly. Unlike
the put side it hands nr straight to the per-cluster helper, so the range
has to sit inside one cluster - which it does, since SWAPFILE_CLUSTER ==
HPAGE_PMD_NR under CONFIG_THP_SWAP and a PMD-order folio's slots are only
ever allocated at a cluster head. Reject a crossing range with -EINVAL so a
future caller cannot walk off the end of the swap table.

The GFP_ATOMIC extend-table allocation inside the dup can fail;
copy_huge_pmd() then drops both PMD locks and retries once with
GFP_KERNEL. Bound it to one retry, because swap_retry_table_alloc() also
returns 0 when it decides the table is not needed. Normalise any remaining
failure to -ENOMEM: copy_pmd_range() treats every other error as "not a
huge PMD" and would then reach pmd_none_or_clear_bad(), clearing the source
PMD and leaking its swap slots.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 include/linux/swap.h |  4 +--
 mm/huge_memory.c     | 65 +++++++++++++++++++++++++++++++++++++++-----
 mm/memory.c          |  4 +--
 mm/swap.h            |  5 ++--
 mm/swapfile.c        | 58 +++++++++++++++++++++++++++++----------
 5 files changed, 109 insertions(+), 27 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 43155e122b5c3..0c3006ece1ca5 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -414,7 +414,7 @@ sector_t swap_folio_sector(struct folio *folio);
  * All entries must be allocated by folio_alloc_swap(). And they must have
  * a swap count > 1. See comments of folio_*_swap helpers for more info.
  */
-int swap_dup_entry_direct(swp_entry_t entry);
+int swap_dup_entries_direct(swp_entry_t entry, int nr);
 void swap_put_entries_direct(swp_entry_t entry, int nr);
 
 /*
@@ -458,7 +458,7 @@ static inline void free_swap_cache(struct folio *folio)
 {
 }
 
-static inline int swap_dup_entry_direct(swp_entry_t ent)
+static inline int swap_dup_entries_direct(swp_entry_t ent, int nr)
 {
 	return 0;
 }
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 0e347a545588c..6dfe8ef6dd371 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1894,7 +1894,7 @@ bool touch_pmd(struct vm_area_struct *vma, unsigned long addr,
 	return false;
 }
 
-static void copy_huge_non_present_pmd(
+static int copy_huge_non_present_pmd(
 		struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
 		struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
@@ -1940,14 +1940,40 @@ static void copy_huge_non_present_pmd(
 		 */
 		folio_try_dup_anon_rmap_pmd(src_folio, &src_folio->page,
 					    dst_vma, src_vma);
+	} else if (softleaf_is_swap(entry)) {
+		int err;
+
+		/*
+		 * PMD swap entry: duplicate swap references and clear
+		 * exclusive on source, matching copy_nonpresent_pte().
+		 *
+		 * A PMD swap entry only exists under CONFIG_THP_SWAP, where
+		 * SWAPFILE_CLUSTER == HPAGE_PMD_NR, and it is cluster aligned,
+		 * so these HPAGE_PMD_NR slots are exactly one cluster - which
+		 * is what swap_dup_entries_direct() requires.
+		 */
+		err = swap_dup_entries_direct(entry, HPAGE_PMD_NR);
+		if (err < 0)
+			return err;
+
+		mm_prepare_for_swap_entries(dst_mm);
+
+		if (pmd_swp_exclusive(pmd)) {
+			pmd = pmd_swp_clear_exclusive(pmd);
+			set_pmd_at(src_mm, addr, src_pmd, pmd);
+		}
 	}
 
-	add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
+	if (softleaf_is_swap(entry))
+		add_mm_counter(dst_mm, MM_SWAPENTS, HPAGE_PMD_NR);
+	else
+		add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 	mm_inc_nr_ptes(dst_mm);
 	pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
 	if (!userfaultfd_protected(dst_vma))
 		pmd = pmd_swp_clear_uffd(pmd);
 	set_pmd_at(dst_mm, addr, dst_pmd, pmd);
+	return 0;
 }
 
 int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
@@ -1957,6 +1983,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	spinlock_t *dst_ptl, *src_ptl;
 	struct page *src_page;
 	struct folio *src_folio;
+	bool retried = false;
 	pmd_t pmd;
 	pgtable_t pgtable = NULL;
 	int ret = -ENOMEM;
@@ -1988,6 +2015,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	if (unlikely(!pgtable))
 		goto out;
 
+retry:
 	dst_ptl = pmd_lock(dst_mm, dst_pmd);
 	src_ptl = pmd_lockptr(src_mm, src_pmd);
 	spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
@@ -1995,11 +2023,34 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	ret = -EAGAIN;
 	pmd = *src_pmd;
 
-	if (unlikely(thp_migration_supported() &&
-		     pmd_is_valid_softleaf(pmd))) {
-		copy_huge_non_present_pmd(dst_mm, src_mm, dst_pmd, src_pmd, addr,
-					  dst_vma, src_vma, pmd, pgtable);
-		ret = 0;
+	if (unlikely(pmd_is_valid_softleaf(pmd))) {
+		ret = copy_huge_non_present_pmd(dst_mm, src_mm, dst_pmd, src_pmd,
+						addr, dst_vma, src_vma, pmd,
+						pgtable);
+		if (ret) {
+			spin_unlock(src_ptl);
+			spin_unlock(dst_ptl);
+			/*
+			 * For PMD swap entries -ENOMEM means the per-cluster
+			 * swap-extend table couldn't be GFP_ATOMIC-allocated.
+			 * Try the GFP_KERNEL fallback once before giving up.
+			 * swap_retry_table_alloc() also returns 0 when it
+			 * decides the table is not needed after all, so bound
+			 * this to a single retry rather than looping on it.
+			 */
+			if (ret == -ENOMEM && !retried) {
+				softleaf_t entry = softleaf_from_pmd(pmd);
+
+				retried = true;
+				if (softleaf_is_swap(entry) &&
+				    !swap_retry_table_alloc(entry, HPAGE_PMD_NR,
+							    GFP_KERNEL))
+					goto retry;
+			}
+			pte_free(dst_mm, pgtable);
+			ret = -ENOMEM;
+			goto out;
+		}
 		goto out_unlock;
 	}
 
diff --git a/mm/memory.c b/mm/memory.c
index 477d7e359b447..84e1e1c22bffa 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -979,7 +979,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	struct page *page;
 
 	if (likely(softleaf_is_swap(entry))) {
-		if (swap_dup_entry_direct(entry) < 0)
+		if (swap_dup_entries_direct(entry, 1) < 0)
 			return -EIO;
 
 		mm_prepare_for_swap_entries(dst_mm);
@@ -1394,7 +1394,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 
 	if (ret == -EIO) {
 		VM_WARN_ON_ONCE(!entry.val);
-		if (swap_retry_table_alloc(entry, GFP_KERNEL) < 0) {
+		if (swap_retry_table_alloc(entry, 1, GFP_KERNEL) < 0) {
 			ret = -ENOMEM;
 			goto out;
 		}
diff --git a/mm/swap.h b/mm/swap.h
index b3b54c28929a1..2321c9a2c2c58 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -222,7 +222,7 @@ static inline void swap_cluster_unlock_irq(struct swap_cluster_info *ci)
 	spin_unlock_irq(&ci->lock);
 }
 
-extern int swap_retry_table_alloc(swp_entry_t entry, gfp_t gfp);
+int swap_retry_table_alloc(swp_entry_t entry, unsigned int nr, gfp_t gfp);
 
 /*
  * Below are the core routines for doing swap for a folio.
@@ -428,7 +428,8 @@ static inline int swap_writeout(struct swap_io_ctx *ctx, struct folio *folio)
 	return 0;
 }
 
-static inline int swap_retry_table_alloc(swp_entry_t entry, gfp_t gfp)
+static inline int swap_retry_table_alloc(swp_entry_t entry, unsigned int nr,
+					 gfp_t gfp)
 {
 	return -EINVAL;
 }
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 280dd906eb187..27ae3964a158e 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1468,11 +1468,16 @@ static bool swap_sync_discard(void)
 
 static int swap_extend_table_alloc(struct swap_info_struct *si,
 				   struct swap_cluster_info *ci,
-				   unsigned int ci_off, gfp_t gfp)
+				   unsigned int ci_off, unsigned int nr,
+				   gfp_t gfp)
 {
 	int count;
+	unsigned int i;
 	void *table;
 
+	/* The range must not run past the end of @ci's swap table. */
+	VM_WARN_ON_ONCE(ci_off + nr > SWAPFILE_CLUSTER);
+
 	table = kzalloc(sizeof(ci->extend_table[0]) * SWAPFILE_CLUSTER, gfp);
 	if (!table)
 		return -ENOMEM;
@@ -1486,15 +1491,21 @@ static int swap_extend_table_alloc(struct swap_info_struct *si,
 	 */
 	if (!cluster_table_is_alloced(ci))
 		goto out_free;
-	count = swp_tb_get_count(__swap_table_get(ci, ci_off));
-	if (count < (SWP_TB_COUNT_MAX - 1))
-		goto out_free;
 	if (ci->extend_table)
 		goto out_free;
-
-	ci->extend_table = table;
-	spin_unlock(&ci->lock);
-	return 0;
+	/*
+	 * The caller may not know which slot in [ci_off, ci_off + nr) hit
+	 * SWP_TB_COUNT_MAX - 1. Confirm at least one slot in the range still
+	 * needs the extend table before committing the allocation.
+	 */
+	for (i = 0; i < nr; i++) {
+		count = swp_tb_get_count(__swap_table_get(ci, ci_off + i));
+		if (count >= (SWP_TB_COUNT_MAX - 1)) {
+			ci->extend_table = table;
+			spin_unlock(&ci->lock);
+			return 0;
+		}
+	}
 
 out_free:
 	spin_unlock(&ci->lock);
@@ -1502,7 +1513,7 @@ static int swap_extend_table_alloc(struct swap_info_struct *si,
 	return 0;
 }
 
-int swap_retry_table_alloc(swp_entry_t entry, gfp_t gfp)
+int swap_retry_table_alloc(swp_entry_t entry, unsigned int nr, gfp_t gfp)
 {
 	int ret;
 	struct swap_info_struct *si;
@@ -1514,7 +1525,8 @@ int swap_retry_table_alloc(swp_entry_t entry, gfp_t gfp)
 		return 0;
 
 	ci = __swap_offset_to_cluster(si, offset);
-	ret = swap_extend_table_alloc(si, ci, swp_cluster_offset(entry), gfp);
+	ret = swap_extend_table_alloc(si, ci, swp_cluster_offset(entry), nr,
+				      gfp);
 
 	put_swap_device(si);
 	return ret;
@@ -1690,6 +1702,9 @@ static int __swap_cluster_dup_entry(struct swap_cluster_info *ci,
  * @offset: start offset of slots.
  * @nr: number of slots.
  *
+ * The range [offset, offset + nr) must not cross a cluster boundary; the
+ * caller is responsible for splitting a range that can.
+ *
  * Context: The specified slots must be pinned by existing swap count or swap
  * cache reference, so they won't be released until this helper returns.
  * Return: 0 on success. -ENOMEM if the swap count maxed out (SWP_TB_COUNT_MAX)
@@ -1704,6 +1719,7 @@ static int swap_dup_entries_cluster(struct swap_info_struct *si,
 
 	ci_start = offset % SWAPFILE_CLUSTER;
 	ci_end = ci_start + nr;
+	VM_WARN_ON_ONCE(ci_end > SWAPFILE_CLUSTER);
 	ci_off = ci_start;
 	ci = swap_cluster_lock(si, offset);
 restart:
@@ -1712,7 +1728,8 @@ static int swap_dup_entries_cluster(struct swap_info_struct *si,
 		if (unlikely(err)) {
 			if (err == -ENOMEM) {
 				spin_unlock(&ci->lock);
-				err = swap_extend_table_alloc(si, ci, ci_off, GFP_ATOMIC);
+				err = swap_extend_table_alloc(si, ci, ci_off, 1,
+							      GFP_ATOMIC);
 				spin_lock(&ci->lock);
 				if (!err)
 					goto restart;
@@ -1723,6 +1740,7 @@ static int swap_dup_entries_cluster(struct swap_info_struct *si,
 	swap_cluster_unlock(ci);
 	return 0;
 failed:
+	/* The caller's page-table or swap-cache reference pins every slot. */
 	while (ci_off-- > ci_start)
 		__swap_cluster_put_entry(ci, ci_off);
 	swap_cluster_unlock(ci);
@@ -3966,8 +3984,9 @@ void si_swapinfo(struct sysinfo *val)
 }
 
 /*
- * swap_dup_entry_direct() - Increase reference count of a swap entry by one.
+ * swap_dup_entries_direct() - Increase reference count of swap entries by one.
  * @entry: first swap entry from which we want to increase the refcount.
+ * @nr: number of contiguous swap entries to duplicate.
  *
  * Returns 0 for success, or -ENOMEM if the extend table is required
  * but could not be atomically allocated.  Returns -EINVAL if the swap
@@ -3978,8 +3997,16 @@ void si_swapinfo(struct sysinfo *val)
  * owner. e.g., locking the PTL of a PTE containing the entry being increased.
  * Also the swap entry must have a count >= 1. Otherwise folio_dup_swap should
  * be used.
+ *
+ * Unlike swap_put_entries_direct(), the whole range [entry, entry + nr) must
+ * lie within one swap cluster; a range that crosses a cluster boundary is
+ * rejected with -EINVAL. The only caller passing nr > 1 is the PMD swap entry
+ * fork path: a PMD swap entry can only exist with CONFIG_THP_SWAP, where
+ * SWAPFILE_CLUSTER == HPAGE_PMD_NR, and a PMD-order folio's slots are only ever
+ * allocated at a cluster head (see alloc_swap_scan_cluster()), so such a range
+ * is exactly one cluster.
  */
-int swap_dup_entry_direct(swp_entry_t entry)
+int swap_dup_entries_direct(swp_entry_t entry, int nr)
 {
 	struct swap_info_struct *si;
 
@@ -3989,6 +4016,9 @@ int swap_dup_entry_direct(swp_entry_t entry)
 		return -EINVAL;
 	}
 
+	if (WARN_ON_ONCE(swp_cluster_offset(entry) + nr > SWAPFILE_CLUSTER))
+		return -EINVAL;
+
 	/*
 	 * The caller must be increasing the swap count from a direct
 	 * reference of the swap slot (e.g. a swap entry in page table).
@@ -3996,7 +4026,7 @@ int swap_dup_entry_direct(swp_entry_t entry)
 	 */
 	VM_WARN_ON_ONCE(!swap_entry_swapped(si, entry));
 
-	return swap_dup_entries_cluster(si, swp_offset(entry), 1);
+	return swap_dup_entries_cluster(si, swp_offset(entry), nr);
 }
 
 #if defined(CONFIG_MEMCG) && defined(CONFIG_BLK_CGROUP)
-- 
2.53.0-Meta

