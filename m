Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A23B35E1A3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236690; cv=none; b=hwoB1FqKjQZavsPnV/Dd1Wtn160aI+yt9SrY33xVmxwdtIPPm3I/SWSqAODJcquoMXvhh+/NcTgMWO1yYSUKBJjVbnRYn4xXD9fA6TRls8mPJ5wi4r40CguxBfUNhwD0wUXhZC9sOs1scMRfSWkdUURyeByDO6ntvhQe8fDEVak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236690; c=relaxed/simple;
	bh=k6yeCVy0cj0GF6ydp+5PgspzHyNJVNAnaJw0u9cih4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sK07yCzoiBwZxrB8JLuc78QPCwPSbbeozKgpHmj/kORxaNe7ycd9Ng2hEjUCm0/h4bKFKfhqF2QN27fJAYLMueE3tToPfvOex2b7/RDna/tLgJFi95YC4uuRfJsaqB0CfE9gr4hbBTBn1fW3iTm4Cu1YGpwbD9XTXMCRDUGsnJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JKLkfxqk; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JKLkfxqk"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so985613a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790236687; x=1790841487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgA5dgb5izhCu2j+FaX7Ht7UUGMfz5OynkoaMbINRFs=;
        b=JKLkfxqkhPev4r+7If2XILAkvT++n535ampCGYY0WdaCXP2wOKAWeVJ9mIRTDxaZry
         Apul5T/xFMFbrLBDUzJvrdxfNbR5xfjbGACD/fD0MRz2G9kxblkhDOi4kOD478LyvnN4
         sia2yb3fPigclHcqFVSD8jHHaOYR0jTp8E4uFYuWcIAKPHtzuegc+3w9xDmSBjvmQpux
         i4nmF7CIDjTvcCcP85PaX3aceGYClx6Iew7+AxgWZIhaWh4RlYY6HB/S6qAS5gzTDNYn
         A0KtKG7LMoaqZ6xl2Xuc+CHLj/Zg3S/q3KE760lT3HDMLYJSLoHBFerqkTwS5SyxbaFY
         OlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790236687; x=1790841487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VgA5dgb5izhCu2j+FaX7Ht7UUGMfz5OynkoaMbINRFs=;
        b=dV/9FhHj06KaKLrGtAaAxvKDhi9syHWfS+ODSsLKuA4HbTPvnIQBX/IlGrJlE75Nel
         mzgXuTAZSYX2iD7ZvsGWCj+6PuqCxXLhEwsXsxtUBHa+lQUCyPnQORhSojMKAmuDvQxS
         FEuRTgWIbNbbdOnn2C7dW7IRb24ag6iNRCNMjfcq3g4ynt7sllZxlnEHaHz06VMJOYt3
         QLnRcTdsWopn2U/DQpuNhzHQJeWgp/5k5JtDWfLw9feaKyIH2WrEGj6oAG5q32AZFvlz
         fHYjCWdGO34CugatpBNeCx+C9u+rTKI+DpfwZXeFv3e+ZTPg4Kzd4jDd0By6JWey0PLq
         LPHg==
X-Forwarded-Encrypted: i=1; AKwUvBwj3XE6B5cEK/FrpvEvwHXp3Zz7ZaFgwzrLqASXDxMhtLOGtOrIfq1yOD5HluDNB7l8lClQ0D3MFP8L/Xo=@vger.kernel.org
X-Gm-Message-State: AFuF++mqCpFGj+0PRYEZJjBfNXO92C6VHNVEVp0SRiF2+I5Coa2WeqkD
	xvlxHEiPrl2xxUJRihO/7J2NKSzmLvvK2P16gs/z3PGjtdiKPU3a8DeGxCVnVHTvUzo=
X-Gm-Gg: AYBFou0A/TS3zxBdJfiQWcyHGt9dXQv60IUpLN33St0lEcFDPBEmY/AmnYk8/skdE39
	XLRA15rhPMBIkrTvbdSicOhH71nzJG/l3Lp6galuwBvIf0t1Qp+TTW0Hk6ave20ndJAjifKu2j4
	Kr/vUTrmCjfCx5ZMn3Db7dWMJNAUV1cZ17X46vxgCkg9eGUxYfQwWfuvYswcFEbhtLWJgQ53RU5
	iXT39f+PX54YWKpRGFbfAzPKxc00t1oqOPUfN+wUILtZJPXjAfMNvi4KItiG38h2BQ5YVCfMcQ0
	0QEXHcbTxN7XRNFxRjxW9wlY2i2WIRngHRMdEL/2+oqNiJI+8LGp2/Sf+2iLKXQtnG5xAB37h06
	Zxlf/o4n4wsZjVj1wY9b6dsS5KwDKX6SlfNTP+FAJJlzC3CaPtrBuuJpJpwsNhY6x//8pZw6iUk
	fuHjxifpZYPsnM8NeRX8m9JE4BlGtJHwX2IdAad0YpEylLnKPLIzE2j0yAb0raQpsieytrClEZH
	taD+kgU6Cv+7beIsLH4W93Fd08e+Q==
X-Received: by 2002:a17:90b:4d07:b0:39d:fcbe:fdcf with SMTP id 98e67ed59e1d1-3a0985700c8mr1539659a91.1.1790236686989;
        Thu, 24 Sep 2026 00:58:06 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972eec92sm3575622a91.7.2026.09.24.00.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:58:06 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v2 1/6] mm/sparse-vmemmap: drop VMEMMAP_POPULATE_DAX
Date: Thu, 24 Sep 2026 15:52:54 +0800
Message-ID: <20260924075259.2013039-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260924075259.2013039-1-songmuchun@bytedance.com>
References: <20260924075259.2013039-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VMEMMAP_POPULATE_DAX currently distinguishes DAX vmemmap population in
two places: it keeps allocations on the normal path and takes a reference
when a backing page is supplied for reuse.

After Device DAX switched to the common per-zone shared tail page, both
conditions can be determined locally. DAX supplies ptpfn for every shared
tail mapping and requests an allocation only for compound head mappings,
whose PFNs are not optimizable. Therefore, vmemmap_optimizable_pfn() alone
selects the correct allocation path.

When ptpfn is supplied, the caller is reusing an existing backing page.
Once the slab allocator is available, take a reference for each reused
mapping to balance the release performed by vmemmap_free(). Although the
buddy allocator is available before slab, no vmemmap population occurs in
that interval. Earlier mappings are backed by memblock/reserved memory and
do not need page reference accounting.

Remove VMEMMAP_POPULATE_DAX and the flags argument from the vmemmap
population helpers.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Explain why the buddy-to-slab initialization gap is safe (suggested by
  Qi Zheng)
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 3267f9362c68..919c94a36346 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -32,12 +32,6 @@
 #include <asm/dma.h>
 #include <asm/tlbflush.h>
 
-/*
- * Flags for vmemmap_populate_range and friends.
- */
-/* Vmemmap population for ZONE_DEVICE compound pages */
-#define VMEMMAP_POPULATE_DAX		0x0001
-
 #include "internal.h"
 #include "mm_init.h"
 #include "sparse.h"
@@ -208,7 +202,7 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 }
 
 static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
-		struct vmem_altmap *altmap, unsigned long flags)
+		struct vmem_altmap *altmap)
 {
 	struct zone *zone;
 	struct page *page;
@@ -218,7 +212,7 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
 	 * Device DAX still relies on vmemmap_populate_compound_pages() for
 	 * head/first-tail allocation and tail-page reuse.
 	 */
-	if (!vmemmap_optimizable_pfn(pfn) || flags & VMEMMAP_POPULATE_DAX)
+	if (!vmemmap_optimizable_pfn(pfn))
 		return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
 
 	zone = pfn_to_zone(pfn, node);
@@ -230,8 +224,7 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
 }
 
 static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
-				       struct vmem_altmap *altmap,
-				       unsigned long ptpfn, unsigned long flags)
+		struct vmem_altmap *altmap, unsigned long ptpfn)
 {
 	pte_t *pte = pte_offset_kernel(pmd, addr);
 	unsigned long pfn = page_to_pfn((struct page *)addr);
@@ -240,7 +233,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 		pte_t entry;
 
 		if (ptpfn == (unsigned long)-1) {
-			void *p = vmemmap_alloc_pte(pfn, node, altmap, flags);
+			void *p = vmemmap_alloc_pte(pfn, node, altmap);
 
 			if (!p)
 				return NULL;
@@ -255,7 +248,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 			 * and through vmemmap_populate_compound_pages() when
 			 * slab is available.
 			 */
-			if (flags & VMEMMAP_POPULATE_DAX)
+			if (slab_is_available())
 				get_page(pfn_to_page(ptpfn));
 		}
 		entry = pfn_pte(ptpfn, PAGE_KERNEL);
@@ -318,8 +311,7 @@ static pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
 
 static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 					      struct vmem_altmap *altmap,
-					      unsigned long ptpfn,
-					      unsigned long flags)
+					      unsigned long ptpfn)
 {
 	pgd_t *pgd;
 	p4d_t *p4d;
@@ -339,7 +331,7 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 	pmd = vmemmap_pmd_populate(pud, addr, node);
 	if (!pmd)
 		return NULL;
-	pte = vmemmap_pte_populate(pmd, addr, node, altmap, ptpfn, flags);
+	pte = vmemmap_pte_populate(pmd, addr, node, altmap, ptpfn);
 	if (!pte)
 		return NULL;
 	vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
@@ -350,15 +342,14 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 static int __meminit vmemmap_populate_range(unsigned long start,
 					    unsigned long end, int node,
 					    struct vmem_altmap *altmap,
-					    unsigned long ptpfn,
-					    unsigned long flags)
+					    unsigned long ptpfn)
 {
 	unsigned long addr = start;
 	pte_t *pte;
 
 	for (; addr < end; addr += PAGE_SIZE) {
 		pte = vmemmap_populate_address(addr, node, altmap,
-					       ptpfn, flags);
+					       ptpfn);
 		if (!pte)
 			return -ENOMEM;
 	}
@@ -369,7 +360,7 @@ static int __meminit vmemmap_populate_range(unsigned long start,
 int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
 					 int node, struct vmem_altmap *altmap)
 {
-	return vmemmap_populate_range(start, end, node, altmap, -1, 0);
+	return vmemmap_populate_range(start, end, node, altmap, -1);
 }
 
 /*
@@ -498,7 +489,6 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 	unsigned long size, addr;
 	pte_t *pte;
 	int rc;
-	unsigned long flags = VMEMMAP_POPULATE_DAX;
 	struct page *page;
 	unsigned int order = pfn_to_section_compound_order(start_pfn);
 
@@ -508,14 +498,14 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 
 	if (reuse_compound_section(start_pfn, pgmap))
 		return vmemmap_populate_range(start, end, node, NULL,
-					      page_to_pfn(page), flags);
+					      page_to_pfn(page));
 
 	size = min(end - start, (1UL << order) * sizeof(struct page));
 	for (addr = start; addr < end; addr += size) {
 		unsigned long next, last = addr + size;
 
 		/* Populate the head page vmemmap page */
-		pte = vmemmap_populate_address(addr, node, NULL, -1, flags);
+		pte = vmemmap_populate_address(addr, node, NULL, -1);
 		if (!pte)
 			return -ENOMEM;
 
@@ -525,7 +515,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		 */
 		next = addr + PAGE_SIZE;
 		rc = vmemmap_populate_range(next, last, node, NULL,
-					    page_to_pfn(page), flags);
+					    page_to_pfn(page));
 		if (rc)
 			return -ENOMEM;
 	}
-- 
2.54.0

