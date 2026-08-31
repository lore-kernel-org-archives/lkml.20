Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5C327E1DC
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162888; cv=none; b=DKa9Xj32QMIz+qoS61Ctpa1fE4xekWkYWmw1WJNGslfaBs08Q6WcoQOT31RSQjDgP8iPp+sTEQGHClTV3xn335wZGEB6CaDVT1hJdLOla1672aoCUICLSP7kb2/Ly01OxAy4X+p40eTBKUNZVL6ZYrj4smhqJctPytdo6SmEuIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162888; c=relaxed/simple;
	bh=mY7MmVnPZ0lPBAqPB17Huo/jDkdlxRi5TewX6ZYgDYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onZKsZQaNkpYfyMwy9+gKGZiZAGL8HCjvmrSx2l+BVDR+wMQe1/yYsaIgqgYg9hsewfC4TpfkigobOCvlQmar0tZaVeWpH1hxUb2UO1ZvR1ZL++uIhg3fWQud6sJqEplfXconl408BGgT0z33cNttigGyOU/42b+YSqfAC+86GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AmL9Fh3H; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AmL9Fh3H"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84eb992a881so2783749b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788162886; x=1788767686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVp9a6es5dGYiwq82JtXpVvKTCPlSq+5R8j2MYX8xm8=;
        b=AmL9Fh3H98UklS9mymoy6+g8qXT9925TQgnkQs4OL2up4icZto/erQGtDQZkiRFt0h
         HK9pXgFiH3xZMmQIA8ieMcGITKuuiPEisIfNgANVmXvOa4FQOb+I27bXHPEV4TfFHXIk
         27U4wByn8zux5v5kABMERyIOIyzyk3GrBpBf7Qcw5EzGaUUd2DGbfR30uEqpBoNd7nyR
         kHulIgii41k64Qg/0P4mNJ+gEAnCTN9AqdBRsuFfb90Jj24aehZx5EElU6AK/tPNWBJb
         BRhPRzHc735yPaXC0BcDc+KXl3iAScoJNJdb3ON33D4vWkxcDwh4MMCYgKUcU9pD2f1e
         2sTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162886; x=1788767686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVp9a6es5dGYiwq82JtXpVvKTCPlSq+5R8j2MYX8xm8=;
        b=RptQmCDotPLtWfLCCIb7CqzOztvnC0kHIWTAd3vrA1Dkvn91EaartdJ6R8AA4m39pP
         cDHI1kHcpHq3w9Zo0WSmxXeHG/dYROkNx0TVQbMbF4r1NwMM5KJxYOldtI+qZMsNujo6
         YlAX4w5CHtX+2Jxp+hB84hi/P3bcGZ2pJ3g2Kmx9qi6vtwYbYWo6ce4TPD1N3e6VSjcz
         J7e4H7slnqFxbpWvlqOdaC5ChRx0Lm4pqYDbjvM5BuchBz8y0FZnrpoA/MuKfjmLT+zn
         kZ4wsLEJG8pgkcM2HOjqWkiw9A7NToB96DmbPTV+GjH37X77aeRjmqSxF5KaD6xF20FN
         Z5jg==
X-Forwarded-Encrypted: i=1; AHgh+RppCArlUNzooB712vzPoKK5ZPeBaTPYbDqrWe9vvqqGvCrxhTwDrSbe2wxxOnTYEH0lN82bMkkMgWvuDx0=@vger.kernel.org
X-Gm-Message-State: AFuF++lCgj78cBPW0mP6EukwuW5ThpubU50JqZo6l36EdEWA0uOnnIvO
	DGA7HKsoo7wNDx0qrG7WpMK8khZRmIeyz9OcdeWdNT0aasNVA4yqb//p9s7b1HVbPlE=
X-Gm-Gg: AR+sD11x6i0c8m54ETl4OAS3ALubCu/Mf4MmOGHd5AM2A5cQVHZ//JmgtD0twZ+xR28
	uDw9ZYMgQbNu/wmsJ7EQe/PSxaUPChjnRlz5fb5xOcFHE3k/voeC/vOa1L/ek5GIcdf1VhtVRqv
	gR19jO44lQTccg4OwhZON0Df7VykepjUNz3AeT9L4wN6OwifOal2EcFMjObimAEbbpKU6Zw/4by
	k5o719YwhlncatQKLKcOYWik2WolyuFV3fkVqYIRNGApqIda1DR3GCryFjwVhGvhUfJjbZxFDeU
	mzaGajaBiuFo1MoKH3l7PSdHrOqn4cS8UgXGCuCzc/na/wBORUboEU60E/d1bz9pgIPK09npyss
	QmWwaDyIdv+AVpP5sZK0+RIvtiTLU+8hZ3JzIfd0yzUKwPAW5dPuxsaww+IDvoX66ljjG2/k63R
	k2idyRNUb95by7p1XdiawEIXv6HjrIcgSRj6FvrckkDETWOTBAG+G0OedbzwFBjejqdlujiENTy
	e7vlXR9F3T4t6QmOxWAD3hF
X-Received: by 2002:a05:6a00:1706:b0:851:c1d2:c48d with SMTP id d2e1a72fcca58-8562a1f8fd6mr37313481b3a.8.1788162886422;
        Mon, 31 Aug 2026 00:54:46 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f88csm3590256a12.10.2026.08.31.00.54.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 00:54:46 -0700 (PDT)
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
Subject: [PATCH 04/11] mm/sparse-vmemmap: prepare DAX vmemmap population for section orders
Date: Mon, 31 Aug 2026 15:53:35 +0800
Message-ID: <20260831075342.57563-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831075342.57563-1-songmuchun@bytedance.com>
References: <20260831075342.57563-1-songmuchun@bytedance.com>
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
population path yet. Once a later patch records the DAX compound-page
geometry in the section order, DAX head and first-tail PFNs can look
optimizable to the generic helpers as well.

Add a DAX-specific population flag for this transition. It keeps DAX
head/first-tail allocations on the normal vmemmap allocation path, while
preserving the existing page reference for reused DAX tail mappings.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/sparse-vmemmap.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index e453ce4675a0..54ae8c284324 100644
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
 	const unsigned int order = pfn_to_section_order(pfn);
 
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

