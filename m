Received: from mta0.migadu.com (out-247.mta0.migadu.com [91.218.175.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA57484243
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935063; cv=none; b=cf6wqDyKi4hg2ry6LKWzVHgXFkqONVsOVwJxg85cNzStLbHH5geOXCLJBYyGnOtGBlGhf9SKauXcYVKuImXgpUz+EEb7efgJu5gDKdxyvzg6CIJLCLRlXDfi0mT16/jKQiGOxC8wKUitaJIWA2vUlRo2R4KK5qA1x+rvi6I+8/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935063; c=relaxed/simple;
	bh=iU9ocT2TEBSFYtG8fbChATV4/D158MSldwzOvx6mfpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hR8eA9ThEfw6BTw4pbEPqloQaFIacga4pb04TZbNm3XgmMfNj2G4MED8FXmA+oQuP6AIA7iCzT0cPr86x5ndMcTdijvAoaT4D0PiWYukefIBQgzx1ZIdElvL1SDtBk6f4qRLfY11PREhjjOGW1KP+HJG0H6PQMvqz0KoEP8zJ9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nk0aLi98; arc=none smtp.client-ip=91.218.175.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nk0aLi98"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=iU9ocT2TEBSFYtG8fbChATV4/D158MSldwzOvx6mfpk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790935058; v=1; x=1791539858;
 b=nk0aLi98mdKQEuAmeoBzq7QxYAC0m7iDvtWu969YP1ezPWOmgrPJlYrpyLpXaO5ki4P7En3Q
 SvORIGYEB/5Dq02/Z41cKI8h2iw6M5SKps809pxW7Qc132/IuTGFrNuEXAqFQF1JkMBJ6mwh7+6
 /cohmrbTQQfTl0gcV2PHBi1w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id e133ed410f67748b;
	Fri, 02 Oct 2026 09:57:37 +0000
X-Mizu-Trace-ID: e133ed410f67748b
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
Subject: [PATCH v8 29/30] mm: install PMD swap entries on swap-out
Date: Fri,  2 Oct 2026 02:52:43 -0700
Message-ID: <20261002095503.3585565-30-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002095503.3585565-1-usama.arif@linux.dev>
References: <20261002095503.3585565-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When reclaim swaps out a PMD-mapped anonymous THP it first splits the PMD
via TTU_SPLIT_HUGE_PMD. The huge mapping is lost for the whole swap
round-trip: swapping the range back in takes HPAGE_PMD_NR faults and
leaves as many small mappings, and the process waits for khugepaged to
collapse them again.

The PMD does not have to be split. A contiguous run of slots was already
secured when the folio was added to the swap cache - a non-contiguous
allocation would have split the folio first - so the whole mapping can be
replaced by one PMD-level swap entry encoding the first slot.

shrink_folio_list() therefore stops asking for TTU_SPLIT_HUGE_PMD for a
PMD-mappable folio already in the swap cache, and try_to_unmap_one() grows
a PMD branch. TTU_SPLIT_HUGE_PMD remains the fallback for everything else.

set_pmd_swap_entry() is deliberately close in shape to
set_pmd_migration_entry(): invalidate the mapping while keeping the
original for rollback, take a swap reference on every slot, transfer the
exclusive state, propagate the dirty bit to the folio so writeback is not
lost, add the mm to mmlist before the entry becomes visible, and carry
over soft-dirty and uffd-wp. Any step that can fail restores the mapping
first.

The entry encodes exactly what the PTE entries would, so swap_map
accounting is unchanged: each slot carries a count of one, released
individually on a later split or together on swap-in.

zswap needs no handling here. It stores the folio as order-0 entries, and
the PMD-order swap-in users split and fall back to PTEs if any covered
slot turns out to have a zswap entry.

thp_swpout_pmd counts PMD mappings replaced this way. Unlike thp_swpout it
counts mappings rather than folios, so a fork-shared THP can increment it
once per mapping.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 Documentation/admin-guide/mm/transhuge.rst |  5 ++
 include/linux/huge_mm.h                    |  2 +
 include/linux/vm_event_item.h              |  1 +
 mm/huge_memory.c                           | 84 ++++++++++++++++++++++
 mm/rmap.c                                  | 19 +++++
 mm/vmscan.c                                |  9 ++-
 mm/vmstat.c                                |  1 +
 7 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index b187d618452f4..64d413d9fd83e 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -632,6 +632,11 @@ thp_swpout
 	is incremented every time a huge page is swapout in one
 	piece without splitting.
 
+thp_swpout_pmd
+	is incremented every time a PMD mapping is replaced by a PMD-level
+	swap entry. A fork-shared THP can increment this counter once for each
+	PMD mapping that is swapped out.
+
 thp_swpout_fallback
 	is incremented if a huge page has to be split before swapout.
 	Usually because failed to allocate some continuous swap space
diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 04466662cfabd..2f537e5fed60c 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -551,6 +551,8 @@ vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf);
 
 #ifdef CONFIG_THP_SWAP
 vm_fault_t do_huge_pmd_swap_page(struct vm_fault *vmf);
+int set_pmd_swap_entry(struct page_vma_mapped_walk *pvmw,
+		       struct folio *folio);
 #else
 static inline vm_fault_t do_huge_pmd_swap_page(struct vm_fault *vmf)
 {
diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index 2628ccda076a0..f8fd4e13698c3 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -108,6 +108,7 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 		THP_ZERO_PAGE_ALLOC_FAILED,
 		THP_SWPOUT,
 		THP_SWPOUT_FALLBACK,
+		THP_SWPOUT_PMD,
 #endif
 #ifdef CONFIG_BALLOON
 		BALLOON_INFLATE,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index a64f568f315c1..63ef7a5f799ce 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -5707,3 +5707,87 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct folio *folio
 	trace_remove_migration_pmd(address, pmd_val(pmde));
 }
 #endif
+
+#ifdef CONFIG_THP_SWAP
+/**
+ * set_pmd_swap_entry() - Replace a PMD mapping with a PMD-level swap entry.
+ * @pvmw: Page vma mapped walk context, must have pvmw->pmd set and
+ *        pvmw->pte NULL (i.e. PMD-mapped).
+ * @folio: The folio being swapped out. Must be in the swap cache.
+ *
+ * This installs a PMD-level swap entry in place of a present PMD mapping,
+ * avoiding the need to split the PMD into PTE-level swap entries.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int set_pmd_swap_entry(struct page_vma_mapped_walk *pvmw,
+		       struct folio *folio)
+{
+	struct vm_area_struct *vma = pvmw->vma;
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long address = pvmw->address;
+	unsigned long haddr = address & HPAGE_PMD_MASK;
+	struct page *page = folio_page(folio, 0);
+	bool anon_exclusive;
+	pmd_t pmdval;
+	swp_entry_t entry;
+	pmd_t pmdswp;
+
+	/*
+	 * try_to_unmap_one() only gets here for a PMD-mapped, anonymous,
+	 * PMD-sized folio that is already in the swap cache, and a swapcache
+	 * folio is always swapbacked. Refuse instead of crashing should that
+	 * ever stop being true: the caller aborts the rmap walk and the folio
+	 * simply stays mapped.
+	 */
+	if (unlikely(!pvmw->pmd || pvmw->pte ||
+		     !folio_test_anon(folio) ||
+		     !folio_test_swapcache(folio) ||
+		     !folio_test_swapbacked(folio) ||
+		     folio_nr_pages(folio) != HPAGE_PMD_NR)) {
+		VM_WARN_ON_ONCE_FOLIO(true, folio);
+		return -EBUSY;
+	}
+
+	flush_cache_range(vma, haddr, haddr + HPAGE_PMD_SIZE);
+
+	pmdval = pmdp_invalidate(vma, haddr, pvmw->pmd);
+
+	/* Update high watermark before we lower rss */
+	update_hiwater_rss(mm);
+
+	if (folio_dup_swap(folio, NULL) < 0) {
+		set_pmd_at(mm, haddr, pvmw->pmd, pmdval);
+		return -ENOMEM;
+	}
+
+	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
+	anon_exclusive = PageAnonExclusive(page);
+	if (anon_exclusive && folio_try_share_anon_rmap_pmd(folio, page)) {
+		folio_put_swap(folio, NULL);
+		set_pmd_at(mm, haddr, pvmw->pmd, pmdval);
+		return -EBUSY;
+	}
+
+	mm_prepare_for_swap_entries(mm);
+
+	if (pmd_dirty(pmdval))
+		folio_mark_dirty(folio);
+
+	entry = folio->swap;
+	pmdswp = softleaf_to_pmd(entry);
+	if (pmd_soft_dirty(pmdval))
+		pmdswp = pmd_swp_mksoft_dirty(pmdswp);
+	if (pmd_uffd(pmdval))
+		pmdswp = pmd_swp_mkuffd(pmdswp);
+	if (anon_exclusive)
+		pmdswp = pmd_swp_mkexclusive(pmdswp);
+	set_pmd_at(mm, haddr, pvmw->pmd, pmdswp);
+
+	folio_remove_rmap_pmd(folio, page, vma);
+	folio_put(folio);
+
+	count_vm_event(THP_SWPOUT_PMD);
+	return 0;
+}
+#endif /* CONFIG_THP_SWAP */
diff --git a/mm/rmap.c b/mm/rmap.c
index b762eb85915ea..d04d376386c80 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2284,6 +2284,25 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				goto walk_abort;
 			}
 
+#ifdef CONFIG_THP_SWAP
+			/*
+			 * If the folio is in the swap cache and we're not
+			 * asked to split, install a PMD-level swap entry.
+			 */
+			if (!(flags & TTU_SPLIT_HUGE_PMD) &&
+			    folio_test_anon(folio) &&
+			    folio_test_swapcache(folio)) {
+				if (set_pmd_swap_entry(&pvmw, folio))
+					goto walk_abort;
+
+				add_mm_counter(mm, MM_ANONPAGES,
+					       -HPAGE_PMD_NR);
+				add_mm_counter(mm, MM_SWAPENTS,
+					       HPAGE_PMD_NR);
+				goto walk_done;
+			}
+#endif
+
 			if (flags & TTU_SPLIT_HUGE_PMD) {
 				/*
 				 * We temporarily have to drop the PTL and
diff --git a/mm/vmscan.c b/mm/vmscan.c
index c2eb8fa9d5e50..7648a2a0d0813 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1408,7 +1408,14 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 			enum ttu_flags flags = TTU_BATCH_FLUSH;
 			bool was_swapbacked = folio_test_swapbacked(folio);
 
-			if (folio_test_pmd_mappable(folio))
+			/*
+			 * With THP_SWAP, PMD-mappable folios already in the
+			 * swap cache can be unmapped with a PMD-level swap
+			 * entry, avoiding the cost of splitting the PMD.
+			 */
+			if (folio_test_pmd_mappable(folio) &&
+			    !(IS_ENABLED(CONFIG_THP_SWAP) &&
+			      folio_test_swapcache(folio)))
 				flags |= TTU_SPLIT_HUGE_PMD;
 			/*
 			 * Without TTU_SYNC, try_to_unmap will only begin to
diff --git a/mm/vmstat.c b/mm/vmstat.c
index a3e809c57f295..5badcce8ff0ad 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1435,6 +1435,7 @@ const char * const vmstat_text[] = {
 	[I(THP_ZERO_PAGE_ALLOC_FAILED)]		= "thp_zero_page_alloc_failed",
 	[I(THP_SWPOUT)]				= "thp_swpout",
 	[I(THP_SWPOUT_FALLBACK)]		= "thp_swpout_fallback",
+	[I(THP_SWPOUT_PMD)]			= "thp_swpout_pmd",
 #endif
 #ifdef CONFIG_BALLOON
 	[I(BALLOON_INFLATE)]			= "balloon_inflate",
-- 
2.53.0-Meta

