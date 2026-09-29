Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05804C4F62
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718799; cv=none; b=HosnUZ6JFB4vrbzsWbvbI2jSTzDOuu06P5NEx7w9PWwAiPVhkGTtQWPHMCAdwa0ORlMPAw7abNUykpsOvo3QKFlMZE/Zro5Wfwb9YkqgAwHanhays7Rp1RiLCFyZgi5aVrQJ3/7mhmuEIjGVt/dbjvtod5dS8gmuzcY1ilBievU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718799; c=relaxed/simple;
	bh=sre7jyIMgAx+RR/5GMP5+K/HsjT6lY8YfkxLh2JZfP4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GJTuAY4bTvkjtow7BezcMh+KXLNQiDnmZA4f9oz03286HTdmX/Nh3h4fKhKUF3W9tEuGacG1QvZWa00ARZgu8VGNTLfpKWcd1LI/NyHE2IVXOVyz4MM64RbQ1If0g5np/0QEUgljyyN9/YB5ePHPZwK6sgYHPXsRRDANwyfgKgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HBJXYFjB; arc=none smtp.client-ip=74.125.82.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HBJXYFjB"
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1438719cc1eso5118832c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790718796; x=1791323596; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o1P9WuKoGNZI5bVMLBN5j4pkqMdI5a1cja1/URYfM68=;
        b=HBJXYFjBi8yWe2c6gZYU3xzgoXDdfv6KSNBf2i9xfu58GHiEqGDdlp36MhHEhzFOqq
         dn8WOaBNVMDo2JCxa/ACt3GASWMh4EM5dyZF+27Bd9hsd9c4e3k0ImpSAo91rxXOn67B
         5mRN8Tc0Qk1b+Ngacg5QcbeYozGcegE1uegrea85DY156xZiq7AQG17+Y9ADxJT/PVpE
         Mnhl833Xg8Vsm8u2fBc3JZrxFswfO6LZchkDoP9xA49aWyYc3eMDUnZQtwqe87mmuqtQ
         ZLmH8aJhnzLloz25FgIE7/nDxH24IRQRjuO3w8EZen7k+FP5tRJMyAPWRQ8cV/Qxmljw
         HytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718796; x=1791323596;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1P9WuKoGNZI5bVMLBN5j4pkqMdI5a1cja1/URYfM68=;
        b=InA0KA+l6LxsuuxutBpLuMhH9v7nshuqrU1yrBQyHpm0DyTIl8JqNULoL20CgdOyr9
         mgjK5UsdjjxWCPaMjLWktvs3DFq+oh8xFQQrB26jfRNHcTFQXsiwUCAe4XQ7cuG+SAo5
         paAO/2Ki0zT/VHXmIJF6tmBwyuSfcvCAZfY5SIQFNUxOIY1r11uMo1xeTP/K4vm4XRaV
         Kg0epFqXWiafN0Fs4cZAskqpsOUfe72JWcwY2I97m8nRo5zv93s7a8YnqoJI1aoPvHzF
         XOREPH6OWHbPvO753vIf4YSoFyQ5IGILmXF6cjPpIru9amhARcclimrgBiGIrtXP+rZY
         IHxw==
X-Forwarded-Encrypted: i=1; AKwUvBwq1ULF/wyV3b6lxqY2VUxNYBmDNh51eh3IGEVU+avSmurQBmZnwPjbJsXXK8VMMy1giXu7bYZ4THqUV4w=@vger.kernel.org
X-Gm-Message-State: AFuF++myq8Myt+nnYz/SLTXiUkEaCCQ13NkoJCDEtS//8g9FIEI0nrOc
	CMA/fGu+f5o1T/hewDcBWt6wHrpX8hwZ9G3G7j08FtOGDQyq/gsEgW331EvHoCs/UTk3WN2GJ2f
	dYcejoGU/udMBD6iCQEVD1Q==
X-Received: from dlbox7.prod.google.com ([2002:a05:7022:1207:b0:149:432f:988])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701a:c909:b0:14a:725b:7b40 with SMTP id a92af1059eb24-14ca02946f6mr559079c88.44.1790718795504;
 Tue, 29 Sep 2026 14:53:15 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:51:53 -0700
In-Reply-To: <20260929215206.516490-1-nilayvaish@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929215206.516490-1-nilayvaish@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929215206.516490-3-nilayvaish@google.com>
Subject: [PATCH 02/15] mm/huge_memory: use folio_page() in PMD/PUD rmap, zap,
 and migration
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Roman Gushchin <kfree@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

As part of the memdescs effort, struct folio will be allocated
separately from struct page and will no longer overlay the head page.

Replace direct &folio->page uses with folio_page(folio, 0) in
insert_pmd(), insert_pud(), copy_huge_non_present_pmd(),
zap_huge_pmd_folio(), zap_huge_pmd(), move_pages_huge_pmd(), and
remove_migration_pmd().

No functional change intended.

Assisted-by: LLM
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 mm/huge_memory.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ddc631a388b9..31af817eeded 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1664,7 +1664,8 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 			entry = pmd_mkspecial(entry);
 		} else {
 			folio_get(fop.folio);
-			folio_add_file_rmap_pmd(fop.folio, &fop.folio->page, vma);
+			folio_add_file_rmap_pmd(fop.folio,
+						folio_page(fop.folio, 0), vma);
 			add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
 		}
 	} else {
@@ -1786,7 +1787,8 @@ static vm_fault_t insert_pud(struct vm_area_struct *vma, unsigned long addr,
 		entry = folio_mk_pud(fop.folio, vma->vm_page_prot);
 
 		folio_get(fop.folio);
-		folio_add_file_rmap_pud(fop.folio, &fop.folio->page, vma);
+		folio_add_file_rmap_pud(fop.folio,
+					folio_page(fop.folio, 0), vma);
 		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PUD_NR);
 	} else {
 		entry = pud_mkhuge(pfn_pud(fop.pfn, prot));
@@ -1935,7 +1937,7 @@ static void copy_huge_non_present_pmd(
 		 * folio_try_dup_anon_rmap_pmd does not fail for
 		 * device private entries.
 		 */
-		folio_try_dup_anon_rmap_pmd(src_folio, &src_folio->page,
+		folio_try_dup_anon_rmap_pmd(src_folio, folio_page(src_folio, 0),
 					    dst_vma, src_vma);
 	}
 
@@ -2487,7 +2489,7 @@ static void zap_huge_pmd_folio(struct mm_struct *mm, struct vm_area_struct *vma,
 
 	/* Present and device private folios are rmappable. */
 	if (is_present || is_device_private)
-		folio_remove_rmap_pmd(folio, &folio->page, vma);
+		folio_remove_rmap_pmd(folio, folio_page(folio, 0), vma);
 
 	if (folio_test_anon(folio)) {
 		add_mm_counter(mm, MM_ANONPAGES, -HPAGE_PMD_NR);
@@ -2572,7 +2574,7 @@ bool zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 
 	spin_unlock(ptl);
 	if (is_present && folio)
-		tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
+		tlb_remove_page_size(tlb, folio_page(folio, 0), HPAGE_PMD_SIZE);
 	return true;
 }
 
@@ -2947,7 +2949,7 @@ int move_pages_huge_pmd(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd, pm
 	}
 	if (src_folio) {
 		if (folio_maybe_dma_pinned(src_folio) ||
-		    !PageAnonExclusive(&src_folio->page)) {
+		    !PageAnonExclusive(folio_page(src_folio, 0))) {
 			err = -EBUSY;
 			goto unlock_ptls;
 		}
@@ -5186,12 +5188,13 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct folio *folio
 		if (!softleaf_is_migration_read(entry))
 			rmap_flags |= RMAP_EXCLUSIVE;
 
-		folio_add_anon_rmap_pmd(folio, &folio->page, vma, haddr, rmap_flags);
+		folio_add_anon_rmap_pmd(folio, folio_page(folio, 0), vma,
+					haddr, rmap_flags);
 	} else {
-		folio_add_file_rmap_pmd(folio, &folio->page, vma);
+		folio_add_file_rmap_pmd(folio, folio_page(folio, 0), vma);
 	}
 	VM_WARN_ON_ONCE(pmd_write(pmde) && folio_test_anon(folio) &&
-			!PageAnonExclusive(&folio->page));
+			!PageAnonExclusive(folio_page(folio, 0)));
 	set_pmd_at(mm, haddr, pvmw->pmd, pmde);
 
 	/* No need to invalidate - it was non-present before */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

