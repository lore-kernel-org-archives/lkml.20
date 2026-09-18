Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFB354705D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789703940; cv=none; b=F8dAnNfC55YpJLV6URhHTA6Ma3s1Dbv5H/+XtrNqhEyi8E9bXfVQwItXBQ2Vy0t6WQqy6DJ6sZUk0kAOp/h/aBABWvB9aoGjxLWFnKX5lkki8O9TbbLydUC8EWjVKpM3RIk3pe8750bI6pObwdJenPQfILSnery8LMbDh9/78RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789703940; c=relaxed/simple;
	bh=kV5nodOYBBXhHpLhXDlQndjB5MFGzuNitcOvqrzcyxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CCHQqf5zINC17XkO+RDJ/ktR2vGFzE45UgAS2/D2Ux1QCDvIac+cDCI4IZqZQlcg5i4j8jTotI5gM1vIPgRcZLPKMGxrtF1qzUYCa3BZ1mI1B/LUpr2+VcdXgruBdPEFZjm9mQm+53swyFrF+39W3zIS/Q8SkP75hgKJEcC+7sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=X+/AthxS; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="X+/AthxS"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789703936; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=GVLNVVgni+ygI11Mkg6WFcdyrUYsnS6Lm8jx1pX0R4A=;
	b=X+/AthxSxY0CnTgVwXl7QmtWDHOoZ0zguAWdxSMgpMLy7Y5VHc3ufPztOluMqtNRlHIGGs3W0IqpIVY+2QgMkJBGS08nJESkrXPEBi+hasbYVWVcSDhYIuQqohXnsWCzJXs1/Lq+8+ipfbsL070uMSBSHutk6TIBEjEpeNfEJ+Y=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XB9uK64_1789703934;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XB9uK64_1789703934 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 11:58:54 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com,
	david@kernel.org
Cc: ziy@nvidia.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	ljs@kernel.org,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] mm: khugepaged: add shmem mTHP collapse support
Date: Fri, 18 Sep 2026 11:58:40 +0800
Message-ID: <0bcc8d5e6cc15670c83c643c0f0527138014fe6a.1789701677.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1789701677.git.baolin.wang@linux.alibaba.com>
References: <cover.1789701677.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Khugepaged already supports the anonymous mTHP collapse. Similarly, let
khugepaged also support the shmem mTHP collapse. The strategy for shmem
mTHP collapse follows the anonymous mTHP collapse:

Track present pages via a bitmap while scanning PMD ranges for collapse
candidates. After the scan completes, use the bitmap to determine the
most efficient mTHP order to collapse to. Scale 'max_ptes_none' by the
attempted collapse order to determine the minimum fill threshold for
eligibility. Similarly, shmem mTHP collapse rejects regions containing
swapped-out pages to avoid creep.

Currently, the collapse_pte_mapped_thp() does not build the mapping for mTHP.
Cause we still expect to establish the mTHP mapping via refault under the
control of fault_around. So collapse_pte_mapped_thp() remains responsible
only for building the mapping for PMD-sized THP, which is reasonable and
makes life easier.

Note that we do not need to remove pte page tables for shmem mTHP collapse.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/khugepaged.c | 100 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 81 insertions(+), 19 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 64605a72ac2b..dba747442461 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -84,6 +84,10 @@ static struct khugepaged_scan khugepaged_scan = {
 	.mm_head = LIST_HEAD_INIT(khugepaged_scan.mm_head),
 };
 
+static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
+		struct file *file, pgoff_t start,
+		struct collapse_control *cc, int order);
+
 #ifdef CONFIG_SYSFS
 static ssize_t scan_sleep_millisecs_show(struct kobject *kobj,
 					 struct kobj_attribute *attr,
@@ -1452,7 +1456,11 @@ static enum scan_result mthp_collapse(struct mm_struct *mm, unsigned long addres
 			enum scan_result ret;
 
 			collapse_address = address + offset * PAGE_SIZE;
-			ret = collapse_huge_page(mm, collapse_address, cc, order);
+			if (cc->scan_file)
+				ret = collapse_file(mm, collapse_address, cc->scan_file,
+						cc->scan_pgoff + offset, cc, order);
+			else
+				ret = collapse_huge_page(mm, collapse_address, cc, order);
 
 			switch (ret) {
 			/* Cases where we continue to next collapse candidate */
@@ -1460,6 +1468,13 @@ static enum scan_result mthp_collapse(struct mm_struct *mm, unsigned long addres
 				collapsed += nr_ptes;
 				fallthrough;
 			case SCAN_PTE_MAPPED_HUGEPAGE:
+				/*
+				 * Return SCAN_PTE_MAPPED_HUGEPAGE to call
+				 * collapse_pte_mapped_thp() if the page cache
+				 * already holds the PMD folio.
+				 */
+				if (order == HPAGE_PMD_ORDER)
+					last_result = ret;
 				goto next_offset;
 			/* Cases where lower orders might still succeed */
 			case SCAN_ALLOC_HUGE_PAGE_FAIL:
@@ -1493,7 +1508,7 @@ static enum scan_result mthp_collapse(struct mm_struct *mm, unsigned long addres
 		 * any smaller order enabled. When at the smallest order
 		 * we must always move to the next offset.
 		 */
-		if (order > collapse_min_mthp_order(NULL) &&
+		if (order > collapse_min_mthp_order(cc->scan_file) &&
 		    (cc->scan_orders & GENMASK(order - 1, 0))) {
 			order--;
 			continue;
@@ -2237,7 +2252,8 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 
 				if (++nr_none > max_ptes_none) {
 					result = SCAN_EXCEED_NONE_PTE;
-					count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
+					count_collapse_event(order, THP_SCAN_EXCEED_NONE_PTE,
+							MTHP_STAT_COLLAPSE_EXCEED_NONE);
 					goto xa_locked;
 				}
 
@@ -2247,6 +2263,19 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 
 			if (xa_is_value(folio) || !folio_test_uptodate(folio)) {
 				xas_unlock_irq(&xas);
+
+				/*
+				 * TODO: Support swapin without leading to further mTHP
+				 * collapses. Currently bringing in new pages via swapin may
+				 * cause a future higher order collapse on a rescan of the same
+				 * range.
+				 */
+				if (!is_pmd_order(order)) {
+					count_mthp_stat(order, MTHP_STAT_COLLAPSE_EXCEED_SWAP);
+					result = SCAN_EXCEED_SWAP_PTE;
+					goto xa_unlocked;
+				}
+
 				/* swap in or instantiate fallocated page */
 				if (shmem_get_folio(mapping->host, index, 0,
 						&folio, SGP_NOALLOC)) {
@@ -2330,6 +2359,15 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 			goto out_unlock;
 		}
 
+		/*
+		 * If the folio order is greater than the collapse order, there is
+		 * no need to continue attempting to collapse.
+		 */
+		if (folio_order(folio) >= order) {
+			result = SCAN_PTE_MAPPED_HUGEPAGE;
+			goto out_unlock;
+		}
+
 		if (folio_mapping(folio) != mapping) {
 			result = SCAN_TRUNCATED;
 			goto out_unlock;
@@ -2552,10 +2590,11 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	xas_unlock_irq(&xas);
 
 	/*
-	 * Remove pte page tables, so we can re-fault the page as huge.  A
-	 * caller that wants the PMD mapped now is told to go and do that.
+	 * Remove pte page tables for PMD-sized THP collapse, so we can
+	 * re-fault the page as huge.
 	 */
-	retract_page_tables(mapping, start);
+	if (is_pmd_order(order))
+		retract_page_tables(mapping, start);
 	if (cc->policy.install_pmd)
 		result = SCAN_PTE_MAPPED_HUGEPAGE;
 	folio_unlock(new_folio);
@@ -2606,10 +2645,11 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 }
 
 static enum scan_result collapse_scan_file(struct vm_area_struct *vma,
-		unsigned long addr, struct collapse_control *cc)
+		unsigned long addr, struct collapse_control *cc,
+		unsigned long enabled_orders)
 {
-	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, NULL, HPAGE_PMD_ORDER);
 	const unsigned int max_ptes_swap = collapse_max_ptes_swap(cc, HPAGE_PMD_ORDER);
+	unsigned int max_ptes_none = collapse_max_ptes_none(cc, NULL, HPAGE_PMD_ORDER);
 	struct file *file = vma->vm_file;
 	struct folio *folio = NULL;
 	struct address_space *mapping = file->f_mapping;
@@ -2619,10 +2659,19 @@ static enum scan_result collapse_scan_file(struct vm_area_struct *vma,
 	int node = NUMA_NO_NODE;
 	enum scan_result result = SCAN_SUCCEED;
 	unsigned long failed_pfn = -1;
+	unsigned long nr_pages;
+	pgoff_t pgoff;
 
 	present = 0;
 	swap = 0;
 	collapse_scan_reset(cc);
+	/*
+	 * If PMD is the only enabled order, enforce max_ptes_none, otherwise
+	 * scan all pages to populate the bitmap for mTHP collapse.
+	 */
+	if (enabled_orders != BIT(HPAGE_PMD_ORDER))
+		max_ptes_none = COLLAPSE_MAX_PTES_LIMIT;
+
 	rcu_read_lock();
 	xas_for_each(&xas, folio, start + HPAGE_PMD_NR - 1) {
 		if (xas_retry(&xas, folio))
@@ -2690,7 +2739,17 @@ static enum scan_result collapse_scan_file(struct vm_area_struct *vma,
 		 * is just too costly...
 		 */
 
-		present += folio_nr_pages(folio);
+		nr_pages = folio_nr_pages(folio);
+		present += nr_pages;
+
+		/*
+		 * If there are folios present, keep track of it in the bitmap
+		 * for file/shmem mTHP collapse.
+		 */
+		pgoff = max_t(pgoff_t, start, folio->index) - start;
+		nr_pages = min_t(int, HPAGE_PMD_NR - pgoff, nr_pages);
+		bitmap_set(cc->eligible_ptes, pgoff, nr_pages);
+
 		folio_put(folio);
 
 		if (need_resched()) {
@@ -2706,7 +2765,8 @@ static enum scan_result collapse_scan_file(struct vm_area_struct *vma,
 
 	if (result == SCAN_SUCCEED && present < HPAGE_PMD_NR - max_ptes_none) {
 		result = SCAN_EXCEED_NONE_PTE;
-		count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
+		count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_NONE_PTE,
+				MTHP_STAT_COLLAPSE_EXCEED_NONE);
 	}
 
 	/*
@@ -2721,6 +2781,8 @@ static enum scan_result collapse_scan_file(struct vm_area_struct *vma,
 		 */
 		cc->scan_file = get_file(file);
 		cc->scan_pgoff = start;
+		cc->scan_orders = enabled_orders;
+		cc->scan_unmapped = swap;
 	}
 
 	trace_mm_khugepaged_scan_file(vma->vm_mm, failed_pfn, file, present, swap,
@@ -2778,7 +2840,7 @@ enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
 	if (vma_is_anonymous(vma))
 		return collapse_scan_anon_pmd(vma, addr, cc, orders);
 
-	return collapse_scan_file(vma, addr, cc);
+	return collapse_scan_file(vma, addr, cc, orders);
 }
 
 /*
@@ -2796,23 +2858,21 @@ enum scan_result collapse_run_pmd(struct mm_struct *mm, unsigned long addr,
 {
 	struct file *file = cc->scan_file;
 	bool triggered_wb = false;
-	pgoff_t pgoff;
-
-	if (!file)
-		return mthp_collapse(mm, addr, cc);
-
-	cc->scan_file = NULL;
-	pgoff = cc->scan_pgoff;
 
 	/* The scan found the PMD folio in place: nothing to collapse */
 	if (result == SCAN_PTE_MAPPED_HUGEPAGE)
 		goto retract;
+
 retry:
-	result = collapse_file(mm, addr, file, pgoff, cc, HPAGE_PMD_ORDER);
+	result = mthp_collapse(mm, addr, cc);
+	/* Just return the results for anonymous folio collapse. */
+	if (!file)
+		return result;
 
 	/* Dirty pages are worth a writeback and one more try, if asked for */
 	if (cc->policy.writeback_dirty && result == SCAN_PAGE_DIRTY_OR_WRITEBACK &&
 	    !triggered_wb && mapping_can_writeback(file->f_mapping)) {
+		pgoff_t pgoff = cc->scan_pgoff;
 		const loff_t lstart = (loff_t)pgoff << PAGE_SHIFT;
 		const loff_t lend = lstart + HPAGE_PMD_SIZE - 1;
 
@@ -2821,6 +2881,8 @@ enum scan_result collapse_run_pmd(struct mm_struct *mm, unsigned long addr,
 		goto retry;
 	}
 retract:
+	cc->scan_file = NULL;
+	VM_WARN_ON_ONCE(!file);
 	fput(file);
 
 	/*
-- 
2.47.3

