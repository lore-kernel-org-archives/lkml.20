Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D933B2FC8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162912; cv=none; b=KD4M5pu/NuBoqkuGre4u10LWkmNX1eDc8edBDBhptWf/ezIumZmLS2I5SYuOwz44r9hBl6/KH1/wgntItl3/jm6pFESiuk4tjIng9MBBxqLShdZCfKL0m9ud6VT14Kembn9FvTLRBqFHV2Q/YcbmN8twjQOBWGR0NJFbsLAEv08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162912; c=relaxed/simple;
	bh=+I09y+q9sr67CNOypLQdIUiE7TdXVc7M6dwiHdriwd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8AaqCDoBBcnyray5oUpYzwx5ke+tQLzdQnkNyEVaKZ6nOMlw59kS+gOPUvwVskQmhSHMZf7I5XmWu7+jcb3N1z5+DUqLXSKuicC8p83xZTDpTRVJ7Z7Qf/HFcu96lC/Hf19zv1nGvzl6TJIJrT5axl1s/Z8L5GX+hrRwIhpHTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hy9ZhfI+; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hy9ZhfI+"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84864086bfeso3303229b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788162910; x=1788767710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tkr6D1mJkSgu6ygeW9vA9keYBBS8zHk8hkf8RCBkSI=;
        b=hy9ZhfI+FjnCX4moJq98A5i2Qx1SZXoib8KAt6SxtUOO1eEEwoaSLlv1CeVeOmT5q6
         LWSfc4hvpGgKUaMbKM0BAewLRhMt2+3RRnG7aFjA/94pEzBBBXLlHqsMoiG1mmfBdNvv
         4VAhIRXuezPbAo6wxjDJJiIpqD3fQzCN5aDk3iK5n4/VcAIMqjXBR/FbJn5haQJppYrO
         LBzm5Se7G3mTrTnUilSetn7xrV37H+Eo+02LP2Ka7sIU4z4lw42KJnr/TVkHX7mMUB7z
         BrXx8+kaGKFVxnCrZALAdEONkCr5/m2l23YHAwa6EgVKP3ecbHB62Ow8u5VroWPBS18t
         Z1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162910; x=1788767710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0tkr6D1mJkSgu6ygeW9vA9keYBBS8zHk8hkf8RCBkSI=;
        b=BFqeYS97LYRa0aORaqgIU/iaw9xw3Hc6Fp//FsxvDkZSMVwatdhkr06BJu25jIHqpB
         jUMGuip2BMx5FkLgYDgoBz0JTPOxJcrh+JX0VR7d4elICdcoqr2S+TP7NSOW7W61Lz0R
         bZ2reIL90uEd26eq/pV0G4K6AIHqDn5mTYimE1y1ENuxj6NtI9gg/YGK6F56y+RpWL6X
         Lm435JHvSFbc/opW9jeq/Jmuz5iPlvVrj4gvo/ZGFmfqdXK/rBjzde+ecbUjx2nnyv/v
         pR4IJTIjzXh+pm/cS4iETgwh18P23KMbAC7Pq4yd+JBDoJ2NLC/gxsY2Fmq4Gjnfe6zd
         h1cw==
X-Forwarded-Encrypted: i=1; AHgh+RoGUQJIwbLdz6l/vRg89DeTHgKdMD9I1icGQXKdJcIsxoBLxRD+vPFlVoc9E+vNt3nI6PN2ZXr9Hb9ptFg=@vger.kernel.org
X-Gm-Message-State: AFuF++kaCf1D9sehCcAsU2TlyxeHUitF0uBVX//0ksq239TQQsfLktmr
	F3zvlC7nUaDqNT8RwYZqRp0V3pRKHLKHvOfeoU9S0NaXQh6gYuft6GuT34W7U9PGWsk=
X-Gm-Gg: AR+sD13t1HnKyZfYHbzd2bCHAWFyO+1Vt7KHJ4/hKYb9NpZylE7a56Fd4AeLYDh/RZY
	ASIzfPhpPZUOYOPGOcvzfS3Jva0w3kwPGVUnjy86HSEIYLROJuTc0igL1QzG+zlus1ZNe8N+pF0
	ScwkMjeiOzkFgaVtXAGjDEOXp7RVVxLIo5FngiPmyYpGod0jyNvv5EXkLCDAq9qpiKim7VjTMnk
	rLrk0nNgpVvpxYPY0H0i1BdGkuhhMXFdI1rZiCu2XDWXpR8IBRYxWWw25sMePlI6YdtZe/v4dVg
	eN/PsInVXFZODfCpGj8yfnY+9EMk2OpcjgsAu0AbqfYHK09sm5GyfiGKRZXxjmoz6YY6PugeVif
	Q+qRJUrqw6f9K0DGYR7UIN0z1cA2jEQdGaALrSynUNXR8uirgVj2E1esC9lvC6ax56fgXfuV06L
	I+y9zC8Lp5YEy6NQPuAZvvZgG0kYL+cOVlap6UFZV/jt3Cg9gTLsrnkt+VHsFmj6e9NEseNTj8u
	W7cVdEAUDDiDO0d3tY+eebx
X-Received: by 2002:a05:6a00:1c9a:b0:84e:9257:d0c2 with SMTP id d2e1a72fcca58-8562a00149emr40654262b3a.9.1788162909920;
        Mon, 31 Aug 2026 00:55:09 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f88csm3590256a12.10.2026.08.31.00.55.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 00:55:09 -0700 (PDT)
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
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 09/11] mm/sparse-vmemmap: drop the extra tail page from device DAX reservation
Date: Mon, 31 Aug 2026 15:53:40 +0800
Message-ID: <20260831075342.57563-10-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831075342.57563-1-songmuchun@bytedance.com>
References: <20260831075342.57563-1-songmuchun@bytedance.com>
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
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 46 ++----------------------
 include/linux/mm.h                       |  3 +-
 mm/mm_init.c                             |  2 +-
 mm/sparse-vmemmap.c                      | 13 ++-----
 4 files changed, 7 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 831c231a4a18..e7e751c48dd2 100644
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
index edadd7549b72..edc7b9ce9e79 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -5180,7 +5180,6 @@ static inline void vmem_altmap_free(struct vmem_altmap *altmap,
 }
 #endif
 
-#define VMEMMAP_RESERVE_NR	2
 #ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
 					  struct dev_pagemap *pgmap)
@@ -5200,7 +5199,7 @@ static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
 	 * For vmemmap optimization with DAX we need minimum 2 vmemmap
 	 * pages. See layout diagram in Documentation/mm/vmemmap_dedup.rst
 	 */
-	return !altmap && (nr_vmemmap_pages > VMEMMAP_RESERVE_NR);
+	return !altmap && (nr_vmemmap_pages > VMEMMAP_OPTIMIZATION_PAGES);
 }
 /*
  * If we don't have an architecture override, use the generic rule
diff --git a/mm/mm_init.c b/mm/mm_init.c
index c4cd61978ce8..d520fd8de0df 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1049,7 +1049,7 @@ static inline unsigned long compound_nr_pages(unsigned long pfn,
 	if (!section_vmemmap_optimizable(ms))
 		return pgmap_vmemmap_nr(pgmap);
 
-	return VMEMMAP_RESERVE_NR * (PAGE_SIZE / sizeof(struct page));
+	return VMEMMAP_OPTIMIZATION_PAGES * (PAGE_SIZE / sizeof(struct page));
 }
 
 static void __ref memmap_init_compound(struct page *head,
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 0201877a7f80..e655d9d1348f 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -136,7 +136,6 @@ int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages
 {
 	const struct mem_section *ms = __pfn_to_section(pfn);
 	const int order = section_order(ms);
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
@@ -521,17 +520,11 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
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

