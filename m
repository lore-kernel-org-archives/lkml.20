Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365103955DB
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789288847; cv=none; b=Llcen9uGCr9tjERg3iAZKF0PVGKekgC8ut3aBh52Ljhh86cB2Qr4BaH0Nec0P2xURZKmPXHm2UTSkcG18Pe/k8jbCkoo++xUuvxuiMfmB6PALWzf6zgdd4BoSttdn97W2h33JR3Yj3qb7aM/bn/a2y/vEkDMB+jx4DIAPoBqjhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789288847; c=relaxed/simple;
	bh=axZHqSrdvfRy76XwHi9h5QpvXkgidn9uUExeGXtk0c0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=luYY/lFVFFBuNEnU7vgq0THn0crv3uNclWKDn37PE9en/CkHXbmOBGhlKe9O3dbkwl9rDRnnIr+F7PhO5yNfVpMMNMxIlBiy2j+zRiCNocKL5VkXMYYUe61swe7u4ZyxJZewyStLos+9l4/hxRwuNoXl1+X+YeUKnorXSm90VT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=U8dkuScI; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="U8dkuScI"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25400so816392b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789288844; x=1789893644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ML0t01Bj4qeBUEzdqhHtr19Sc8eC1B+HcCN0p8hsXSo=;
        b=U8dkuScIoeFonvMz4wtjvThxd+uSTMNk7/QPExIl0KFUWvwGNbfpl5ZjXCLoCfEEYs
         +HDqYf/mDv7jsrBM58g11S+n7tHqhAaUg2HfmrMdT7QZKtwiG5z4WFfnhsF/TOzBEJnd
         nr5GKCbF2Dsl9hCmOShtgSsFzhygOXSL5rWBiJbExlmBF0gov3gLtoLCpMBhTkzeaW7N
         FqIH757umH0o+HvWhAgud50mG7kxx43YjccQ4oI3KSkdGdRURQeDjbE+js2/eh4DBFOj
         UDIuCDiQsc+lO0bGtR5SDk8HpPU/ewS17BvQIpHSy3HCUEr+LwANJsrloCdagBiaRX7p
         bu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789288844; x=1789893644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ML0t01Bj4qeBUEzdqhHtr19Sc8eC1B+HcCN0p8hsXSo=;
        b=dJWCPSBEEz1Fo8pGbNN8RJQrGeNgx7Y1i4QwpSkANtD3XDlzPcbS9i+cIkMkxQ83B7
         wrpo/UTuVbiIxn3pSgBWeiqO/OCRjNVcQBZA4OweKrMaVGuZV4rrr4lrHiYMOmr5hyJv
         IBG3kFRhBckGscoeiAOR4+PW5OI5uY8wOl4pjlWgZQNECRR5RI9/QC3d84G4STx1z11c
         DQpg1GuUgPqfxcmIQxHc8y+NGHHI2hvBOGsHDBmY28RwJsznzjzOv7jyKC3v9mAUgi7d
         OHdo0SiKaigdq/XN4ehkX0lJBhTeKt4oXkrug2YYYSW/nzRdtHkzvF2m9DsDC+fi2D68
         RYpQ==
X-Forwarded-Encrypted: i=1; AKwUvBygDNXC6b9XjmXiTP2EfX4iL5aT+gy1j5am1Ur6oeNiaEjIY6H6mhx01doGiJ1YwxFPM4WBuQ6hflr5XU0=@vger.kernel.org
X-Gm-Message-State: AFuF++mPITtSypm9beBVh3V6Vcw2OMVwgCC68nhl81/+ySMfComWdAiy
	apsPi4xqkgznhE2qSFK1Iq3x4cS7+4/LCfXo8c3keX/VZCiar4kUonEQmPEsDyJNstM=
X-Gm-Gg: AYBFou1fXmZGh3kJV4/RKmnOOmj9klbvDM9cLtgA1nMcriKO5URzML0lYzuVXYENyCz
	jB08LAtU/wtqHRrpw06KPkdX2dnAsOB29BGHNbtFpqFobf/1kDqggQUrq3jaoPsYeTibynOqMV4
	UC7X9vC0u1CNgo5WkwxDrtbI5XZ+/5RGpdDcuE82oDMCiVdl5SzrbB28vffQoXPNP0uZoOonNu2
	GDLvhBPAd5id3T71LT3u24DQ0QzM0ZCWUbD6jtjijxzfuKy/WKZoTxJQLzzg6/n9JJEObkUQBBV
	yDwgqSc1Q/ThuAIcM6PUfRZOKQrS4vgOePSCIMVIVXGe2f+sbvCMCCTPcJYAR7qgNqtB2zGplhL
	e4sdUyKSdSm/xSAq2DJdFc5emi409LCqmcFdqK+XdjHnpDKJul8PFHd0v1QccVqNNRSG0NT9uM8
	YoEhxDQudkdYrd+N8qoTVNYsn5eSZT3BaZUI2G/hF8FaQM+v/DU//1/sX8QLqWdFtoykc27tAVY
	bLFZJDux8iIoT4kYe+mFpi/FvA=
X-Received: by 2002:a05:6a00:8c6:b0:845:e440:d0ca with SMTP id d2e1a72fcca58-86b2fe25315mr17990526b3a.8.1789288844473;
        Sun, 13 Sep 2026 01:40:44 -0700 (PDT)
Received: from G6L4RL2QG9 ([2409:8a00:1832:cf0:5137:990:100e:cc7e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb0d3sm3070531b3a.42.2026.09.13.01.40.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 01:40:44 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH 3/6] mm/sparse-vmemmap: drop Device DAX-specific population path
Date: Sun, 13 Sep 2026 16:37:31 +0800
Message-ID: <20260913083734.86802-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260913083734.86802-1-songmuchun@bytedance.com>
References: <20260913083734.86802-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The common vmemmap path selects the shared page for optimized mappings
itself, so Device DAX no longer needs vmemmap_populate_compound_pages()
to find a shared tail page and pass its backing PFN through the generic
population helpers.

Remove the Device DAX-specific population path and let section memmap
population always use vmemmap_populate(). The powerpc retains an
architecture-specific compound-page implementation, so select it directly
from radix__vmemmap_populate() for optimizable sections.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c |  3 +
 mm/mm_init.c                             |  2 +-
 mm/sparse-vmemmap.c                      | 71 +-----------------------
 3 files changed, 5 insertions(+), 71 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 9ca28e4a610a..cb72d9ccf747 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1122,7 +1122,10 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
+	unsigned long pfn = page_to_pfn((struct page *)start);
 
+	if (section_vmemmap_optimizable(__pfn_to_section(pfn)))
+		return vmemmap_populate_compound_pages(pfn, start, end, node, NULL);
 	/*
 	 * If altmap is present, Make sure we align the start vmemmap addr
 	 * to PAGE_SIZE so that we calculate the correct start_pfn in
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 56bb4567a494..1650d6bc1211 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1046,7 +1046,7 @@ static void zone_device_page_init_from_template(struct page *page,
  * initialize is a lot smaller that the total amount of struct pages being
  * mapped. This is a paired / mild layering violation with explicit knowledge
  * of how the sparse_vmemmap internals handle compound pages in the lack
- * of an altmap. See vmemmap_populate_compound_pages().
+ * of an altmap.
  */
 static inline unsigned long compound_nr_pages(unsigned long pfn,
 					      struct dev_pagemap *pgmap)
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index e83821768c12..028f844c90f5 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -454,71 +454,6 @@ int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
 	return 0;
 }
 
-#ifndef vmemmap_populate_compound_pages
-/*
- * For compound pages bigger than section size (e.g. x86 1G compound
- * pages with 2M subsection size) fill the rest of sections as tail
- * pages.
- *
- * Note that memremap_pages() resets @nr_range value and will increment
- * it after each range successful onlining. Thus the value or @nr_range
- * at section memmap populate corresponds to the in-progress range
- * being onlined here.
- */
-static bool __meminit reuse_compound_section(unsigned long start_pfn,
-					     struct dev_pagemap *pgmap)
-{
-	unsigned long nr_pages = pgmap_vmemmap_nr(pgmap);
-	unsigned long offset = start_pfn -
-		PHYS_PFN(pgmap->ranges[pgmap->nr_range].start);
-
-	return !IS_ALIGNED(offset, nr_pages) && nr_pages > PAGES_PER_SUBSECTION;
-}
-
-static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-						     unsigned long start,
-						     unsigned long end, int node,
-						     struct dev_pagemap *pgmap)
-{
-	unsigned long size, addr;
-	pte_t *pte;
-	int rc;
-	struct page *page;
-	unsigned int order = pfn_to_section_compound_order(start_pfn);
-
-	page = vmemmap_shared_tail_page(order, device_zone(node));
-	if (!page)
-		return -ENOMEM;
-
-	if (reuse_compound_section(start_pfn, pgmap))
-		return vmemmap_populate_range(start, end, node, NULL,
-					      page_to_pfn(page));
-
-	size = min(end - start, (1UL << order) * sizeof(struct page));
-	for (addr = start; addr < end; addr += size) {
-		unsigned long next, last = addr + size;
-
-		/* Populate the head page vmemmap page */
-		pte = vmemmap_populate_address(addr, node, NULL, -1);
-		if (!pte)
-			return -ENOMEM;
-
-		/*
-		 * Reuse the shared page for the rest of tail pages
-		 * See layout diagram in Documentation/mm/vmemmap_dedup.rst
-		 */
-		next = addr + PAGE_SIZE;
-		rc = vmemmap_populate_range(next, last, node, NULL,
-					    page_to_pfn(page));
-		if (rc)
-			return -ENOMEM;
-	}
-
-	return 0;
-}
-
-#endif
-
 struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
 		struct dev_pagemap *pgmap)
@@ -531,11 +466,7 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
 		return NULL;
 
-	if (pgmap && section_vmemmap_optimizable(__pfn_to_section(pfn)))
-		r = vmemmap_populate_compound_pages(pfn, start, end, nid, pgmap);
-	else
-		r = vmemmap_populate(start, end, nid, altmap);
-
+	r = vmemmap_populate(start, end, nid, altmap);
 	if (r < 0)
 		return NULL;
 
-- 
2.54.0

