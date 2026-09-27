Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475443AA1B0
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477743; cv=none; b=FdplIbw6i1HrMwBNAPs+282cLzPYU0Cf19Z2Kf2rUGWHYe0JB4PHejPLuzwk0mZScLNew5irApF+Rmu3D9MlIxH8L70eUFxtisITtoXv7Z3FTvrWS8KVBM6yUZf44Dpcl60pCzYDOyT2NDLLc69qxDsuNqyxdkdLL3N0tcPe3T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477743; c=relaxed/simple;
	bh=izuulSfXE1BmZoJkXOqpmGZzMJP0MxoT/jMcceufMOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPt5LU3LXafEk9zx3GuIft3lBeSbqJvdOe1pBHnaFu0KTjeIbm/1PZ1tEbHuzbOtHpdt7v2NOIk10/vq1QhsTdHZif2B9pd69W5Ml8h43lWKXcWsJ6/ayP8WoDws9n/ECC3sgCVlyaOnT9FUlk4pxowtBWXDVox+2cy3MwLEv4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kS64Stla; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kS64Stla"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87fd84c0bfeso687843b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790477740; x=1791082540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uoDGlxDfQClS9LJzaMCGDThB6goPDglPo8AWl0LRFoA=;
        b=kS64StlaU6FBN6uJxrwwfukO8kufExSDvt9W1qzgrOSLxeUI/TQW50kDfWlsmk3ujI
         Cwg20pnKRm/zZnECT3hm8BdvrK6LlQbC9LfoKNQXgJ0Qm9cBsrMGxcfs6Z5PWhtPIH4x
         Fxp4iqsh902Q/7RV58eyaS22pIrUdkVKhkUXAYSUNY+ShvwwUHjpSctI+bcA20KJrOmV
         9AtrD+6lP4Sz9QooFWrGEUIBCFBJg4X1SsVBPHcBGT3hDQYZ/jbqYn7gIGQtcSi2UjKN
         1jYDhTOgdRSUojVAwfLRsbMzU/j9LvuyETmJ2bE8q7YdnjJqBTRYHzAgikWkM3q3uElg
         QbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477740; x=1791082540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uoDGlxDfQClS9LJzaMCGDThB6goPDglPo8AWl0LRFoA=;
        b=VGCFrChc09rTHzuWgxVw3aR8x3hBXRVnV777ik1IOzkwfdUXEriHLs81b3yk7+wTwr
         IclCv48vMQeX3XV1D2wDtL0pr7pnhTvCKPWjVJXQtL9wrUxhC7q1B1CYM3RHf2sKUC9C
         dYoILnDP1vnx7QaXJTvieRrdwGXf1klBnFt+xa9Rg2v+owUpvL5Oq5JRspL1VfLMHvpz
         Inh1gJ+SqOHPPb5HfJwwWhVZ8fVOyM3gZBV2ZlyrPVsJwZigfwNzi7c6PWWV+BxvBhOd
         5jIayG4xPxSEHyNSnM4AseGbKZfjMEMC7J/UcEvUooBLeUJMK6rGYpWGMTmyF3XKiLbj
         m0sA==
X-Forwarded-Encrypted: i=1; AKwUvBxCv38p5XLlUwF0ZA2gIVsbOPHjwgJ/rJKKB8Gig0kRPLpN9cG8puJhdAofRKkkFRVBb+0SGflCgcCiqbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvUpTc0YwfbB/4bswu6CeftK47UefS1YO4UEu+GkVLS49Iapkc
	qqwnHcV8BAP2qihNfFLgkcxpIHl+kUZVV2HZqOWl9lSaDkfsUZ6HCOu6DbVp/7VEE4Y=
X-Gm-Gg: AYBFou21NYnEOiC+lvvekKjfssLsOvBMbi+1vRymrP+wYzCDUzPHBwpd8PnTnD/x8rI
	QcePpi1CKALcMWLxzp0n2mt2ZZZOl+kdvl9mEoIO/4GQg1nsDX1RPefsp7d1yhbvQ52n2WZBGR9
	qOJF181z30/RWsXSCXNOBpf94/UCGWjoZDBeH96MiJNy7BIsjbuxE7aaWQw0JOoNnk6H1CqShFv
	tcun1/W6BYRc+PerrD3HqrSbyP8cD9rZQvMN+nwIDeMkwLT8HgV/fMvLEKnTHg+15qPADkwxpPW
	YDgaSjXh8L3wjOMWYlsbAAVkwpEZ63+z5us2KLQkrWNILYgYWFXO/bqt+QYpeaFo6o6oWS3waMi
	82YZRBm6EurefdiiY8nvfkSnaElkeJhf7U5E5oEL6p1PJVvDeb5hjOxPXL1bnvQxQSXoLUwbU39
	R1YJdbMDb+y4E9YYAqztPxV77fqMN/0IwLCZe9VQfTxIrZdO5Z/lGoyDbj10VECuXlv5+1YVEo7
	ub6tzCVkxlTJMT6ZBK+
X-Received: by 2002:a17:90a:e7c4:b0:39e:6c6a:4b73 with SMTP id 98e67ed59e1d1-3a098e3eef6mr8558907a91.61.1790477740110;
        Sat, 26 Sep 2026 19:55:40 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm13461377a91.1.2026.09.26.19.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:55:39 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v5 10/12] mm/sparse-vmemmap: drop the extra tail page from device DAX reservation
Date: Sun, 27 Sep 2026 10:54:39 +0800
Message-ID: <20260927025441.741633-11-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927025441.741633-1-songmuchun@bytedance.com>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device DAX vmemmap population still reserves one extra tail vmemmap
page after the head page.

Drop that extra reservation and let the shared tail page cover all tail
vmemmap pages after the head page, so DAX follows the same reservation
model as HugeTLB.

This reduces the reserved vmemmap pages for optimized DAX mappings to
one and removes the now-unneeded first-tail population from the generic
and powerpc paths to simplify the code as well.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Collect Acked-by from Qi Zheng
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 46 ++----------------------
 include/linux/mm.h                       |  4 +--
 mm/mm_init.c                             |  2 +-
 mm/sparse-vmemmap.c                      | 13 ++-----
 4 files changed, 8 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index ee068f24a79f..9ca28e4a610a 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1218,39 +1218,6 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	return 0;
 }
 
-static pte_t * __meminit radix__vmemmap_populate_address(unsigned long addr, int node,
-							 struct vmem_altmap *altmap,
-							 struct page *reuse)
-{
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
-	pte_t *pte;
-
-	pgd = pgd_offset_k(addr);
-	p4d = p4d_offset(pgd, addr);
-	pud = vmemmap_pud_alloc(p4d, node, addr);
-	if (!pud)
-		return NULL;
-	pmd = vmemmap_pmd_alloc(pud, node, addr);
-	if (!pmd)
-		return NULL;
-	if (pmd_leaf(*pmd))
-		/*
-		 * The second page is mapped as a hugepage due to a nearby request.
-		 * Force our mapping to page size without deduplication
-		 */
-		return NULL;
-	pte = vmemmap_pte_alloc(pmd, node, addr);
-	if (!pte)
-		return NULL;
-	radix__vmemmap_pte_populate(pmd, addr, node, NULL, NULL);
-	vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
-
-	return pte;
-}
-
 int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 					      unsigned long start,
 					      unsigned long end, int node,
@@ -1297,7 +1264,7 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		if (!pte_none(*pte)) {
 			/*
 			 * This could be because we already have a compound
-			 * page whose VMEMMAP_RESERVE_NR pages were mapped and
+			 * page whose retained vmemmap page was mapped and
 			 * this request fall in those pages.
 			 */
 			next = addr + PAGE_SIZE;
@@ -1318,16 +1285,7 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 					return -ENOMEM;
 				vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
 
-				/*
-				 * Populate the tail pages vmemmap page
-				 * It can fall in different pmd, hence
-				 * vmemmap_populate_address()
-				 */
-				pte = radix__vmemmap_populate_address(addr + PAGE_SIZE, node, NULL, NULL);
-				if (!pte)
-					return -ENOMEM;
-
-				next = addr + 2 * PAGE_SIZE;
+				next = addr + PAGE_SIZE;
 				continue;
 			}
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 070ce27e9cd3..30a3365bca82 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -38,6 +38,7 @@
 #include <linux/bitops.h>
 #include <linux/iommu-debug-pagealloc.h>
 #include <linux/kcsan-checks.h>
+#include <linux/vmemmap-optimization.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -5167,7 +5168,6 @@ static inline void vmem_altmap_free(struct vmem_altmap *altmap,
 }
 #endif
 
-#define VMEMMAP_RESERVE_NR	2
 #ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
 					  struct dev_pagemap *pgmap)
@@ -5187,7 +5187,7 @@ static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
 	 * For vmemmap optimization with DAX we need minimum 2 vmemmap
 	 * pages. See layout diagram in Documentation/mm/vmemmap_dedup.rst
 	 */
-	return !altmap && (nr_vmemmap_pages > VMEMMAP_RESERVE_NR);
+	return !altmap && (nr_vmemmap_pages > VMEMMAP_OPTIMIZATION_PAGES);
 }
 /*
  * If we don't have an architecture override, use the generic rule
diff --git a/mm/mm_init.c b/mm/mm_init.c
index efffa8609b85..56bb4567a494 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1056,7 +1056,7 @@ static inline unsigned long compound_nr_pages(unsigned long pfn,
 	if (!section_vmemmap_optimizable(ms))
 		return pgmap_vmemmap_nr(pgmap);
 
-	return VMEMMAP_RESERVE_NR * (PAGE_SIZE / sizeof(struct page));
+	return VMEMMAP_OPTIMIZATION_PAGES * (PAGE_SIZE / sizeof(struct page));
 }
 
 static void __ref memmap_init_compound(struct page *head,
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 4309f8b626f5..b6378826b9a2 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -136,7 +136,6 @@ int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages
 {
 	const struct mem_section *ms = __pfn_to_section(pfn);
 	const int order = section_compound_order(ms);
-	const int vmemmap_pages = pgmap ? VMEMMAP_RESERVE_NR : VMEMMAP_OPTIMIZATION_PAGES;
 	const unsigned long pages_per_compound = 1UL << order;
 
 	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SUBSECTION));
@@ -147,13 +146,13 @@ int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages
 
 	if (order < PFN_SECTION_SHIFT) {
 		VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, pages_per_compound));
-		return vmemmap_pages * nr_pages / pages_per_compound;
+		return VMEMMAP_OPTIMIZATION_PAGES * nr_pages / pages_per_compound;
 	}
 
 	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION));
 
 	if (IS_ALIGNED(pfn, pages_per_compound))
-		return vmemmap_pages;
+		return VMEMMAP_OPTIMIZATION_PAGES;
 
 	return 0;
 }
@@ -550,17 +549,11 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		if (!pte)
 			return -ENOMEM;
 
-		/* Populate the tail pages vmemmap page */
-		next = addr + PAGE_SIZE;
-		pte = vmemmap_populate_address(next, node, NULL, -1, flags);
-		if (!pte)
-			return -ENOMEM;
-
 		/*
 		 * Reuse the shared page for the rest of tail pages
 		 * See layout diagram in Documentation/mm/vmemmap_dedup.rst
 		 */
-		next += PAGE_SIZE;
+		next = addr + PAGE_SIZE;
 		rc = vmemmap_populate_range(next, last, node, NULL,
 					    page_to_pfn(page), flags);
 		if (rc)
-- 
2.54.0

