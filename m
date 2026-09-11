Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0837E3A6EF7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103054; cv=none; b=jUeVLGrxz6nbpt94baMkHtT4n4rlMasGAuMkLLyAqw/yuetMGCnR73sfKZ8M4qoDJi4hUHMie4tJFpnBV3FjdvWiDZx1EDCsFe0FaEUAC5URbYAjvOQJVYX1i59RBRnnuIxUnHlrHyRTERDtgiRtSzhAgHerjA1BUW4fepK1GVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103054; c=relaxed/simple;
	bh=gShyvx+/cniTHn6nFfCC/e3ahAHIaLdaIffqkvBBwuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9pCXZRFn99SqLIIYz7H7egkENni1ZgYjQw+5ioxxoin+OVRqwfGqFfOjeC/stRpkVctzM6e1ja197BljZXMiw9hNqrPsiAllFLaiar9sp7nLFbZRzrmb98yNr/UsmwRQanZ+HD/6sZeUWYlF61zO1KQxyJvOcH72hli3LksIn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=L9t5b41U; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="L9t5b41U"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398beb616f5so163156a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789103051; x=1789707851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZ9EEhriv4uQFVrwFElKF7ZgZH1tSjYdJIJZrcuS8I4=;
        b=L9t5b41UgRlQyLt86N4Bh05WiSlXemjLr+vEqxXdO1Nw7PO7kjG7/jRorIEjR+OnJS
         0kJnlkI8ok2PLJ2NbPc6IDviOAmtQYcc4bUxxL6PC3pJuU43VJT9v2kriKhmpQwUHkQa
         ieOqQ8mZZaR21TcaJW6Gi21LL5xLB2afBL6wGuS8S1KSJTg1Gkj4Bk19MO/NODN1l/5h
         mvwYk2YuVdHxaqTD69JMot1oM5UDesZT6clPVTXKtxISGbstjQrDiQDnLQaDYKwq3sHJ
         7xIyXqe5zNKgCMtW9s/I0jhj3lq4xOxi3pTpm38ndNFLpvqrThxm3myc1YWXQ2VGTEbq
         AxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103051; x=1789707851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZ9EEhriv4uQFVrwFElKF7ZgZH1tSjYdJIJZrcuS8I4=;
        b=gLPc4Pb1De8/4ojTGW+RBANHCf3xjqISwy6xWXPv1BcOrakW8VEK3W7/efXE1VvDVN
         W1+SQEerXH6HKGeOSm1mHEAc3AcdOH17YnFozs8JM6V51/n/zhQqSHj9QYbqbHhEEaTx
         OlQD0gCEgc+C2sayMkoy2GyZXDQm1osor5mQ4pM96OBcTDwYWqBRaJePoM7WoaMw5C9S
         jdg4edt5XdkkJdxNAPzh2JsWBNojjQHZkkFpV6Q41asQpxLDR3kA8+9HrLdDsdUN01Qw
         WERBNkjCGaeQhe9OTiTobaXVruVz1OtdvtlxeVfD7KlLmYYc8R/l38VJa1MGk3qxQFqU
         Z7uQ==
X-Forwarded-Encrypted: i=1; AKwUvBx73vSDdBvJvwOusXrM7T5lP+A+DCJAMPoN4HgZO229x2ZX3M2xOo+FQ1ECATjQ+nYc03hcpkAjY49mH0w=@vger.kernel.org
X-Gm-Message-State: AFuF++loaYm5SqjuqfxwGwkh2Ym1AuPczoMaxmLJLznrHlk3KBRta8Lq
	oC5/zr63xUXn+dNsMO1AQ4k4aYnjj/ztrIiaB5L36VtbyGDf645RHo9Ik9Iqu8rqL7I=
X-Gm-Gg: AYBFou2tzv264M45aED5uqos9HJwKkYROFjKjrLcMBqfFiw0r6fTPErv9Ebsxt4DIwa
	gIxZ6waHFDjCkhxs+seaOJA9itmcSrMHyc1kgGDfDq0G43v6kLtgm7PRbza9ZqKTMoZBtMZtUDk
	OOMtQwC2w3X6FevOkkw1VBTDV2zmblv4OloMwbtnRw7oyOLRgdkAZuZpFpztTqoBIRR1WSDD/uJ
	tpeCb2VxMv2P/YGy7koB4Ofv78WA1VzVmm4HzffdFFWWQa4lP7/U9/xQi3fd0wwCiPS0fJU45J0
	YnDaBLBIbhaRnpB9YdSrqFLxYUWyUi1Mx+sDU5qtPifJ4PZYKtDQj5fz8rIIgx8exg5Hfw8oGos
	sQ16baAM8Td0OGE4l7SmFxCZhwmtG1doM0lF5GskJu5Bslt5EB0i8DxOZnNLPhA2u3jffpnxir2
	j+sq2y1skpM/wktiTDUln0tF0CbXhK+8VOBEd458W0SdFxgOzERDipyeqe3O44cU+7wsjuwCjae
	/RmjyvRM/6SDycBYwOjnClanT7wRkj4KkAV
X-Received: by 2002:a17:90b:4c4e:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-39d9805da27mr2729392a91.9.1789103051065;
        Thu, 10 Sep 2026 22:04:11 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm2651561a91.14.2026.09.10.22.04.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 22:04:10 -0700 (PDT)
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
Subject: [PATCH v3 09/11] mm/sparse-vmemmap: drop the extra tail page from device DAX reservation
Date: Fri, 11 Sep 2026 13:02:26 +0800
Message-ID: <20260911050228.58884-10-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911050228.58884-1-songmuchun@bytedance.com>
References: <20260911050228.58884-1-songmuchun@bytedance.com>
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
 include/linux/mm.h                       |  3 +-
 mm/mm_init.c                             |  2 +-
 mm/sparse-vmemmap.c                      | 13 ++-----
 4 files changed, 7 insertions(+), 57 deletions(-)

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
index a2ebe87e7654..969594074fd2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -5167,7 +5167,6 @@ static inline void vmem_altmap_free(struct vmem_altmap *altmap,
 }
 #endif
 
-#define VMEMMAP_RESERVE_NR	2
 #ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
 					  struct dev_pagemap *pgmap)
@@ -5187,7 +5186,7 @@ static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
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
index 7b5b9ceec697..39f0cfeefc6a 100644
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

