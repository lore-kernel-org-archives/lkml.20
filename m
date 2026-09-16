Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F2D3E559C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541054; cv=none; b=KYma27yj6BOSijE5jkvt3IidedriqqipsL+gt7RwZf6blpEaCHYx8ZjT0M+K2CcIrUzt19xxJ6PWmdYUXSRBcyQjxKIO4QOganehjLwEnW0uvqmJfNZbLLVqAa2+hDnmHtuDVIIh9ZI95yLaoNvrsEgM+ho1aBNOk6St3mMT1Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541054; c=relaxed/simple;
	bh=4C/H0OXURhGuKf+braJ+uKcmMn4yaEgFfA4J4Js2eLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LyL3SfHnY+T/eM2fqbuWEa2GPAU5gXuQ6kWnQ5rykskduTrzzKJgEQlfhR/vpdvMXFR/5T8Z/HiTMP8UT+7p40/AKcz74QGGztOzG0X6iS09KjRNZ8T5PZb0OdwXNhyDDVMredyAaJGI5cbP7XcF24AR+xZ2IpNEVu0PRl9hYFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=IKPamaUM; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="IKPamaUM"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db18fe433fso5142495ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789541052; x=1790145852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrSUwqa7xtL2ZBs1WlB04Z11tmz781BnHoaaNOznkvI=;
        b=IKPamaUM5+ChDYemNMjT2VaTTngBn1onpMDClpXULJ+Cg7kn6q6L6ripwuicO81emm
         dsXpYSm0ZpwPVcLDaqYIUek6eAZj4aVrGxoBN8TTDiWZUdXtpbwS2a34pY55/6c6hgUn
         wDMZBmn4ZUhSn4OlzfesIhiwLoCrPQvi2DqmI9uyxSAYSgmKam0xdSVcpQd1UZmxzmiz
         X/cC/QJs5f0s0kMdvVGnCaPtX6EV3ZwSG1tQc0EFbDotEM+cTOwqG7NJMMpJdtOpKe3b
         2ys3LosuaSghvDwVNcEjgIji2OYh5BQoH5a7vdhbFvLo5QyjLl95RmX0bJXYN/06EFNx
         R9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541052; x=1790145852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrSUwqa7xtL2ZBs1WlB04Z11tmz781BnHoaaNOznkvI=;
        b=yAPs31Cj38MqTmPav4mTPr4z2Fj67zRUr1X909owf8+ATW7VkwlBgEqRCk8yximdhD
         jGK794KARsqihJ53HijyZrRcCRUWQ46iUwaGiWaQy/ep6MId0KLBxvNGyK/1iUyqW0cK
         WRmPQvhW27N9lW6DGcyMGhLBP0Mpulz4U2fabxpHTcGd2MQhs51IFjhfsCpukdsms660
         dpbc7c9U6oJZ9SqgTTVX79aQGh0JRInhF5f8mD27WjSApSxbcewIKHQIEVH3hcdNbGz4
         ji7iZYMox5RiG5nT7iG4A59EhlsHgINpSOzmUDS7QFRFA7I9GrIU8rMN+LuDTUBv8+YD
         +S1w==
X-Forwarded-Encrypted: i=1; AKwUvBz3xOi3g4XAaiR7UdZLAQLPA+gt8Gzq+L3egAvPQfix4MRV2pwjB2G7vFLoZp3HlA3E3WqS0uTP3mhycjY=@vger.kernel.org
X-Gm-Message-State: AFuF++nhNuD/6uTQRC1zOMA9HUjB6uztDDFErkZZ7P9+qPGeuknkzNbP
	V/6aAmIaL5Zwo2fEXfb+SEAjJp/KdxmdkhXq02shEobUNrAatfUVQheGpcezzeLqgm0=
X-Gm-Gg: AYBFou36CjisdWjEQuzFED+NHgJ9L2pNme0jRQ2wLihGH8DpFg4+rqjR9qd6N5TMAL+
	uWdioefIa2oPBElGQT/KiAInbXGMXI1d45bbGyy+jIidJblzc9hnTVn1goctTDLB6Gqnk4mC/Jn
	ny/XMKqPOKZveg2hRxBjZPmvLAx1vdwWT1vb9vC6Mc1oPwgqv06YFFWV+ESlC1bZdKglnpaJ4Sr
	yEb6HM5l8TH+aMqNXI+SS5US/S/XbUCu0pj596eC+285r5JJYj9oy/gYQ97Z1IFm83lydSyLITK
	ulkSXr/gHZOcWutxrU1mEwHFif0xoXAl8QVK6NCcPmJ/PIqM6Dkup3ipicjTq4840siKcIh6odS
	ku6u3zxk1bYJ1fV2l8xoki5z3rCaXDIhSyDiT7LNuiatZIkbp6yqK15H07cvuAkn4nU0rJir/0V
	/F73WszEQ3syohYdcUMtOJapygdAYwRdopYXquhBw77UmyzqpNytDLaQk6MG1wFYi1mZ3i4XFf/
	61HgbzztgwzkmPxUNM=
X-Received: by 2002:a17:903:1251:b0:2d8:d4d0:792c with SMTP id d9443c01a7336-2dd8e752f13mr29866745ad.16.1789541050075;
        Tue, 15 Sep 2026 23:44:10 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f0592asm6074755ad.62.2026.09.15.23.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:44:09 -0700 (PDT)
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
Subject: [PATCH v4 04/11] mm/sparse-vmemmap: prepare DAX vmemmap population for compound page orders
Date: Wed, 16 Sep 2026 14:43:34 +0800
Message-ID: <20260916064341.1825793-5-songmuchun@bytedance.com>
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

Device DAX still uses vmemmap_populate_compound_pages() to populate its
compound-page vmemmap mappings. That helper allocates the head and first
tail vmemmap pages explicitly, then reuses the first tail page for the
remaining tail page mappings.

Device DAX is being moved to the section-based vmemmap optimization
infrastructure, but it cannot switch to the generic section-based
population path yet. Once a later patch records the DAX compound page
order in section metadata, DAX head and first-tail PFNs can look
optimizable to the generic helpers as well.

Add a DAX-specific population flag for this transition. It keeps DAX
head/first-tail allocations on the normal vmemmap allocation path, while
preserving the existing page reference for reused DAX tail mappings.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Update the subject and commit message to use compound page order
  terminology

v2:
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 861e09b2b096..aa89c16f7fc7 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -35,8 +35,8 @@
 /*
  * Flags for vmemmap_populate_range and friends.
  */
-/* Get a ref on the head page struct page, for ZONE_DEVICE compound pages */
-#define VMEMMAP_POPULATE_PAGEREF	0x0001
+/* Vmemmap population for ZONE_DEVICE compound pages */
+#define VMEMMAP_POPULATE_DAX		0x0001
 
 #include "internal.h"
 #include "mm_init.h"
@@ -208,13 +208,17 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 }
 
 static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
-					 struct vmem_altmap *altmap)
+		struct vmem_altmap *altmap, unsigned long flags)
 {
 	struct zone *zone;
 	struct page *page;
 	const unsigned int order = pfn_to_section_compound_order(pfn);
 
-	if (!vmemmap_optimizable_pfn(pfn))
+	/*
+	 * Device DAX still relies on vmemmap_populate_compound_pages() for
+	 * head/first-tail allocation and tail-page reuse.
+	 */
+	if (!vmemmap_optimizable_pfn(pfn) || flags & VMEMMAP_POPULATE_DAX)
 		return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
 
 	zone = pfn_to_zone(pfn, node);
@@ -236,7 +240,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 		pte_t entry;
 
 		if (ptpfn == (unsigned long)-1) {
-			void *p = vmemmap_alloc_pte(pfn, node, altmap);
+			void *p = vmemmap_alloc_pte(pfn, node, altmap, flags);
 
 			if (!p)
 				return NULL;
@@ -251,7 +255,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 			 * and through vmemmap_populate_compound_pages() when
 			 * slab is available.
 			 */
-			if (flags & VMEMMAP_POPULATE_PAGEREF)
+			if (flags & VMEMMAP_POPULATE_DAX)
 				get_page(pfn_to_page(ptpfn));
 		}
 		entry = pfn_pte(ptpfn, PAGE_KERNEL);
@@ -511,6 +515,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 	unsigned long size, addr;
 	pte_t *pte;
 	int rc;
+	unsigned long flags = VMEMMAP_POPULATE_DAX;
 
 	if (reuse_compound_section(start_pfn, pgmap)) {
 		pte = compound_section_tail_page(start);
@@ -522,8 +527,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		 * with just tail struct pages.
 		 */
 		return vmemmap_populate_range(start, end, node, NULL,
-					      pte_pfn(ptep_get(pte)),
-					      VMEMMAP_POPULATE_PAGEREF);
+					      pte_pfn(ptep_get(pte)), flags);
 	}
 
 	size = min(end - start, pgmap_vmemmap_nr(pgmap) * sizeof(struct page));
@@ -531,13 +535,13 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		unsigned long next, last = addr + size;
 
 		/* Populate the head page vmemmap page */
-		pte = vmemmap_populate_address(addr, node, NULL, -1, 0);
+		pte = vmemmap_populate_address(addr, node, NULL, -1, flags);
 		if (!pte)
 			return -ENOMEM;
 
 		/* Populate the tail pages vmemmap page */
 		next = addr + PAGE_SIZE;
-		pte = vmemmap_populate_address(next, node, NULL, -1, 0);
+		pte = vmemmap_populate_address(next, node, NULL, -1, flags);
 		if (!pte)
 			return -ENOMEM;
 
@@ -547,8 +551,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		 */
 		next += PAGE_SIZE;
 		rc = vmemmap_populate_range(next, last, node, NULL,
-					    pte_pfn(ptep_get(pte)),
-					    VMEMMAP_POPULATE_PAGEREF);
+					    pte_pfn(ptep_get(pte)), flags);
 		if (rc)
 			return -ENOMEM;
 	}
-- 
2.54.0

