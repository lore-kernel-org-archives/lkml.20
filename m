Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904096;
	b=Sf6W8CxJdgA3bbSQmryWn7fAvpqKZUkwfopBqBdoo8476NYUhapWJvHxcpVNb1UJ696o
	 tyHCOiy5wNrB7cQEOCXt5X4fB1UEJpYErMK8FcpyrXWjHtneq8DkZhOJZ3ER0p0AMpj7F
	 Mdca4ozgTARJLaGx8v85dUolOyuxqoZ7tF01v7spMyNu+wUGpYfXX5UvORev7sNRf4T2m
	 +URM+U1uQG9BKEYhYXe9U437DNIrkqapdM1wrkcOHXjWJiFL5Ca7/rbgsG0Bw9gmQfHR3
	 kdiMsbuQjX9XgykIFC9AXV8IX6vt6Gu6mJ6yx5ZZM/vjpoSLWkKutLUVohASL2qFz1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904096;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6qkSn5vEAHOMi4HEwjEOPW6fOkRTHM8LC6HdKX5XaNQ=;
	b=BY41BOYeoEfoSN9VycyE7omwiQxAO2+aCvFUuutewLHJtXtcpkg9CC8YL4Vlo6WP38Pq
	 MbIGneZljCjd1HTYhbozxhC3AobqVjJK+dIp27ZehvGfRlhWiVRnpxLuqXg6pWxQOx2rN
	 4HJ+ZlzonfbSBdAX7nhsVM5tWzyZeLTISSZkmAB5kPDuo6OzqLqUQnyVlkN+qHh9TgaeQ
	 ESZTqFC44yHUVqXdhaLY6BPCLYbVpx7RscymSuY88tbPJ+nWCpK6S/sch1URwBrnfcjUC
	 F/2jlPEfv28ZX39IJndA5fJBUotHcybZMx4WHONfOb6m7ZY5j9B6XmkFL2vLMKxfnDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FPeNO+z9;
	arc=none smtp.remote-ip=95.215.58.236
Received: from mta1.migadu.com (out-236.mta1.migadu.com [95.215.58.236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E330A606A337
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E330A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FPeNO+z9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3WlCqjX5I0DI62cy+ntKZLGWmH4JV5TyJqySjCacMLo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904094; v=1; x=1794508894;
 b=FPeNO+z9KSx6PSUXI5gLnlQ+kHdjoduJoVL+iaBJmpoL+TdMNEUZX0kIQl6sfS1gzur+s+Us
 LETwe3BESio3ika+FvH1w6OZ9HP6Dk/T+/n4xOJN3pwt52NSv9BzSxPoRmWZtef/RY25vbr02Ql
 9pw/z5fiAqIkA7EYvwm/8+0A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 346a432d1e363846;
	Thu, 05 Nov 2026 18:41:33 +0000
X-Mizu-Trace-ID: 346a432d1e363846
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: chenhuacai@kernel.org,
	ying.huang@linux.alibaba.com,
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
Subject: [PATCH v9 17/32] mm: swap in PMD swap entries as whole THPs during swapoff
Date: Thu,  5 Nov 2026 10:39:01 -0800
Message-ID: <20261105183940.2236717-18-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105183940.2236717-1-usama.arif@linux.dev>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

swapoff walks every mm and faults every slot of the device back in.
unuse_pte_range() only understands PTEs, so a PMD swap entry would never be
found and swapoff would never complete.

A PMD swap entry is a compact encoding for HPAGE_PMD_NR slots, not a
promise that the swap cache holds one folio for them. Add
swap_pmd_cache_lookup() to classify the covered range as empty, one
PMD-sized folio, or already split, and unuse_pmd() to map the first two
cases back in as one THP, preserving soft-dirty, exclusive and UFFD state.

Everything else falls back to PTEs: a split cache, per-page zswap state, a
failed PMD-order allocation or read, or a poisoned subpage. Check
PageHWPoison on every subpage rather than the folio-level flag, which
memory_failure() only sets after taking the folio lock.

All the fallback reasons are observed without the PMD lock and possibly
after sleeping, so they share one exit that re-checks the PMD is still the
entry we were called for before splitting it. That exit also drops a folio
that is not uptodate, or that has never been mapped, from the swap cache:
the PTE path cannot re-read the first, and would add a single-page rmap to
the second.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/internal.h   |  19 +++++
 mm/swap.h       |  17 +++++
 mm/swap_state.c |  44 +++++++++++
 mm/swapfile.c   | 189 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 269 insertions(+)

diff --git a/mm/internal.h b/mm/internal.h
index 78a7f17b9934f..8a5bbfebe6270 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -28,6 +28,25 @@ struct folio_batch;
 int __copy_remote_mm_str(struct mm_struct *mm, unsigned long addr,
 		void *buf, int len, unsigned int gup_flags);
 
+/*
+ * Check every page in the folio for HWPoison and return true if any is
+ * poisoned.
+ *
+ * Unlike folio_contain_hwpoisoned_page(), this does not rely on the folio-level
+ * PG_has_hwpoisoned, which memory_failure() only sets after taking the folio
+ * lock and so can lag a tail-page poison.
+ */
+static inline bool folio_has_any_hwpoisoned_page(const struct folio *folio)
+{
+	long nr = folio_nr_pages(folio);
+	long i;
+
+	for (i = 0; i < nr; i++)
+		if (PageHWPoison(folio_page(folio, i)))
+			return true;
+	return false;
+}
+
 /* mm/workingset.c */
 bool workingset_test_recent(void *shadow, bool file, bool *workingset,
 			    bool flush);
diff --git a/mm/swap.h b/mm/swap.h
index f028bd10c2cea..cdf18cfadc53b 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -317,6 +317,23 @@ static inline bool folio_matches_swap_entry(const struct folio *folio,
 bool swap_cache_has_folio(swp_entry_t entry);
 struct folio *swap_cache_get_folio(swp_entry_t entry);
 void *swap_cache_get_shadow(swp_entry_t entry);
+enum swap_pmd_cache {
+	SWAP_PMD_CACHE_EMPTY,
+	SWAP_PMD_CACHE_HUGE,
+	SWAP_PMD_CACHE_SPLIT,
+};
+
+#ifdef CONFIG_THP_SWAP
+enum swap_pmd_cache swap_pmd_cache_lookup(swp_entry_t entry,
+					  struct folio **foliop);
+#else
+static inline enum swap_pmd_cache swap_pmd_cache_lookup(swp_entry_t entry,
+							struct folio **foliop)
+{
+	*foliop = NULL;
+	return SWAP_PMD_CACHE_EMPTY;
+}
+#endif
 void swap_cache_del_folio(struct folio *folio);
 struct folio *__swap_cache_alloc_folio(swp_entry_t target_entry, gfp_t gfp_mask,
 				       unsigned long orders, struct vm_fault *vmf,
diff --git a/mm/swap_state.c b/mm/swap_state.c
index f41e740a91b87..89c7812ac03fa 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -135,6 +135,50 @@ bool swap_cache_has_folio(swp_entry_t entry)
 	return swp_tb_is_folio(swp_tb);
 }
 
+#ifdef CONFIG_THP_SWAP
+/**
+ * swap_pmd_cache_lookup - classify the swap cache behind a PMD swap entry
+ * @entry: first swap slot encoded by the PMD swap entry
+ * @foliop: returned PMD-sized folio, with a reference, if present
+ *
+ * A PMD swap entry is a compact page-table encoding for HPAGE_PMD_NR
+ * consecutive swap slots. The swap cache behind those slots can be empty,
+ * one PMD-sized folio, or per-slot folios after the original folio was split.
+ *
+ * Context: Caller must keep @entry valid using the usual swap cache rules.
+ * Return: SWAP_PMD_CACHE_EMPTY if no slot in the PMD range has a cached folio,
+ * SWAP_PMD_CACHE_HUGE if one PMD-sized folio covers the range, or
+ * SWAP_PMD_CACHE_SPLIT if the range needs per-page handling.
+ */
+enum swap_pmd_cache swap_pmd_cache_lookup(swp_entry_t entry,
+					  struct folio **foliop)
+{
+	unsigned int type = swp_type(entry);
+	pgoff_t offset = swp_offset(entry);
+	struct folio *folio;
+	int i;
+
+	*foliop = NULL;
+
+	folio = swap_cache_get_folio(entry);
+	if (folio) {
+		if (folio_nr_pages(folio) == HPAGE_PMD_NR) {
+			*foliop = folio;
+			return SWAP_PMD_CACHE_HUGE;
+		}
+		folio_put(folio);
+		return SWAP_PMD_CACHE_SPLIT;
+	}
+
+	for (i = 1; i < HPAGE_PMD_NR; i++) {
+		if (swap_cache_has_folio(swp_entry(type, offset + i)))
+			return SWAP_PMD_CACHE_SPLIT;
+	}
+
+	return SWAP_PMD_CACHE_EMPTY;
+}
+#endif
+
 /**
  * swap_cache_get_shadow - Looks up a shadow in the swap cache.
  * @entry: swap entry used for the lookup.
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 6b5149b88fa43..7e91dc50a5131 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -42,6 +42,7 @@
 #include <linux/suspend.h>
 #include <linux/zswap.h>
 #include <linux/plist.h>
+#include <linux/huge_mm.h>
 
 #include <asm/tlbflush.h>
 #include <linux/leafops.h>
@@ -2695,6 +2696,182 @@ static int unuse_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
 	return 0;
 }
 
+#ifdef CONFIG_THP_SWAP
+/*
+ * unuse_pmd - Map a locked folio at PMD granularity during swapoff.
+ *
+ * The caller provides a locked, swapped-in folio.  Returns 0 on success
+ * (PMD was mapped).  Returns -EAGAIN if the swap cache folio no longer
+ * matches the entry or the PMD changed under the lock (try_to_unuse will
+ * rescan). Returns -EIO if the folio is not uptodate or contains a poisoned
+ * subpage; in that case the PMD is split so unuse_pte_range() can handle
+ * individual pages.
+ */
+static int unuse_pmd(struct vm_area_struct *vma, pmd_t *pmd,
+		     unsigned long addr, softleaf_t entry,
+		     struct folio *folio)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	struct page *page;
+	pmd_t new_pmd, old_pmd;
+	spinlock_t *ptl;
+	rmap_t rmap_flags = RMAP_NONE;
+	bool exclusive;
+
+	if (unlikely(!folio_matches_swap_entry(folio, entry)))
+		return -EAGAIN;
+
+	/* Let PTE fallback reread each slot, or isolate the poisoned ones. */
+	if (unlikely(!folio_test_uptodate(folio)))
+		return -EIO;
+	if (unlikely(folio_has_any_hwpoisoned_page(folio)))
+		return -EIO;
+
+	page = folio_page(folio, 0);
+
+	ptl = pmd_lock(mm, pmd);
+	old_pmd = pmdp_get(pmd);
+
+	if (!pmd_is_swap_entry(old_pmd) ||
+	    softleaf_from_pmd(old_pmd).val != entry.val) {
+		spin_unlock(ptl);
+		return -EAGAIN;
+	}
+
+	exclusive = pmd_swp_exclusive(old_pmd);
+
+	/*
+	 * Some architectures may have to restore extra metadata to the folio
+	 * when reading from swap. This metadata may be indexed by swap entry
+	 * so this must be called before folio_put_swap().
+	 */
+	arch_swap_restore(folio_swap(entry, folio), folio);
+
+	add_mm_counter(mm, MM_ANONPAGES, HPAGE_PMD_NR);
+	add_mm_counter(mm, MM_SWAPENTS, -HPAGE_PMD_NR);
+
+	new_pmd = folio_mk_pmd(folio, vma->vm_page_prot);
+	new_pmd = pmd_mkold(new_pmd);
+	if (pmd_swp_soft_dirty(old_pmd))
+		new_pmd = pmd_mksoft_dirty(new_pmd);
+	if (pmd_swp_uffd(old_pmd))
+		new_pmd = pmd_mkuffd(new_pmd);
+	if (pmd_swp_uffd(old_pmd) && userfaultfd_rwp(vma))
+		new_pmd = pmd_modify(new_pmd, PAGE_NONE);
+
+	if (exclusive)
+		rmap_flags |= RMAP_EXCLUSIVE;
+
+	folio_get(folio);
+	if (!folio_test_anon(folio))
+		folio_add_new_anon_rmap(folio, vma, addr, rmap_flags);
+	else
+		folio_add_anon_rmap_pmd(folio, page, vma, addr, rmap_flags);
+
+	set_pmd_at(mm, addr, pmd, new_pmd);
+	folio_put_swap(folio, NULL);
+
+	spin_unlock(ptl);
+
+	folio_free_swap(folio);
+	return 0;
+}
+
+/*
+ * Try to swap in a PMD swap entry as a whole THP. Returns 0 on success.
+ * If the swap cache no longer has one PMD-sized folio, zswap may require
+ * per-page loading, or a PMD-order allocation/read fails, split the PMD so
+ * the caller can fall back to unuse_pte_range(). Otherwise propagates the
+ * error from unuse_pmd().
+ */
+static int unuse_pmd_entry(struct vm_area_struct *vma, pmd_t *pmd,
+			   unsigned long addr, softleaf_t entry)
+{
+	enum swap_pmd_cache cache_state;
+	struct folio *folio;
+	pmd_t pmdval;
+	int ret;
+
+	cache_state = swap_pmd_cache_lookup(entry, &folio);
+	if (cache_state == SWAP_PMD_CACHE_SPLIT) {
+		ret = -EAGAIN;
+		goto split_fallback;
+	}
+	if (!folio) {
+		struct vm_fault vmf = {
+			.vma = vma,
+			.address = addr,
+			.real_address = addr,
+			.pmd = pmd,
+		};
+
+		if (zswap_is_present(entry, HPAGE_PMD_NR)) {
+			ret = -EAGAIN;
+			goto split_fallback;
+		}
+
+		folio = swapin_sync(entry, GFP_HIGHUSER_MOVABLE,
+				    BIT(HPAGE_PMD_ORDER), &vmf, NULL, 0);
+		if (IS_ERR_OR_NULL(folio)) {
+			ret = folio ? PTR_ERR(folio) : -ENOMEM;
+			goto split_fallback;
+		}
+	}
+
+	folio_lock(folio);
+	folio_wait_writeback(folio);
+	/*
+	 * If the cached folio is no longer PMD-sized (e.g. split in the
+	 * swap cache by deferred_split_scan() or memory_failure() while
+	 * the PMD swap entry was installed), the PMD swap entry no longer
+	 * maps a single contiguous folio.  Split the PMD swap entry so
+	 * unuse_pte_range() can swap the per-slot folios in individually.
+	 */
+	if (folio_nr_pages(folio) != HPAGE_PMD_NR) {
+		folio_unlock(folio);
+		folio_put(folio);
+		ret = -EAGAIN;
+		goto split_fallback;
+	}
+	ret = unuse_pmd(vma, pmd, addr, entry, folio);
+	/*
+	 * PTE fallback cannot add a single-page rmap to a newly allocated,
+	 * PMD-sized !anon folio, and it cannot do anything useful with a folio
+	 * that failed to read. Remove either from the swap cache so each slot
+	 * is read back into an order-0 folio. An uptodate anon swap-cache folio
+	 * can be mapped one PTE at a time and must stay cached so poisoned
+	 * subpages remain visible.
+	 */
+	if (ret && folio_matches_swap_entry(folio, entry) &&
+	    (!folio_test_uptodate(folio) || !folio_test_anon(folio)))
+		swap_cache_del_folio(folio);
+	folio_unlock(folio);
+	folio_put(folio);
+	if (ret == -EIO)
+		goto split_fallback;
+	return ret;
+
+split_fallback:
+	/*
+	 * Every reason we get here was observed without the PMD lock and
+	 * possibly after sleeping, so re-check that the PMD is still the entry
+	 * we were called for. A racing fault may already have swapped the range
+	 * back in as a THP, and splitting that would demote it for nothing.
+	 */
+	pmdval = pmdp_get(pmd);
+	if (pmd_is_swap_entry(pmdval) &&
+	    softleaf_from_pmd(pmdval).val == entry.val)
+		__split_huge_pmd(vma, pmd, addr);
+	return ret;
+}
+#else	/* !CONFIG_THP_SWAP */
+static inline int unuse_pmd_entry(struct vm_area_struct *vma, pmd_t *pmd,
+				  unsigned long addr, softleaf_t entry)
+{
+	return -EAGAIN;
+}
+#endif	/* CONFIG_THP_SWAP */
+
 static inline int unuse_pmd_range(struct vm_area_struct *vma, pud_t *pud,
 				unsigned long addr, unsigned long end,
 				unsigned int type)
@@ -2705,10 +2882,22 @@ static inline int unuse_pmd_range(struct vm_area_struct *vma, pud_t *pud,
 
 	pmd = pmd_offset(pud, addr);
 	do {
+		pmd_t pmdval;
+
 		cond_resched();
 		if (signal_pending(current))
 			return -ERESTARTSYS;
 		next = pmd_addr_end(addr, end);
+
+		pmdval = pmdp_get(pmd);
+		if (IS_ENABLED(CONFIG_THP_SWAP) && pmd_is_swap_entry(pmdval)) {
+			softleaf_t entry = softleaf_from_pmd(pmdval);
+
+			if (swp_type(entry) == type &&
+			    !unuse_pmd_entry(vma, pmd, addr, entry))
+				continue;
+		}
+
 		ret = unuse_pte_range(vma, pmd, addr, next, type);
 		if (ret)
 			return ret;
-- 
2.53.0-Meta

