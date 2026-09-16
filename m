Received: from mail-pj2-f33.google.com (mail-pj2-f33.google.com [74.125.227.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD993ED3BB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541077; cv=none; b=Q6remOCEM+L7kzBVU/LsEIe5DWi7xeczE47T3yZP7FZ66CflAoGJ2gnSRh1Iinx8Xy3njBH08Y/KQlQCjB5Vw17DZWzIG9+8wNOPbkE17/QNsqwZ/yWKcFh6h2z/lwWZZG2siD6skaP7/aGiohqYbT6GaHlu6NjYJMXxJAj1T3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541077; c=relaxed/simple;
	bh=bkDO7GMEwrirAzyCc6E/9aYGNJDW7onGIUPfcccFqr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMZuUR77P0+HiA3CEJfpbRnMzIDoN34j2QQpsBDfB+inCpM+cwmkV9GDLXSfRk9URKjwSn6NNLqdVv3gjnMgo/hXZukKk/cIajE7zbrC20TAfQf/yPq6QhgOlMWr0vuLoFqsu6WcPGqEFQ80acT/2V/OgTVJBu2uDZgnNhgaCQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KP3teCTl; arc=none smtp.client-ip=74.125.227.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KP3teCTl"
Received: by mail-pj2-f33.google.com with SMTP id d9443c01a7336-2d747ed1368so6211205ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789541075; x=1790145875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVLitPRwuorHo3p/kYxhVkChlufVFy2kYjbuHRdLiho=;
        b=KP3teCTl82A6y9p5xByVBUbG4UaAOVHPHblHrdH8CRWC13ZN3FCQ3/XOhN+GbUB+hu
         omhL31ia9BfjXKfAZAxFTC09ro3mIIjL4wcpiDns425AVXD3lUVrQaDrO0v7pbr8lUlw
         Myk1OwPsBwd35GqH5snP/y2w1QLWobPpBL1Gyl4EXjafgDaYWttvvNHCRD2H91BLrpMO
         QEM7HJM0fmnp6LRAlgl8dDUon2RIQnRmKwThbV5SGkyFkPn1Q5DAcnDz4yoPdCvBE+SK
         /bNQg85zFUzKQE3rFUlo45+Bg8ycv1p6Jz0M91jVmaP3c/N792nA1zcJxp6CWFgFNji2
         aqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541075; x=1790145875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iVLitPRwuorHo3p/kYxhVkChlufVFy2kYjbuHRdLiho=;
        b=F6f2kXNCIXERruWasSb3UQ1y7VgUpIxwDxkGOTq484AWX15rdvcCTGIChafcLpiciu
         QDIbLcrdXd3Ywvkvb9tlkMBoGGmAxXmdZbT2UF0Qwb8G28vAK7CxpamuYB4M8v8oAUTf
         u1t665to1BjaE5RyDydoNjb6bfGt6KTiHeSeIRoXJtdI9MXKd+q893mU8AJp+D0k2oxJ
         4tpwDODyINh7Q5L8rNY3R3H3mXYZ/NrCMvzuXtw1HaQehhPodJMu6fq/eoBZqN8Hy3UJ
         YcH7fENVcPH+YN9z2xSC3YRApnLw+8UCC51UkeCi7bgNJfspD5232JotEP2vX96fLc3y
         vE2A==
X-Forwarded-Encrypted: i=1; AKwUvBx0uDLoMz7m0dTJARlxByZlG92t5eB3HIcXMH4I0SmUsAiCJX3e1PXmKf+Y7qqaomc7htf908YKEgypW3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kcjYddeKJoz8Z4bSjPqtTbrFjxlVd525EGDEc5gFmMSZMydFt5
	eRoIdtcPnkRGlvPUjfnCjqqDpzq4P04E/xdMnQqsJTOMRW97+s+DBANTCOMFyL3unaE=
X-Gm-Gg: AYBFou2Sx7vupApk96wi0h0i1VmfkFsOWXp3DamrTxbkIdd3WTziVTpR7kqFCOqx8FA
	9adUX36+XlKeBnKzVeiewNO/R3TRNoiHxnXH1SZP4sn13YJezescure1pg9lzTW3wSVzkF/Jymf
	HOSlN+O399tE6hzoiJQLYuVrtsqhy7nc3/XzxwrXdHOiae91LDhUEaAQ+M68eBGlOBnMml0ejIL
	fr4liqSx8QWBTM5xyEMcgpWZ4Jq20N4HGpNJmMwgRG/QgbjaBZKiEgAZRtBRGAXtucAELltmPh7
	ddrXA1+x9VToHquTvMquROL6ws3sAdZjcD+RDoUxRDL24AgebTbhBC8v+9BqhYm0uyZwiMBPo6q
	vJWrZ4OQ7rqBnMFRZgPfNvQRDByBG5VvhitOj4NQqWGaKxqajQkNKZYoDBtJwWbbaJhDq409Lec
	zU01orKedBaXw2q8nUkMS9ZOTizMt+UUzkoKEGA9m8FCZRo3fdC5aC3PeifZ2uCgVmaVhpkCfqC
	OAvxOOlf8IzvsL0B9BF4gXd7Hf+Ew==
X-Received: by 2002:a17:902:eac9:b0:2db:5c0a:f18c with SMTP id d9443c01a7336-2dd8e00ecdamr19914175ad.6.1789541074649;
        Tue, 15 Sep 2026 23:44:34 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f0592asm6074755ad.62.2026.09.15.23.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:44:34 -0700 (PDT)
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
Subject: [PATCH v4 09/11] mm/sparse-vmemmap: drop the extra tail page from device DAX reservation
Date: Wed, 16 Sep 2026 14:43:39 +0800
Message-ID: <20260916064341.1825793-10-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916064341.1825793-1-songmuchun@bytedance.com>
References: <20260916064341.1825793-1-songmuchun@bytedance.com>
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
index 070ce27e9cd3..66d384da4433 100644
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

