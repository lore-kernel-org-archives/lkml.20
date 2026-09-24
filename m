Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4446C43DECB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236700; cv=none; b=jucpOgVFVg5taEVSWez92NGqIbVyHZ6oXJKYFwnmNvD1qaeChUZ7JSKR3TSsPbMxjhQUGRsMwe6sN2jp7NHUOWPM5dmDbjTXmT38NZnoburqKEnf3kYfsNQKB6uGByPADJjNg9shdFZwUo5jPSJDyh/ok8HvGG8zO8TNUzJB/O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236700; c=relaxed/simple;
	bh=0ThW2qM7vNvfW83kXIKzDXebm6IN+qEzu5zDI2USEj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VgbC3iE77h3xNFguF1Gn1mtn9EnhkorFM4GDnC1PddVdiFKmIKV06xcsUNuAtXTznfz/Ls80AnV07r/7WdDXKIeIkUXpPATsPldRi84WSu8kUPX9GVz5c9IwFj/9BhET2rkwhM03k9GKqw1UumUTU2aKleJ1zFDIqdY4YXu4SCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DaCMFozC; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DaCMFozC"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so984265a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790236698; x=1790841498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mwg8qfU0YRGSE8UK0HBy9iZTs3Sk7OFpk3Nxuz+XYco=;
        b=DaCMFozCHkCj8pQ/l9CXDt1v+W3REdaud2JOeRF5lVkoXQ9m+AqNKZSBnNgJXJCfRe
         rmqNgEkLdWpH9N0UOZy5jBbOBWXqhcG+I3gExSnvuFxCx/2tLjcpnkdxAzT9L2BZvI2t
         R7vn9Vw2U+EDRU/HRF+oiBYXDaxWhwvlHbLWSs3Qol+ElEhdi35hAICzcCsi3YuYX/1L
         v9dznS4bYe7z7QmUsquVkRgpmKy9vANyB3UvH6SM82EJyBXvfPYyKAFyZiFvqU0I5El8
         rWA/QrIpvMJVvhHbgP4KAHWQfDJzm/qWSIUyNPaIuGldrs8FihTlr+KtL4Tz5uDRTdBQ
         rZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790236698; x=1790841498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mwg8qfU0YRGSE8UK0HBy9iZTs3Sk7OFpk3Nxuz+XYco=;
        b=OgckMm+nkZYuKGffGt0AWW6AjNCwvNN9sWjJ4btQj703L51jBwwQJacfiKDnLUZTe4
         KqmgXwq+euBUdRfCTb+2En+e5x4OVHSCpbV5G7LIIkF7npkzHJY4U4T5eukDJLThvcL0
         iExoSeR8V6lNsSx9X61rQ9o5WwAscj75lJBqZDQl6Uq1JWJOB3VwqrlFeJxUa23RMOa0
         yHf/EaTc/nrnefsdIl7qC+tvHx4HHoUXZR46+22IqsHTqABjSYcErWmTt6pzxOty+5ld
         d+j/dIzkSShUE7LFyRWvi5aMNdlLMUzjc4pXRyMNTgrdsJgCk9fOUXWTqe2Cryv/q/j4
         ScIA==
X-Forwarded-Encrypted: i=1; AKwUvBxBxhqXqKv4IdjejB/wmLD32WMxLGArkyCDXFxdAUmfRLR0itaaTwvkA2TfwIKB3B1t4mgJhyZCqIrLK0g=@vger.kernel.org
X-Gm-Message-State: AFuF++nWPqqENFNEQ8RFtbsPA1a33EkiHv84RaEOc5p7qHMlL+pL54AY
	aGaP6bYne462QTeUttFbYo7vJj9XxDlrHxKbgmetjPXAbePzFzkYvr/A0Ek8Ga21L8Y=
X-Gm-Gg: AYBFou2JrtFIqkwULfEf+Q1nVcFX3OTZ6m0P0e8vqcjJuiGQ3uHnH2Kx87WDuTDAeBi
	oRP/6L+8UbgQepgznWm5EZpEaUm13NmgaY2NN0CNc2YrwQ0wqVK+1ufc3IVjarRULcD63TLjxuW
	qlDJj4SBNB3ERLg+0mwbVuqN4ALdwrHA4Cs8HoVRr271vQ6xnUjCZ0avuD68Z5Us4aJx+1xP4wQ
	nge92vondzYz9Lp8nwHxE131P3+214Cz6ZlCYYpltyV8n/OPbgcP5d+WascVEGIzQpNfXIyilZ9
	CliY30bk3L8tRGW27vgctHimlxnut7yp7ajwOD0sNbNtUoejhdd6YC87KeuRxJ6Ku6emqTIGeQq
	OqIVFAG4LMGYmovdqSedsF8Mcps2SoKfiguXiTC1CWiX5pZptHaYbc8Yk4mf0cGOlxtSxTkKiF1
	SK7k06AvkdON46N0RxX+/QvcKlKuwByu0UC2PEIMW19pRk/LqLEbBBsL9c4+e6/kZ39frhZmyjJ
	ChdG8Wk/6UdWeqJPcUX
X-Received: by 2002:a17:90b:4e8f:b0:39e:4c80:f67c with SMTP id 98e67ed59e1d1-3a09875f8f6mr1584809a91.27.1790236698392;
        Thu, 24 Sep 2026 00:58:18 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972eec92sm3575622a91.7.2026.09.24.00.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:58:17 -0700 (PDT)
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
Subject: [PATCH v2 3/6] mm/sparse-vmemmap: drop Device DAX-specific population path
Date: Thu, 24 Sep 2026 15:52:56 +0800
Message-ID: <20260924075259.2013039-4-songmuchun@bytedance.com>
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

The common vmemmap path selects the shared page for optimized mappings
itself, so Device DAX no longer needs vmemmap_populate_compound_pages()
to find a shared tail page and pass its backing PFN through the generic
population helpers.

Remove the Device DAX-specific population path and let section memmap
population always use vmemmap_populate(). The powerpc retains an
architecture-specific compound-page implementation, so select it directly
from radix__vmemmap_populate() for optimizable sections.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Collect Acked-by from Qi Zheng
---
 arch/powerpc/mm/book3s64/radix_pgtable.c |  3 +
 mm/mm_init.c                             |  2 +-
 mm/sparse-vmemmap.c                      | 71 +-----------------------
 3 files changed, 5 insertions(+), 71 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 9ca28e4a610a..cb72d9ccf747 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1122,7 +1122,10 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
+	unsigned long pfn = page_to_pfn((struct page *)start);
 
+	if (section_vmemmap_optimizable(__pfn_to_section(pfn)))
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
index cdcc93714a9a..4aae22beca21 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -466,71 +466,6 @@ int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
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
-	unsigned long size, addr;
-	pte_t *pte;
-	int rc;
-	struct page *page;
-	unsigned int order = pfn_to_section_compound_order(start_pfn);
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
@@ -543,11 +478,7 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
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

