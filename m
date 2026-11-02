Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619031;
	b=wI1kx8mu64/ztLA7JIQEBBPSx1+F554YeQl+Dvw1ORQ7gw0HXDw3OXkWIx9q7s7bveXN
	 8no5IeCDqPjfu9vJiP2sOKoI0TpmtqBO9X5zYQAvx3QaIpoN0q6XHIHOvN17JjzP4t0Yj
	 z3BVkSQUya9PZYbq6D71AtYV9ilH5j57SMk1Qi0H3EdRc8FOmaS3nLbr4Dw7yXhdBF0lU
	 hiUopfsu0EVkUG7GHru+LNDyAKHUweSqQqLpevFkG5A6RZ3W6wrlqRojKqbD0+mONTZPH
	 RalSzRnxbvWMK3qQ0+wFh3JDWE6OaIT9XxzSxL1KcsQGIaVSTzZ+eaOOPs8qVg9hBVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619031;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=CyfI2URWEEZSUDLYtQ8leAcYbuBDAQCTWOVugCAWeV4=;
	b=iBYOUfV/VxPMnU5e5C8vArNCAumyy4nh75dLQIAANHiFEEn2NI0hme088LimPA4cRHuA
	 goz4NlhVY2dJLAQ6E4N1CuhZxgtq3gpOz4x23FflcLh7xXDFXHWrCpbB83k488vhbXy1o
	 j/0tATd9a81Hn7Zl1M8ZUweNZs1pGlAFmS8W4BGLwXruWeud2MJV9hNYidekCGM78xxdj
	 Q6Sy7CbXgIST77pBqIPvKWesYFZfur5Cvku54lyW5P2kpq+iWi3oWuXcXJBqGteGUbi2p
	 e7tePgUVC1pLyp72SN92NXEHMpzpEVbP2BDUm8oAQbZs2U20tBpoCHSS5uS5caI7h9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XLiXGnf0;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53845606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53845606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XLiXGnf0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F147293B;
	Mon,  2 Nov 2026 03:30:27 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C15DD3F632;
	Mon,  2 Nov 2026 03:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793619030; bh=GEgao3jfAi97/KvYK2veDWTPC1m/gdO7DW7bwurZlRM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XLiXGnf00xkvKIUafAQUeHYdENhmgL4sxUWBXisxFXljYCO44sut8T7qDwvsOxxpb
	 sIWIbr7lPBZMIZWQd2Oxk5ctUvHKihU3LQZpuyIqA1tyS/aG0FHnWFCQ3pteULiCRL
	 kZDGGQG5b9TQzqESoOpXQqrE/udOKrQKwki/Gotk=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:30:16 +0000
Subject: [PATCH v2 1/4] mm: gup: introduce gup_unshared_pages()
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
Message-Id: <20261102-refactor_gup_fast-v2-1-bc1ac018c834@arm.com>
References: <20261102-refactor_gup_fast-v2-0-bc1ac018c834@arm.com>
In-Reply-To: <20261102-refactor_gup_fast-v2-0-bc1ac018c834@arm.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Rik van Riel <riel@surriel.com>, 
 Yuan-Hao Hsu <aa9736195201@gmail.com>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6819; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=GEgao3jfAi97/KvYK2veDWTPC1m/gdO7DW7bwurZlRM=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HRQmVkVyCjC+EeXYi6E21LfeXEwU749jq1po
 RzHY3/yzC+JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauh0UAAKCRBt1cPRWsUx
 MyHIC/0TxjuZnMQ+FNmQwTWYDFrWseD9LL5B6jSB905GLvi/7KGxw7skPmQqkQu5xKbtNF/XJAI
 2G7Cjwouc2XmpheH3wLDURh8oiJUhTGH2h2aPbAw2WB7KVM4oeZXvXMUZILv/UkqzqOgUGOFvp7
 EWy86UIT+pV3QeESX/QQPcv14whSYkuBpbyrxB3E7pzld0cYQlIYo4riV9+ApJ82PWgkPOv+i8Q
 be4S9c77HHZ+Ekal3eeEK7Keijfm/IpHANwCT9JZBUjhX7GrczoOHP8I8u9OKi65DYvUI5FkssN
 awsXgiKUS7A9c8xdSRq3MaRLbGlxsYjn7PyFCRMBhtjQ5mzV/SKhtVEhz8Sb6PDpVcZgZ1E7To+
 n8cZXN7eOw/ZlE1ZhhoUCrHNbw3VlZGhU1OG07Cy6dOl1eOBwNYR9L8jVSZt3nrsSOHkwlYjoye
 IDlkL+b3wL3lkzaf9yI62QymzNsFauRbhlGYmoyTR+7oqT6zfA80JfLq8YgnzAXwkwhbQ=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

This is preparatory patch to make gup_fast_pte_range() batchable.

Introduce gup_unshared_pages() to count consecutive pages within a folio
that do not require unsharing, and use it to implement gup_must_unshare().

Also add a folio argument to gup_must_unshare() so callers can reuse an
existing folio and avoid the compound_head() call implicit in PageAnon().

There is no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 mm/gup.c      | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++------
 mm/internal.h | 49 ++++++------------------------------------
 2 files changed, 70 insertions(+), 48 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 7d43ce717b246..49681f63950ec 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -633,6 +633,59 @@ static struct page *no_page_table(struct vm_area_struct *vma,
 	return NULL;
 }
 
+unsigned long gup_unshared_pages(struct vm_area_struct *vma, unsigned int flags,
+				 struct folio *folio, struct page *page,
+				 unsigned long nr_pages)
+{
+	unsigned int i;
+
+	/*
+	 * FOLL_WRITE is implicitly handled correctly as the page table entry
+	 * has to be writable -- and if it references (part of) an anonymous
+	 * folio, that part is required to be marked exclusive.
+	 */
+	if ((flags & (FOLL_WRITE | FOLL_PIN)) != FOLL_PIN)
+		return nr_pages;
+	/*
+	 * Note: PageAnon(page) is stable until the page is actually getting
+	 * freed.
+	 */
+	if (!folio_test_anon(folio)) {
+		/*
+		 * We only care about R/O long-term pining: R/O short-term
+		 * pinning does not have the semantics to observe successive
+		 * changes through the process page tables.
+		 */
+		if (!(flags & FOLL_LONGTERM))
+			return nr_pages;
+
+		/* We really need the vma ... */
+		if (!vma || vma_is_cow_mapping(vma))
+			return 0;
+
+		/*
+		 * ... because we only care about writable private ("COW")
+		 * mappings where we have to break COW early.
+		 */
+		return nr_pages;
+	}
+
+	/* Paired with a memory barrier in folio_try_share_anon_rmap_*(). */
+	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
+		smp_rmb();
+
+	/*
+	 * Note that KSM pages cannot be exclusive, and consequently,
+	 * cannot get pinned.
+	 */
+	for (i = 0; i < nr_pages; i++) {
+		if (!PageAnonExclusive(page + i))
+			return i;
+	}
+
+	return nr_pages;
+}
+
 #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
 /* FOLL_FORCE can write to even unwritable PUDs in COW mappings. */
 static inline bool can_follow_write_pud(pud_t pud, struct page *page,
@@ -668,7 +721,8 @@ static struct page *follow_huge_pud(struct vm_area_struct *vma,
 	pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
 	page = pfn_to_page(pfn);
 
-	if (!pud_write(pud) && gup_must_unshare(vma, flags, page))
+	if (!pud_write(pud) &&
+	    gup_must_unshare(vma, flags, page_folio(page), page))
 		return ERR_PTR(-EMLINK);
 
 	ret = try_grab_folio(page_folio(page), 1, flags);
@@ -722,7 +776,8 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
 	if (pmd_protnone(*pmd) && !gup_can_follow_protnone(vma, flags))
 		return NULL;
 
-	if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
+	if (!pmd_write(pmdval) &&
+	    gup_must_unshare(vma, flags, page_folio(page), page))
 		return ERR_PTR(-EMLINK);
 
 	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
@@ -846,7 +901,7 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 	}
 	folio = page_folio(page);
 
-	if (!pte_write(pte) && gup_must_unshare(vma, flags, page)) {
+	if (!pte_write(pte) && gup_must_unshare(vma, flags, folio, page)) {
 		page = ERR_PTR(-EMLINK);
 		goto out;
 	}
@@ -2892,7 +2947,7 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 			goto pte_unmap;
 		}
 
-		if (!pte_write(pte) && gup_must_unshare(NULL, flags, page)) {
+		if (!pte_write(pte) && gup_must_unshare(NULL, flags, folio, page)) {
 			gup_put_folio(folio, 1, flags);
 			goto pte_unmap;
 		}
@@ -2969,7 +3024,8 @@ static unsigned long gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp,
 		gup_put_folio(folio, nr_pages, flags);
 		return 0;
 	}
-	if (!pmd_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
+	if (!pmd_write(orig) &&
+	    gup_must_unshare(NULL, flags, folio, &folio->page)) {
 		gup_put_folio(folio, nr_pages, flags);
 		return 0;
 	}
@@ -3011,7 +3067,8 @@ static unsigned long gup_fast_pud_leaf(pud_t orig, pud_t *pudp,
 		return 0;
 	}
 
-	if (!pud_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
+	if (!pud_write(orig) &&
+	    gup_must_unshare(NULL, flags, folio, &folio->page)) {
 		gup_put_folio(folio, nr_pages, flags);
 		return 0;
 	}
diff --git a/mm/internal.h b/mm/internal.h
index c53c369bf8b5d..35016b1afc8bf 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1282,6 +1282,10 @@ int migrate_device_coherent_folio(struct folio *folio);
 int __must_check try_grab_folio(struct folio *folio, int refs,
 				unsigned int flags);
 
+unsigned long gup_unshared_pages(struct vm_area_struct *vma, unsigned int flags,
+				 struct folio *folio, struct page *page,
+				 unsigned long nr_pages);
+
 /*
  * mm/huge_memory.c
  */
@@ -1354,51 +1358,12 @@ enum {
  * to fallback to the slow path just to lookup the vma.
  */
 static inline bool gup_must_unshare(struct vm_area_struct *vma,
-				    unsigned int flags, struct page *page)
+				    unsigned int flags,
+				    struct folio *folio, struct page *page)
 {
-	/*
-	 * FOLL_WRITE is implicitly handled correctly as the page table entry
-	 * has to be writable -- and if it references (part of) an anonymous
-	 * folio, that part is required to be marked exclusive.
-	 */
-	if ((flags & (FOLL_WRITE | FOLL_PIN)) != FOLL_PIN)
-		return false;
-	/*
-	 * Note: PageAnon(page) is stable until the page is actually getting
-	 * freed.
-	 */
-	if (!PageAnon(page)) {
-		/*
-		 * We only care about R/O long-term pining: R/O short-term
-		 * pinning does not have the semantics to observe successive
-		 * changes through the process page tables.
-		 */
-		if (!(flags & FOLL_LONGTERM))
-			return false;
-
-		/* We really need the vma ... */
-		if (!vma)
-			return true;
-
-		/*
-		 * ... because we only care about writable private ("COW")
-		 * mappings where we have to break COW early.
-		 */
-		return vma_is_cow_mapping(vma);
-	}
-
-	/* Paired with a memory barrier in folio_try_share_anon_rmap_*(). */
-	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
-		smp_rmb();
-
-	/*
-	 * Note that KSM pages cannot be exclusive, and consequently,
-	 * cannot get pinned.
-	 */
-	return !PageAnonExclusive(page);
+	return gup_unshared_pages(vma, flags, folio, page, 1) != 1;
 }
 
-
 static inline bool vma_soft_dirty_enabled(struct vm_area_struct *vma)
 {
 	/*

-- 
2.43.0

