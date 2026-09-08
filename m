Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172C0311C2D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836670; cv=none; b=ef2mtUDtob1Ie+B1TlPip8KUS0Fbc1zeTADzg8Pg0PtEcqWtN6rX9H3ds9hMhDeinh7If3nUqCiNngWp+qTTH/ruWcm0+FKN+XIp9KRqspWu4zvnRbO+0rsoRaAv8YOQW1B40Poidt7nH7xOPL9ok7VqNaiyA7nojmYBeoqFG7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836670; c=relaxed/simple;
	bh=6iR+I4+CRd6OErCQvwrzJO+09x/z03jI1dFumA0VSuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQaurSDRpNnvFDSdskXQqbL3jrNq0KZKjs2p0FvQmaSqwMVyxD3qAs/WO21i6Y9Oe34lI/SLHNbP0aiOGXW7rrGQhLhNTgFWgEcJH8tLFIAUpwS+Z8gkbQn4idsyyL02PNXKUt1gXAhxIGMi9OhplrfPXIq/m20aDQxaKORq1cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ffhFmlrJ; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ffhFmlrJ"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e2254dso66657b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788836666; x=1789441466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEGgQCKJvggw1Narb1WaslYNRsxnnnRwg14YCHWkvvU=;
        b=ffhFmlrJMMvyXs9uH9zMivqVlVdM+B+314G62SuVXMeHJHMSmZi2yg4+zpLBsYRmqf
         mkWXkvXUvV10wJbODubnWBa0ccd2gV2ptQ0ZqpX2AOlj8s4OhNPxcYxx5FrS7aAo7TEq
         Ak7bUm/f6082b0GTvBTETBdvyXo6vsktAGhFWLdksiGAkWnvyO4eco4AEo5/b8+7MGLD
         qtCJBw8oGAXpbOdASHtWSfVp8ZLxU/c9II+oIs48uRN1m+s+ctVCdzBe4XHS7garOfva
         D87ZruF2lrb10eWw4qeKqnzZKOgG/HqPVC48+4rAmLGi/NrL4GH/aR011u11paXRLVV2
         0D7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788836666; x=1789441466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEGgQCKJvggw1Narb1WaslYNRsxnnnRwg14YCHWkvvU=;
        b=Xu+iK3BOw+KYMlM0u0MR3zZUGp7Sf0n0JJHy75opRj1T4/Inbibk0bg7bZAoruh3iO
         TSif9c1PEEhJKYSQsIeAe09FzoLM5T/W5ych0kVJld8+46TFXwcZPmLN+nJ5/3Y9cdkJ
         wZOT/yUjyEPacstj1ebumOiOCDe28zDABB6jr62Eke5hkvS0kmDLWAR/LSNY8V5JDDMY
         3f4MyXTlr8yQOcq/8yRZS5jkrOjRtM29xTI1ceZZwGzkEEanjFeIBQeifqMEte2dntOE
         m+cAu4WaeqJQVxHwKkcrjMHxf1xhf7sRYcLZSHbK522DQtrzT+OYzcaj34/nnxsOkDuU
         y0Gg==
X-Forwarded-Encrypted: i=1; AKwUvBy9mNjINHVuotCCKFbfHwcXnZ+5puGfedpqZsjPY2aV8NH+6QRyByAPuHBnDD3PpaXshCrecwWFJezmDD4=@vger.kernel.org
X-Gm-Message-State: AFuF++k81fVNlz53if5NE7+pqCk4UHWETSwGBCSt9QqpPHsuyxaEw/hJ
	6lrOVWutIemgaNomiKh7V3Z3L7irhR4RV6anm464Gc3EeE2XegPwFCBeGgqwiIjmlv0=
X-Gm-Gg: AYBFou0e+98mvDcSb030amq3ke2nZUAd+sTh8OoB87iwsN5ASHudTDbU5DrwnO7fCL2
	v8aSByqhAd9ZWAXkhm/fp9iYQXemcV+fTfOCRAn5lPTpVeJena8+gxSpttSDhoRV6zQAnRx+L3k
	CQhZjPsY/lkoD3TgIDkp7mBIIOrtOlt8pH4bHek8OtibUzm6pizUVtwkz2ywWlI9w17UahCLcOT
	WDGoLTp+ebgrCCaytHsq/U38vINOpjtDHHTU235wU8y0XgCJk37ZdGqJgVTZM5+3qZVX3mQN7hB
	JRoQGk2c9olmU1514ov2wpREk/E242jcKJMiPJ11yhemCeVhJwRXc02lzqyiezpfsP28xADB7v3
	Lz9SXEoAq4t5pfXBlmCNnWeCCFm1sswJHWFeXhvPULfRlThf3UMDkNlDv8ejzaucOCrWVFZ9QLB
	i9BhveaXaCuD7vcs6mWjga+0bCebi3HuX6lcrdFdXK7XgME0HbHl4l6qXEbjFbBaTKjYtqAJHfD
	CYV7UNw4N+wcW6/xVkXhyH9A3AlOuLjJWE=
X-Received: by 2002:a05:6a00:1d9a:b0:847:852f:c28a with SMTP id d2e1a72fcca58-86698ee5c1bmr4207907b3a.5.1788836666149;
        Mon, 07 Sep 2026 20:04:26 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152a358a2sm4868234b3a.29.2026.09.07.20.04.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 20:04:25 -0700 (PDT)
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
Subject: [PATCH v2 06/11] mm/sparse-vmemmap: switch device DAX to shared tail vmemmap pages
Date: Tue,  8 Sep 2026 11:03:30 +0800
Message-ID: <20260908030335.96549-7-songmuchun@bytedance.com>
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

HugeTLB vmemmap optimization now uses per-zone shared tail vmemmap pages.
Device DAX has not been switched to that mechanism yet.

Switch device DAX to vmemmap_shared_tail_page() as well. This aligns DAX
with HugeTLB by using the common per-zone shared tail vmemmap page.

The optimization is enabled only for DEV-DAX through pgmap->vmemmap_shift,
which is assigned when a DEV-DAX device is initialized. Unlike FS-DAX,
DEV-DAX does not modify tail struct pages, so sharing them is safe.

Since the shared tail page can now back ZONE_DEVICE vmemmap mappings,
initialize its entries with PG_reserved for device zones. Also skip
poisoning vmemmap-optimizable sections while their struct pages may be
shared.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Explain why sharing tail vmemmap pages is safe for DEV-DAX
  (suggested by Qi Zheng)
---
 include/linux/mmzone.h | 10 +++++++++
 mm/memory_hotplug.c    |  5 +++--
 mm/sparse-vmemmap.c    | 47 ++++++++++++++----------------------------
 3 files changed, 28 insertions(+), 34 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index d3778ba976a5..03ed9232f186 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1686,11 +1686,21 @@ static inline bool zone_is_zone_device(const struct zone *zone)
 {
 	return zone_idx(zone) == ZONE_DEVICE;
 }
+
+static inline struct zone *device_zone(int nid)
+{
+	return &NODE_DATA(nid)->node_zones[ZONE_DEVICE];
+}
 #else
 static inline bool zone_is_zone_device(const struct zone *zone)
 {
 	return false;
 }
+
+static inline struct zone *device_zone(int nid)
+{
+	return NULL;
+}
 #endif
 
 /*
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index b428da66d279..0db0379826df 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -554,8 +554,9 @@ void remove_pfn_range_from_zone(struct zone *zone,
 		/* Select all remaining pages up to the next section boundary */
 		cur_nr_pages =
 			min(end_pfn - pfn, SECTION_ALIGN_UP(pfn + 1) - pfn);
-		page_init_poison(pfn_to_page(pfn),
-				 sizeof(struct page) * cur_nr_pages);
+		if (!section_vmemmap_optimizable(__pfn_to_section(pfn)))
+			page_init_poison(pfn_to_page(pfn),
+					 sizeof(struct page) * cur_nr_pages);
 	}
 
 	/*
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index aed1e7429daa..0201877a7f80 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -193,6 +193,8 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 		set_page_node(page, zone_to_nid(zone));
 		set_page_zone(page, zone_idx(zone));
 		prep_compound_tail(page, NULL, order);
+		if (zone_is_zone_device(zone))
+			__SetPageReserved(page);
 	}
 
 	page = virt_to_page(addr);
@@ -490,23 +492,6 @@ static bool __meminit reuse_compound_section(unsigned long start_pfn,
 	return !IS_ALIGNED(offset, nr_pages) && nr_pages > PAGES_PER_SUBSECTION;
 }
 
-static pte_t * __meminit compound_section_tail_page(unsigned long addr)
-{
-	pte_t *pte;
-
-	addr -= PAGE_SIZE;
-
-	/*
-	 * Assuming sections are populated sequentially, the previous section's
-	 * page data can be reused.
-	 */
-	pte = pte_offset_kernel(pmd_off_k(addr), addr);
-	if (!pte)
-		return NULL;
-
-	return pte;
-}
-
 static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 						     unsigned long start,
 						     unsigned long end, int node,
@@ -516,21 +501,18 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 	pte_t *pte;
 	int rc;
 	unsigned long flags = VMEMMAP_POPULATE_DAX;
+	struct page *page;
+	unsigned int order = pfn_to_section_order(start_pfn);
 
-	if (reuse_compound_section(start_pfn, pgmap)) {
-		pte = compound_section_tail_page(start);
-		if (!pte)
-			return -ENOMEM;
+	page = vmemmap_shared_tail_page(order, device_zone(node));
+	if (!page)
+		return -ENOMEM;
 
-		/*
-		 * Reuse the page that was populated in the prior iteration
-		 * with just tail struct pages.
-		 */
+	if (reuse_compound_section(start_pfn, pgmap))
 		return vmemmap_populate_range(start, end, node, NULL,
-					      pte_pfn(ptep_get(pte)), flags);
-	}
+					      page_to_pfn(page), flags);
 
-	size = min(end - start, pgmap_vmemmap_nr(pgmap) * sizeof(struct page));
+	size = min(end - start, (1UL << order) * sizeof(struct page));
 	for (addr = start; addr < end; addr += size) {
 		unsigned long next, last = addr + size;
 
@@ -546,12 +528,12 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 			return -ENOMEM;
 
 		/*
-		 * Reuse the previous page for the rest of tail pages
+		 * Reuse the shared page for the rest of tail pages
 		 * See layout diagram in Documentation/mm/vmemmap_dedup.rst
 		 */
 		next += PAGE_SIZE;
 		rc = vmemmap_populate_range(next, last, node, NULL,
-					    pte_pfn(ptep_get(pte)), flags);
+					    page_to_pfn(page), flags);
 		if (rc)
 			return -ENOMEM;
 	}
@@ -883,13 +865,14 @@ int __meminit sparse_add_section(int nid, unsigned long start_pfn,
 	if (IS_ERR(memmap))
 		return PTR_ERR(memmap);
 
+	ms = __nr_to_section(section_nr);
 	/*
 	 * Poison uninitialized struct pages in order to catch invalid flags
 	 * combinations.
 	 */
-	page_init_poison(memmap, sizeof(struct page) * nr_pages);
+	if (!section_vmemmap_optimizable(ms))
+		page_init_poison(memmap, sizeof(struct page) * nr_pages);
 
-	ms = __nr_to_section(section_nr);
 	__section_mark_present(ms, section_nr);
 
 	/* Align memmap to section boundary in the subsection case */
-- 
2.54.0

