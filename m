Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034EA3101B2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103033; cv=none; b=c1PNrTGYcJEseqcKXGa3MpAWQFj809YgX97JN0INt2iZ9GgC1byyKg4U81bAT2q7mRQU2hiOkplNi9VsdXHUYtxlO4tTCD+sBYl3CRticrYNb+V2783hyk6VK/AaHhy92xudYB6EWkYpWGpeLqECmP1xRNpgKuo0pHVnFTdo4eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103033; c=relaxed/simple;
	bh=q4sE4pbRykd1vhFCtA51ekVFkV6gQ95xL4RRztXC6GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGjbzTyW9hYlQflAzewAf1dpuJCuGLL6alTgl0Gaz0DmTV47a9YiD7ZCWUqt9fcZX5bWzR1w6obHLtAPFY5S/fQfFDAtBJs/Xf2prW0++d1A/dMXvo4JQL/471N/AUvwkZoKiQBRLRjvC0YS6fIR6h0dT4DD+SNjVkzP44g+EL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=X7rk64k0; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="X7rk64k0"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4d03f95dfso3854a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789103031; x=1789707831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6sM9zpfll+quDztLFFF0jfXeRCau4il9IJzrgeT16pM=;
        b=X7rk64k0BrCqji/e9/gqOIT/4LWlUxZI/XtJvgPah5bqpAebchlL+ey4lztPs5r7RL
         HB2yp1afNCL69uocoQFLPPpGT8kU7oUuhoV5KbH5WTX6hyg17LNhw/VTf3HfBWtGNQ91
         6BrvQMRHrm6kSLPAmNIDpLVYq2o+m/q9lUixmH+aWJHxDJe/5I78kND/fM97LAwebpNx
         2V2xANSVN1pC6i54FItRGqjV9O/OiTiYlEkswNCqze3o9seWh3pPvaFyptZDfhZ2Nkow
         3dok0A5LSovEJuALUy0GMBsp2W0JexZAI1fmmQD649KkRa3SCjCfoADeYjJrV07MiaZI
         1nHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103031; x=1789707831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6sM9zpfll+quDztLFFF0jfXeRCau4il9IJzrgeT16pM=;
        b=BjPLhjSayPpPN9t0oFAzrVpbSDdJhFzkWB5os2XgJYOlBmEHte26mC4XDWih059ug/
         o5LjjyGwN+Lt5ZvJ6y43LQcc0MoeDywUuxDiheyJ78exIg6xnpIleNw+ZB0z1sCkpiwV
         fOGcbweN9CuWAzLZXj6wRwGpmRW4rjUxnkZlLQyjsNFcjlON0ydWvWxvD4Wq3FC6c6oy
         +kNIsE4MgT8hROt7UZnxh9JfZJhDGs4vK6Ia+uewVYJUToQHT947HeMpUomc1oFNuq0O
         EEVloryNVOVScgRnH6CJ5FfzA3pxeTMa1/Ej9CwLw40d1F0ngNY/vKKZCfzMajYFkMzw
         gU8Q==
X-Forwarded-Encrypted: i=1; AKwUvBy0uvSRMMyfbRQh6wM3LtpSqhSm7PU7Zo4V4WE2t7Eyjw4yMqKl/FiW3TM3LNONsoJfshyyg9a+heQWSJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mbEwILelHItia2DGB65ZwuO2kyu57JZmQXknMoqzOfnzJYVkv8
	4QpouNIGo/QfC6PtIdRn7PN21RI87qhgPLIYRxSrcICVICCja44jFaqrfLpDEoSauuCiCgmODom
	yVe2H
X-Gm-Gg: AYBFou0ay4eenuu3mwPPjhtrFw9GEa6lNzevW6F9oVV77M2bxQNajZopdwVGoy1W8hn
	YBjr2LCW5a86f/TRoK+/I/KHmAr50Ohueo1HknH3/zthZydBYbRsZPGozINBdE2eOn7c3YQN+tf
	XvYHkIe4zm5oCjlzehSjy120sFQOw6oUV9dbqzxAV+JNcbj3DwW81kCp7b8v2Lce3TSC3TqBR/H
	D8h0Vsx6e+soSMzRqR+hMalA103C+hhwL+g5mTu0K6S8+Zl8fZxHDDp2Dqqqn/WTR2gFa7qhDmn
	WA9kzrIrN5qqCWvT2KCmaRuQmzwOQXNlu6vbuj8NdckzrW6NhdUPZD+EetXMQ4yGyprTOcxzK1Y
	PgXuxA2EqbQFSo7b3fevAPXqmzYDCoO4DGb4hQQegSgLwKj5qSk8pIDNzqj7/Tr9t7dnTkU8MYt
	t0gPKpNR18iwZ/zADDbDQPWl1v5iRadlelzRZn+OzO8Y/lQ1qD35J4eq+UFiO7DNXwqT/vGvkIb
	xED2rX4gJGQfgtpLnDB/onDjn5Ixrta3WLd
X-Received: by 2002:a17:90b:2b43:b0:398:a2a3:b631 with SMTP id 98e67ed59e1d1-39d9c21f8c9mr4085781a91.19.1789103031225;
        Thu, 10 Sep 2026 22:03:51 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm2651561a91.14.2026.09.10.22.03.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 22:03:50 -0700 (PDT)
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
Subject: [PATCH v3 05/11] mm/sparse-vmemmap: set compound page order for device DAX
Date: Fri, 11 Sep 2026 13:02:22 +0800
Message-ID: <20260911050228.58884-6-songmuchun@bytedance.com>
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

Device DAX can use vmemmap optimization only when a full section is
populated with a compound-page geometry. Record that geometry as the
compound page order in section metadata before populating the section, so
later vmemmap accounting and population decisions can use the section state
directly.

Clear the compound page order when the section becomes empty again. Also
reject partial additions to a section that already has optimized vmemmap
mappings. compound_nr_pages() determines how many struct pages to
initialize with a section as the smallest granularity. A section therefore
cannot safely mix optimized and ordinary vmemmap layouts.

Partial additions continue to use ordinary vmemmap population, so they do
not save vmemmap memory. Such additions are uncommon, and the lost saving
is negligible.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Update the subject and commit message to use compound page order
  terminology
- Use EOPNOTSUPP instead of ENOTSUPP

v2:
- Explain why optimized and ordinary layouts cannot share a section
  (suggested by Qi Zheng)
- Collect Acked-by from Qi Zheng
---
 mm/mm_init.c        | 15 +++++----------
 mm/sparse-vmemmap.c | 16 ++++++++++++----
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 97e0158d2aca..efffa8609b85 100644
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
index aa89c16f7fc7..02da1321197d 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -135,14 +135,14 @@ int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages
 		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
 {
 	const struct mem_section *ms = __pfn_to_section(pfn);
-	const int order = pgmap ? pgmap->vmemmap_shift : section_compound_order(ms);
+	const int order = section_compound_order(ms);
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
+		section_set_compound_order(ms, 0);
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
+	if (nr_pages < PAGES_PER_SECTION && section_compound_order(ms))
+		return ERR_PTR(-EOPNOTSUPP);
+
 	if (!ms->usage) {
 		usage = kzalloc(mem_section_usage_size(), GFP_KERNEL);
 		if (!usage)
@@ -830,6 +837,7 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
 	if (nr_pages < PAGES_PER_SECTION && early_section(ms))
 		return pfn_to_page(pfn);
 
+	section_set_compound_order_range(pfn, nr_pages, order);
 	memmap = populate_section_memmap(pfn, nr_pages, nid, altmap, pgmap);
 	if (!memmap) {
 		section_deactivate(pfn, nr_pages, altmap, pgmap);
-- 
2.54.0

