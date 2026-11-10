Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351205;
	b=eij5+KpGoUvDLaeT2N0W8TPyybr8UQR06LuBRaXUFisLHWDm3p7hIwzMNiQKwD/4yKSQ
	 ApMr0s3NeXAsfav2mgMRuuDgGYLB2A0pDDUU5JbysQZ8Hoz6woXHzl/gRGZLwLcOjBz5V
	 uzAuG+U04CC1/6cy2MrCV+UIqpAGIkS5onA+/4LosIVtp+uy86C6afji9V+PKhPT4bfVS
	 NPUBInAWdR1WYgND6Qn18I6CCxJkshcOLfaj/eA3R1b9j2ikuik5jqGINfLbzul1uxYh9
	 kYYrRucKSP9hyJk1BYbmKHSlOOBhJcBMRGJWawi2DD1hk0xINqA0qZAQpkcUy/CKrxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351205;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=TN71or/KqWqpJdqiFqFX6Tnqncaut5sTMTc9ncIt7D4=;
	b=BDT0Yji3QmEP/0RAZ/TYYHtuYbI3GEqAisrgQuEeYb0AyT46C0pJxi/1l0K1nz08h5s4
	 bPMc/Dhix7ojzGlAJnlx/6/L+5aGLQzlrR+1TGZaMB30IdkzLMGViXhjA7d0hzUAQQzF+
	 pJ3q4JJYITKchFQokxXEvMDd5TXEPu1HaJzcDTol88YDvAu9X+9+0wBH+E0jK0Leegmlb
	 hj5+33nHreEwRPeCx2P2sv5w6Q2w+QVjpWNVzARzs3cSXmUGHM1uHNSF5RKMCxc9M8RJL
	 gsuL6BYBd/Y0W3F4Ky+YPvGLRFE3CGtrDczZZPEp1KivdlHVUJR3ztZqBessZG4T6ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=W48ASpi6;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF8E606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF8E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=W48ASpi6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 353461C2B;
	Tue, 10 Nov 2026 14:53:21 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CA723F85F;
	Tue, 10 Nov 2026 14:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794351204; bh=Nf2xRbv9ETliUUnn83Z80tcd0GYkMdI/qY22YeN4KRQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W48ASpi6VrLpYN7BavQsUOctQDc2KQUAMXzG1tc7uwAwk0hW/tlGTtWgVsMqSAhM+
	 cDpOb+LrvBbyK5l5DDYQmFPtBCJhdsnhjLUaJsyu3uKo8LlZ9xhaSBjWVje95ZlOHW
	 SwXM4Tx6nylPEQ6EW6fpkO1qQGHYaCiSjj33iwsI=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 10 Nov 2026 22:52:55 +0000
Subject: [PATCH v4 5/6] mm: gup: introduce
 gup_pages_not_requiring_unshare()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-refactor_gup_fast-v4-5-e779a7674274@arm.com>
References: <20261110-refactor_gup_fast-v4-0-e779a7674274@arm.com>
In-Reply-To: <20261110-refactor_gup_fast-v4-0-e779a7674274@arm.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Rik van Riel <riel@surriel.com>, 
 Yuan-Hao Hsu <aa9736195201@gmail.com>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9201; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=Nf2xRbv9ETliUUnn83Z80tcd0GYkMdI/qY22YeN4KRQ=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq86BU/nRAj4zg6lTU9p4xl1YRxVznTriXQruqB
 7mC4HZxzwyJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCavOgVAAKCRBt1cPRWsUx
 M8+wDACggYO4Is/3jOn4+rp4CEhD+z/iqO2USHqHgGEfxmxED6ERJ7WZrKVZZfITMr+WyXXmjeF
 bMwz2v2GNKDLj/P+l0imnkV3UuaRS1j+r4iYqG4qBnPkJ+wOUo5x5HqGSqPftOAHpR58hqCH3Lu
 kvriLkcLgGeGcjGH+21E/My7sLk+WJJXAOdAxcsc9EDb8nLj6zxZz4J2PCcqeLVR4kC4Ihp78uN
 hnKPpgAhyTrX2J7f3LbEDpSP1fzJKPCF6DrR2n4EpD7R8MZzeICgSvfQHaTYbyzENotrGLDWh5O
 ShycsDLbBs9I8qLjwubFF69erBxDj1eV8pCP8d/mdeS46VckpMV8OFx9cb3eHIU9kItnWABk5EA
 vWZy80I+XVidaU6831wSy2rea3H29udanCwEe3pVUe2xC7hbfhHl9rhL5PvlCv5uska4uKzKCT7
 ENTeZevgg+YCcnMDotvZm8Rfk/uYCYshFCQtgfNFsudGqVXRJoRvb+9Qs97vxrc7dtNmY=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

This is preparatory patch to make gup_fast_pte_range() batchable.

Introduce gup_pages_not_requiring_unshare() to count consecutive pages
within a folio that do not require unsharing, and use it to implement
gup_must_unshare().

Also add a folio argument to gup_must_unshare() so callers can reuse an
existing folio and avoid the compound_head() call implicit in PageAnon().

Reviewed-by: Rik van Riel <riel@surriel.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 mm/gup.c | 111 +++++++++++++++++++++++++++++++++++++--------------------------
 1 file changed, 66 insertions(+), 45 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index ccdce67ef300..8ef41353afe8 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -633,58 +633,39 @@ static struct page *no_page_table(struct vm_area_struct *vma,
 	return NULL;
 }
 
-/*
- * Indicates for which pages that are write-protected in the page table,
- * whether GUP has to trigger unsharing via FAULT_FLAG_UNSHARE such that the
- * GUP pin will remain consistent with the pages mapped into the page tables
- * of the MM.
- *
- * Temporary unmapping of PageAnonExclusive() pages or clearing of
- * PageAnonExclusive() has to protect against concurrent GUP:
- * * Ordinary GUP: Using the PT lock
- * * GUP-fast and fork(): mm->write_protect_seq
- * * GUP-fast and KSM or temporary unmapping (swap, migration): see
- *    folio_try_share_anon_rmap_*()
- *
- * Must be called with the (sub)page that's actually referenced via the
- * page table entry, which might not necessarily be the head page for a
- * PTE-mapped THP.
- *
- * If the vma is NULL, we're coming from the GUP-fast path and might have
- * to fallback to the slow path just to lookup the vma.
- */
-static inline bool gup_must_unshare(struct vm_area_struct *vma,
-				    unsigned int flags, struct page *page)
+static unsigned long gup_pages_not_requiring_unshare(
+		struct vm_area_struct *vma, unsigned int flags,
+		struct folio *folio, struct page *page, unsigned long nr_pages)
 {
+	unsigned int i;
+
 	/*
 	 * FOLL_WRITE is implicitly handled correctly as the page table entry
 	 * has to be writable -- and if it references (part of) an anonymous
 	 * folio, that part is required to be marked exclusive.
 	 */
 	if ((flags & (FOLL_WRITE | FOLL_PIN)) != FOLL_PIN)
-		return false;
-	/*
-	 * Note: PageAnon(page) is stable until the page is actually getting
-	 * freed.
-	 */
-	if (!PageAnon(page)) {
+		return nr_pages;
+
+	/* folio_test_anon(folio) is stable until folio gets freed. */
+	if (!folio_test_anon(folio)) {
 		/*
 		 * We only care about R/O long-term pining: R/O short-term
 		 * pinning does not have the semantics to observe successive
 		 * changes through the process page tables.
 		 */
 		if (!(flags & FOLL_LONGTERM))
-			return false;
+			return nr_pages;
 
 		/* We really need the vma ... */
-		if (!vma)
-			return true;
+		if (!vma || vma_is_cow_mapping(vma))
+			return 0;
 
 		/*
 		 * ... because we only care about writable private ("COW")
 		 * mappings where we have to break COW early.
 		 */
-		return vma_is_cow_mapping(vma);
+		return nr_pages;
 	}
 
 	/* Paired with a memory barrier in folio_try_share_anon_rmap_*(). */
@@ -695,7 +676,38 @@ static inline bool gup_must_unshare(struct vm_area_struct *vma,
 	 * Note that KSM pages cannot be exclusive, and consequently,
 	 * cannot get pinned.
 	 */
-	return !PageAnonExclusive(page);
+	for (i = 0; i < nr_pages; i++) {
+		if (!PageAnonExclusive(page + i))
+			return i;
+	}
+
+	return nr_pages;
+}
+
+/*
+ * Indicates for which pages that are write-protected in the page table,
+ * whether GUP has to trigger unsharing via FAULT_FLAG_UNSHARE such that the
+ * GUP pin will remain consistent with the pages mapped into the page tables
+ * of the MM.
+ *
+ * Temporary unmapping of PageAnonExclusive() pages or clearing of
+ * PageAnonExclusive() has to protect against concurrent GUP:
+ * * Ordinary GUP: Using the PT lock
+ * * GUP-fast and fork(): mm->write_protect_seq
+ * * GUP-fast and KSM or temporary unmapping (swap, migration): see
+ *    folio_try_share_anon_rmap_*()
+ *
+ * Must be called with the (sub)page that's actually referenced via the
+ * page table entry, which might not necessarily be the head page for a
+ * PTE-mapped THP.
+ *
+ * If the vma is NULL, we're coming from the GUP-fast path and might have
+ * to fallback to the slow path just to lookup the vma.
+ */
+static inline bool gup_must_unshare(struct vm_area_struct *vma,
+		unsigned int flags, struct folio *folio, struct page *page)
+{
+	return gup_pages_not_requiring_unshare(vma, flags, folio, page, 1) != 1;
 }
 
 #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
@@ -717,6 +729,7 @@ static struct page *follow_huge_pud(struct vm_area_struct *vma,
 {
 	struct mm_struct *mm = vma->vm_mm;
 	struct page *page;
+	struct folio *folio;
 	pud_t pud = *pudp;
 	unsigned long pfn = pud_pfn(pud);
 	int ret;
@@ -729,11 +742,12 @@ static struct page *follow_huge_pud(struct vm_area_struct *vma,
 
 	pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
 	page = pfn_to_page(pfn);
+	folio = page_folio(page);
 
-	if (!pud_write(pud) && gup_must_unshare(vma, flags, page))
+	if (!pud_write(pud) && gup_must_unshare(vma, flags, folio, page))
 		return ERR_PTR(-EMLINK);
 
-	ret = try_grab_folio(page_folio(page), 1, flags);
+	ret = try_grab_folio(folio, 1, flags);
 	if (ret)
 		page = ERR_PTR(ret);
 	else
@@ -768,11 +782,14 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t pmdval = *pmd;
 	struct page *page;
+	struct folio *folio;
 	int ret;
 
 	assert_spin_locked(pmd_lockptr(mm, pmd));
 
 	page = pmd_page(pmdval);
+	folio = page_folio(page);
+
 	if ((flags & FOLL_WRITE) &&
 	    !can_follow_write_pmd(pmdval, page, vma, flags))
 		return NULL;
@@ -784,13 +801,13 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
 	if (pmd_protnone(*pmd) && !gup_can_follow_protnone(vma, flags))
 		return NULL;
 
-	if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
+	if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, folio, page))
 		return ERR_PTR(-EMLINK);
 
 	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
 			     !PageAnonExclusive(page), page);
 
-	ret = try_grab_folio(page_folio(page), 1, flags);
+	ret = try_grab_folio(folio, 1, flags);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -908,7 +925,7 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 	}
 	folio = page_folio(page);
 
-	if (!pte_write(pte) && gup_must_unshare(vma, flags, page)) {
+	if (!pte_write(pte) && gup_must_unshare(vma, flags, folio, page)) {
 		page = ERR_PTR(-EMLINK);
 		goto out;
 	}
@@ -2973,7 +2990,7 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 			goto pte_unmap;
 		}
 
-		if (!pte_write(pte) && gup_must_unshare(NULL, flags, page)) {
+		if (!pte_write(pte) && gup_must_unshare(NULL, flags, folio, page)) {
 			gup_put_folio(folio, 1, flags);
 			goto pte_unmap;
 		}
@@ -3020,7 +3037,7 @@ static unsigned long gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp,
 		unsigned long addr, unsigned long end,
 		unsigned int flags, struct page **pages)
 {
-	struct page *page;
+	struct page *mapped_page, *page;
 	struct folio *folio;
 	unsigned long nr_pages, i;
 
@@ -3035,7 +3052,8 @@ static unsigned long gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp,
 		return 0;
 
 	nr_pages = (end - addr) >> PAGE_SHIFT;
-	page = pmd_page(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
+	mapped_page = pmd_page(orig);
+	page = mapped_page + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
 
 	folio = try_grab_folio_fast(page, nr_pages, flags);
 	if (!folio)
@@ -3050,7 +3068,8 @@ static unsigned long gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp,
 		gup_put_folio(folio, nr_pages, flags);
 		return 0;
 	}
-	if (!pmd_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
+	if (!pmd_write(orig) &&
+	    gup_must_unshare(NULL, flags, folio, mapped_page)) {
 		gup_put_folio(folio, nr_pages, flags);
 		return 0;
 	}
@@ -3065,7 +3084,7 @@ static unsigned long gup_fast_pud_leaf(pud_t orig, pud_t *pudp,
 		unsigned long addr, unsigned long end,
 		unsigned int flags, struct page **pages)
 {
-	struct page *page;
+	struct page *mapped_page, *page;
 	struct folio *folio;
 	unsigned long nr_pages, i;
 
@@ -3076,7 +3095,8 @@ static unsigned long gup_fast_pud_leaf(pud_t orig, pud_t *pudp,
 		return 0;
 
 	nr_pages = (end - addr) >> PAGE_SHIFT;
-	page = pud_page(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
+	mapped_page = pud_page(orig);
+	page = mapped_page + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
 
 	folio = try_grab_folio_fast(page, nr_pages, flags);
 	if (!folio)
@@ -3092,7 +3112,8 @@ static unsigned long gup_fast_pud_leaf(pud_t orig, pud_t *pudp,
 		return 0;
 	}
 
-	if (!pud_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
+	if (!pud_write(orig) &&
+	    gup_must_unshare(NULL, flags, folio, mapped_page)) {
 		gup_put_folio(folio, nr_pages, flags);
 		return 0;
 	}

-- 
2.43.0

