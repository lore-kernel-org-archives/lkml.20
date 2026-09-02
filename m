Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E143246E8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 02:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788317827; cv=none; b=kBYFeRaCqXulbySz8hOpD3i0xZH0G9pDtBYEMUIIsivL/P1RrjLQRXzoqBWI1/VV9/tOeOFcDs2GxA/ilVD6EDBaoe6EmR3u4oq/KZdVG0zAA8EXKJG8ucRtGntBEbTnoviVIwWBM/HQpwf0n0WBa9Zwwx6OZPCn6VhfXXI06TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788317827; c=relaxed/simple;
	bh=4fjEPD+lrgKFPwhNPaNEjHit28uMZCyLw1Vle+YjuOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lZeFKh4RlCUYITZ8aL0ECziP3JZ4T3F0bVT36lS8L2SwXMYbzrMZWrLkfCuklFfV5GP1iHwiHSB1rYtfpvlnrJqivT+xhapf4xK2J2UD4Fg/JPB+rLaUfze00qQ/TWXZfeqStYs9pseVK3zRi5qJESAFOl7Dwlsn7OT/HDR5oQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=XEVCsHcd; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="XEVCsHcd"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d6e954afbdso3095445ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 19:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1788317825; x=1788922625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AfIUElBfsBuc32fcVrUuC+qxuGAKqGDmpiNow6bdW8=;
        b=XEVCsHcdTA2hTgIz2Wzi6ljBpHvCjBozwlTKsnjjxo4FqBfu3QG1fC0Zu7KXThWB3Q
         k6fWhqtoEreh24aNwga4Fexd7vKJQj2GKExh5YeKpjbkavPJxWJy2rCjFO/puKFz5IR+
         ipdCqFi/d1vgR/6Hwhs2EEdA3pRO4b8tkxLZ4VzmNmj1s575AcuV+7X6NISb1dLTz+n4
         xA9YLFW4OdAHexUpxo8j2r60v6Uk6BOLr73MAPP4IJ4Wd9AsZ0DMFx+pgG8kwvpwbVyx
         iBNbH99MYfr9bcnJ9EO+xG+BP+bJGjf96v07MniBw35PAFCz0nsnLQuR/ZRFsmKHWSRy
         ytew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788317825; x=1788922625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AfIUElBfsBuc32fcVrUuC+qxuGAKqGDmpiNow6bdW8=;
        b=gh5U78/03r42nMe1bNFFy0nTRXKMG8awWwKD2gH95gn3k05NfdTAeapXEKwf4BuQrS
         yCIAWuIGue1PKht1KsxdzTVITfvfxHpYN0jJrXdyAps4/1tsK9wNfD81y/0K85qAMQ0t
         gP5cZH+y7MEDP6Nk+db1/y0YbjB0XW0NIHcHPGnLZoHStLPK6FRvPFDIh3mMMFPlDCMt
         +JMuQUeoAga0D10Pw47ev965bcep37VSOFVa+BqQTypeoxml2wKk5UYSHEnFmKtlNPTj
         PYzqtOgYxnlkXYwXXMWbCV3TBdArCgQ5emymfsZoXj9Ve5mq3DIE+r4ggg0J0AErPtAV
         JAmA==
X-Forwarded-Encrypted: i=1; AKwUvBw2zHf6eDPoaQUMHdlm8q3zFulrBt1PXTkhiKIZ/kRjwcPIb5fs37FTNZraY4hAhJJocMLcJC4kehm3Bbg=@vger.kernel.org
X-Gm-Message-State: AFuF++l2o+WRjEpfRc93C7gR+Ih/gIe1EfNlh6AqsyBGEL9mZmaSF3WU
	PYd56OnZ88gSYy0Gk1NmGZABOqZkhvpm2HpIMW+yO1WBWbvP6ofWEjmDqcKE1Nmjg1Q=
X-Gm-Gg: AYBFou0N8lsaeP2/V4OgsS8Bs68gy0x+qFR2zvstKJvNtrKX4z4nT+srbUNlwM+CpiR
	+mCWkq0YpbBqPAJqmN9mtHl8CxKzp6lC2bC3WjTcBrQO7lCswVBdDthxt4MXNnuSnIiiD6UZp/R
	BUq8NEMTQuQUWB/N6bRXQ4UgJSQQu0ZQMKz4blLBnGx8oSO7f8/8pgq4c3ZZibv213UCED/KgHt
	chYsSFAIHSNSKqBNja8/b3TzAorZDOTSqzQ6GcTIn8hRbijoVaobOf0ZSHtLYoaznNJIi3YDGgL
	KHVbquLa6iSVB2GidyL9u1xsdlGeJHI46YIcMcTSKiojCJL74uFYurGBq71f3yVujIJ38MJdJ54
	eGam48hliXOPODMsDIAzyUsI8R+wiVowonOEXOnK71YVzpT/4MSKdr8J0uP6xCUVDcGfiek0AWB
	hom67Jin21jwxF0jXkIV0pcqjG13CdOhxRtMhNgDdM2e1A74ylm1ZykoVV1Klcsm2AmgRs80cub
	wT5KIr4Fu1E1ejX6Noz1f1x65kSP0x+UFxK
X-Received: by 2002:a17:902:d491:b0:2d9:3636:d01a with SMTP id d9443c01a7336-2daec74e5e3mr22490315ad.15.1788317825337;
        Tue, 01 Sep 2026 19:57:05 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([2601:645:c68a:b830:a1c2:77c:7ab7:f9a0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07bde5bfsm2066469eec.27.2026.09.01.19.57.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 19:57:05 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] mm/damon/ops-common: handle hugetlb folios in folio mkold/young rmap walkers
Date: Tue,  1 Sep 2026 19:56:59 -0700
Message-ID: <20260902025700.17975-3-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902025700.17975-1-kiyer@crusoe.ai>
References: <20260902025700.17975-1-kiyer@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damon_folio_mkold_one() and damon_folio_young_one() assume the folios
they walk are mapped by normal PTEs or THP PMDs.  When the folio is a
hugetlb folio, page_vma_mapped_walk() returns the huge PTE in pvmw.pte
with its page table lock held, but the walkers treat it as a normal
PTE: they read and age it with PAGE_SIZE-granularity helpers, which is
wrong for huge PTEs (up to PUD level), and notify secondary MMUs for
only PAGE_SIZE of the mapping.

Add hugetlb branches to both walkers.  The mkold walker reuses
damon_hugetlb_mkold(), which the virtual address space operations set
has been using for hugetlb aging: it clears the young bit of the huge
PTE via set_huge_pte_at() and calls mmu_notifier_clear_young() spanning
the whole huge page size.  The young walker gets an equivalent new
helper, damon_hugetlb_young(), which reads the huge PTE with
huge_ptep_get() and consults the page idle flag and
mmu_notifier_test_young() like the existing PTE branch.

Locking mirrors what page_vma_mapped_walk() provides: the huge PTE's
page table lock is held inside the walk, and for shared hugetlb
mappings (the only ones subject to huge PMD sharing), rmap_walk_file()
already holds i_mmap_rwsem, satisfying hugetlb_walk()'s locking
requirements.

This is currently dead code: both rmap walkers are only reachable
through damon_get_folio(), which rejects hugetlb folios since they are
not on the LRU lists.  A following commit will let the physical address
space monitoring primitives opt in to hugetlb folios.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Krishna Iyer <kiyer@crusoe.ai>
---
 mm/damon/ops-common.c | 61 +++++++++++++++++++++++++++++++++----------
 1 file changed, 47 insertions(+), 14 deletions(-)

diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index f5fe92b825bb..373b25db5950 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -193,10 +193,15 @@ static bool damon_folio_mkold_one(struct folio *folio,
 
 	while (page_vma_mapped_walk(&pvmw)) {
 		addr = pvmw.address;
-		if (pvmw.pte)
-			damon_ptep_mkold(pvmw.pte, vma, addr);
-		else
+		if (pvmw.pte) {
+			if (folio_test_hugetlb(folio))
+				damon_hugetlb_mkold(pvmw.pte, vma->vm_mm, vma,
+						addr);
+			else
+				damon_ptep_mkold(pvmw.pte, vma, addr);
+		} else {
 			damon_pmdp_mkold(pvmw.pmd, vma, addr);
+		}
 	}
 	return true;
 }
@@ -221,27 +226,55 @@ void damon_folio_mkold(struct folio *folio)
 
 }
 
+#ifdef CONFIG_HUGETLB_PAGE
+static bool damon_hugetlb_young(pte_t *pte, struct vm_area_struct *vma,
+		unsigned long addr, struct folio *folio)
+{
+	pte_t entry = huge_ptep_get(vma->vm_mm, addr, pte);
+
+	return (pte_present(entry) && pte_young(entry)) ||
+		!folio_test_idle(folio) ||
+		mmu_notifier_test_young(vma->vm_mm, addr);
+}
+#else
+static bool damon_hugetlb_young(pte_t *pte, struct vm_area_struct *vma,
+		unsigned long addr, struct folio *folio)
+{
+	return false;
+}
+#endif	/* CONFIG_HUGETLB_PAGE */
+
+static bool damon_pte_young(pte_t *pte, struct vm_area_struct *vma,
+		unsigned long addr, struct folio *folio)
+{
+	pte_t entry = ptep_get(pte);
+
+	/*
+	 * PFN swap PTEs, such as device-exclusive ones, that actually map
+	 * pages are "old" from a CPU perspective. The MMU notifier takes care
+	 * of any device aspects.
+	 */
+	return (pte_present(entry) && pte_young(entry)) ||
+		!folio_test_idle(folio) ||
+		mmu_notifier_test_young(vma->vm_mm, addr);
+}
+
 static bool damon_folio_young_one(struct folio *folio,
 		struct vm_area_struct *vma, unsigned long addr, void *arg)
 {
 	bool *accessed = arg;
 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, addr, 0);
-	pte_t pte;
 
 	*accessed = false;
 	while (page_vma_mapped_walk(&pvmw)) {
 		addr = pvmw.address;
 		if (pvmw.pte) {
-			pte = ptep_get(pvmw.pte);
-
-			/*
-			 * PFN swap PTEs, such as device-exclusive ones, that
-			 * actually map pages are "old" from a CPU perspective.
-			 * The MMU notifier takes care of any device aspects.
-			 */
-			*accessed = (pte_present(pte) && pte_young(pte)) ||
-				!folio_test_idle(folio) ||
-				mmu_notifier_test_young(vma->vm_mm, addr);
+			if (folio_test_hugetlb(folio))
+				*accessed = damon_hugetlb_young(pvmw.pte, vma,
+						addr, folio);
+			else
+				*accessed = damon_pte_young(pvmw.pte, vma,
+						addr, folio);
 		} else {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 			pmd_t pmd = pmdp_get(pvmw.pmd);
-- 
2.54.0

