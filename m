Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1313D413F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541057; cv=none; b=NnGyY7lPj2f0swIBSbY/s6XtUZIpHU3JiQMlPwb8n9SMvhsE4HF1SbQdiOoE1rUgUs92d5qa9M20ZqkTorKU9EK7TpREr9Ve2S1EjZPRSUrZRvsYmTfptfDSBAh77bTyhOnR/NDDcCcHV/CPeT4ARgOC9Tsn1H348fIQYT0iVv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541057; c=relaxed/simple;
	bh=q4sE4pbRykd1vhFCtA51ekVFkV6gQ95xL4RRztXC6GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ucGBy2mlY2nz2B8pdah8YaBoQ7A0J4eBbOioTxQ5BpiIDUpzntHdsL9tgHe5w+8pkqgdA84O6ZqKjku7ZXZ2XiYfK186SYtItPjFMfd91kqCyzv31mjPj8ZPm60fnXzQiF+KTvY0PoLaWLMYycesMtnbUujMAwQU0OMOw7dEWV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dhFRSzAh; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dhFRSzAh"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115c1so6145925ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789541055; x=1790145855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6sM9zpfll+quDztLFFF0jfXeRCau4il9IJzrgeT16pM=;
        b=dhFRSzAhBYhUpFbaQND345zR2MbdFHFLnZjvDC4/8NFXgiBSdit8QQ5ed9J41+mrWS
         xeUptWNmzW+2pdF9OH8Hu8YIooZqh6cSGoURI1aWSWHvhkaR7WajWJPt3+/k4pcKuRMr
         DoPujnc18aQ96e8ArTku22Hsb6afURyuM9Y6H8HYxYvTfiUEfPpuOPCydHJ/NySopAX9
         eNi2akAJcqx5qC9kaY5oQtdK9P1FThXwpX7UhlEyj8qe2Gfc7atiY/Qk09J+lC/lP7IF
         JKRqb8IQdqLJ24jDrMEfs7spBA7MZUmS9pJ/Sltz8vZylaBxdu04mRy+9WQncZMcolw6
         xFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541055; x=1790145855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6sM9zpfll+quDztLFFF0jfXeRCau4il9IJzrgeT16pM=;
        b=vHc8C0Mm1JVC7h59q7xbeQ5Ib3w9GNHF+WL577Xv9wqLLNc2zLLaSqJKiveKCMKQNv
         XWoI/p2g+BUqxQaIIN3IBfPJ1an5/2kXcAwgREkmPmxl+CfWUCAtZpCzELfubtTa0Vwd
         hxpZreFKDqA9UqHpKAigjY948cS6zrrMfSZIU0ziCAv2FnUB1hF5tCX5kAm6e4Huuv8Y
         TUgOfd4fHQEtz6PMZxk3Bwnm2ZQGgbOa7nTKMEImAsl/bpdNYRvdqa5e6RTBDNhIcECB
         y3n4Qzjr2Hzf7Tt+rNIXbPfOeB9Ca1RHmZQXUIKYWw7j2AzhiydZTxBONoql7mVQpzXX
         rMXw==
X-Forwarded-Encrypted: i=1; AKwUvBzauf6fO+s3cJBaxv+EWpRUvqmeXyXF2i/hiSXaBQaiYSnM1NMzfQTcGg5/rHonBRcOkwQFRZeX/dDjFpA=@vger.kernel.org
X-Gm-Message-State: AFuF++ktjZjyrbVHOEao/ZUDgPGKXVBt0JCQ1ocVTb1zMwZ6lgQYR6kQ
	5V68hSDbRFSIrnhrvS+t8GY/gzye8p6+dfb7zQsrDv5GyH/3g3dlGGaE+PviblsnRG8=
X-Gm-Gg: AYBFou0HCZ7f8hrYXfPnjgVGqPbo7LScLW9UITfykNJvQ5QzW5ban9/KjflEN+ZHPXj
	XPSx1HmTinwqU3q6gGWtbd4V8NMxLtiEUCeJdq1eCr6DR4u4Tiru8bOmAI9i+nmoNkNTW/mMs2G
	xQqRcWAZ8eXjTwJH+GxPXS7h8fjjnvH6Xu5I6GcfS80Go/hMyKUOvvkykgqHhprYWNG+NLch38/
	5mUOZ0LZ/avz6qgHYlkQ3a1f2gDq03htMYNpVGspM6qvDN3qEzipHuXQpyHxqngDc5/drpAPnXx
	5nHfBtfXrOE6+JAXWzrrBvHxN4ql8qxIGczoxMQObUXUao18YiHiL9R6Hr97BsMVT6YqxWe+if6
	h8dENvrjRmVsOsiEdCiyRgXFMBmIZRygQyx88E3JB82VoD9dLY2YN38Kv/agxWjG8FlW+fX6UvT
	B0FPZWE79cpxZcA+w865ZSv1OUghXt6ALNWoAJClwlfPH0fnxsiwz9ZXRW8hgJV/tBd+CksX0Jv
	e40sCQaRm/Qyk09qqPC
X-Received: by 2002:a17:903:1b2f:b0:2d5:2f49:b3f4 with SMTP id d9443c01a7336-2dd8dbf6ed0mr31915195ad.2.1789541055247;
        Tue, 15 Sep 2026 23:44:15 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f0592asm6074755ad.62.2026.09.15.23.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:44:14 -0700 (PDT)
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
Subject: [PATCH v4 05/11] mm/sparse-vmemmap: set compound page order for device DAX
Date: Wed, 16 Sep 2026 14:43:35 +0800
Message-ID: <20260916064341.1825793-6-songmuchun@bytedance.com>
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

