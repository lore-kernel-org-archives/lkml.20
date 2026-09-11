Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9843A0E8E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103028; cv=none; b=vCVNoOkOjkVb0gAH4pY2NGkVXYV3rRfD6FNCSo5Hz6F7q4RkohY9L2qWNVC1Tw0mBR9AN2UioR6OMotJ4kzAGo3JcGnww04tdce82eRMVhJbgQWzKP0I0P3k0xpVqlbwoZYaUCzhgh0hGqt6Ba3G3+MPg8H1Di+MN9q1w9CtOeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103028; c=relaxed/simple;
	bh=4C/H0OXURhGuKf+braJ+uKcmMn4yaEgFfA4J4Js2eLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahJ7xLcHbcNScnwxafKT8MZzVkQ8GO+0txUbI7BKv5SZXE3T6OIBWW2PpgpSbkwLndK4IeDSg5BQfV+NysDDxA0AKYsv/5nzRe0kBackaIJ+Yei4nZ+GZDADR3CyCr5v2jjNUmia8NwItjj1HGcv/4bYzdqrqhgKxF9EN7ccI6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=EId8OT3s; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="EId8OT3s"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4ae61629fso407472a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789103026; x=1789707826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrSUwqa7xtL2ZBs1WlB04Z11tmz781BnHoaaNOznkvI=;
        b=EId8OT3ssGYVFUtSPjUI8PMyYQNJc793KFLxt4iaekVT4POWEWhqq4H/UM7GapqIAR
         ADTGlgJlDbChZb5eOAOS/DedQe/Xy4PJOLtT0A5TnzIHG3onKvtmv0glLdeTqiVqdFAG
         vWmv/0Ui3UCcVmp6nyqoFjqpHYBSpOJhzmwNKBBT9kQ0QckiVw135lxlIQuX3Db3ZWTu
         wAlKXU5IBrpMoKhn8PuS2tCPY7PvfyTTOke1N8803utTO6SPvimdzW8pfg7onWyLsOS7
         7w9wvXH7aAGNuCKrNrupEIoeUdgCC/v+7GXAPeCQ7YaG/KUrdCQGQLNqx2lCuR5BqUcm
         X4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103026; x=1789707826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrSUwqa7xtL2ZBs1WlB04Z11tmz781BnHoaaNOznkvI=;
        b=bI7FqpqAQfgRb90qxtoMnZgn6VDr67lKeIkBeLcoykbJMDsnLYvINOJiYU4v7+IbzB
         jXoacOxZy4YNg/h/wrAiZN0yrKevfmReE0y/LRwWGFXo0GuB372ZjkDTxs0qH+Ci4i73
         XpFH9VGZL+5VTDvhqnLQpsc6YShQdYebFSLCVHvrGlVeStjAx5xydntTLmszSirYT8Uq
         NqQujs8GFFoTt3cds6LtlBlyKbmOaVaoI9955hNJjaLtxwHvMBKA7IEJxjxRVSHJcDt/
         wW0eIYNTRb2L1XTo+onT2okf3nH9hDueiZvTTUcSmS0lDiwrTZjm+8AETyjU9oyVGHlP
         FUCA==
X-Forwarded-Encrypted: i=1; AKwUvBwi1i0EcgA3nbskWgL/nDo88zm8Y3VrbV1OUwHnqAWqJK0IrCnjfCPXZhEAHwtaOb9hQQSk4BBwRoGtMqs=@vger.kernel.org
X-Gm-Message-State: AFuF++lTGqFviFeUhIZ3tc5A9zke4ZmZSPbRtM7cG7mhM+gbSOvSP3Ir
	AKBbilSYjuvjZlYEebAgXIkImoNfQmrGnWKh+BivOu01n+6AtSdJRdXd7r41ILvwWEo=
X-Gm-Gg: AYBFou08o/6b2j5H8FZB/2LS2NdqjBgKEJJaiJZWZXDt6rn4JdB+x4I8/gpK8ccFMav
	aCHPIpia+iRqxpcOrS/8bNP6UlrLBlmBSOnIgAvOOAGIymZRBIZo28HyFpZaFSp00p5CHdkm/0M
	warRB9tLUCYd4hxoFQ0qearxLFdMPX8aprTVb6n9xXvl0b9BTSCQnopEuP13CWzvI5uUzCNROqb
	kqPtFpuZYHFhYhaNFciBzSFwJbkKCzsPqenX7JKE42e4FoV/oFgL2avkaJOKbX+MSRPu/nZ+J7m
	1Q6uOAgmMxv/jqVxPAPJYBIykxm7iRObMmi3LQII9AqtG8cfoRVZlXmQ91KinA6cWfgLLq4RSNL
	Q4uOe0NmyaZ5XyGHVp+AvwqjuWHlpL73HLiov1UvBQ9Bo3KdC5rLJtFX4nY3hQUzYqBx4udS2C4
	c2Px4SejyUuFD/R16jHE3WhxX/gqHs56JF6EQbW7lBXcBRV1vFM7p7nZsvvvxxxMl7xEkkHqXoP
	Oy1JzueyKfLBYLrtsYXSbnSufmZa9S/MhsP
X-Received: by 2002:a17:90b:390f:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39d9c0b7047mr3845524a91.12.1789103026376;
        Thu, 10 Sep 2026 22:03:46 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm2651561a91.14.2026.09.10.22.03.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 22:03:46 -0700 (PDT)
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
Subject: [PATCH v3 04/11] mm/sparse-vmemmap: prepare DAX vmemmap population for compound page orders
Date: Fri, 11 Sep 2026 13:02:21 +0800
Message-ID: <20260911050228.58884-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911050228.58884-1-songmuchun@bytedance.com>
References: <20260911050228.58884-1-songmuchun@bytedance.com>
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

