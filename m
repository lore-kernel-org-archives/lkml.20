Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4283933F8C1
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477697; cv=none; b=pgB0hC8wdHVLMtrqiF6gzWwhDXQObyiyFAiQwZs81XuJuiZcmPvl5HfBy/6jQ5fzQHMcKKOK8Rr64A72d2bZnKt5SO7LOmK/MfjhsbBSTQ3UNDLgtDB/RFhTbXuPNuKMqABPdS8UANkWhuv+FahWRrRRT2z72m1+xERFo+npdhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477697; c=relaxed/simple;
	bh=+N50Seo0VfK2Ga64K5cesXaliBYeQJmA/v3bOatp3nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5LZ06qDb6RwBpU2jbbXtfO9g/YurazdPfqTz96CHL+yyl+CyE7qerWWd2Il4Z4qfZvXulYY821FApJh6yygQ/YUf5iiNbVGb4C172y6LeZEzX31a5uypICFxGDM5KYbTtbylDEPZEmhWiwYV8pUBVoH+LT2XxIZVAx1i5ClvAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=CocKw5Y7; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="CocKw5Y7"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39d654f02baso850252a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790477695; x=1791082495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4fFb5jWFZ2W8X/tUSizSdLW9y/fwSZ4mGTJ1PbgeB4=;
        b=CocKw5Y7WpvT7ej1jqQ8ne/8tUg2rlHql4P5+Oq7y2EueCbFvMnCvC0rCpzzxiasmu
         f0PEiLJ2hcUjpY9MyYgtbYVmvPKdKSbo/9beQnPXvf2Y2hAB6a+EHdrsTTq77JxOyzUu
         aXUT+f6KZxFCORiOsSP7+IuYLWqOlqo4ILZmPVuvSGU/1eT7IE1NyYyLR9yyzId2rVYR
         HXzl3EK6rYRnVlQlYR5sMZ3fnSZlcEZIuDV52BFPHVrOlw//1tIgsdKaAxRVTYzs528y
         D7qgbBhOQu9Y3CO+We0gpUAS3glk8RMwwueB1agJqkXdzojH0tqmbuW8Qiz3zgH3KzA+
         kVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477695; x=1791082495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P4fFb5jWFZ2W8X/tUSizSdLW9y/fwSZ4mGTJ1PbgeB4=;
        b=QJvyTZsh1SeaeQ3elq5baSBXSulwBgdAj4cAJmEzMI1Kmejou1rLHs23XvJ+eAy8lU
         4W7bk4KSujI98ajkNoC5BHGwLrhddkqYw+SeWY/o/6qf13tXRN29fri0FW+99yH1cxzM
         sZgbWy7LvfmlWfnZORUUKB6Z19S+BvEHAoruUo/IvYOzftwVPLJqjDRdNb6laOE5sQDa
         TkGccTPtdhxt98pKBxBroPB0T7mjVGy7WPNnb+PS0KybeL2SSTLsIxfUHkOSdtMGfA1/
         pq+Q/qM3RUeaBicAKTgu0LGJBBaFEWwYXhDabl3t6cK3eObz1+ZeCP9FIMF++J/EEkGj
         WmuA==
X-Forwarded-Encrypted: i=1; AKwUvBwRv6tWQvwO5DeB5Wm2x1N0a5hcLgtJQ7opZnm7su+TZOXvmdwlZR2OW5xsCz6iCchbakxqHDUdHTm0vqQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqxdYGxnH1bMdSbrjOkEM9O1FcOWcO68DBWuxOrDI9+n6JZZ5J
	CzHOK6uqyBsNBKLhQciXpodVtPSFj5OQGjnZ36mKi+tQjcGWiUt9Tfz1Sxd+FBwHJ5w=
X-Gm-Gg: AYBFou1lYbqhIZh5kYgWEnuuqz5UZ5tTma1MOq4x2W6WvvzJveLp1DIMzHUcxyAGfCO
	mJJpjVOgh2oIKby/NaPlAq7O2yrsN9se4eDn1OgBVtvQKPixl4NhOi22nIHjVu01/Dwcdry+cZI
	og9o0brSuXMoOLRA+5fP+q99MfJt0rCosGxy+HPx4VpHV44zBMhs1J8Xi6dkfbDOROYMqQyu6VO
	XN2YEGlMkwNASWyduKZMMLRduEBjtdIzx9sCSxvQYu/NBlU07MoJi0p0lDQsCSgaHbRlQHEmbuI
	+tYP/6cm9ya2YGds57U9BimdbaS3O1TutaLZuiZPoWh9FfeOw4gHljCZ11esqWaN9kukFU5m1zq
	YwNMSljyS7ee7ulaS1pxhM2G00a+01OrnaRrfORTpp9jgZxXPjq75vlbmlydd6RxH6E79L29Nmy
	qqFnA9LTB0eeIB5kHpKLEhsYXlfxuVXF0/4RpFv6/OnDkPQhpiaVYUGwYz3I9Wx0bH3EWWsGJ+r
	lDG6UP112n6kVGmQWt3
X-Received: by 2002:a17:90b:28c3:b0:3a0:d18f:4be4 with SMTP id 98e67ed59e1d1-3a0d18f8399mr3416950a91.33.1790477695213;
        Sat, 26 Sep 2026 19:54:55 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm13461377a91.1.2026.09.26.19.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:54:54 -0700 (PDT)
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
Subject: [PATCH v5 01/12] mm/sparse-vmemmap: factor out shared vmemmap tail page allocation
Date: Sun, 27 Sep 2026 10:54:30 +0800
Message-ID: <20260927025441.741633-2-songmuchun@bytedance.com>
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

HugeTLB and sparse-vmemmap each have their own helper to allocate the
shared vmemmap tail page used by vmemmap optimization.

Factor that logic into a common vmemmap_shared_tail_page() helper. It
allocates the page through vmemmap_alloc_block(), initializes the tail
struct pages, and uses cmpxchg() to install the per-zone shared page.

This removes duplicate allocation logic while handling both early boot
and runtime allocation through the same helper.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
v5:
- Move this patch before CONFIG_VMEMMAP_OPTIMIZATION is introduced

v4:
- Update the commit message for the renamed VMEMMAP_OPTIMIZATION config
- Collect Acked-by from Mike Rapoport

v2:
- Collect Acked-by from Qi Zheng
---
 mm/hugetlb_vmemmap.c | 29 +-----------------
 mm/sparse-vmemmap.c  | 70 ++++++++++++++++++++------------------------
 mm/sparse.h          |  3 ++
 3 files changed, 36 insertions(+), 66 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index f977d0a7e002..76765c97ff68 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -19,7 +19,6 @@
 #include <asm/tlbflush.h>
 #include "hugetlb_vmemmap.h"
 #include "sparse.h"
-#include "internal.h"
 
 /**
  * struct vmemmap_remap_walk - walk vmemmap page table
@@ -493,32 +492,6 @@ static bool vmemmap_should_optimize_folio(const struct hstate *h, struct folio *
 	return true;
 }
 
-static struct page *vmemmap_get_tail(unsigned int order, struct zone *zone)
-{
-	const unsigned int idx = order - VMEMMAP_OPTIMIZATION_MIN_ORDER;
-	struct page *tail, *p;
-	int node = zone_to_nid(zone);
-
-	tail = READ_ONCE(zone->vmemmap_tails[idx]);
-	if (likely(tail))
-		return tail;
-
-	tail = alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
-	if (!tail)
-		return NULL;
-
-	p = page_to_virt(tail);
-	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++)
-		init_compound_tail(p + i, NULL, order, zone);
-
-	if (cmpxchg(&zone->vmemmap_tails[idx], NULL, tail)) {
-		__free_page(tail);
-		tail = READ_ONCE(zone->vmemmap_tails[idx]);
-	}
-
-	return tail;
-}
-
 static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 					    struct folio *folio,
 					    struct list_head *vmemmap_pages,
@@ -535,7 +508,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 		return ret;
 
 	nid = folio_nid(folio);
-	vmemmap_tail = vmemmap_get_tail(h->order, folio_zone(folio));
+	vmemmap_tail = vmemmap_shared_tail_page(h->order, folio_zone(folio));
 	if (!vmemmap_tail)
 		return -ENOMEM;
 
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index f22d815d7af0..9b00085122b2 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -42,27 +42,13 @@
 #include "mm_init.h"
 #include "sparse.h"
 
-/*
- * Allocate a block of memory to be used to back the virtual memory map
- * or to back the page tables that are used to create the mapping.
- * Uses the main allocators if they are available, else bootmem.
- */
-
-static void * __ref __earlyonly_bootmem_alloc(int node,
-				unsigned long size,
-				unsigned long align,
-				unsigned long goal)
-{
-	return memmap_alloc(size, align, goal, node, false);
-}
-
-void * __meminit vmemmap_alloc_block(unsigned long size, int node)
+void __ref *vmemmap_alloc_block(unsigned long size, int node)
 {
 	/* If the main allocator is up use that, fallback to bootmem. */
 	if (slab_is_available()) {
 		gfp_t gfp_mask = GFP_KERNEL|__GFP_RETRY_MAYFAIL|__GFP_NOWARN;
 		int order = get_order(size);
-		static bool warned __meminitdata;
+		static bool warned;
 		struct page *page;
 
 		page = alloc_pages_node(node, gfp_mask, order);
@@ -76,8 +62,7 @@ void * __meminit vmemmap_alloc_block(unsigned long size, int node)
 		}
 		return NULL;
 	} else
-		return __earlyonly_bootmem_alloc(node, size, size,
-				__pa(MAX_DMA_ADDRESS));
+		return memmap_alloc(size, size, __pa(MAX_DMA_ADDRESS), node, false);
 }
 
 static void * __meminit altmap_alloc_block_buf(unsigned long size,
@@ -185,34 +170,43 @@ static void * __meminit vmemmap_alloc_block_zero(unsigned long size, int node)
 }
 
 #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
-static __meminit struct page *vmemmap_get_tail(unsigned int order, struct zone *zone)
+struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zone)
 {
-	struct page *p, *tail;
-	unsigned int idx;
-	int node = zone_to_nid(zone);
+	void *addr;
+	struct page *page;
+	const unsigned int idx = order - VMEMMAP_OPTIMIZATION_MIN_ORDER;
 
-	if (WARN_ON_ONCE(order < VMEMMAP_OPTIMIZATION_MIN_ORDER))
-		return NULL;
-	if (WARN_ON_ONCE(order > MAX_FOLIO_ORDER))
+	if (WARN_ON_ONCE(idx >= VMEMMAP_OPTIMIZATION_NR_ORDERS))
 		return NULL;
 
-	idx = order - VMEMMAP_OPTIMIZATION_MIN_ORDER;
-	tail = zone->vmemmap_tails[idx];
-	if (tail)
-		return tail;
-	p = vmemmap_alloc_block_zero(PAGE_SIZE, node);
-	if (!p)
+	page = READ_ONCE(zone->vmemmap_tails[idx]);
+	if (likely(page))
+		return page;
+
+	addr = vmemmap_alloc_block(PAGE_SIZE, zone_to_nid(zone));
+	if (!addr)
 		return NULL;
-	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++)
-		init_compound_tail(p + i, NULL, order, zone);
 
-	tail = virt_to_page(p);
-	zone->vmemmap_tails[idx] = tail;
+	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++) {
+		page = (struct page *)addr + i;
+		mm_zero_struct_page(page);
+		init_compound_tail(page, NULL, order, zone);
+	}
 
-	return tail;
+	page = virt_to_page(addr);
+	if (cmpxchg(&zone->vmemmap_tails[idx], NULL, page) != NULL) {
+		if (slab_is_available())
+			__free_page(page);
+		else
+			memblock_free(addr, PAGE_SIZE);
+		page = READ_ONCE(zone->vmemmap_tails[idx]);
+	}
+
+	return page;
 }
 #else
-static inline struct page *vmemmap_get_tail(unsigned int order, struct zone *zone)
+static inline struct page *vmemmap_shared_tail_page(unsigned int order,
+						    struct zone *zone)
 {
 	return NULL;
 }
@@ -229,7 +223,7 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
 		return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
 
 	zone = pfn_to_zone(pfn, node);
-	page = vmemmap_get_tail(order, zone);
+	page = vmemmap_shared_tail_page(order, zone);
 	if (!page)
 		return NULL;
 
diff --git a/mm/sparse.h b/mm/sparse.h
index d3a71ef4fad0..6e7aaeaa5594 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -142,6 +142,9 @@ static inline void sparse_sections_init(void) {}
  * mm/sparse-vmemmap.c
  */
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
+#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+struct page *vmemmap_shared_tail_page(unsigned int order, struct zone *zone);
+#endif
 void sparse_init_subsection_map(void);
 int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
 		struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
-- 
2.54.0

