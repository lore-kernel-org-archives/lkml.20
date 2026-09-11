Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1875A3101B2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103038; cv=none; b=hAXNRZIAcV0c1ml9SlZq3ny61yoDbm26GAjVdGjdwPQ/T2cpJDlnBY9Swn9Tfg1fITYgGByOTtTviUlDdcKaSWddkNeXYWjNclaws9ot8PHE+9jCXopxMWIz6wOp6ONH5/l1HFaNK+SVg88YyyygvhtJIbklpR2GvstAAeqB+cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103038; c=relaxed/simple;
	bh=0llyyoMRgBuen3IFNQ8CcdCaoiuoaaDgEXEVe3ASyro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m49Y7p12zaoOpHsB35usFyTpGTbQsXcsfhJyJAo/Gq1lriaeyC1b96mgySa0jjBRq/YNB2RO+ZucNsitBpgD6cyvlDOvstlFDFJ5gDQooURCD+cUa0GMIAeZ9NDdRXXvHcJ0/zpw8Bt5NeiCHLdTO6BgQTBMvgWJHc+y4zEIBRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=lNggjDWR; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="lNggjDWR"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398e9698a70so556633a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789103036; x=1789707836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SoYJ7WMuU/pqlbOJzY7F/meqClQuD0NoJ+12TnNHPs=;
        b=lNggjDWR+N8v6zzi9sMsHr2ovH4lnFQb6hX405YNDT76vQ7bIl08YyhfnY65RQM9w2
         EcDpMemkeo1hvQc8XDuhROUtJTYfAuChi7AYWOtBUfcZmsVb9iyASGlZqNudPJdhqdJ2
         lYKY7EzIaM6d9oWz1VVWtNmvSBd198V6YVBMnPV4ANrpmTp/CY9iAX7VQ3CYGgmKSSvW
         f/rV6VitPJNaO27sszFQHs4j2Bc3vu8z1xArZbVGWqYNRB2s8kSRfLujf/VdGx18UPDs
         NIeH1UB3ZclHCZZA02wxGEpTr//bf7mHDt/PHFPePwQdKHWYgsHioRAKa/MHTnEdWeTV
         essA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103036; x=1789707836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4SoYJ7WMuU/pqlbOJzY7F/meqClQuD0NoJ+12TnNHPs=;
        b=bpUs5dYksLeT7CjotlCi1goPGZIGUrblj41G5Ytkq2DzIUx3Nt7nEi80BACfMVeEwY
         od09wqmtsJ2iLFyiaf6yAWU73/1mJfFNo2NIZP7T50a8dIqkGOlIx+FEfbKZkgkUU4Gi
         7UIi81OOtAbE9GWlHeWOPgBiuF+HG8tt/nMRvlQyze6NtnIcyrZrKGNIZIKqCChTbESc
         +vGVbUFMkTmtTmpLC6XxOkPncJS1oYFGxtm4kN6d1WmVhkShyezkDmfNqfxi0oD2ah5w
         DRNtU9PihV95X2w56yxgcRzr+Z7d+MAbCpfOnoUl70MXSC6Dn1wwt61wMR8bRukvpOYF
         q+YA==
X-Forwarded-Encrypted: i=1; AKwUvBwvFbPVsSyzbpn5rHxOkvvUonBvgDcOBttFGYxXHs++ED0sE+AZwl5kLgOdd9cnYbTa4zyEbSuSIrIh19A=@vger.kernel.org
X-Gm-Message-State: AFuF++mZCjR/wLGJfVr4TTkU8EBFO8XFt65qfe13vG15w0OcDlfGj9PK
	oBo3cPWUfPCkOO96Ci6+gfRU1gp8PrItpy1RSuR6d95jRcEssfrb7s6tUOHhDQTNMQY=
X-Gm-Gg: AYBFou24z2rcCcDCB/TBbfl+BgCmJRoOYsgOQnljkyR/DyTjCQ68Ur/0K9tZ72tS7k5
	+p8qoI4XtGv3v/lWcQWO02kH9pP7x8qWYGwSV7YBIRiojsJX9jtHqA/lUR0PVnjNd3woSRCBTX8
	O0j64TIu7qfEHGlL3NSE6jTmnX2grNWr2Bt4wL98NXVAta/ynW5W91DrHgAyawnNPIEno9UYq8N
	JyYuVTutw5+MXk7KYBzaIqCme7HPxo57eFC3rzWN+ASEmfY2XX8JJyLkaKNiPrQj2jcKHfeFiFM
	adWUEElSs6NLVVJah9sBSPI7FZEW11obyL2e730g0UlXvd+3N6ZfZZjqwHeySJGdmvRxGoP1Gad
	eP60yg6VRbUbT7MG+V2jlt5U0ejQ+TBcje3F4qi0ALz+dZmOczIPDhn9WOmbtho3U3B+y5Esx74
	5fjYV52UpDuoITHaSz+MTUJzkSzGpo/JdcRurSdP4OrIkzlWcTBL1riySl6sPGVd/QfWs6fH9ar
	PQr9AkhVYVqzCU4nbjNhGQ1FTm0oWyzMSB8
X-Received: by 2002:a17:90b:2b50:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39d9c1c199dmr3979201a91.14.1789103036192;
        Thu, 10 Sep 2026 22:03:56 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm2651561a91.14.2026.09.10.22.03.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 22:03:55 -0700 (PDT)
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
Subject: [PATCH v3 06/11] mm/sparse-vmemmap: switch device DAX to shared tail vmemmap pages
Date: Fri, 11 Sep 2026 13:02:23 +0800
Message-ID: <20260911050228.58884-7-songmuchun@bytedance.com>
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

HugeTLB vmemmap optimization now uses per-zone shared tail vmemmap pages.
Device DAX has not been switched to that mechanism yet.

Switch device DAX to vmemmap_shared_tail_page() as well. This aligns DAX
with HugeTLB by using the common per-zone shared tail vmemmap page.

The optimization is enabled only for DEV-DAX through pgmap->vmemmap_shift,
which supplies the compound page order recorded in section metadata before
vmemmap population. Unlike FS-DAX, DEV-DAX does not modify tail struct
pages, so sharing them is safe.

Since the shared tail page can now back ZONE_DEVICE vmemmap mappings,
initialize its entries with PG_reserved for device zones. Also skip
poisoning vmemmap-optimizable sections while their struct pages may be
shared.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Move device_zone() after the definition of NODE_DATA() to fix
  non-NUMA builds.
- Update the commit message to describe the compound page order stored
  in section metadata
- Collect Acked-by from Qi Zheng

v2:
- Explain why sharing tail vmemmap pages is safe for DEV-DAX
  (suggested by Qi Zheng)
---
 include/linux/mmzone.h | 10 +++++++++
 mm/memory_hotplug.c    |  6 ++++--
 mm/sparse-vmemmap.c    | 47 ++++++++++++++----------------------------
 3 files changed, 29 insertions(+), 34 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 1a18c1c40c8c..f8a2d823f7de 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2149,11 +2149,21 @@ static inline int online_device_section(const struct mem_section *section)
 
 	return section && ((section->section_mem_map & flags) == flags);
 }
+
+static inline struct zone *device_zone(int nid)
+{
+	return &NODE_DATA(nid)->node_zones[ZONE_DEVICE];
+}
 #else
 static inline int online_device_section(const struct mem_section *section)
 {
 	return 0;
 }
+
+static inline struct zone *device_zone(int nid)
+{
+	return NULL;
+}
 #endif
 
 static inline int online_section_nr(unsigned long nr)
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index b428da66d279..d7a59167bec4 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -43,6 +43,7 @@
 #include "mm_init.h"
 #include "page_alloc.h"
 #include "shuffle.h"
+#include "sparse.h"
 
 enum {
 	MEMMAP_ON_MEMORY_DISABLE = 0,
@@ -554,8 +555,9 @@ void remove_pfn_range_from_zone(struct zone *zone,
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
index 02da1321197d..7b5b9ceec697 100644
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
+	unsigned int order = pfn_to_section_compound_order(start_pfn);
 
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

