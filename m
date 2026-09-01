Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B587839F17F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788241513; cv=none; b=KDpT5arnOTydG59hQn4AOO3h48Y7KY3tIEcoGqD1rqavZCBAnMHRqX3ziEEI4+qwRPYMqGvwN1FA2MivMtKcXRVYGAOtVGeoUhkgAIv6yVNdax9+jZ13gK5t8cL1huFV83XxHyKjhu0RrQsg/orZ55z11wtIJ/r/qJpRk0kKNM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788241513; c=relaxed/simple;
	bh=ExzsBBQQzRLXmN5iM7ua3O1UxwNf7wasB8hjbJf/zWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WW9x7QyK/TVGHwkngibkiOjypoFp9+MPwe5ZD7VzaJ42FwPM8qsMj8fKpvvr6zSFbMyYJHVYyAO+WsJ0PfTgrII2X+cZl6fUoiWqYR1geVe3WI8ZivrmdB7AJSMjhbFEedpTz0Mh3LQ2fQKl/d2sjjv2ePoRoZTyYJZBGJcXrio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lIqXMwdd; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lIqXMwdd"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 445F61756;
	Mon, 31 Aug 2026 22:45:06 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2B6443F85F;
	Mon, 31 Aug 2026 22:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788241510; bh=ExzsBBQQzRLXmN5iM7ua3O1UxwNf7wasB8hjbJf/zWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lIqXMwddZi+uOm9ZJisAjVtSPICoXG4TgBYeL3OwVXiBe3YuDLo86lqjl4CnIXSQu
	 hAAQNs6LM9tL+uABixrKnhZhHejKRN55E0CZS3bV2ebPGFWeTIcFC7IPuVMOaHGnxD
	 vX99fqxU1f1+wtDyVO5ioGry1vQqF96Jso7B3QCw=
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com,
	chrisl@kernel.org,
	kasong@tencent.com
Cc: Dev Jain <dev.jain@arm.com>,
	riel@surriel.com,
	liam@infradead.org,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	baolin.wang@linux.alibaba.com,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	pfalcato@suse.de,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com
Subject: [PATCH v2 8/8] mm/rmap: batch unmap anonymous swap-backed large folios
Date: Tue,  1 Sep 2026 05:43:55 +0000
Message-ID: <20260901054358.4049095-9-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901054358.4049095-1-dev.jain@arm.com>
References: <20260901054358.4049095-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable batch clearing of ptes, and batch swap setting of ptes for anon
swap-backed folio unmapping.

Processing all ptes of a large folio in one go helps us batch across
atomics (add_mm_counter etc), barriers (in the function
__folio_try_share_anon_rmap), repeated calls to page_vma_mapped_walk(),
to name a few. In general, batching helps us to execute similar code
together, making the execution of the program more memory and
CPU friendly.

On arm64-contpte, batching also helps us avoid redundant ptep_get() calls
and TLB flushes while breaking the contpte mapping.

The handling of anon-exclusivity is very similar to commit cac1db8c3aad
("mm: optimize mprotect() by PTE batching"). Since folio_unmap_pte_batch()
won't look at the bits of the underlying page, we need to process
sub-batches of ptes pointing to pages which are same w.r.t exclusivity,
and batch set only those ptes to swap ptes in one go.

arch_unmap_one() is only defined for sparc64; I am not comfortable
regarding the nuances between retrieving the pfn from pte_pfn() or from
(paddr = pte_val(oldpte) & _PAGE_PADDR_4V).

(And, pte_next_pfn() can't even be called from arch_unmap_one() because
that file does not include pgtable.h) So just disable the
"sparc64-anon-swapbacked" case for now.

We need to take care of rmap accounting (folio_remove_rmap_ptes) and
reference accounting (folio_put_refs) when anon folio unmap succeeds.
In case we partially batch the large folio and fail, we need to correctly
do the accounting for pages which were successfully unmapped. So, put
this accounting code (which is finish_folio_unmap()) in
__ttu_anon_swapbacked_folio() itself, instead of doing some horrible
goto jumping at the callsite of ttu_anon_folio().

Similarly, do the finish_folio_unmap() in ttu_anon_folio itself for
the non-swapbacked (lazyfree) case.

If the batch length is less than the number of pages in the folio, then
we must skip over this batch.

The page_vma_mapped_walk API ensures this - check_pte() will return true
only if any of [pvmw->pfn, pvmw->pfn + nr_pages) is mapped by the pte.
There is no pfn underlying a swap pte, so check_pte returns false and we
keep skipping until we hit a present pte, which is where we want to start
unmapping from next.

Remove the label finish_unmap since no goto callers are left now.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/rmap.c | 110 ++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 81 insertions(+), 29 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 1b9f07d4d1be9..68e0201ffd003 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1964,12 +1964,14 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
 	end_addr = pmd_addr_end(addr, vma->vm_end);
 	max_nr = (end_addr - addr) >> PAGE_SHIFT;
 
-	/* We only support lazyfree or file folios batching for now ... */
-	if (folio_test_anon(folio) && folio_test_swapbacked(folio))
+	if (pte_unused(pte))
 		return 1;
 
-	if (pte_unused(pte))
+#ifdef __HAVE_ARCH_UNMAP_ONE
+	/* Add batching support to arch_unmap_one() to remove this */
+	if (folio_test_anon(folio) && folio_test_swapbacked(folio))
 		return 1;
+#endif
 
 	/*
 	 * If unmap fails, we need to restore the ptes. To avoid accidentally
@@ -2139,16 +2141,25 @@ static pte_t swp_pte_prepare(swp_entry_t entry, pte_t old_pte,
 	return swp_pte;
 }
 
-static bool ttu_anon_swapbacked_folio(struct vm_area_struct *vma,
+static void finish_folio_unmap(struct vm_area_struct *vma,
+		struct folio *folio, struct page *page, unsigned long nr_pages)
+{
+	folio_remove_rmap_ptes(folio, page, nr_pages, vma);
+	if (vma->vm_flags & VM_LOCKED)
+		mlock_drain_local();
+	folio_put_refs(folio, nr_pages);
+}
+
+static bool __ttu_anon_swapbacked_folio(struct vm_area_struct *vma,
 		struct folio *folio, struct page *page, unsigned long address,
-		pte_t *ptep, pte_t pteval)
+		pte_t *ptep, pte_t pteval, unsigned long nr_pages,
+		bool anon_exclusive)
 {
-	const bool anon_exclusive = folio_test_anon(folio) &&
-				    PageAnonExclusive(page);
 	swp_entry_t entry = page_swap_entry(page);
 	struct mm_struct *mm = vma->vm_mm;
+	pte_t swp_pte;
 
-	if (folio_dup_swap_pages(folio, page, 1) < 0)
+	if (folio_dup_swap_pages(folio, page, nr_pages) < 0)
 		return false;
 
 	/*
@@ -2157,21 +2168,57 @@ static bool ttu_anon_swapbacked_folio(struct vm_area_struct *vma,
 	 * so we'll not check/care.
 	 */
 	if (arch_unmap_one(mm, vma, address, pteval) < 0) {
-		folio_put_swap_pages(folio, page, 1);
+		VM_WARN_ON(nr_pages != 1);
+		folio_put_swap_pages(folio, page, nr_pages);
 		return false;
 	}
 
 	/* See folio_try_share_anon_rmap(): clear PTE first. */
-	if (anon_exclusive && folio_try_share_anon_rmap_pte(folio, page)) {
-		folio_put_swap_pages(folio, page, 1);
+	if (anon_exclusive &&
+	    folio_try_share_anon_rmap_ptes(folio, page, nr_pages)) {
+		folio_put_swap_pages(folio, page, nr_pages);
 		return false;
 	}
 
 	mm_prepare_for_swap_entries(mm);
-	dec_mm_counter(mm, MM_ANONPAGES);
-	inc_mm_counter(mm, MM_SWAPENTS);
-	set_pte_at(mm, address, ptep,
-		   swp_pte_prepare(entry, pteval, anon_exclusive));
+	add_mm_counter(mm, MM_ANONPAGES, -nr_pages);
+	add_mm_counter(mm, MM_SWAPENTS, nr_pages);
+	swp_pte = swp_pte_prepare(entry, pteval, anon_exclusive);
+	set_softleaf_ptes(mm, address, ptep, swp_pte, nr_pages);
+	finish_folio_unmap(vma, folio, page, nr_pages);
+	return true;
+}
+
+static bool ttu_anon_swapbacked_folio(struct vm_area_struct *vma,
+		struct folio *folio, struct page *first_page,
+		unsigned long address, pte_t *ptep, pte_t pteval,
+		unsigned long nr_pages)
+{
+	unsigned long batch_idx = 0;
+
+	while (nr_pages) {
+		bool anon_exclusive = PageAnonExclusive(first_page + batch_idx);
+		unsigned long len = page_anon_exclusive_batch(batch_idx,
+				nr_pages, first_page, anon_exclusive);
+
+		if (!__ttu_anon_swapbacked_folio(vma, folio,
+				first_page + batch_idx, address, ptep, pteval,
+				len, anon_exclusive)) {
+			/* Restore the remaining PTEs that were cleared. */
+			set_ptes(vma->vm_mm, address, ptep, pteval, nr_pages);
+			return false;
+		}
+
+		nr_pages -= len;
+		if (!nr_pages)
+			break;
+
+		pteval = pte_advance_pfn(pteval, len);
+		address += len * PAGE_SIZE;
+		batch_idx += len;
+		ptep += len;
+	}
+
 	return true;
 }
 
@@ -2184,15 +2231,22 @@ static bool ttu_anon_folio(struct vm_area_struct *vma, struct folio *folio,
 	 * See handle_pte_fault() ...
 	 */
 	if (WARN_ON_ONCE(folio_test_swapbacked(folio) !=
-			 folio_test_swapcache(folio)))
+			 folio_test_swapcache(folio))) {
+		set_ptes(vma->vm_mm, address, ptep, pteval, nr_pages);
 		return false;
+	}
 
-	if (!folio_test_swapbacked(folio))
-		return ttu_anon_lazyfree_folio(vma, folio, nr_pages);
+	if (!folio_test_swapbacked(folio)) {
+		if (!ttu_anon_lazyfree_folio(vma, folio, nr_pages)) {
+			set_ptes(vma->vm_mm, address, ptep, pteval, nr_pages);
+			return false;
+		}
+		finish_folio_unmap(vma, folio, page, nr_pages);
+		return true;
+	}
 
-	/* nr_pages > 1 not supported yet */
 	return ttu_anon_swapbacked_folio(vma, folio, page, address, ptep,
-					 pteval);
+					 pteval, nr_pages);
 }
 
 /*
@@ -2370,13 +2424,14 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			 */
 			dec_mm_counter(mm, mm_counter(folio));
 		} else if (folio_test_anon(folio)) {
+			/* finish_folio_unmap handled internally */
 			if (!ttu_anon_folio(vma, folio, page, address,
-					    pvmw.pte, pteval, nr_pages)) {
-				set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
+					    pvmw.pte, pteval, nr_pages))
 				goto walk_abort;
-			}
 
-			goto finish_unmap;
+			if (nr_pages == folio_nr_pages(folio))
+				goto walk_done;
+			continue;
 		} else {
 			/*
 			 * This is a locked file-backed folio,
@@ -2391,11 +2446,8 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			 */
 			add_mm_counter(mm, mm_counter_file(folio), -nr_pages);
 		}
-finish_unmap:
-		folio_remove_rmap_ptes(folio, page, nr_pages, vma);
-		if (vma->vm_flags & VM_LOCKED)
-			mlock_drain_local();
-		folio_put_refs(folio, nr_pages);
+
+		finish_folio_unmap(vma, folio, page, nr_pages);
 
 		/*
 		 * If we are sure that we batched the entire folio and cleared
-- 
2.43.0

