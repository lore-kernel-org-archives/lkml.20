Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6B93B585D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477723; cv=none; b=VcviNBP04LCKrMvpN05De/wwNgkJu6Ed7gZ9wZiBOAOC/OdA0uFmX0L2+8N0oM+DQp/aa2a2cDIfRl6IseKQD6eDh1PMdhrIW71qTz5GH41/P9wgNh+ipbqC1nHeDarXCwRdueRwOp8DL8Rxd2LNyjXLRi4YXcy4h33vi86Sdbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477723; c=relaxed/simple;
	bh=pgyM1vwmcv6thQ5QhTepGhi8qZvN79+WtmwVD05Xugc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XO08fp4CpUVfv+DxW7rPry51hx82Izbq9Ks3rpIj9MkiPK/5DIbUsWElnC2LQXqN5JcAcRHxiMr5nd6nwy9oJe6I7Nz5V/pYq0gyYr4tIj1PJ9/eHUvUWV57/gc6/VsKDqSscPXTaB5cGHwOzuFe3rubawWDBmCbDk7cvpCS0VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Y7QITrfn; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Y7QITrfn"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398beb616f5so1055054a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790477721; x=1791082521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBlSYhutFVpa615i7UF023108ER8B6ja1OjBI94hgy4=;
        b=Y7QITrfnZ0vf4s0xrUyokJ5JLNbXHKxASNHM5wv8uPSIx0sULVaV0+dA5h7LXyNi1D
         qDoqim8YUgRR3wevHsNkTV45ogw3wyrkuh26U0jYbb6lplIWk6Ys1ZkJ4b00Zl6exJrD
         GnObwV0b6NtLC1uGqZ/RMJ8oLwMpPuZmVzooMB8W013Es8Oy/KkVO87keoocBGHRMtcx
         raZnMmOnO9TgYqMyHt+hjHUj1+XrKsb6s7VNgrl9YdQkMvPmhtd8UaGRaEVfLSCr6Gwy
         hddCyEWmI7FUMpsZdZM4NCsBrBudkHaOd4ZSOqknUKEDoedfDwUxTS1pUlcZI8vEiCL8
         BNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477721; x=1791082521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WBlSYhutFVpa615i7UF023108ER8B6ja1OjBI94hgy4=;
        b=Hm2PEXADj094tN8aM0+D9TE92L052CbKcbXjslR77wCeY8dPDyzGG5XGDv61WgJJ5i
         JQWug7cMboGRWEJdXQZCZVgWU5ZtsZlpFpMIMJRKfG1zBK0LpeEl5QOUV2HubWuK6s1J
         dK/dYUXRYzHRFvIVAU3aRKujHT6ucyESwG3sVWwbsyn5/HoA7A1V019r3tHoudlAblbh
         C6DNIDHPvnI3Ra5Fpbk9bz5xlyYxzy6cx/lAEo6JgabFiW47qm1+QJanYaC7Ki1ih7rd
         9mbByYoZ/n569E1PUB54WHygVA39FRWcngEk0nXN5PrrMJf26ciqQNjuZpvAtE36nMUS
         zlXA==
X-Forwarded-Encrypted: i=1; AKwUvBz0Wq/Iv+B/noMepWzsW+YLsj8BTLBc8ko83QOqc7VFyRAT/r3sv0M1yNEsQLnA+CHKV7CAXAIjiHa33bY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4ZdKXwWcAtEa8OG3H39ch5+TBE9rdaJ9dTBfShLh2DQTzWcHa
	rb+kwEsg5WuKZiINW5Wtd/ly2Y5Xd8bTehPqzljXM+22ZwJ3QPu16vPc0U1k/gZw+LU=
X-Gm-Gg: AYBFou2lSm41j5jmIkc/5iICP69JE8YxXEtTH/UYqqjw0hJSNX7oZG7ImyjM04HF9sf
	i4rwSd1Rkimw7zguGo+hJT7VGRFVxJPtDjNvYm/HdWmFGlbWUShAXtzckXwGUBRlnJ5Q0eJ3ybf
	pKOOT0amYRe813Yi9viGV5Uk/DqROYVrVRPGXos96eYWY1O6pKwJb8fAvchX6517RfHc8ZRHNnF
	Ws8stkSfdjToMnUbxohOE2g1ErMFCbHl6A7Ks91jV9OyDqtFyi2mwt2k2X4VHmVp3JnDHM9CSz6
	QFJKVr9718tOsuCapJA1YsGeKV3pYRDowU8IjuzeaW7BHFIfNT3UYF9af9jJ1ONR5yQoyYcXaXA
	oald5l4rkqt20UTVL4hkalQ6Rhx5P9DaQ28Tyh8sxkWetA+aeXntbu7eHma/+hoIN+gQzxy6T/G
	ZNn29G4JtQ01xays4s6l2HFPo1sja8+SZZ3l5hRX00AKiMg2SC+u0Oe86vf318zQ0wi5+XS6TVC
	w+sYhTS0uLX7smUop7z
X-Received: by 2002:a17:90a:d64f:b0:3a0:e985:9ca2 with SMTP id 98e67ed59e1d1-3a0e985a241mr1295162a91.31.1790477720535;
        Sat, 26 Sep 2026 19:55:20 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm13461377a91.1.2026.09.26.19.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:55:20 -0700 (PDT)
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
Subject: [PATCH v5 06/12] mm/sparse-vmemmap: set compound page order for device DAX
Date: Sun, 27 Sep 2026 10:54:35 +0800
Message-ID: <20260927025441.741633-7-songmuchun@bytedance.com>
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
index 2457ea2c6dca..ca2470e96a74 100644
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
@@ -608,7 +608,7 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
 		return NULL;
 
-	if (vmemmap_can_optimize(altmap, pgmap))
+	if (pgmap && section_vmemmap_optimizable(__pfn_to_section(pfn)))
 		r = vmemmap_populate_compound_pages(pfn, start, end, nid, pgmap);
 	else
 		r = vmemmap_populate(start, end, nid, altmap);
@@ -827,8 +827,10 @@ static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
 	else if (memmap)
 		free_map_bootmem(memmap);
 
-	if (empty)
+	if (empty) {
 		ms->section_mem_map = (unsigned long)NULL;
+		section_set_compound_order(ms, 0);
+	}
 }
 
 static struct page * __meminit section_activate(int nid, unsigned long pfn,
@@ -838,8 +840,13 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
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
@@ -865,6 +872,7 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
 	if (nr_pages < PAGES_PER_SECTION && early_section(ms))
 		return pfn_to_page(pfn);
 
+	section_set_compound_order_range(pfn, nr_pages, order);
 	memmap = populate_section_memmap(pfn, nr_pages, nid, altmap, pgmap);
 	if (!memmap) {
 		section_deactivate(pfn, nr_pages, altmap, pgmap);
-- 
2.54.0

