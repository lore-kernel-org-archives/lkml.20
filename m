Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD493C9456
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022039; cv=none; b=IqWjlVR9uAurlGguZL5mBalf8nhI2w51AzHXsw+Bi2pJwYU1tpX2l2IX1MqtQL6dgWEzR5PnlZoCRqrxUuYll73ivfxU+2dGhJJ3osDjFGgL+zzPnV3yT9CElbcqOaxhIEqk7IWuZ2oyaH+Op5PiaMjFKIPUg9H89oMTVa5dOtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022039; c=relaxed/simple;
	bh=2Mk0vaX73XX03B9QYgUcsK912ze5m7mL2XVK9F8MRGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TlSPbC80hB9s99CvrJQSuzDF6Han3jG7odZRG2luz5tuDDyXLcABk2jSzS0bo0qBu2y8nEbcTHxF2AsQTjTj67s10r64Ti6y9F53RKTSwu5+zY2PcdOjeVlg4NoucsI3ETzm9jNqZFE6UD2042L7FyC7Di5Isvpvj9nRbTK3Wvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=LRmJ8lXm; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="LRmJ8lXm"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3964e480f76so7891422a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022029; x=1789626829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hiIQxlaJeEFoBo/L9xN4cjkO8AZZ+a3pO3zM7+AvDT4=;
        b=LRmJ8lXmiyeGM/JJT7vmq9Bs91+BuExyTii2z2UVBwIykm0VRiGEXBM2RoEU7Rwjgy
         0Mm7f7TT/qpBWFuXxl2erF4u0t1fOV99Bc8KrogNZiDfjXm/f5VfsjneH413671xUp2z
         0tixA+eHQnWbIrFnSUi8NkMnilaNNvTxctAF5iFJoI4UJq+RWMUihFj5gj2e+nq1uWrG
         u/P3cCJaEz6SGPAvjwHKMq8ZOqjKiSaGL/5pF1MoLXxVc4VRPn51zDjna0M7tXFEFJoz
         0WlCbTHRgpWtcN1taEKwEDo0rk3OlsWe4rNj9m+F3bva4CwyNNSfsXKGOETZwPvvKQ6v
         nn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022029; x=1789626829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hiIQxlaJeEFoBo/L9xN4cjkO8AZZ+a3pO3zM7+AvDT4=;
        b=KEUxBECbSLv9Ada0CYRi+Q1IpkVcEEpoVA4buvokrRXiowLii7CuHVFqEhAQC8CRMi
         9/r+DJFWIkENi5RyDyXxx5+70qXEhtz0lXGe5G/LiwoER3tku1Qd2+mYJS+vEOUwYoaL
         qBRIGVA4gGbVEzKccgvo7ANP2yZNSJsWi+699JD1b/oh+QG2zX8RyHQcweBBRia0DBWk
         G5Wev0ajAqKpBt6kl+35IZUKjIVYQlEVbvIbRPKl8RBS2mBKwmhue/dbRcSMhe++SrV8
         GsawMJA/jXXT/OsGm0Jy1XxMrTOuLO2Hs6cXNLLiV6X2QVd4LLjIMkSsuZIGF+RIZsEQ
         sx9w==
X-Forwarded-Encrypted: i=1; AKwUvBy7K6uqFXNRInyR3PNwbXzTOEbARD6Kqrx8/6ExM1TQmuliqCh4Sa1wisCP2EoD7iMmA3d1OEkNey8WFKg=@vger.kernel.org
X-Gm-Message-State: AFuF++lK74XF/ma8WSM7S5+dWAlsf5MLTYeDzdegkkl6Ziaynkn018Mf
	TFeT3/xR0bo+uaO9MZWC+z+IBZUayTvxkC4dMFeTR2xkfPZUFTMYKklqPCV3j6euru4=
X-Gm-Gg: AYBFou0nJuU2c1H6NjoQjtv06Ek+kCURIcfwRyQC8BQzbvRul0ILeurpMGF8Ix1Ahm5
	bFzXkwkXgTnhrcKDSfIp8myXEu6QdxUEnOZCBNtVcCKVob7AaDp0QPEY6DHxu0nqJXkTvAEKpu6
	QgdYu2pgXiXEiX5yJm5pwtqgAh00HRYcLnyCvQIoYsCJPQ6r91lNIcB6sakOZUsHsaq435iCj4Z
	zwQMnSzjRD+Ws06y6XQjEp6tuh3AWZh+sSglE6vXrC20ecbNTKFWbl3PA2tEZ8tCNr0nbmfUSIW
	ee+raaUQHWIJ1tlESaUAzD21ivi6NmZ93Tlzo1Vk0p9H7I12bfjYCaRP4Ytc1q0sOnalTk9dLh+
	eGVHZ8avCPv3oW0m/fuPoIWyWgYZZqaf4zXDyW2wl/huixscJDtTXV8kqojYVXInaN1OQFNH4e1
	B9wMTmXcjnZw2rF758oFdNIRBw8Db/386rux0ySAGI6D+UMh4x42Igvlbg0MKvCiAfZhp4insLW
	ZmVyFzQMLcXFFeN9ogRhxELZFYUSztL4NNiDOu3evwpyg==
X-Received: by 2002:a17:90a:c106:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39b2624cf3fmr61513978a91.21.1789022028572;
        Wed, 09 Sep 2026 23:33:48 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.33.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:33:48 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	David Laight <david.laight.linux@gmail.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>
Subject: [PATCH v6 07/17] mm/sparse-vmemmap: move helpers ahead of future callers
Date: Thu, 10 Sep 2026 14:32:46 +0800
Message-ID: <20260910063256.64386-8-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260910063256.64386-1-songmuchun@bytedance.com>
References: <20260910063256.64386-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for section-based vmemmap optimization by moving helpers that
follow-up changes will use. vmemmap_get_tail() will be called from the PTE
population path. section_nr_vmemmap_pages() will be made visible outside
the memory hotplug code and called from sparse_init_nid().

Move vmemmap_alloc_block_zero() together with vmemmap_get_tail(), since
the tail helper depends on it. Move section_nr_vmemmap_pages() earlier
into its own CONFIG_MEMORY_HOTPLUG block. That lets the later patch change
its visibility and callers without also moving the function body.

No functional change is intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v6:
- Keep the moved accounting helper on compound page order naming
  (suggested by David Hildenbrand)
- Collect Acked-by from Qi Zheng

v5:
- Move section_nr_vmemmap_pages() earlier under its own CONFIG_MEMORY_HOTPLUG
  block to avoid code movement in the later visibility change
- Reword the subject and commit message for the helper movement
- Collect Acked-by from Mike Rapoport

v2:
- Add this new patch to move vmemmap_get_tail() before PTE
  population (suggested by Mike Rapoport)
---
 mm/sparse-vmemmap.c | 134 +++++++++++++++++++++++---------------------
 1 file changed, 69 insertions(+), 65 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index dea7179fbc90..e2a2a5eab4dc 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -148,6 +148,75 @@ void __meminit vmemmap_verify(pte_t *pte, int node,
 			start, end - 1);
 }
 
+#ifdef CONFIG_MEMORY_HOTPLUG
+static int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
+		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
+{
+	const struct mem_section *ms = __pfn_to_section(pfn);
+	const int order = pgmap ? pgmap->vmemmap_shift : section_compound_order(ms);
+	const int vmemmap_pages = pgmap ? VMEMMAP_RESERVE_NR : VMEMMAP_OPTIMIZATION_PAGES;
+	const unsigned long pages_per_compound = 1UL << order;
+
+	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SUBSECTION));
+	VM_WARN_ON_ONCE(nr_pages > PAGES_PER_SECTION);
+
+	if (!vmemmap_can_optimize(altmap, pgmap) && !section_vmemmap_optimizable(ms))
+		return DIV_ROUND_UP(nr_pages * sizeof(struct page), PAGE_SIZE);
+
+	if (order < PFN_SECTION_SHIFT) {
+		VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, pages_per_compound));
+		return vmemmap_pages * nr_pages / pages_per_compound;
+	}
+
+	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION));
+
+	if (IS_ALIGNED(pfn, pages_per_compound))
+		return vmemmap_pages;
+
+	return 0;
+}
+#endif
+
+static void * __meminit vmemmap_alloc_block_zero(unsigned long size, int node)
+{
+	void *p = vmemmap_alloc_block(size, node);
+
+	if (!p)
+		return NULL;
+	memset(p, 0, size);
+
+	return p;
+}
+
+#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+static __meminit struct page *vmemmap_get_tail(unsigned int order, struct zone *zone)
+{
+	struct page *p, *tail;
+	unsigned int idx;
+	int node = zone_to_nid(zone);
+
+	if (WARN_ON_ONCE(order < VMEMMAP_OPTIMIZATION_MIN_ORDER))
+		return NULL;
+	if (WARN_ON_ONCE(order > MAX_FOLIO_ORDER))
+		return NULL;
+
+	idx = order - VMEMMAP_OPTIMIZATION_MIN_ORDER;
+	tail = zone->vmemmap_tails[idx];
+	if (tail)
+		return tail;
+	p = vmemmap_alloc_block_zero(PAGE_SIZE, node);
+	if (!p)
+		return NULL;
+	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++)
+		init_compound_tail(p + i, NULL, order, zone);
+
+	tail = virt_to_page(p);
+	zone->vmemmap_tails[idx] = tail;
+
+	return tail;
+}
+#endif
+
 static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
 				       struct vmem_altmap *altmap,
 				       unsigned long ptpfn, unsigned long flags)
@@ -181,17 +250,6 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 	return pte;
 }
 
-static void * __meminit vmemmap_alloc_block_zero(unsigned long size, int node)
-{
-	void *p = vmemmap_alloc_block(size, node);
-
-	if (!p)
-		return NULL;
-	memset(p, 0, size);
-
-	return p;
-}
-
 static pmd_t * __meminit vmemmap_pmd_populate(pud_t *pud, unsigned long addr, int node)
 {
 	pmd_t *pmd = pmd_offset(pud, addr);
@@ -323,33 +381,6 @@ void vmemmap_wrprotect_hvo(unsigned long addr, unsigned long end,
 }
 
 #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
-static __meminit struct page *vmemmap_get_tail(unsigned int order, struct zone *zone)
-{
-	struct page *p, *tail;
-	unsigned int idx;
-	int node = zone_to_nid(zone);
-
-	if (WARN_ON_ONCE(order < VMEMMAP_OPTIMIZATION_MIN_ORDER))
-		return NULL;
-	if (WARN_ON_ONCE(order > MAX_FOLIO_ORDER))
-		return NULL;
-
-	idx = order - VMEMMAP_OPTIMIZATION_MIN_ORDER;
-	tail = zone->vmemmap_tails[idx];
-	if (tail)
-		return tail;
-	p = vmemmap_alloc_block_zero(PAGE_SIZE, node);
-	if (!p)
-		return NULL;
-	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++)
-		init_compound_tail(p + i, NULL, order, zone);
-
-	tail = virt_to_page(p);
-	zone->vmemmap_tails[idx] = tail;
-
-	return tail;
-}
-
 int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
 				       unsigned int order, struct zone *zone,
 				       unsigned long headsize)
@@ -646,33 +677,6 @@ void offline_mem_sections(unsigned long start_pfn, unsigned long end_pfn)
 	}
 }
 
-static int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
-		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
-{
-	const struct mem_section *ms = __pfn_to_section(pfn);
-	const int order = pgmap ? pgmap->vmemmap_shift : section_compound_order(ms);
-	const int vmemmap_pages = pgmap ? VMEMMAP_RESERVE_NR : VMEMMAP_OPTIMIZATION_PAGES;
-	const unsigned long pages_per_compound = 1UL << order;
-
-	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SUBSECTION));
-	VM_WARN_ON_ONCE(nr_pages > PAGES_PER_SECTION);
-
-	if (!vmemmap_can_optimize(altmap, pgmap) && !section_vmemmap_optimizable(ms))
-		return DIV_ROUND_UP(nr_pages * sizeof(struct page), PAGE_SIZE);
-
-	if (order < PFN_SECTION_SHIFT) {
-		VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, pages_per_compound));
-		return vmemmap_pages * nr_pages / pages_per_compound;
-	}
-
-	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION));
-
-	if (IS_ALIGNED(pfn, pages_per_compound))
-		return vmemmap_pages;
-
-	return 0;
-}
-
 static struct page * __meminit populate_section_memmap(unsigned long pfn,
 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
 		struct dev_pagemap *pgmap)
-- 
2.54.0

