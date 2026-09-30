Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684AE4FD7AC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777260; cv=none; b=TVQjeSIDD8Wx9zNNelQ61EQYpXlqnc/uTETgK6Og4Zh+Nm/rRWrNmCaZWJnE2ccZrYlNhPToChgCBb9ivwILv77VzDPDNQ62QAXd4XtRJo/YOPdYpp56pSEMOgRvljyHBe1f1RBinH7bQFiO63kPnTCI9LKVt0MXijyT4dfmEBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777260; c=relaxed/simple;
	bh=6xeTqm0MPfbxyV8i7kCw4+kaZfhzfCoE9zTzfuYhkvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mEXq293FcPZKDmE+1bxhQXbef4fI0pgYBsrzRpnB7OSUjVrYG5ueXqn+Q68mWrxNHaoxmsHuiL8dbrBg/Yh+yJkaOE9hjjQVpe7wFP8Jo0sz3tH4IBZzHs7foDkFVBZYC4F19lK9pzOHPYSjEzKy8bi17/QaCIAsIyGVoEm9iYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Xp1Xoyj6; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Xp1Xoyj6"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0f64df6a6so2111002a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790777244; x=1791382044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/Fb5g8MDUieQ0AsGZlC/m2n+LM+/+hXUoXNvWx5za0=;
        b=Xp1Xoyj6N0SL1l33MDvDae8WF76DHAgDYfV4ykTgZJlo+aegUsNet28tr8bITBepnl
         gj5AojWJmO9n01VzactLiSXz/XRotvuqsrmxDv0PPCj6dkIOHLGl6wcFsuptbG0CYD7Y
         AyiQsLmA16IzmYhH13Pa8uUMxJD6OdMMPMskYtLE5Mhaidy4YJ7O7/AizOSAJ0HoOhFU
         WibJWmt99/b939LZ00mZbnUrNqt1b+SmXgGkALAWhLuqEV18IXnwEny7cDOcMRhUAjbb
         4fPu5AQ3Oj1pgRuZEW26LYtssJ0ubWp1s2ik/kYIR6fiH0za15/oKuAt7O1kIUPCgh54
         Icew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777244; x=1791382044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9/Fb5g8MDUieQ0AsGZlC/m2n+LM+/+hXUoXNvWx5za0=;
        b=nv1KVzztHyLIKDTBEe7G78lDsELwBlzYgW2fvaCY/fwC6DuKHWrgNzAvtmAFYtlkKR
         mfD3NlTOnlAXyQ03KL7HJozBKWG4NWH99GNP08cvc1PwjGjecAz3BF6s+3K+vxjO3br5
         OGGclAdsDRwfuPQQAvO4cda3X2t6cpceSH15/uz/wa2Hsi+pZuzc57x5huQNxo8vtTeV
         3+fIvSbFZSeRghUEO5X9gBKfsnLwITM2XB5f3uCo59b5q/WaTHB8Dix7zS0J0KppIh1b
         UucvGsJwo0A+gx/AGzQXYP8mABMQg33AgbRju5Uas4IanjJi53tO5zh+5HWDRG4gBxSi
         yV7Q==
X-Forwarded-Encrypted: i=1; AKwUvBy4CTGysqjuGVs2Y0xgzSopfIvFg0AD+rINRQscJ5rCOQJ7eY56MoZ1ITUVBE1qO/2rokhChOl9xDCmfoY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJAn9UTCNhs21K5jd4DG2PUtTZjI9I8zCEdhYDs0NjMbZf0Poi
	fNCcadslXwFVfxaho2HBZItZfTHK2n0Zc5SGkXHFLzO8K39g1Ekp4EaFOc6YO9TC0xSm3XqP0wv
	Y33kt3a4=
X-Gm-Gg: AYBFou2TPSQQ+6dxGKkBuUmgYgqzz7cCdqQ/nYGR7sPMO31nRJj5B5ZsrbuBNYENaIw
	wOFye0P1IxWkdC70GqGPFJ3eZcy+Eg9k/d4iFDJrjJBGTJrczzXrd7xwYIP8SFm8Pz7o2M5j5w/
	ieobI5rQsUoTWZZu9qAfMdDKwkNk2iCHYiBo+Nzvoe8OgXZbbuC7X9oPWlDnWJ5ZLBtHlZrSi8e
	YNRIF2TfRJsebg9jhAPmng7gk2ll3PzMvd9waFHFYoJpsA40nYLbGBBRcW4nU45tMkRraF2odNu
	6Eu301tXIpeEbpAKNROU1Imx95K9NO4Ym8ITk3TgdXBmMxndy+uXtdxxEPxH1BVBiAixwOHxmNJ
	B1ys3IEwYHwYaNNVZu41cpcxyrDQ4w/20r6QqLdpsuCRKxdfViw4yIk9VgJJtxOYHfWkB5F5ixo
	nPwt8Sk9UU9XwnsdH0MtwHtEFgIy4TrcAcWujOrXD7x86Vb6zGCNkCE9ohCpWW73KdOcWRMbTVp
	ZOhGD7Uj7DlkQ==
X-Received: by 2002:a17:90b:2687:b0:3a4:a270:23f1 with SMTP id 98e67ed59e1d1-3a4d103d004mr1307962a91.4.1790777243537;
        Wed, 30 Sep 2026 07:07:23 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e60ea12csm639509a91.1.2026.09.30.07.07.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 07:07:22 -0700 (PDT)
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
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v6 01/12] mm/sparse-vmemmap: factor out shared vmemmap tail page allocation
Date: Wed, 30 Sep 2026 22:06:16 +0800
Message-ID: <20260930140627.57431-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930140627.57431-1-songmuchun@bytedance.com>
References: <20260930140627.57431-1-songmuchun@bytedance.com>
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
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v6:
- Move the constant declaration to the top of the function (suggested by
  David Hildenbrand)
- Collect Acked-by from David Hildenbrand

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
index f22d815d7af0..9af349581fbd 100644
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
+	const unsigned int idx = order - VMEMMAP_OPTIMIZATION_MIN_ORDER;
+	struct page *page;
+	void *addr;
 
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
+	if (page)
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

