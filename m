Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2F930C171
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836664; cv=none; b=Y/rIqau5hauIUCNZ7TuY8+qp55eeQu017GerTMqTbMpgd/nacCDoOh/cHAjJmkw4slctQ9Fc7UxzeOoCaNVkgX7y9T7WTiArN8cV1A77dTMYz+yRoaRQMbG6pa19zi4ssDb8sQSVH3ugDfKnKdwR23D4ZYOQ/c4cFg0cwNQrxJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836664; c=relaxed/simple;
	bh=B2ejOMr2ZHP5Xylq8iU8Nr9jZObNOXowzyIFQOvCedM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8kyA+EInVKxyVyGotNaj7ftFgj85fjvWCUzUWFOoBBU3RoZ1Ov/RueEoQdTEubfSwdQv1CGe+8ayKJPPI4x4OItpDctSkTI5RisKawKh/I12sJcO2F/Y6GJFPrmefzHnwPQui1W+7PRapuA53uUaDbl+ReVrYuujsTQTTRhozg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SAUE0jeM; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SAUE0jeM"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-848643382fcso4199154b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788836662; x=1789441462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nco6X6VSmg3b4sCsw2GCdeq7qTzf+r3pWDgUiD6K2qM=;
        b=SAUE0jeMhBegQIV/hr1vx+uWXUsE2gT+IAOzYZCAraKBIweUy3MsU8U3nQfQGewLPA
         Eovsm5KAjB+eM1OzSACAjxfjwOJfMUNSRVP9b4Ap0nMBTCHxJONphiKJ1PdVDMicknLM
         0RUO8rUdCp1mnqu8XV6Nvjb25wElJxHq/PV4Id7iOlpx8g6bvGf2Lj/QboeBKbafF/rl
         zJjLxiJ+r0L8x5uGtxLNK/CR5n1mb1s6EzGkzmBpdU/VIU7LONrr9fj9cwmVCipN8wu2
         RoOZXdWiOgO1sXOS8kDKkZ/r94cAWj+RVsaBkU3MKP8FSSdMkCIliRZY4yh6sZeeokvF
         FVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788836662; x=1789441462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nco6X6VSmg3b4sCsw2GCdeq7qTzf+r3pWDgUiD6K2qM=;
        b=MStU61xyUcCoaN940rYPMeSJ2eKOL+ybdNYb3CXe9gJ2fX11G5jepmavTXkiFz/1Ry
         GGE+G+sLFoKUStMPo11VHwPTYhgsg6MvtVhZFxaUxumqtUPByQvFEJQQ+hNf0e31d2c2
         He132//V6Lg+h9JEWrAJRCBVasDAZPQO42CShFFUPVmqjqbpXV+XPcnfuUfGs5uhWVCh
         HqjJNnImHbjEh5zPzW3X/r5Kl5wP52h9wgxTJasFB+zDIDpVy3YySm6fkesCN/btCC/a
         b5kCmu3Hvpa2kZqTqqLNScX1H69HWVnKrOVbiWkgMudtOveMUveBRKFPcFK/2Wl4hTkH
         OnJw==
X-Forwarded-Encrypted: i=1; AKwUvBxcvSnJnXDa9Ny5Ug/lp7Np2kE2YzB/RYvscJEu2o8+U0IJe+9s5Fcwn7Zp2NTjnjt02pQIUXZvHsjMY3k=@vger.kernel.org
X-Gm-Message-State: AFuF++lUdsMmtCggPTPcIgFH9QPBj8iLuaz9jRN2jxl2JaIRHbxsA+9D
	/M3y9ducq8rFBzBEo5s3QtIKdHLUxLJ5GSPEmP0gRLZq9qgjCzjg4bnq0bK8eDY8MEU=
X-Gm-Gg: AYBFou0LJNlFEHyvtvKZ2P7KxfzMCxqqNn16FLUpfvMLJVEOT8W4G3RYNrsDRJW6hWL
	FVH35lExrSqFImSuCRrE0uROosr7t1Y2cZRCAvJ+b3/mkv/2wJnGozBizN7LBP8rW/UOkEgzhdi
	dsOMCRadwK89Vi5OIAg7K8+zDS6jV3hEU1vcYD0VJSxG0SFCjq7Yn64gSnCTB3pah3M5SFUE5rp
	Mw9FcuGtQkqzfvjAkjAq2BHH9LlDJhlgxxs/DA107/VjeXk8W2vXxTCk2AZ7kG3JT9Qv4Gc3faF
	ebqWxl+g3SY3HwbNHw02FjGvHpTBHdN3yXebh7Wu2ObWUQ/PXOZ3tMFbsEfhezapz2GsAFLJysx
	g+LYYF4WufzZOJqNiYDkO0991GjSvmFaCYcdJAC7IksbqGNjPwvpCmvI6mjW1rbAMtzFaVlljMW
	cssFlYkA35mY4+cbdxDKPLnrNPQAu4Pd1HZl5KQqHJe9IkFIuykdtj/d0yfAUIUsBR2RGjmljL0
	7MSfB5o1EHXfLP5javo6WyrAg==
X-Received: by 2002:a05:6a00:4ac6:b0:847:7ffd:ce35 with SMTP id d2e1a72fcca58-86168992df1mr41275963b3a.8.1788836661718;
        Mon, 07 Sep 2026 20:04:21 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152a358a2sm4868234b3a.29.2026.09.07.20.04.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 20:04:21 -0700 (PDT)
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
Subject: [PATCH v2 05/11] mm/sparse-vmemmap: set section order for device DAX
Date: Tue,  8 Sep 2026 11:03:29 +0800
Message-ID: <20260908030335.96549-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908030335.96549-1-songmuchun@bytedance.com>
References: <20260908030335.96549-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device DAX can use vmemmap optimization only when a full section is
populated with a compound-page geometry. Record that geometry in the
section order before populating the section, so later vmemmap accounting
and population decisions can use the section state directly.

Clear the section order when the section becomes empty again. Also reject
partial additions to a section that already has optimized vmemmap mappings.
compound_nr_pages() determines how many struct pages to initialize with a
section as the smallest granularity. A section therefore cannot safely mix
optimized and ordinary vmemmap layouts.

Partial additions continue to use ordinary vmemmap population, so they do
not save vmemmap memory. Such additions are uncommon, and the lost saving
is negligible.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Explain why optimized and ordinary layouts cannot share a section
  (suggested by Qi Zheng)
- Collect Acked-by from Qi Zheng
---
 mm/mm_init.c        | 15 +++++----------
 mm/sparse-vmemmap.c | 16 ++++++++++++----
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 9e8ffd01b4f7..7a2e58d631c2 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1049,16 +1049,11 @@ static void zone_device_page_init_from_template(struct page *page,
  * of an altmap. See vmemmap_populate_compound_pages().
  */
 static inline unsigned long compound_nr_pages(unsigned long pfn,
-					      struct vmem_altmap *altmap,
 					      struct dev_pagemap *pgmap)
 {
-	/*
-	 * If DAX memory is hot-plugged into an unoccupied subsection
-	 * of an early section, the unoptimized boot memmap is reused.
-	 * See section_activate().
-	 */
-	if (early_section(__pfn_to_section(pfn)) ||
-	    !vmemmap_can_optimize(altmap, pgmap))
+	const struct mem_section *ms = __pfn_to_section(pfn);
+
+	if (!section_vmemmap_optimizable(ms))
 		return pgmap_vmemmap_nr(pgmap);
 
 	return VMEMMAP_RESERVE_NR * (PAGE_SIZE / sizeof(struct page));
@@ -1144,7 +1139,7 @@ void __ref memmap_init_zone_device(struct zone *zone,
 	memcpy(&template, page, sizeof(*page));
 	if (pfns_per_compound != 1)
 		memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
-				     compound_nr_pages(pfn, altmap, pgmap));
+				     compound_nr_pages(pfn, pgmap));
 	pfn += pfns_per_compound;
 
 	/* Initialize the remaining head pages from template. */
@@ -1160,7 +1155,7 @@ void __ref memmap_init_zone_device(struct zone *zone,
 			continue;
 
 		memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
-				     compound_nr_pages(pfn, altmap, pgmap));
+				     compound_nr_pages(pfn, pgmap));
 	}
 
 	pageblock_migratetype_init_range(start_pfn, nr_pages, MIGRATE_MOVABLE,
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 54ae8c284324..aed1e7429daa 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -135,14 +135,14 @@ int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages
 		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
 {
 	const struct mem_section *ms = __pfn_to_section(pfn);
-	const int order = pgmap ? pgmap->vmemmap_shift : section_order(ms);
+	const int order = section_order(ms);
 	const int vmemmap_pages = pgmap ? VMEMMAP_RESERVE_NR : VMEMMAP_OPTIMIZATION_PAGES;
 	const unsigned long pages_per_compound = 1UL << order;
 
 	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SUBSECTION));
 	VM_WARN_ON_ONCE(nr_pages > PAGES_PER_SECTION);
 
-	if (!vmemmap_can_optimize(altmap, pgmap) && !section_vmemmap_optimizable(ms))
+	if (!section_vmemmap_optimizable(ms))
 		return DIV_ROUND_UP(nr_pages * sizeof(struct page), PAGE_SIZE);
 
 	if (order < PFN_SECTION_SHIFT) {
@@ -573,7 +573,7 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
 		return NULL;
 
-	if (vmemmap_can_optimize(altmap, pgmap))
+	if (pgmap && section_vmemmap_optimizable(__pfn_to_section(pfn)))
 		r = vmemmap_populate_compound_pages(pfn, start, end, nid, pgmap);
 	else
 		r = vmemmap_populate(start, end, nid, altmap);
@@ -792,8 +792,10 @@ static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
 	else if (memmap)
 		free_map_bootmem(memmap);
 
-	if (empty)
+	if (empty) {
 		ms->section_mem_map = (unsigned long)NULL;
+		section_set_order(ms, 0);
+	}
 }
 
 static struct page * __meminit section_activate(int nid, unsigned long pfn,
@@ -803,8 +805,13 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
 	struct mem_section *ms = __pfn_to_section(pfn);
 	struct mem_section_usage *usage = NULL;
 	struct page *memmap;
+	unsigned int order;
 	int rc;
 
+	order = vmemmap_can_optimize(altmap, pgmap) ? pgmap->vmemmap_shift : 0;
+	if (nr_pages < PAGES_PER_SECTION && section_order(ms))
+		return ERR_PTR(-ENOTSUPP);
+
 	if (!ms->usage) {
 		usage = kzalloc(mem_section_usage_size(), GFP_KERNEL);
 		if (!usage)
@@ -830,6 +837,7 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
 	if (nr_pages < PAGES_PER_SECTION && early_section(ms))
 		return pfn_to_page(pfn);
 
+	section_set_order_range(pfn, nr_pages, order);
 	memmap = populate_section_memmap(pfn, nr_pages, nid, altmap, pgmap);
 	if (!memmap) {
 		section_deactivate(pfn, nr_pages, altmap, pgmap);
-- 
2.54.0

