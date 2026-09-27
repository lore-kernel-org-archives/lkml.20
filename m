Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FED3B6371
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477727; cv=none; b=X6U1//X8257e3ntn53+JPyD4uPDhFOVNoKYVc9ytMbAb7S8MaPSaBK27iFub8Af8kKHvqwQaAZWsrdv2A8psV8SdkndwTGvtge5ciZGLlFyRHlwpSVyI7320loDxIZWpCkmiptHDZX8o/k4QnBO8ff4F8ITOX91lSYzKxYAG+PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477727; c=relaxed/simple;
	bh=xT775cT6s6mW9g81ZVRNWS9Y87iXNfwCvQrAKLb2oUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=enLZIPAIxq7v6QabnnluxeJ8eYXTsx0x3U+X+nlv/pLg23sq4RYz/25Ym2DOXyehS2SDHLYgxqz+4HlAhwukq6if2v/1pOUT647XnkAZOhLurxprYtbm4JOy8yJDquRIDg0bnwr9ekwGXqFppmiMx5OiL3qneS8HlAFzGtkZ5hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=FwZPsLYz; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="FwZPsLYz"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so1376060a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790477725; x=1791082525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eDg0B4GTZoaBgeAm1Zuaxbe7/C+fLySFm30qNgbQ5Ns=;
        b=FwZPsLYz9/R+ARukJ17cp/AUWV20tdpUYoIMHNppy2iuAMU2giL9EKhtCt40VNfB1i
         UV15cha1Rs8vhMVnj9wbwdNMGmbEz/XXjmH4dtp+rVMD31tmViU4tBRi/GrzPnexfWKH
         aSbk7r8NvHtchBteeeAMF8DJAYp/kxVYnuMQeqFarkEJtTv94YjLtPhdHEgnQd8tMxgT
         Ebv0qauYs0o+cFshhJUWUZajDucMV9ddk2bCqZewrB4OpaLoCplrvhKVuEEJ6qlSevlb
         DbtPPM9wDl2h3qGAChGOsAowiMWFKKlBqU1vh4m79JppyqVvI98unOT+YniO7a+rQT0L
         dAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477725; x=1791082525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eDg0B4GTZoaBgeAm1Zuaxbe7/C+fLySFm30qNgbQ5Ns=;
        b=JDI62s1C0u3wdMFh2D28tNECzg18CRdHRrPWu3BTJZOtwc61d3ix0t3t6uefNZc9Nn
         DRz40m9ANzla71M9K3dwEPoIM3dJbV9FlPKXvN+cpUi4Y4doj+EvSzOdf9ed2nRzghGT
         f3quVO2lGnW+Ivlr3ufw4vBCbIKX1ewYFCNyf4iH5nCJ6OUNgGQCYEMkF8m5sXrFtOTu
         dSf1Top8ra0MSavJ+fNPUnoAgBAK7Kfd9gvuFata76D8alVR9DUV59ha0f2OfBX7bctv
         lbcSCSm4Kc4aL0HoMnsuAu+uZOLSoZTICq5cy5Uxz8xduFfkD+6pWv1M5eNCgocffHRY
         e39Q==
X-Forwarded-Encrypted: i=1; AKwUvBye22SZZVSeq2Lf1am1dm5+qoPGsHrEJjtFVdt0OIOermzIfF0ju4xbZhOlzI1+V/wPG51xE2kWHT6POWA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCVBVl05pvK7dd8qZ149SAfRF7CAm+8bs4EC0/ZAPjtx5v4RO1
	DpdeIXzWDAD2etp34j/I2E4OMZ4loVl9WEzysffV0gbTYmoQ/zNJqL1Xl4Cec9D8Xz0=
X-Gm-Gg: AYBFou1bLJ17/qVt19wjQrFpRoCQA3kS+vZKzxrm9zFZlSG4/M/MKEml4pk9GsyCaP7
	dgYaYWEF37H4IgsHKrREI7MYczUxnLAynfWWjPmVDnRj5kt/Blew3U+EQwpWNTIU1J+0uQMrczL
	I5qxF4dW1Qr/S5vpvFzGXlyTUC5/t3THJUxZX3kLrexFQ9Q4MCkgW0cWQ/YjwYn+t3g0zbBq04z
	F0MJ33ZEigdn41pGofYUcreUJUZNde0Yr7JHYosLvfyrmqCSf8PbzbTDUKlBMpW2VPCod5CyBmF
	HYT5E67FHuAdaObqhkQgrYMzXejEfXo0ZJR6/+M6bUN8eoUhD1gButqtbUhNzL4HOfIeNmPZ2iA
	aUjMkNA+mXL4xr4bU8DmN60m/uOV6VvDPmpASlwvhUmVnmwplnsmh0eZ/N42Mh2G98OUL/F33nP
	u/ZVW8G1mQmlJVCpO+BjprSmO0x/HQyzvCT8l5yHZkSrRawXzTjKYLWgxGoIeyMwfpfbF/Rc+jW
	37quz8WXSQ6nWD82Z34
X-Received: by 2002:a17:90b:4a45:b0:39e:6c68:c77c with SMTP id 98e67ed59e1d1-3a098e07a64mr8528965a91.50.1790477725206;
        Sat, 26 Sep 2026 19:55:25 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm13461377a91.1.2026.09.26.19.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:55:24 -0700 (PDT)
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
Subject: [PATCH v5 07/12] mm/sparse-vmemmap: switch device DAX to shared tail vmemmap pages
Date: Sun, 27 Sep 2026 10:54:36 +0800
Message-ID: <20260927025441.741633-8-songmuchun@bytedance.com>
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
index ee9cbaaa63f4..cd68c1904c91 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2143,11 +2143,21 @@ static inline int online_device_section(const struct mem_section *section)
 
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
index ca2470e96a74..2bc78aa053a1 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -221,6 +221,8 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 		set_page_node(page, zone_to_nid(zone));
 		set_page_zone(page, zone_idx(zone));
 		prep_compound_tail(page, NULL, order);
+		if (zone_is_zone_device(zone))
+			__SetPageReserved(page);
 	}
 
 	page = virt_to_page(addr);
@@ -525,23 +527,6 @@ static bool __meminit reuse_compound_section(unsigned long start_pfn,
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
@@ -551,21 +536,18 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
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
 
@@ -581,12 +563,12 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
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
@@ -918,13 +900,14 @@ int __meminit sparse_add_section(int nid, unsigned long start_pfn,
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

