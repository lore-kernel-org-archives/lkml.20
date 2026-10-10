Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA78E38C42B
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619132; cv=none; b=rbjMBIGIXicT+2B7GOYi2IagVzSCh99f3BH891hnViTw29LigP+RWsqqGacfPruVPPNFdpiG0t0q2D1KstejWB/agcq7ubqNRro4I62ZkuK8Uavk66uwjnA8ZNinqrwZbAvsE6eRFbLQiWXPppDiunY32m+g6cAoxQIzQ0eFhKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619132; c=relaxed/simple;
	bh=hmkOeivfdJgmIRHvKljL72to+lC+SQ2voYTTlElE6Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ByJSwhLqcc5KL+e+M4xt+ggMzukrPMlLAGEHIByWlCS6aNbpoTCj51JhEmeDAl+fnLJGeZnAB3Ps51Y4LwUvp6yySE5h1BMlHjrV/zrcSYjdJWBgL2wvjh9skTdGumJFaAfa1dZZp0UXSJOzQdeNy/ujqybRTkpnr5F/S8F/1ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=cBidyhpL; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="cBidyhpL"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398b3c37877so179299a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791619130; x=1792223930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIpC3TTxDyvpOR8NKmtyMQLMyDufyxtaZeBdyCHZ6SI=;
        b=cBidyhpLWxdiK3zKduJ6NLpIqYzJz0bwOUqX/Y5+nCAXEFHZY2wnfe01XGqEVAQ0H5
         wUMCTSl6AqdjplEOFQKKPhwSfbvtzdMYfG8qjjtznmqHD6tq8YeSc9z/ouUaWAjzznVK
         y8oWfv7Au6KRNhd+HajdPDx5+NM3rdqcQ0r5qWz+jSgFdcK/ontUjJiBw2N9LP7dn6lB
         ScrDPJye3lVdRhh5B6Z2Led5OykTqyLKWGZ9PFSx9Y+5JK4CnQ/vQ1HNbG1djy3rI4mX
         VkTbK1+G+KdKiXa5pKKZWg1Pi1CELE1fKhVwAFBXJxPvBqpW4r6b4f/nmqFsU1/MSY1S
         2p0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791619130; x=1792223930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gIpC3TTxDyvpOR8NKmtyMQLMyDufyxtaZeBdyCHZ6SI=;
        b=czqX4BelEMOnUrxhwN5izVwSakKcUr5GoWroGGXXkGOxJX/KM7+WL7/QhtsS6wLLut
         TSlOxJFQl7J5I6lDKjlI6slRQ2sLMpGdmvOUesvz3XnndRnRP+3sI/p7kpOzHh3e0iZA
         +koim95hwI8wWc6/caNgtITWvZXb0txyb8lu2X4Xvnu7a3Z50xkz/P8AaXkDuYrDYCsf
         fW1jP9UZo3BXaJgXP18q5lAItn0roVj+CwDz+aINoBVWHt2P8MChurIlPUEGyQTmIq/l
         YOynli5txrRnpE19ojNCvVh5azwW9FHOCIikvGI5yItVVBC9cIb5MI/BJYveXbpsSrnt
         rfyQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/W2IB7ajndMvZ+AWbPZ8+rFljYHEFha2S+ZI7j5h+WrPtvG96TYXAhMExJkt2py1ONzIP5lJyq/J3Vic=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsWbCGtpaJ5e3h1vipKgYCjbUHIFBx6dur+HbeCx+oct7kSNXI
	Nw8Mk8wGBSA4uYN77Egfbo5SkF3efnkwf0DVZ3ko1mr4hTUCT4HM1YV4nLNW0Jj/Cbo=
X-Gm-Gg: AYBFou11P35F5T4mWd4R4A8GbDMuMTdTzCic9u0t/vKzJs1CU/MUk3vEFUom5h/52HK
	PALhNmrL7CPINs7AZAavqkWo1+pREvo4VK1fZHn8pw28ooZlppTyWT+iE6Q1xPSpYzf6d3ZVOQe
	u6c11d7fzTZnpOVFyagy1mAivgdTGZT+KhaDUc/jdmVMct8ORA0swNCqflhjRu3DaMu/5nxmNDc
	ZhoDBmu0ctpr5RZFA12yVdFX23cIWqy0UNvoVmQkrAKPwaMHclX0Ux5FC60suX+FhLiPGSJtOYK
	q1hT00pmpdClSJwFyosDAxP6R4QG0FuyVJGFn2KhDlacwGm764vm9cH+JtffWoxybjPP02f2Ou1
	TFx8CVDMzehw3sNunv8jhaZ6eVbwzUKeBHhuama8IN9iI1aCKvtb7HBeKbswozF05XvULuhkDNZ
	qVMGUGsalWx4hmGJ3CjeVJjpOF0EqhJhDbu39OnDTcD3rsBRgM4ZBMb2uQqxaxoQ+9b9OVGUMzi
	hHrfFP98NTZC3Ok92NVrX/MELwpmfxOqtxehFisrZzwJGHX
X-Received: by 2002:a17:90b:2ccb:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3ab3afcdc6emr4054531a91.52.1791619129838;
        Sat, 10 Oct 2026 00:58:49 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab57c05724sm3473569a91.4.2026.10.10.00.58.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 00:58:49 -0700 (PDT)
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
Subject: [PATCH v4 3/6] mm/sparse-vmemmap: drop Device DAX-specific population path
Date: Sat, 10 Oct 2026 15:57:52 +0800
Message-ID: <20261010075755.83339-4-songmuchun@bytedance.com>
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

The common vmemmap path selects the shared page for optimized mappings
itself, so Device DAX no longer needs vmemmap_populate_compound_pages()
to find a shared tail page and pass its backing PFN through the generic
population helpers.

Remove the Device DAX-specific population path and let section memmap
population always use vmemmap_populate(). The powerpc retains an
architecture-specific compound-page implementation, so select it directly
from radix__vmemmap_populate() for optimizable sections.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v4:
- Collect Reviewed-by from Lance Yang

v3:
- Use the public order-based optimization predicate in the powerpc path

v2:
- Collect Acked-by from Qi Zheng
---
 arch/powerpc/mm/book3s64/radix_pgtable.c |  3 +
 mm/mm_init.c                             |  2 +-
 mm/sparse-vmemmap.c                      | 71 +-----------------------
 3 files changed, 5 insertions(+), 71 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index a3332f32ffb2..44868b62b14e 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1126,7 +1126,10 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
+	unsigned long pfn = page_to_pfn((struct page *)start);
 
+	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
+		return vmemmap_populate_compound_pages(pfn, start, end, node, NULL);
 	/*
 	 * If altmap is present, Make sure we align the start vmemmap addr
 	 * to PAGE_SIZE so that we calculate the correct start_pfn in
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 56bb4567a494..1650d6bc1211 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1046,7 +1046,7 @@ static void zone_device_page_init_from_template(struct page *page,
  * initialize is a lot smaller that the total amount of struct pages being
  * mapped. This is a paired / mild layering violation with explicit knowledge
  * of how the sparse_vmemmap internals handle compound pages in the lack
- * of an altmap. See vmemmap_populate_compound_pages().
+ * of an altmap.
  */
 static inline unsigned long compound_nr_pages(unsigned long pfn,
 					      struct dev_pagemap *pgmap)
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 62327ac15206..270b5def58e1 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -503,71 +503,6 @@ int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
 	return 0;
 }
 
-#ifndef vmemmap_populate_compound_pages
-/*
- * For compound pages bigger than section size (e.g. x86 1G compound
- * pages with 2M subsection size) fill the rest of sections as tail
- * pages.
- *
- * Note that memremap_pages() resets @nr_range value and will increment
- * it after each range successful onlining. Thus the value or @nr_range
- * at section memmap populate corresponds to the in-progress range
- * being onlined here.
- */
-static bool __meminit reuse_compound_section(unsigned long start_pfn,
-					     struct dev_pagemap *pgmap)
-{
-	unsigned long nr_pages = pgmap_vmemmap_nr(pgmap);
-	unsigned long offset = start_pfn -
-		PHYS_PFN(pgmap->ranges[pgmap->nr_range].start);
-
-	return !IS_ALIGNED(offset, nr_pages) && nr_pages > PAGES_PER_SUBSECTION;
-}
-
-static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-						     unsigned long start,
-						     unsigned long end, int node,
-						     struct dev_pagemap *pgmap)
-{
-	const unsigned int order = pfn_to_section_compound_order(start_pfn);
-	unsigned long size, addr;
-	pte_t *pte;
-	struct page *page;
-	int rc;
-
-	page = vmemmap_shared_tail_page(order, device_zone(node));
-	if (!page)
-		return -ENOMEM;
-
-	if (reuse_compound_section(start_pfn, pgmap))
-		return vmemmap_populate_range(start, end, node, NULL,
-					      page_to_pfn(page));
-
-	size = min(end - start, (1UL << order) * sizeof(struct page));
-	for (addr = start; addr < end; addr += size) {
-		unsigned long next, last = addr + size;
-
-		/* Populate the head page vmemmap page */
-		pte = vmemmap_populate_address(addr, node, NULL, -1);
-		if (!pte)
-			return -ENOMEM;
-
-		/*
-		 * Reuse the shared page for the rest of tail pages
-		 * See layout diagram in Documentation/mm/vmemmap_dedup.rst
-		 */
-		next = addr + PAGE_SIZE;
-		rc = vmemmap_populate_range(next, last, node, NULL,
-					    page_to_pfn(page));
-		if (rc)
-			return -ENOMEM;
-	}
-
-	return 0;
-}
-
-#endif
-
 struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
 		struct dev_pagemap *pgmap)
@@ -580,11 +515,7 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
 		return NULL;
 
-	if (pgmap && section_vmemmap_optimizable(__pfn_to_section(pfn)))
-		r = vmemmap_populate_compound_pages(pfn, start, end, nid, pgmap);
-	else
-		r = vmemmap_populate(start, end, nid, altmap);
-
+	r = vmemmap_populate(start, end, nid, altmap);
 	if (r < 0)
 		return NULL;
 
-- 
2.54.0

