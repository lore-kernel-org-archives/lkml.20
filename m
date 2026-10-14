Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698BA566C7A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997955; cv=none; b=tbkzSjpSlSPOoLldrZbAjtMFeGfVnQy83R97m5o0vd1eJ38Dhqf4VctHdiSQPoAo+zVMBN8tRFF3jYkzzt8FScml23Hqg5arqL2DlT8yihvCUvnQ55unxDj4nvFUyoxUvpD1S6leDEKPcwBGAGiCJ/nCWMZwYiFCo3fvTojLC7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997955; c=relaxed/simple;
	bh=efJcrtJEgBkbgGN0LLES/7Yq0v9iKiMKrmQ7Rb0kFZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFEBjiNazGyKZMXgJO44wOP7pvoulad4C99D3XCLlpZ2HyRxzor0YUNU1g2DKJe2vZz6XSVA9GjWzUGG+JOlgAIGm1Wbh6FNItGs3KVLYU+mZzkBFOeW4aBPWFAHF3vZk4pXs2qNZcZUIfFFUHGZ3OJmjsBHB8SWUnZ/gZs7b6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNmeLYlY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNmeLYlY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D071F000C6;
	Wed, 14 Oct 2026 17:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791997947;
	bh=ZMygL6tdcXkGQmCA0q+zGPfiICl+7Rxhfn/hlR4DJtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gNmeLYlYnwD2gp0bWiHbksr3cyGdlKBCod1rbDZ1NzRryWrLxscMJaIig0mtflZVm
	 Typ8HQQgXsFlAMtiQU/NPygM/SUWefgfC7nHIKcaoy8pI4nSYzQ232cRWcx2AbzBtn
	 OBtxg/jGg6ThUuock+eIy0t5lzsIf6UR5id2W2iAIdMr3+kZHAKn/yJlSN0U9dMuAM
	 kbRjPUhDWzML7ceskn51ZvmBTyKTWJhs7kqjFXZl+/zD4I+zbsrMCcOF8qt/LTbKAG
	 YyzASJedXmDZyY9JDnG6QcwAEhe9f7+3EDlgfE7LndgkHfa7YREnMNYqALuNS8DZ1l
	 IuHxNrQuywI1g==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.ams.internal (Postfix) with ESMTP id 735481980047;
	Wed, 14 Oct 2026 13:12:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 14 Oct 2026 13:12:25 -0400
X-ME-Sender: <xms:97fPakxIYQPbsz8wP6dce_H20nak4j1UivTrMIC_tECbvWeqeUfG_w>
    <xme:97fPakPPtK7tzzn2ld8eT3AUaDTih3hK3HZGIl1OM9_0b0SJvHEjp-uAHd7PBMBAZ
    sbauJN9I0JT60PC9FPMMlYoatB5ltXVT2X_aCeq2QIR8P8iYs0tOw>
X-ME-Received: <xmr:97fPascN2MN0clQiMMfkOhtfRpSnbyRTjQp8S2q1IDz3GzsR2TCQ_JBikys>
X-ME-Proxy-Cause: dmFkZTGg3k0TVKsEP7CfoR57WWB+3h574BO5vjP4iWax6f9GidZ8szHobtaOvLAEbPCZ2m
    mw+y4/PWP+fl/ZrEvowyJM606Aqux2KjdkbOrs1qTyDsxUDjHhZTWksnA7am7MGg9VukjB
    qcXL+mBtcoMF0nKIYV1Ko0CB5fx2IplfPHhSynDMYzb+URxJm2HhB9bzqvrzy4Cvkw3z4+
    1ufb70dVHftr+eFTK65fTPkzZfMFIkT+fPjngxsm3eiPLOeyYT2uqJ47ZuQsB+0l7i804Q
    fk/9VtLe5apNPJHA5iwMfFjFMaiWANNYkGgKJdhqeFkBwi3mvIJ1y0E25HLDGDGvYAjfQ7
    4OP/V9or1Dp/xJ8pXspREyO4zLjjXzFK6Pk7NMRjJn1HJBNQ58bpjda3gjg7LFni0L/ERI
    GGRL8/FtLtNjcqq9APK0fpSep5ImRYsIdDHeQFtjX7gRL1sehNG5YWLliYRMqlyZhXRBNA
    WhpHXcq+l2c9UiV/F/HeismH2Ke+mLKfrI2jIOzZdcG7lNCgdSVdPLEhXXaqFjt8GRv6Z5
    UvhcyTXsR4eu7XV/8GfeASGl4UChbJiL/6go9RacnR2MfUfgKgI98WBMx/yqg91CRqQ0ke
    4LyLmpgVvOv48sIgZWMwG87MxWRZ2zelIMFobAloE6YI02PLypdtWa0zV/6g
X-ME-Proxy: <xmx:97fPao6AeOfhqNO9-IdP2knOhvmO_jrjPFqXVLb5SW5-1eF-47wQ-Q>
    <xmx:97fPakIDdoWKtC5bFwOQxTzGmDEWQMv1rDDOK1B0Mi9tr3CJIUtFtw>
    <xmx:97fPas5KLbSKpXeVEQ1Gz8kki3bofV3E8N2qXKBvBpMr6JIaNim9zw>
    <xmx:97fPajYNBU2KUjFloL6KH4J_K1S6N5faPIKFAI2BhtKIKzbDjQp88Q>
    <xmx:-LfPajy757jmFa41cAooZebyzX7TbAm5PhfaOFOqDf5_0Zu9eNBJ7qeW>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Oct 2026 13:12:23 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v5 9/9] mm/collapse: separate scanning a PTE table from collapsing it
Date: Wed, 14 Oct 2026 18:11:42 +0100
Message-ID: <20261014171145.3292736-10-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014171145.3292736-1-kas@kernel.org>
References: <20261014171145.3292736-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A collapse is two jobs.  One reads a PTE table under mmap_lock and decides
whether the range is worth collapsing.  The other allocates, isolates,
copies and flushes, and wants the lock given up first.

collapse_single_pmd() did both, so the boundary between them was somewhere
in the middle of a function.

Give each half its own function:

  - collapse_scan_pmd() scans one table.  It picks the side:
    collapse_scan_anon(), the anonymous scan that used to carry the
    collapse_scan_pmd() name, or collapse_scan_file().

  - collapse_pmd() does the collapse the scan asked for, and is handed
    what the scan returned.  SCAN_SUCCEED means there is something to
    collapse.  SCAN_PTE_MAPPED_HUGEPAGE means the page cache already
    holds the PMD folio and only the PTE table is left to retract.
    Anything else is why there is nothing to do.  It calls
    collapse_anon(), formerly mthp_collapse(), or collapse_file().

For now collapse_single_pmd() stays, as the two of them with the
mmap_lock drop in between, so its callers see what they saw before.
collapse_control_init() sets a control up before its first scan.

What the scan found and the collapse needs travels in collapse_control.
For an anonymous table that is the orders and the referenced and
swapped-out counts.  collapse_anon() and collapse_huge_page() now read
them from there instead of taking them as arguments.

For a file it is the file itself and the offset in it.  A file collapse
works on the page cache and never sees a VMA, so the scan takes the
reference while it still has one and the collapse gives it back.

The file scan moves under mmap_lock with the anonymous one, where before
the lock was given up first.  The lock is now held over the page cache
walk, an RCU walk over one table's worth of slots with no PTL, and taken
fewer times.  collapse_scan_mm_slot() ends its walk whenever the lock was
dropped, so a refused file table used to cost khugepaged an unlock, a
trip back through khugepaged_do_scan(), a relock and a VMA lookup.  Now
only a table that goes on to be collapsed does.

Assisted-by: LLM
Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/collapse.h   |  18 ++++++
 mm/khugepaged.c | 151 +++++++++++++++++++++++++++++++-----------------
 2 files changed, 117 insertions(+), 52 deletions(-)

diff --git a/mm/collapse.h b/mm/collapse.h
index dcd117071955..759ec9cd4541 100644
--- a/mm/collapse.h
+++ b/mm/collapse.h
@@ -98,6 +98,24 @@ struct collapse_control {
 
 	/* Each bit marks a PTE the scan accepted as a collapse source */
 	DECLARE_BITMAP(eligible_ptes, MAX_PTRS_PER_PTE);
+
+	/*
+	 * What a scan found and the collapse after it needs.  Live only between
+	 * the two, and read by nobody else.
+	 */
+
+	/* Anonymous only: orders to try, referenced and swap PTE counts */
+	unsigned long scan_orders;
+	int scan_referenced;
+	int scan_unmapped;
+
+	/*
+	 * File only.  A file collapse works on the page cache and never sees a
+	 * VMA, so the scan takes a reference to the file while it still has
+	 * one, and the collapse gives it back.
+	 */
+	struct file *scan_file;
+	pgoff_t scan_pgoff;
 };
 
 #endif	/* __MM_COLLAPSE_H */
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 89a4c3f5a91c..88254cba8dd9 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -646,7 +646,7 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 			goto out;
 		}
 
-		/* See collapse_scan_pmd(). */
+		/* See collapse_scan_anon(). */
 		if (folio_maybe_mapped_shared(folio)) {
 			/*
 			 * TODO: Support shared pages without leading to further
@@ -1099,7 +1099,7 @@ static enum scan_result check_pmd_still_valid(struct mm_struct *mm,
 
 /*
  * Bring missing pages in from swap, to complete THP collapse.
- * Only done if collapse_scan_pmd() believes it is worthwhile.
+ * Only done if collapse_scan_anon() believes it is worthwhile.
  *
  * For mTHP orders the function bails on the first swap entry, because
  * faulting pages back in during collapse could re-populate PTEs that
@@ -1235,8 +1235,8 @@ static enum scan_result alloc_charge_folio(struct folio **foliop, struct mm_stru
  * while allocating a THP, as that could trigger direct reclaim/compaction.
  * Note that the VMA must be rechecked after grabbing the mmap_lock again.
  */
-static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long start_addr,
-		int referenced, int unmapped, struct collapse_control *cc,
+static enum scan_result collapse_huge_page(struct mm_struct *mm,
+		unsigned long start_addr, struct collapse_control *cc,
 		unsigned int order)
 {
 	const unsigned long pmd_addr = start_addr & HPAGE_PMD_MASK;
@@ -1275,14 +1275,14 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long s
 		goto out_nolock;
 	}
 
-	if (unmapped) {
+	if (cc->scan_unmapped) {
 		/*
 		 * __collapse_huge_page_swapin() will return with mmap_lock
 		 * released when it fails. So we jump out_nolock directly in
 		 * that case.  Continuing to collapse causes inconsistency.
 		 */
 		result = __collapse_huge_page_swapin(mm, vma, start_addr, pmd,
-						     referenced, order);
+						     cc->scan_referenced, order);
 		if (result != SCAN_SUCCEED)
 			goto out_nolock;
 	}
@@ -1430,8 +1430,8 @@ static unsigned int max_order_from_offset(unsigned int offset)
 }
 
 /*
- * mthp_collapse() consumes the bitmap that is generated during
- * collapse_scan_pmd() to determine what regions and mTHP orders fit best.
+ * collapse_anon() consumes the bitmap that is generated during
+ * collapse_scan_anon() to determine what regions and mTHP orders fit best.
  *
  * Each bit in cc->eligible_ptes marks a PTE the scan accepted as a collapse
  * source. We start at the PMD order and check if it is eligible for collapse;
@@ -1446,9 +1446,8 @@ static unsigned int max_order_from_offset(unsigned int offset)
  * If a collapse is permitted, we attempt to collapse the PTE range into a
  * mTHP.
  */
-static enum scan_result mthp_collapse(struct mm_struct *mm,
-		unsigned long address, int referenced, int unmapped,
-		struct collapse_control *cc, unsigned long enabled_orders)
+static enum scan_result collapse_anon(struct mm_struct *mm,
+		unsigned long address, struct collapse_control *cc)
 {
 	unsigned int nr_eligible_ptes, nr_ptes, max_ptes_none;
 	enum scan_result last_result = SCAN_FAIL;
@@ -1461,7 +1460,7 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
 	while (offset < HPAGE_PMD_NR) {
 		nr_ptes = 1UL << order;
 
-		if (!test_bit(order, &enabled_orders))
+		if (!test_bit(order, &cc->scan_orders))
 			goto next_order;
 
 		max_ptes_none = collapse_max_ptes_none(cc, NULL, order);
@@ -1469,19 +1468,18 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
 						      offset + nr_ptes);
 
 		/*
-		 * Swap PTEs accepted during the scan are counted in @unmapped,
-		 * not in cc->eligible_ptes. Account them for the PMD-order
-		 * candidate.
+		 * Swap PTEs accepted during the scan are counted in
+		 * cc->scan_unmapped, not in cc->eligible_ptes. Account them for
+		 * the PMD-order candidate.
 		 */
 		if (is_pmd_order(order))
-			nr_eligible_ptes += unmapped;
+			nr_eligible_ptes += cc->scan_unmapped;
 
 		if (nr_eligible_ptes >= nr_ptes - max_ptes_none) {
 			enum scan_result ret;
 
 			collapse_address = address + offset * PAGE_SIZE;
-			ret = collapse_huge_page(mm, collapse_address, referenced,
-						 unmapped, cc, order);
+			ret = collapse_huge_page(mm, collapse_address, cc, order);
 
 			switch (ret) {
 			/* Cases where we continue to next collapse candidate */
@@ -1523,7 +1521,7 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
 		 * we must always move to the next offset.
 		 */
 		if (order > COLLAPSE_MIN_MTHP_ORDER &&
-		    (enabled_orders & GENMASK(order - 1, 0))) {
+		    (cc->scan_orders & GENMASK(order - 1, 0))) {
 			order--;
 			continue;
 		}
@@ -1548,14 +1546,14 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
 	return last_result;
 }
 
-static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
-		struct vm_area_struct *vma, unsigned long start_addr,
-		bool *lock_dropped, struct collapse_control *cc)
+static enum scan_result collapse_scan_anon(struct vm_area_struct *vma,
+		unsigned long start_addr, struct collapse_control *cc)
 {
 	const unsigned int max_ptes_shared = collapse_max_ptes_shared(cc, HPAGE_PMD_ORDER);
 	const unsigned int max_ptes_swap = collapse_max_ptes_swap(cc, HPAGE_PMD_ORDER);
 	unsigned int max_ptes_none = collapse_max_ptes_none(cc, vma, HPAGE_PMD_ORDER);
 	enum tva_type tva_flags = cc->policy.tva_type;
+	struct mm_struct *mm = vma->vm_mm;
 	pmd_t *pmd;
 	pte_t *pte, *_pte, pteval;
 	int i;
@@ -1584,7 +1582,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 	/*
 	 * If PMD is the only enabled order, enforce max_ptes_none, otherwise
 	 * scan all pages to populate the bitmap for mTHP collapse. The bitmap
-	 * is then checked again in mthp_collapse() for each attempted order.
+	 * is then checked again in collapse_anon() for each attempted order.
 	 */
 	if (enabled_orders != BIT(HPAGE_PMD_ORDER))
 		max_ptes_none = COLLAPSE_MAX_PTES_LIMIT;
@@ -1735,12 +1733,9 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 out_unmap:
 	pte_unmap_unlock(pte, ptl);
 	if (result == SCAN_SUCCEED) {
-		/* collapse_huge_page() expects the lock to be dropped before calling */
-		mmap_read_unlock(mm);
-		result = mthp_collapse(mm, start_addr, referenced,
-				       unmapped, cc, enabled_orders);
-		/* mmap_lock was released above, set lock_dropped */
-		*lock_dropped = true;
+		cc->scan_orders = enabled_orders;
+		cc->scan_referenced = referenced;
+		cc->scan_unmapped = unmapped;
 	}
 out:
 	trace_mm_khugepaged_scan_pmd(mm, failed_pfn, referenced,
@@ -2742,41 +2737,67 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 		count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
 	}
 
-	trace_mm_khugepaged_scan_file(mm, failed_pfn, file, present, swap, result);
+	trace_mm_khugepaged_scan_file(mm, failed_pfn, file, present, swap,
+				      result);
 	return result;
 }
 
-/*
- * Try to collapse a single PMD starting at a PMD aligned addr, and return
- * the results.
- */
-static enum scan_result collapse_single_pmd(unsigned long addr,
-		struct vm_area_struct *vma, bool *lock_dropped,
-		struct collapse_control *cc)
+static void collapse_control_init(struct collapse_control *cc)
+{
+	cc->progress = 0;
+	cc->scan_file = NULL;
+}
+
+static enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
+		unsigned long addr, struct collapse_control *cc)
 {
-	struct mm_struct *mm = vma->vm_mm;
-	bool triggered_wb = false;
 	enum scan_result result;
-	struct file *file;
 	pgoff_t pgoff;
 
-	mmap_assert_locked(mm);
+	mmap_assert_locked(vma->vm_mm);
+	/* A scan that found work has to have been followed by collapse_pmd() */
+	if (WARN_ON_ONCE(cc->scan_file)) {
+		fput(cc->scan_file);
+		cc->scan_file = NULL;
+	}
 
 	if (vma_is_anonymous(vma))
-		return collapse_scan_pmd(mm, vma, addr, lock_dropped, cc);
+		return collapse_scan_anon(vma, addr, cc);
 
-	file = get_file(vma->vm_file);
 	pgoff = linear_page_index(vma, addr);
-
-	mmap_read_unlock(mm);
-	*lock_dropped = true;
-
+	result = collapse_scan_file(vma->vm_mm, addr, vma->vm_file, pgoff, cc);
 	/*
 	 * SCAN_PTE_MAPPED_HUGEPAGE is work too: the page cache already holds
-	 * the PMD folio, and only the PTE table is left to retract.
+	 * the PMD folio, and collapse_pmd() still has to retract the PTE table.
 	 */
-	result = collapse_scan_file(mm, addr, file, pgoff, cc);
-	if (result != SCAN_SUCCEED)
+	if (result != SCAN_SUCCEED && result != SCAN_PTE_MAPPED_HUGEPAGE)
+		return result;
+
+	/*
+	 * A file collapse works on the page cache and never sees a VMA, so take
+	 * what it needs from this one while it is still here.
+	 */
+	cc->scan_file = get_file(vma->vm_file);
+	cc->scan_pgoff = pgoff;
+	return result;
+}
+
+static enum scan_result collapse_pmd(struct mm_struct *mm,
+		unsigned long addr, enum scan_result result,
+		struct collapse_control *cc)
+{
+	struct file *file = cc->scan_file;
+	bool triggered_wb = false;
+	pgoff_t pgoff;
+
+	if (!file)
+		return collapse_anon(mm, addr, cc);
+
+	cc->scan_file = NULL;
+	pgoff = cc->scan_pgoff;
+
+	/* The scan found the PMD folio in place: nothing to collapse */
+	if (result == SCAN_PTE_MAPPED_HUGEPAGE)
 		goto put;
 retry:
 	result = collapse_file(mm, addr, file, pgoff, cc);
@@ -2794,6 +2815,10 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 put:
 	fput(file);
 
+	/*
+	 * A PMD folio is in the page cache, whether the collapse just put it
+	 * there or found it: retract the PTE table, and map the PMD if asked.
+	 */
 	if (result == SCAN_PTE_MAPPED_HUGEPAGE) {
 		mmap_read_lock(mm);
 		if (collapse_test_exit_or_disable(mm))
@@ -2808,6 +2833,28 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 	return result;
 }
 
+/*
+ * Try to collapse a single PMD starting at a PMD aligned addr, and return
+ * the results.
+ */
+static enum scan_result collapse_single_pmd(unsigned long addr,
+		struct vm_area_struct *vma, bool *lock_dropped,
+		struct collapse_control *cc)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	enum scan_result result;
+
+	result = collapse_scan_pmd(vma, addr, cc);
+	if (result != SCAN_SUCCEED && result != SCAN_PTE_MAPPED_HUGEPAGE)
+		return result;
+
+	/* The collapse takes its own locks, so give this up */
+	mmap_read_unlock(mm);
+	*lock_dropped = true;
+
+	return collapse_pmd(mm, addr, result, cc);
+}
+
 static void collapse_scan_mm_slot(unsigned int progress_max,
 		enum scan_result *result, struct collapse_control *cc)
 	__releases(&khugepaged_mm_lock)
@@ -2950,9 +2997,9 @@ static void khugepaged_do_scan(struct collapse_control *cc)
 
 	lru_add_drain_all();
 
+	collapse_control_init(cc);
 	collapse_policy_khugepaged(&cc->policy);
 
-	cc->progress = 0;
 	while (true) {
 		cond_resched();
 
@@ -3179,8 +3226,8 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	cc = kmalloc_obj(*cc);
 	if (!cc)
 		return -ENOMEM;
+	collapse_control_init(cc);
 	collapse_policy_madvise(&cc->policy);
-	cc->progress = 0;
 
 	lru_add_drain_all();
 
-- 
2.54.0

