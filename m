Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082A0353A8C
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619114; cv=none; b=pC5XkSD3YoBtyF17+Z12ywth+qnUEK0ynqvchXnmTcP75mWHKn2Gr0bE00wbWWG8tAnYlUsrfrsktjTcyS/sYIWAi1bN2X8zz3YkwzUyFxTB/a8DIsuEjDYHXWRn4GDs3bNHIbNZd3LhQ8Yj5hO9GdFGqg7AzNEccNOCnmIrlmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619114; c=relaxed/simple;
	bh=gI+cKUt/kFmBcZrRZUxV8NsmO1YvxfDlYmlw4s5St8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ofIzXLVyI9WvSDeQRYlw9jbfHmuBuKg48s1zlypqmLFCQSN4FUWLMTPHDCC34nIV+HoRrbMCv5qi9zNes7D1S8MjR28LdQ0bIjUDGbMfJa4b+3UUpxRGkdzMMSGYzZ93GBuleT/YfHwORyzF4dGBlh25Fr1qCGREMRT9Kl45t9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hiUihivC; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hiUihivC"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso162392a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791619112; x=1792223912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkGffN6L6o3olbDL65GC0/HySqZZtRBE5Le50XaNNq4=;
        b=hiUihivCszOwFNEUiFQ1yZo1eOprYFUxy1ShdnpAZtXhUQwk4D/r0rtYyoS4spnVez
         ZT2SWoBRuQOuM5Cw8xF6U3o1lEDAKRfjIsH+TJr1UQQOmWIkTNm49y9DwAmJnyXh3lVw
         nfUXu3YFW2IMVoVYrr/fAow1JoHcmpVW07WevnjALh9aNfxrCTC6fD/ltx2zlAvYELyq
         sRC7LrZtRHUqKI4XThEfD6gp+BSJF1DLqU7PQG1hqfA7Fq0x2URAiSpKiX8fgHSHMRm9
         0R2XWcxxB/8+gJNM86dhU0RcJGL6uB8FLBgZOVbgxfFmXzGbkE6xeI6EmY/7G6XFGF8s
         5AVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791619112; x=1792223912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mkGffN6L6o3olbDL65GC0/HySqZZtRBE5Le50XaNNq4=;
        b=ZZKPs9t+FIryQl6m0gtc/zHglOurjBT5PpA5VJv+a+IIvvC/Hk2hyAG/KwupAp5ZdQ
         7AXxINYjsKuzM5hOVMK5RNnmUbbMKb4xZDdzpggTqldr7iIBhrf5xYUQXbkfR9SwyCG2
         5sEL5lH+14XTSiA6UHP06jZWS4HvT9yQXvBfix3LyPWAVuia+xOsU5dGA3a77j6Wiwfc
         UNxAAY9vYYRDA4oW9uni3sLNel182xXnd575nD8fk0RnamVTQ6eatA275JSnfa1fSQfz
         SwN1q5sMr+zkvzuNatsv9/S86nMU2QsLyoJ4F/5xdtmtU05pbVJfejeCtD8vL5KI6Vsl
         JqIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyW7LRJ1HRAhAScDEWnRoV80SvH7JiURn7EZS3Hckh3L4oYOL1bBj4ke31RA2KoObOB6t4Y0aE1iNphQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjRPGr0X/SX/dEH8B03ZRqEXUzrOMNtxOpNwUckJgPL5Er93TU
	LlOstIPH7QxA/GY4ZSAaqOMHJgZWL/NeXHVY66mGKF33o2aNH8aty/F1pycZF6VXxlo=
X-Gm-Gg: AYBFou0eXeVy+pplJ28NP2fjMAeXpas3J3IRNIQQQxuphxEtFOTxNAycUJArEvbQVXG
	3R8HOZNEXWm8NsqNC5aHbpzFsZQaSarB24Fu5UyhBI9zxFRYkRtrhi8/TZJkCAgcoYG1UfPYIlP
	DEplH5vyf5V7Ge8tZ7yojQqP9g3n7vCHIAdFfYtVxxbshuAwUJZLKWa5CasDNJDAaPmQQ8t10Ai
	axmVrUdwuRkv9pwDFsx+pFXUvQB5zNrmde/usHHgImAXS+mlLB8fqqURhT27jYXPRTEk58pWUrS
	8k5mXRV+hvrMJyp8uYG9Ndu5QHeSoa2/kcOsHTNaJ7rWCb8jrwApUwi3xPwNnyn98fwDKNVjcQF
	uoD6bkiFq18HOC89i6f5YUvWUjYLnzXeSE8HupcRe0U4/8v2vJOqu3/6gwvcVfUrhypvggR53ae
	uZYTmXzRH/b0ILnImLU3MYaW3QP3HAQFfaoJ5nTuueJqgaCTCah0HXUIvH7O5KDGVgrWQe/e9iq
	LjagIOCqOInYgaJfYtdTknagwa16kPdzWWPbg==
X-Received: by 2002:a17:90b:2e4b:b0:3a8:195f:186 with SMTP id 98e67ed59e1d1-3ab3a9fc457mr3160126a91.42.1791619111478;
        Sat, 10 Oct 2026 00:58:31 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab57c05724sm3473569a91.4.2026.10.10.00.58.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 00:58:31 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v4 1/6] mm/sparse-vmemmap: drop VMEMMAP_POPULATE_DAX
Date: Sat, 10 Oct 2026 15:57:50 +0800
Message-ID: <20261010075755.83339-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010075755.83339-1-songmuchun@bytedance.com>
References: <20261010075755.83339-1-songmuchun@bytedance.com>
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
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v4:
- Collect Reviewed-by from Lance Yang

v2:
- Explain why the buddy-to-slab initialization gap is safe (suggested by
  Qi Zheng)
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 098975861523..b23efff80137 100644
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
@@ -241,7 +235,7 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 #endif
 
 static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
-		struct vmem_altmap *altmap, unsigned long flags)
+		struct vmem_altmap *altmap)
 {
 	struct zone *zone;
 	struct page *page;
@@ -251,7 +245,7 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
 	 * Device DAX still relies on vmemmap_populate_compound_pages() for
 	 * head/first-tail allocation and tail-page reuse.
 	 */
-	if (!vmemmap_optimizable_pfn(pfn) || flags & VMEMMAP_POPULATE_DAX)
+	if (!vmemmap_optimizable_pfn(pfn))
 		return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
 
 	zone = pfn_to_zone(pfn, node);
@@ -263,8 +257,7 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
 }
 
 static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
-				       struct vmem_altmap *altmap,
-				       unsigned long ptpfn, unsigned long flags)
+		struct vmem_altmap *altmap, unsigned long ptpfn)
 {
 	pte_t *pte = pte_offset_kernel(pmd, addr);
 	unsigned long pfn = page_to_pfn((struct page *)addr);
@@ -273,7 +266,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 		pte_t entry;
 
 		if (ptpfn == (unsigned long)-1) {
-			void *p = vmemmap_alloc_pte(pfn, node, altmap, flags);
+			void *p = vmemmap_alloc_pte(pfn, node, altmap);
 
 			if (!p)
 				return NULL;
@@ -291,7 +284,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 			 * Use try_get_page() to prevent the shared page refcount
 			 * from overflowing.
 			 */
-			if ((flags & VMEMMAP_POPULATE_DAX) &&
+			if (slab_is_available() &&
 			    !try_get_page(pfn_to_page(ptpfn)))
 				return NULL;
 		}
@@ -355,8 +348,7 @@ static pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
 
 static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 					      struct vmem_altmap *altmap,
-					      unsigned long ptpfn,
-					      unsigned long flags)
+					      unsigned long ptpfn)
 {
 	pgd_t *pgd;
 	p4d_t *p4d;
@@ -376,7 +368,7 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 	pmd = vmemmap_pmd_populate(pud, addr, node);
 	if (!pmd)
 		return NULL;
-	pte = vmemmap_pte_populate(pmd, addr, node, altmap, ptpfn, flags);
+	pte = vmemmap_pte_populate(pmd, addr, node, altmap, ptpfn);
 	if (!pte)
 		return NULL;
 	vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
@@ -387,15 +379,14 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
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
@@ -406,7 +397,7 @@ static int __meminit vmemmap_populate_range(unsigned long start,
 int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
 					 int node, struct vmem_altmap *altmap)
 {
-	return vmemmap_populate_range(start, end, node, altmap, -1, 0);
+	return vmemmap_populate_range(start, end, node, altmap, -1);
 }
 
 /*
@@ -532,7 +523,6 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 						     unsigned long end, int node,
 						     struct dev_pagemap *pgmap)
 {
-	const unsigned long flags = VMEMMAP_POPULATE_DAX;
 	const unsigned int order = pfn_to_section_compound_order(start_pfn);
 	unsigned long size, addr;
 	pte_t *pte;
@@ -545,14 +535,14 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 
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
 
@@ -562,7 +552,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
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

