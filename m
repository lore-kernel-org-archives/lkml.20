Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051254EF13E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777330; cv=none; b=WIGB3cgSk9+cqrEOv4sLXO70epjupTtY9YPTqiilm4BcJoHCZrsREr8JawAhCe56Iz0iFGp6Jg+AovKcNeLi1fIVecEBobK5tHTAqIXIyadyxUzPpeTLKuBCgxWHa3eXoIBWlvd8P2CsWzOfsq8srsV7oUzr3iIVwALraLYzAG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777330; c=relaxed/simple;
	bh=g4YmSOMQbizjdThG5EAEgVSONOXV8Fc7brqQuUyDI4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNfNR0e7C7YKe+DPILppMtx00aJrOLEpS9UZYbfFihC1Y5G997gNWmGTc46SZ/Gt0ygT3PMXZnMiDy0f6kW/wkMWlSOqDRmKsrs7DrXuGvJdy1L3W4AXYGp/rDNLb2QKLQPav+2oyRJJ+oWW3h2dXHXJAXTmLHonF7PjekA9wME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KW9l3hqa; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KW9l3hqa"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7d1802740so751776a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790777312; x=1791382112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9xel/71txHnw7brYLWC7OAspVaWnOG/eiO9DEfyBSY=;
        b=KW9l3hqabaMWqW/fE+w4coeZxECMGoPHlUz4VfZQxuFEgsPFuDT9cmCY3QqbNRWtYc
         psK9Cwb1vJO/Y009tt0pHPOVlCLI5djf4IuhsiEvfT3Ouzsm4O4jn0JrKWVnIzC+64eU
         37AH7Anz/7skC6Uh16fRdxRWjdhhZ9ARPGqc1Noy+F9DXku/OrVIW7OEJKdRW01o9CfN
         ko8lOGCIxkXpVL/pG7C69YtWprq6z6N4TbNFzH0Om1qll79GW9TS23sQ2EaZPIVfmqnn
         KepUG5Nkr5V+6eK0rSnTGqVlhs0t73F/YbpTc6nqJCcGLLHW5RLK0pMQZIc/f6I/JI64
         cbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777312; x=1791382112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9xel/71txHnw7brYLWC7OAspVaWnOG/eiO9DEfyBSY=;
        b=Sk8erVboVtEBUgInFKMY2Vwb58DydYS9GD4IXHSzQ4jW7xAeLMX56UBtLJEzf6jCMV
         G0y54KH9Q+IIui1groyKNzfFP0IltYLCRo/iWYxdITu5Wey0K+rUJx5s0bPV30zy0/Jm
         CkS9LDqGAHq2c5V7C/lhFuOR8o9kRiHooJF+d5CPHsY4E7N8hNUUrx5WNaLtffmWU+Hu
         nOZ5+/GySsJ6s2Lol3C4ntAIMEOiyxbYrbjj30aQzIRkDpyGU+jErgj/6vqCsu7XHwc5
         Yoo18H1s/lfE8hY2O6X589gyhUyh/SujpSU1SHC5zb9FChG7ARrXdaXZ4QY1HUcHL7NQ
         1H2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxnjxDC2pwbqNTrZVYCeoJqOjFY7YDMZ0M2PUgzvu3KckCXwBXQ9UHUKnMZ8oxRHcyV/tGrQUR0Dl2lghs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIs0KHniIh7F1NhBsG76Zf3Rc7SYsPuxFiBreJ4929Q8CX3uMRy
	8KL9gmXIO50BIyb5fq4fPaVEfT2DugwGqx+HfXltEJ54dHkL7pZf62nb7tgTTPSqWYY=
X-Gm-Gg: AYBFou1wDNvGkLp5g4LfRVIM7u8Ythaf2P7jpRXrCb7TccIpbRIQxtLBFKOjAD21Zlz
	Mt62IXFPQcibYx7PbSQ8LZZZvDSwx6R0vLU1NCnUWFa6F1QFsIsI6LgrdKdDIExxe9uXz78zcEB
	GEcHKA5qw5B3qlN7W7S0LXIqnZlmnQ7fVBptqUl+OPCosF4+muPYQLRtausarIaG4YWPHQMcUv7
	emZ4QlnayDCD5rFEaUigTSB05yT5SYzDnySqfPg5r8paq6G+7ICTtY7mYMCxS8NotB7bTC6E/NX
	Tle+wdPg40xRAe0n4b3AGaqyQqNlvDXpv2DHmLCoVCvMptPYkw0yeQxJw+KZAdRxZkYdf20mK4z
	uTBlhXpbO1LiNRkKqXonZbwucWP7Vlz0Ebnckne3QIYeeU5L+4k5kkaU8Y0F7AxBxWBZBmJLwp2
	jY9IMEKUMCChTFCowTAkjeWoeGRo4/EZm9t/Da4kYK+kqHj985ieGt5s2W3KJX1ndNKOhvu0SD8
	jatitBv8w6ui9xB+ug39Byf
X-Received: by 2002:a17:90b:2e42:b0:3a0:f2c8:9ad6 with SMTP id 98e67ed59e1d1-3a4d193d340mr1404438a91.64.1790777312124;
        Wed, 30 Sep 2026 07:08:32 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e60ea12csm639509a91.1.2026.09.30.07.08.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 07:08:31 -0700 (PDT)
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
Subject: [PATCH v6 09/12] powerpc/mm: switch device DAX to shared tail vmemmap pages
Date: Wed, 30 Sep 2026 22:06:24 +0800
Message-ID: <20260930140627.57431-10-songmuchun@bytedance.com>
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

The powerpc radix compound vmemmap population path still finds a reusable
tail page by walking the vmemmap page tables.

Switch it to the common vmemmap_shared_tail_page() helper instead, so it
can use the shared vmemmap page directly to simplify the code.

This removes the powerpc-specific tail-page lookup and its fallback path
and aligns the device DAX vmemmap optimization path with HugeTLB.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v6:
- Collect Acked-by from David Hildenbrand
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 80 +++---------------------
 include/linux/vmemmap-optimization.h     |  6 ++
 mm/sparse-vmemmap.c                      |  6 --
 3 files changed, 15 insertions(+), 77 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index cf692b2b5f7b..ee068f24a79f 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -19,6 +19,7 @@
 #include <linux/string_helpers.h>
 #include <linux/memory.h>
 #include <linux/kfence.h>
+#include <linux/vmemmap-optimization.h>
 
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
@@ -1250,59 +1251,6 @@ static pte_t * __meminit radix__vmemmap_populate_address(unsigned long addr, int
 	return pte;
 }
 
-static pte_t * __meminit vmemmap_compound_tail_page(unsigned long addr,
-						    unsigned long pfn_offset, int node)
-{
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
-	pte_t *pte;
-	unsigned long map_addr;
-
-	/* the second vmemmap page which we use for duplication */
-	map_addr = addr - pfn_offset * sizeof(struct page) + PAGE_SIZE;
-	pgd = pgd_offset_k(map_addr);
-	p4d = p4d_offset(pgd, map_addr);
-	pud = vmemmap_pud_alloc(p4d, node, map_addr);
-	if (!pud)
-		return NULL;
-	pmd = vmemmap_pmd_alloc(pud, node, map_addr);
-	if (!pmd)
-		return NULL;
-	if (pmd_leaf(*pmd))
-		/*
-		 * The second page is mapped as a hugepage due to a nearby request.
-		 * Force our mapping to page size without deduplication
-		 */
-		return NULL;
-	pte = vmemmap_pte_alloc(pmd, node, map_addr);
-	if (!pte)
-		return NULL;
-	/*
-	 * Check if there exist a mapping to the left
-	 */
-	if (pte_none(*pte)) {
-		/*
-		 * Populate the head page vmemmap page.
-		 * It can fall in different pmd, hence
-		 * vmemmap_populate_address()
-		 */
-		pte = radix__vmemmap_populate_address(map_addr - PAGE_SIZE, node, NULL, NULL);
-		if (!pte)
-			return NULL;
-		/*
-		 * Populate the tail pages vmemmap page
-		 */
-		pte = radix__vmemmap_pte_populate(pmd, map_addr, node, NULL, NULL);
-		if (!pte)
-			return NULL;
-		vmemmap_verify(pte, node, map_addr, map_addr + PAGE_SIZE);
-		return pte;
-	}
-	return pte;
-}
-
 int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 					      unsigned long start,
 					      unsigned long end, int node,
@@ -1320,6 +1268,12 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
+	struct page *tail_page;
+	unsigned int order = pfn_to_section_compound_order(start_pfn);
+
+	tail_page = vmemmap_shared_tail_page(order, device_zone(node));
+	if (!tail_page)
+		return -ENOMEM;
 
 	for (addr = start; addr < end; addr = next) {
 
@@ -1349,10 +1303,9 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 			next = addr + PAGE_SIZE;
 			continue;
 		} else {
-			unsigned long nr_pages = pgmap_vmemmap_nr(pgmap);
+			unsigned long nr_pages = 1UL << order;
 			unsigned long addr_pfn = page_to_pfn((struct page *)addr);
 			unsigned long pfn_offset = addr_pfn - ALIGN_DOWN(addr_pfn, nr_pages);
-			pte_t *tail_page_pte;
 
 			/*
 			 * if the address is aligned to huge page size it is the
@@ -1377,23 +1330,8 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 				next = addr + 2 * PAGE_SIZE;
 				continue;
 			}
-			/*
-			 * get the 2nd mapping details
-			 * Also create it if that doesn't exist
-			 */
-			tail_page_pte = vmemmap_compound_tail_page(addr, pfn_offset, node);
-			if (!tail_page_pte) {
-
-				pte = radix__vmemmap_pte_populate(pmd, addr, node, NULL, NULL);
-				if (!pte)
-					return -ENOMEM;
-				vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
-
-				next = addr + PAGE_SIZE;
-				continue;
-			}
 
-			pte = radix__vmemmap_pte_populate(pmd, addr, node, NULL, pte_page(*tail_page_pte));
+			pte = radix__vmemmap_pte_populate(pmd, addr, node, NULL, tail_page);
 			if (!pte)
 				return -ENOMEM;
 			vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
index bd0974b262a4..fa9e9abd6656 100644
--- a/include/linux/vmemmap-optimization.h
+++ b/include/linux/vmemmap-optimization.h
@@ -83,6 +83,12 @@ static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
 {
 	return 0;
 }
+
+static inline struct page *vmemmap_shared_tail_page(unsigned int order,
+						    struct zone *zone)
+{
+	return NULL;
+}
 #endif /* CONFIG_VMEMMAP_OPTIMIZATION */
 
 static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index d40a2f5b5fca..e1f8a03e3d49 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -240,12 +240,6 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 
 	return page;
 }
-#else
-static inline struct page *vmemmap_shared_tail_page(unsigned int order,
-						    struct zone *zone)
-{
-	return NULL;
-}
 #endif
 
 static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
-- 
2.54.0

