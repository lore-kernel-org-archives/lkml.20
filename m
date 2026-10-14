Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EC3569F0F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002643; cv=none; b=U0mUFVlKS2XNpNMk5wYf+ifZa3hp0x6Uej+j8C5FMHMVmA9HovOJGVUdQCDFAurg5hYrtxe0Cl45VaJ84nbP2Eg972eFR3borAU6eX764ng/eSEod3EczWWEGkCQu7GAVOHtXyAwSx7hRsZy+ep9JJXDFvXNhKSWgtfaQo/QY/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002643; c=relaxed/simple;
	bh=UNw2BubWWFmr5yIohRWiLpSz99E6Goio0mZ5j9KXo3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNjJr4oKnEW+/3LwmvH7UrL+Z5ONgQuEg7v5J2lxWln5gmzeK9Vur75V/UCSc8BI0jywGzcrptRtj2DlKWKuPfwK956+lgjRW5HRpxqDNX74SPOf9k01oLlg/ldzN6FrtJ8zAwDvQpg6d6Z7CBXXZ2dBKxqzJlxKiI4JpG+hNHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=gn52DVVG; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="gn52DVVG"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93cb9e9405fso41528785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792002641; x=1792607441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rnuGk4ufowJ9LY5euPS4WtjSZLrLvn92pFDqhxj834=;
        b=gn52DVVG9IhMHLB4MvLynuLwnb/t7eLlxS71I5bezyS7EftiPy9Rwe9kLlB0T38HEe
         LYCNW7dMaA6gXiOOlVPhvgk6TSvQQmJtO+Iox3jlgCo+0ABS8kIiLdQpeWbZaas0Zlbc
         cnhgfLUavjjRF/uHAkFgx8x7RSDE8LUbqNbatuwkTU+B8JTINpwfjZhFmqsupKEgIJj3
         kdMRcCFaYZPpiu6dgNsbMBxcaJjrnHRIUiN72GQRxGcMutcjAFjg1xxAJSPHK3OoR8m4
         h50coUI8mApiBkMdMk73/ybQstNg9Ehq+WyyWbZVg7YflmeeYsn7XOPNgF8KJ/dHz+RS
         fw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002641; x=1792607441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rnuGk4ufowJ9LY5euPS4WtjSZLrLvn92pFDqhxj834=;
        b=OCIxaaDdIo9eV5ioCRNTz2jUQVJiaLlsSC6gjzDY09b1ttOwyww2gctBO2h+3Teju6
         4307rJg3oAanBIhVJPXmGkkgpc4Hk9G2nP3FnUag2RLo1RJ1sWDGojXMIxsdtRPhO/uO
         OrBUC5IHUeeQva7+/J6gzlp+/uoS8jbLqH3EdTie2xizqSEy7e3UiXugKw2/CsSI8T2o
         5Sh1+QX4Qb71frdgThMfhAN8DS2Qt0McPUFflDGFA7fcHFVgIoLZZwsyxJAvuxqWpjyn
         /14Os8FZCWyvXo+FxsTJFxfTDybZOQ+MJXvFySGVVDKRq8fwIuqunp5aelqoEcamziUu
         YyzA==
X-Gm-Message-State: AFq9FYItiPLvXIIPh2nzwhRoNV3AUkH2W5ikdq0XubxUIrOgu0naU0YB
	PJVQD4bpL1qFgi68c15Bv/hY8tUB4dg7xA6y7LcKrKxdFOrmpcuqNBJb0RRM9/tG0y0=
X-Gm-Gg: AYBFou31MwV0aDqvctyCj/r3hiS21/N8FcTazw7pwzQj/sUi1Li7PAbirPhZBhsZBYX
	Ijc/hBPvhj0ZUzVKrGUGGyoPRKtNaRBZ0A3PshtS1dVmUIEHVNrxL8yVBYWBs8xAW7G5GJyWKG1
	GmzdIhFKJyM0AGYXpqf/4o505Rcm2QekKYfL4koIlSSY2V0OI6BZjFY1LLuvaVAJcPBKc4LpBPE
	CMoQc62RE42KnlNCpznb0f029Y51tFiKi5sgRdyRS+bcelH93WFch4VYUvDtA4T1WHS7IVqx8zS
	chFoyXjaL+VA4j1dVLj43c6y2ZuqNO+WtbSD83SvL4ne7xrUPJ3sjVX9OreUmMBtWn45m2/gV8D
	H2+G8e/A5EXEOAQjekd/GK/B+0mnTnob4ui6Q6oGUp0cA7ued+n/MZl6tflfjMOzpwqz3EFE8lX
	hSjfPbE0qx9iJIzWSC/QhMiSSiU1RUz5mbyTmyDCGvAGFiPr4Ilf3InKndE4zIZkvmOphFvNlzr
	uWQm4oC88mEzc9u2jcgktyUGnbe+3XdIcI/QIQKhvfKzQE3BHF+PXmH+I7g
X-Received: by 2002:a05:620a:2715:b0:93e:6709:bc7f with SMTP id af79cd13be357-93ebd2113a5mr2385591185a.15.1792002639693;
        Wed, 14 Oct 2026 11:30:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef508811esm556593085a.36.2026.10.14.11.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:30:39 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com
Subject: [PATCH v2 07/10] mm/madvise: separate PTE-batch folio processing
Date: Wed, 14 Oct 2026 14:30:21 -0400
Message-ID: <20261014183024.2075709-8-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014183024.2075709-1-gourry@gourry.net>
References: <20261014183024.2075709-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each pass of the PTE loop validates the entry, batches the PTEs that
map one large folio, decides whether a partly mapped large folio must
be split, and ages or isolates the folio.

The split path also drops and retakes the PTE lock in the middle of
that sequence.

Move the per-batch work into madvise_lru_pte_batch_locked(), which
runs under the PTE lock and returns a folio that needs splitting locked
and referenced.

The folio lookup goes into madvise_lru_pte_folio() and the MADV_COLD
young-bit clearing into madvise_cold_ptes(). The loop drops the lock,
splits the folio and maps the PTE table again at the same address.

No functional change intended.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 151 +++++++++++++++++++++++++++++----------------------
 1 file changed, 86 insertions(+), 65 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index a9e5a3e2fab4..0c0a840102eb 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -407,6 +407,77 @@ static int madvise_lru_split_folio(struct folio *folio)
 	return err;
 }
 
+static void madvise_cold_ptes(struct mmu_gather *tlb,
+		struct vm_area_struct *vma, pte_t *pte, unsigned long addr,
+		int nr, pte_t ptent)
+{
+	if (!pte_young(ptent))
+		return;
+
+	clear_young_dirty_ptes(vma, addr, pte, nr, CYDP_CLEAR_YOUNG);
+	tlb_remove_tlb_entries(tlb, pte, nr, addr);
+}
+
+/* Return the normal folio mapped by a present PTE, or NULL. */
+static struct folio *madvise_lru_pte_folio(struct vm_area_struct *vma,
+		unsigned long addr, pte_t ptent)
+{
+	struct folio *folio;
+
+	if (pte_none(ptent) || !pte_present(ptent))
+		return NULL;
+
+	folio = vm_normal_folio(vma, addr, ptent);
+	if (!folio || folio_is_zone_device(folio))
+		return NULL;
+	return folio;
+}
+
+/* Return a split candidate locked and referenced for use after the PTL drop. */
+static struct folio *madvise_lru_pte_batch_locked(pte_t *pte,
+		unsigned long addr, unsigned long end, struct mm_walk *walk,
+		struct list_head *folio_list, bool pageout_anon_only, int *nr)
+{
+	const struct madvise_walk_private *private = walk->private;
+	struct vm_area_struct *vma = walk->vma;
+	pte_t ptent = ptep_get(pte);
+	struct folio *folio;
+
+	*nr = 1;
+	folio = madvise_lru_pte_folio(vma, addr, ptent);
+	if (!folio)
+		return NULL;
+
+	/* Split a large folio that the range only partly maps. */
+	if (folio_test_large(folio)) {
+		*nr = madvise_folio_pte_batch(addr, end, folio, pte, &ptent);
+		if (*nr < folio_nr_pages(folio)) {
+			if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
+				return NULL;
+			if (!folio_trylock(folio))
+				return NULL;
+			folio_get(folio);
+			return folio;
+		}
+	}
+
+	/*
+	 * Skip non-LRU folios and folios mapped elsewhere. A large folio here
+	 * is fully mapped, so it is exclusive if its mapcount equals its page
+	 * count.
+	 */
+	if (!folio_test_lru(folio) ||
+	    folio_mapcount(folio) != folio_nr_pages(folio))
+		return NULL;
+	if (pageout_anon_only && !folio_test_anon(folio))
+		return NULL;
+
+	if (!private->pageout)
+		madvise_cold_ptes(private->tlb, vma, pte, addr, *nr, ptent);
+	madvise_lru_folio(folio, private->pageout, folio_list);
+	return NULL;
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void madvise_cold_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		pmd_t *pmd, unsigned long addr, pmd_t orig_pmd)
@@ -502,7 +573,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 	bool pageout = private->pageout;
 	struct mm_struct *mm = tlb->mm;
 	struct vm_area_struct *vma = walk->vma;
-	pte_t *start_pte, *pte, ptent;
+	pte_t *start_pte, *pte;
 	spinlock_t *ptl;
 	struct folio *folio = NULL;
 	LIST_HEAD(folio_list);
@@ -526,9 +597,6 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 	flush_tlb_batched_pending(mm);
 	lazy_mmu_mode_enable();
 	for (; addr < end; pte += nr, addr += nr * PAGE_SIZE) {
-		nr = 1;
-		ptent = ptep_get(pte);
-
 		if (++batch_count == SWAP_CLUSTER_MAX) {
 			batch_count = 0;
 			if (need_resched()) {
@@ -539,69 +607,22 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 			}
 		}
 
-		if (pte_none(ptent))
-			continue;
-
-		if (!pte_present(ptent))
-			continue;
-
-		folio = vm_normal_folio(vma, addr, ptent);
-		if (!folio || folio_is_zone_device(folio))
-			continue;
-
-		/*
-		 * If we encounter a large folio, only split it if it is not
-		 * fully mapped within the range we are operating on. Otherwise
-		 * leave it as is so that it can be swapped out whole. If we
-		 * fail to split a folio, leave it in place and advance to the
-		 * next pte in the range.
-		 */
-		if (folio_test_large(folio)) {
-			nr = madvise_folio_pte_batch(addr, end, folio, pte, &ptent);
-			if (nr < folio_nr_pages(folio)) {
-				int err;
-
-				if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
-					continue;
-				if (!folio_trylock(folio))
-					continue;
-				folio_get(folio);
-				lazy_mmu_mode_disable();
-				pte_unmap_unlock(start_pte, ptl);
-				start_pte = NULL;
-				err = madvise_lru_split_folio(folio);
-				start_pte = pte =
-					pte_offset_map_lock(mm, pmd, addr, &ptl);
-				if (!start_pte)
-					break;
-				flush_tlb_batched_pending(mm);
-				lazy_mmu_mode_enable();
-				if (!err)
-					nr = 0;
-				continue;
-			}
-		}
-
-		/*
-		 * Do not interfere with other mappings of this folio and
-		 * non-LRU folio. If we have a large folio at this point, we
-		 * know it is fully mapped so if its mapcount is the same as its
-		 * number of pages, it must be exclusive.
-		 */
-		if (!folio_test_lru(folio) ||
-		    folio_mapcount(folio) != folio_nr_pages(folio))
+		folio = madvise_lru_pte_batch_locked(pte, addr, end, walk,
+				&folio_list, pageout_anon_only, &nr);
+		if (!folio)
 			continue;
 
-		if (pageout_anon_only && !folio_test_anon(folio))
-			continue;
-
-		if (!pageout && pte_young(ptent)) {
-			clear_young_dirty_ptes(vma, addr, pte, nr,
-					       CYDP_CLEAR_YOUNG);
-			tlb_remove_tlb_entries(tlb, pte, nr, addr);
-		}
-
-		madvise_lru_folio(folio, pageout, &folio_list);
+		lazy_mmu_mode_disable();
+		pte_unmap_unlock(start_pte, ptl);
+		start_pte = NULL;
+		if (!madvise_lru_split_folio(folio))
+			nr = 0;
+		start_pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
+		if (!start_pte)
+			break;
+		pte = start_pte;
+		flush_tlb_batched_pending(mm);
+		lazy_mmu_mode_enable();
 	}
 
 out:
-- 
2.56.0

