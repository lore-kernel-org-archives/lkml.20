Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647843;
	b=mcb7LoUzwBQqz5cox0LlwxTsOpnkX003h9e5vDRmG2fNvQFIuj8LGqPl8hkJ2i3VClec
	 DhD2eLcyJ3luTGeHbUObbALugd4Q+XkVFR++KGDlcaFGeiUZ1xZOO6ai/UyG9FQvELiRl
	 F+20krC9wcR36mJlfenk5eXJCoZ7vi9QYdQPD5MH2MYyhqGL1euh6lJAQHL3X80scJQUt
	 d6F5gV8xbdKExaPIlQuIrq1jYApK0wKmW6xpDMXyCRcZSuBUqLVB04mUp9pF5kdZdsOMC
	 Cy9TukYRXjbp4VeyEFH1kilPqLvE3e3ZcM94NZQLgWJEBM68k/GmuZAJat7NtPuSWlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647843;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pDYZpFmhvHZ879ZgYeZOl13TdF61ZSgQP1T2a7RNxZE=;
	b=uFihOibA1ee5KLTkyeXWL+Qrcd02DEvJWqrdZfLuv53XsVjurbgB5w1WJX3YwQbosv+X
	 AW5pbSZlLy4mMZIsQ60lR1VvuPSECqWJifdy8W4W8+INvq5MM6I4ktgIKACUpIG4NfIaf
	 bt3PBFVHHEPa7BN5tH1tNOBd/Pml24LD+Keo/CmcBw/gdiuga6YAfMSXKzPWeAZRXD7gh
	 R1Y6wsW4gWyqgTwpDs5qOcoWh3IM6gicLBL9WSH2bhpax4eZfmHXdztAbwWBoCgvwI7FU
	 tkcQyM3ky7UUtNLqOH5SvJZFv7L0YzHVPp6aDp1hm8Kbkph1bkrPYuJoSsFfekGaKCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=ZWVWDLSv;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EAD606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6EAD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=ZWVWDLSv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=pDYZpFmhvHZ879ZgYeZOl13TdF61ZSgQP1T2a7RNxZE=; b=ZWVWDL
	SvxJvJFXVP1x/DoND90yI0+AkcsooY7VhVYfXyzn+z/kL+h9d1VpMjE78CFWk59VuTk0Z1bQdS0vq
	LqUFfmKI0QRDwrysllMCxy5zulgCbbcboBbdekeU3cbtT4Z95r3ZwYnOwiELVvXFQateePRrfElbO
	0vxcilD7ffAwwpCgri9aoEgxiv80GfB5ZL4Fyuwmuh35UC2zYxGm3XiZY+dsu04/XTEXZ1RRMUoaE
	TLmX2bzqOQgYnC1xYAQU2rltJ3xPEl3ddWs/GfdZq1m81Jln4fLM/T+W7p+9JF7CXBpE4pYaq601Z
	EOSjmf20qBYtsHcOn7J7vc5EVZSA==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xNxjk-00000001W8x-0ICA;
	Mon, 02 Nov 2026 19:30:32 +0000
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	linux-mm@kvack.org,
	Rik van Riel <riel@surriel.com>
Subject: [PATCH 2/8] mm/gup: convert follow_page_mask() to return a long
Date: Mon,  2 Nov 2026 14:30:20 -0500
Message-ID: <20261102193026.3860700-3-riel@surriel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102193026.3860700-1-riel@surriel.com>
References: <20261102193026.3860700-1-riel@surriel.com>
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

follow_page_mask() and its helpers return a struct page pointer: NULL,
ERR_PTR(), or the page found. Change the return type to long instead:
0, a negative errno, or 1 with the page stored in a new pages[0] slot.

This lets the return value carry a page count rather than a single
struct page pointer.

follow_huge_pud(), follow_huge_pmd() and follow_page_pte() now store
the found page in a pages[0] slot. __get_user_pages() itself is
unchanged: it reads that page back from pages[i] and expands a large
folio's remaining subpages on its own, as before. The vsyscall gate
area bypasses follow_page_mask() and fills its own slot the same way.

*page_mask and __get_user_pages()'s handling of a large folio's
remaining subpages are untouched, and mm/gup_test.c
(PIN_LONGTERM_BENCHMARK) shows no measurable difference for 4 kB,
64 kB mTHP, or 2 MB THP.

No functional changes intended.

Suggested-by: David Hildenbrand <david@kernel.org>
Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/gup.c | 254 +++++++++++++++++++++++++++++--------------------------
 1 file changed, 134 insertions(+), 120 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index cdbe2ed3e6442..f7d940e7e5ffb 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -608,15 +608,15 @@ static inline bool can_follow_write_common(struct page *page,
 	return page && PageAnon(page) && PageAnonExclusive(page);
 }
 
-static struct page *no_page_table(struct vm_area_struct *vma,
-				  unsigned int flags, unsigned long address)
+static long no_page_table(struct vm_area_struct *vma,
+		unsigned int flags, unsigned long address)
 {
 	if (!(flags & FOLL_DUMP))
-		return NULL;
+		return 0;
 
 	/*
 	 * When core dumping, we don't want to allocate unnecessary pages or
-	 * page tables.  Return error instead of NULL to skip handle_mm_fault,
+	 * page tables.  Return error instead of 0 to skip handle_mm_fault,
 	 * then get_dump_page() will return NULL to leave a hole in the dump.
 	 * But we can only make this optimization where a hole would surely
 	 * be zero-filled if handle_mm_fault() actually did handle it.
@@ -625,12 +625,12 @@ static struct page *no_page_table(struct vm_area_struct *vma,
 		struct hstate *h = hstate_vma(vma);
 
 		if (!hugetlbfs_pagecache_present(h, vma, address))
-			return ERR_PTR(-EFAULT);
+			return -EFAULT;
 	} else if ((vma_is_anonymous(vma) || !vma->vm_ops->fault)) {
-		return ERR_PTR(-EFAULT);
+		return -EFAULT;
 	}
 
-	return NULL;
+	return 0;
 }
 
 static void gup_fill_pages(struct vm_area_struct *vma, unsigned long address,
@@ -663,9 +663,10 @@ static inline bool can_follow_write_pud(pud_t pud, struct page *page,
 	return can_follow_write_common(page, vma, flags);
 }
 
-static struct page *follow_huge_pud(struct vm_area_struct *vma,
-				    unsigned long addr, pud_t *pudp,
-				    int flags, unsigned long *page_mask)
+static long follow_huge_pud(struct vm_area_struct *vma,
+		unsigned long addr, pud_t *pudp,
+		unsigned int flags, unsigned long *page_mask,
+		struct page **pages)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	struct page *page;
@@ -676,25 +677,27 @@ static struct page *follow_huge_pud(struct vm_area_struct *vma,
 	assert_spin_locked(pud_lockptr(mm, pudp));
 
 	if (!pud_present(pud))
-		return NULL;
+		return 0;
 
 	if ((flags & FOLL_WRITE) &&
 	    !can_follow_write_pud(pud, pfn_to_page(pfn), vma, flags))
-		return NULL;
+		return 0;
 
 	pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
 	page = pfn_to_page(pfn);
 
 	if (!pud_write(pud) && gup_must_unshare(vma, flags, page))
-		return ERR_PTR(-EMLINK);
+		return -EMLINK;
 
 	ret = try_grab_folio(page_folio(page), 1, flags);
 	if (ret)
-		page = ERR_PTR(ret);
-	else
-		*page_mask = HPAGE_PUD_NR - 1;
+		return ret;
+
+	*page_mask = HPAGE_PUD_NR - 1;
 
-	return page;
+	gup_fill_pages(vma, addr, page, 1, pages);
+
+	return 1;
 }
 
 /* FOLL_FORCE can write to even unwritable PMDs in COW mappings. */
@@ -715,10 +718,10 @@ static inline bool can_follow_write_pmd(pmd_t pmd, struct page *page,
 	return !userfaultfd_huge_pmd_wp(vma, pmd);
 }
 
-static struct page *follow_huge_pmd(struct vm_area_struct *vma,
-				    unsigned long addr, pmd_t *pmd,
-				    unsigned int flags,
-				    unsigned long *page_mask)
+static long follow_huge_pmd(struct vm_area_struct *vma,
+		unsigned long addr, pmd_t *pmd,
+		unsigned int flags, unsigned long *page_mask,
+		struct page **pages)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t pmdval = *pmd;
@@ -730,24 +733,24 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
 	page = pmd_page(pmdval);
 	if ((flags & FOLL_WRITE) &&
 	    !can_follow_write_pmd(pmdval, page, vma, flags))
-		return NULL;
+		return 0;
 
 	/* Avoid dumping huge zero page */
 	if ((flags & FOLL_DUMP) && is_huge_zero_pmd(pmdval))
-		return ERR_PTR(-EFAULT);
+		return -EFAULT;
 
 	if (pmd_protnone(*pmd) && !gup_can_follow_protnone(vma, flags))
-		return NULL;
+		return 0;
 
 	if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
-		return ERR_PTR(-EMLINK);
+		return -EMLINK;
 
 	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
 			     !PageAnonExclusive(page), page);
 
 	ret = try_grab_folio(page_folio(page), 1, flags);
 	if (ret)
-		return ERR_PTR(ret);
+		return ret;
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	if (pmd_trans_huge(pmdval) && (flags & FOLL_TOUCH))
@@ -757,23 +760,26 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
 	page += (addr & ~HPAGE_PMD_MASK) >> PAGE_SHIFT;
 	*page_mask = HPAGE_PMD_NR - 1;
 
-	return page;
+	gup_fill_pages(vma, addr, page, 1, pages);
+
+	return 1;
 }
 
 #else  /* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
-static struct page *follow_huge_pud(struct vm_area_struct *vma,
-				    unsigned long addr, pud_t *pudp,
-				    int flags, unsigned long *page_mask)
+static long follow_huge_pud(struct vm_area_struct *vma,
+		unsigned long addr, pud_t *pudp,
+		unsigned int flags, unsigned long *page_mask,
+		struct page **pages)
 {
-	return NULL;
+	return 0;
 }
 
-static struct page *follow_huge_pmd(struct vm_area_struct *vma,
-				    unsigned long addr, pmd_t *pmd,
-				    unsigned int flags,
-				    unsigned long *page_mask)
+static long follow_huge_pmd(struct vm_area_struct *vma,
+		unsigned long addr, pmd_t *pmd,
+		unsigned int flags, unsigned long *page_mask,
+		struct page **pages)
 {
-	return NULL;
+	return 0;
 }
 #endif	/* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
 
@@ -816,15 +822,16 @@ static inline bool can_follow_write_pte(pte_t pte, struct page *page,
 	return !userfaultfd_pte_wp(vma, pte);
 }
 
-static struct page *follow_page_pte(struct vm_area_struct *vma,
-		unsigned long address, pmd_t *pmd, unsigned int flags)
+static long follow_page_pte(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmd, unsigned int flags,
+		struct page **pages)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	struct folio *folio;
 	struct page *page;
 	spinlock_t *ptl;
 	pte_t *ptep, pte;
-	int ret;
+	long ret;
 
 	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
 	if (!ptep)
@@ -842,14 +849,14 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 	 */
 	if ((flags & FOLL_WRITE) &&
 	    !can_follow_write_pte(pte, page, vma, flags)) {
-		page = NULL;
+		ret = 0;
 		goto out;
 	}
 
 	if (unlikely(!page)) {
 		if (flags & FOLL_DUMP) {
 			/* Avoid special (like zero) pages in core dumps */
-			page = ERR_PTR(-EFAULT);
+			ret = -EFAULT;
 			goto out;
 		}
 
@@ -857,14 +864,13 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 			page = pte_page(pte);
 		} else {
 			ret = follow_pfn_pte(vma, address, ptep, flags);
-			page = ERR_PTR(ret);
 			goto out;
 		}
 	}
 	folio = page_folio(page);
 
 	if (!pte_write(pte) && gup_must_unshare(vma, flags, page)) {
-		page = ERR_PTR(-EMLINK);
+		ret = -EMLINK;
 		goto out;
 	}
 
@@ -873,10 +879,8 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 
 	/* try_grab_folio() does nothing unless FOLL_GET or FOLL_PIN is set. */
 	ret = try_grab_folio(folio, 1, flags);
-	if (unlikely(ret)) {
-		page = ERR_PTR(ret);
+	if (unlikely(ret))
 		goto out;
-	}
 
 	/*
 	 * We need to make the page accessible if and only if we are going
@@ -886,8 +890,7 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 	if (flags & FOLL_PIN) {
 		ret = arch_make_folio_accessible(folio);
 		if (ret) {
-			unpin_user_page(page);
-			page = ERR_PTR(ret);
+			gup_put_folio(folio, 1, flags);
 			goto out;
 		}
 	}
@@ -902,24 +905,27 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 		 */
 		folio_mark_accessed(folio);
 	}
+
+	gup_fill_pages(vma, address, page, 1, pages);
+	ret = 1;
 out:
 	pte_unmap_unlock(ptep, ptl);
-	return page;
+	return ret;
 no_page:
 	pte_unmap_unlock(ptep, ptl);
 	if (!pte_none(pte))
-		return NULL;
+		return 0;
 	return no_page_table(vma, flags, address);
 }
 
-static struct page *follow_pmd_mask(struct vm_area_struct *vma,
-				    unsigned long address, pud_t *pudp,
-				    unsigned int flags,
-				    unsigned long *page_mask)
+static long follow_pmd_mask(struct vm_area_struct *vma,
+		unsigned long address, pud_t *pudp,
+		unsigned int flags, unsigned long *page_mask,
+		struct page **pages)
 {
 	pmd_t *pmd, pmdval;
 	spinlock_t *ptl;
-	struct page *page;
+	long ret;
 	struct mm_struct *mm = vma->vm_mm;
 
 	pmd = pmd_offset(pudp, address);
@@ -929,7 +935,7 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
 	if (!pmd_present(pmdval))
 		return no_page_table(vma, flags, address);
 	if (likely(!pmd_leaf(pmdval)))
-		return follow_page_pte(vma, address, pmd, flags);
+		return follow_page_pte(vma, address, pmd, flags, pages);
 
 	if (pmd_protnone(pmdval) && !gup_can_follow_protnone(vma, flags))
 		return no_page_table(vma, flags, address);
@@ -942,28 +948,28 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
 	}
 	if (unlikely(!pmd_leaf(pmdval))) {
 		spin_unlock(ptl);
-		return follow_page_pte(vma, address, pmd, flags);
+		return follow_page_pte(vma, address, pmd, flags, pages);
 	}
 	if (pmd_trans_huge(pmdval) && (flags & FOLL_SPLIT_PMD)) {
 		spin_unlock(ptl);
 		split_huge_pmd(vma, pmd, address);
 		/* If pmd was left empty, stuff a page table in there quickly */
-		return pte_alloc(mm, pmd) ? ERR_PTR(-ENOMEM) :
-			follow_page_pte(vma, address, pmd, flags);
+		return pte_alloc(mm, pmd) ? -ENOMEM :
+			follow_page_pte(vma, address, pmd, flags, pages);
 	}
-	page = follow_huge_pmd(vma, address, pmd, flags, page_mask);
+	ret = follow_huge_pmd(vma, address, pmd, flags, page_mask, pages);
 	spin_unlock(ptl);
-	return page;
+	return ret;
 }
 
-static struct page *follow_pud_mask(struct vm_area_struct *vma,
-				    unsigned long address, p4d_t *p4dp,
-				    unsigned int flags,
-				    unsigned long *page_mask)
+static long follow_pud_mask(struct vm_area_struct *vma,
+		unsigned long address, p4d_t *p4dp,
+		unsigned int flags, unsigned long *page_mask,
+		struct page **pages)
 {
 	pud_t *pudp, pud;
 	spinlock_t *ptl;
-	struct page *page;
+	long ret;
 	struct mm_struct *mm = vma->vm_mm;
 
 	pudp = pud_offset(p4dp, address);
@@ -972,22 +978,22 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
 		return no_page_table(vma, flags, address);
 	if (pud_leaf(pud)) {
 		ptl = pud_lock(mm, pudp);
-		page = follow_huge_pud(vma, address, pudp, flags, page_mask);
+		ret = follow_huge_pud(vma, address, pudp, flags, page_mask, pages);
 		spin_unlock(ptl);
-		if (page)
-			return page;
+		if (ret)
+			return ret;
 		return no_page_table(vma, flags, address);
 	}
 	if (unlikely(pud_bad(pud)))
 		return no_page_table(vma, flags, address);
 
-	return follow_pmd_mask(vma, address, pudp, flags, page_mask);
+	return follow_pmd_mask(vma, address, pudp, flags, page_mask, pages);
 }
 
-static struct page *follow_p4d_mask(struct vm_area_struct *vma,
-				    unsigned long address, pgd_t *pgdp,
-				    unsigned int flags,
-				    unsigned long *page_mask)
+static long follow_p4d_mask(struct vm_area_struct *vma,
+		unsigned long address, pgd_t *pgdp,
+		unsigned int flags, unsigned long *page_mask,
+		struct page **pages)
 {
 	p4d_t *p4dp, p4d;
 
@@ -998,7 +1004,7 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 	if (!p4d_present(p4d) || p4d_bad(p4d))
 		return no_page_table(vma, flags, address);
 
-	return follow_pud_mask(vma, address, p4dp, flags, page_mask);
+	return follow_pud_mask(vma, address, p4dp, flags, page_mask, pages);
 }
 
 /**
@@ -1007,6 +1013,9 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
  * @address: virtual address to look up
  * @flags: flags modifying lookup behaviour
  * @page_mask: a pointer to output page_mask
+ * @pages: array to receive the page found, refcounted per @flags, or NULL
+ *         to walk the page tables (e.g. to fault pages in) without
+ *         collecting or refcounting them
  *
  * @flags can have FOLL_ flags set, defined in <linux/mm.h>
  *
@@ -1017,17 +1026,17 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
  *
  * On output, @page_mask is set according to the size of the page.
  *
- * Return: the mapped (struct page *), %NULL if no mapping exists, or
- * an error pointer if there is a mapping to something not represented
- * by a page descriptor (see also vm_normal_page()).
+ * Return: 1 with @pages[0] filled in if a page was found, 0 if no mapping
+ * exists at @address, or a negative errno for a mapping to something not
+ * represented by a page descriptor (see also vm_normal_page()).
  */
-static struct page *follow_page_mask(struct vm_area_struct *vma,
-			      unsigned long address, unsigned int flags,
-			      unsigned long *page_mask)
+static long follow_page_mask(struct vm_area_struct *vma,
+		unsigned long address, unsigned int flags,
+		unsigned long *page_mask, struct page **pages)
 {
 	pgd_t *pgd;
 	struct mm_struct *mm = vma->vm_mm;
-	struct page *page;
+	long ret;
 
 	vma_pgtable_walk_begin(vma);
 
@@ -1035,13 +1044,13 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 	pgd = pgd_offset(mm, address);
 
 	if (pgd_none(*pgd) || unlikely(pgd_bad(*pgd)))
-		page = no_page_table(vma, flags, address);
+		ret = no_page_table(vma, flags, address);
 	else
-		page = follow_p4d_mask(vma, address, pgd, flags, page_mask);
+		ret = follow_p4d_mask(vma, address, pgd, flags, page_mask, pages);
 
 	vma_pgtable_walk_end(vma);
 
-	return page;
+	return ret;
 }
 
 static int get_gate_page(struct mm_struct *mm, unsigned long address,
@@ -1391,6 +1400,7 @@ static long __get_user_pages(struct mm_struct *mm,
 	do {
 		struct page *page;
 		unsigned int page_increm;
+		long nr;
 
 		/* first iteration or cross vma bound */
 		if (!vma || start >= vma->vm_end) {
@@ -1417,8 +1427,12 @@ static long __get_user_pages(struct mm_struct *mm,
 						pages ? &page : NULL);
 				if (ret)
 					goto out;
-				page_mask = 0;
-				goto next_page;
+				gup_fill_pages(vma, start, page, 1,
+					       pages ? pages + i : NULL);
+				i++;
+				start += PAGE_SIZE;
+				nr_pages--;
+				continue;
 			}
 
 			if (!vma) {
@@ -1440,10 +1454,11 @@ static long __get_user_pages(struct mm_struct *mm,
 		}
 		cond_resched();
 
-		page = follow_page_mask(vma, start, gup_flags, &page_mask);
-		if (!page || PTR_ERR(page) == -EMLINK) {
+		nr = follow_page_mask(vma, start, gup_flags, &page_mask,
+				      pages ? &pages[i] : NULL);
+		if (!nr || nr == -EMLINK) {
 			ret = faultin_page(vma, start, gup_flags,
-					   PTR_ERR(page) == -EMLINK, locked);
+					   nr == -EMLINK, locked);
 			switch (ret) {
 			case 0:
 				goto retry;
@@ -1457,7 +1472,7 @@ static long __get_user_pages(struct mm_struct *mm,
 				goto out;
 			}
 			BUG();
-		} else if (PTR_ERR(page) == -EEXIST) {
+		} else if (nr == -EEXIST) {
 			/*
 			 * Proper page table entry exists, but no corresponding
 			 * struct page. If the caller expects **pages to be
@@ -1465,49 +1480,48 @@ static long __get_user_pages(struct mm_struct *mm,
 			 * for this page.
 			 */
 			if (pages) {
-				ret = PTR_ERR(page);
+				ret = nr;
 				goto out;
 			}
-		} else if (IS_ERR(page)) {
-			ret = PTR_ERR(page);
+		} else if (nr < 0) {
+			ret = nr;
 			goto out;
 		}
-next_page:
+
 		page_increm = 1 + (~(start >> PAGE_SHIFT) & page_mask);
 		if (page_increm > nr_pages)
 			page_increm = nr_pages;
 
-		if (pages) {
+		/*
+		 * This must be a large folio (and doesn't need to
+		 * be the whole folio; it can be part of it), do
+		 * the refcount work for all the subpages too.
+		 *
+		 * NOTE: here the page may not be the head page
+		 * e.g. when start addr is not thp-size aligned.
+		 * try_grab_folio() should have taken care of tail
+		 * pages.
+		 */
+		if (pages && page_increm > 1) {
+			struct folio *folio = page_folio(pages[i]);
+
 			/*
-			 * This must be a large folio (and doesn't need to
-			 * be the whole folio; it can be part of it), do
-			 * the refcount work for all the subpages too.
-			 *
-			 * NOTE: here the page may not be the head page
-			 * e.g. when start addr is not thp-size aligned.
-			 * try_grab_folio() should have taken care of tail
-			 * pages.
+			 * Since we already hold refcount on the
+			 * large folio, this should never fail.
 			 */
-			if (page_increm > 1) {
-				struct folio *folio = page_folio(page);
-
+			if (try_grab_folio(folio, page_increm - 1,
+					   gup_flags)) {
 				/*
-				 * Since we already hold refcount on the
-				 * large folio, this should never fail.
+				 * Release the 1st page ref if the
+				 * folio is problematic, fail hard.
 				 */
-				if (try_grab_folio(folio, page_increm - 1,
-						   gup_flags)) {
-					/*
-					 * Release the 1st page ref if the
-					 * folio is problematic, fail hard.
-					 */
-					gup_put_folio(folio, 1, gup_flags);
-					ret = -EFAULT;
-					goto out;
-				}
+				gup_put_folio(folio, 1, gup_flags);
+				ret = -EFAULT;
+				goto out;
 			}
 
-			gup_fill_pages(vma, start, page, page_increm, pages + i);
+			gup_fill_pages(vma, start + PAGE_SIZE, pages[i] + 1,
+				       page_increm - 1, pages + i + 1);
 		}
 
 		i += page_increm;
-- 
2.53.0-Meta

