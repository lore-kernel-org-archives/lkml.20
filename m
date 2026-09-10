Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6BC34CCE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022038; cv=none; b=Btpo0dxaB/MlYzVmxKN7BgzOfjPqMrRhcxE+MyGjKidg1e50dMXZel1+98s7vFspjP/qxLtcASxwhnulUT84OE2sftzASxCIQi6hTCUNNT4bVNX6USH7E7CRiIFR31+XEMA7hGAz7z1hecDYedCLjiRgkQV7ywQtpZ+ZJd3smbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022038; c=relaxed/simple;
	bh=hEq7qIpFnYAm54s5gTdB9wGUTTRdN/+pUlavhzSVW9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=thvsdxCOVygraQ2NlCH6AiUKnJOjwB83vxuwzQ1BNmU6U31Vh1HZ0Z6fRv1yxcJhqfqsuOZL8E5e9s2qjOFl8yTBHOLTQS36xsDBH5MQMw1lEVvM4hXVHRldrTL4RnTTyUazG4BQ1m7t3VVhhxPYtbkP4iiOpiF5/x3jwC/p/Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HVARQKpb; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HVARQKpb"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398b3d66515so6891450a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022033; x=1789626833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fScr4mRCKk6xdGZOiQP1hnWEEEG9rl2EUQeAyvKGaqc=;
        b=HVARQKpbdQyWkZ+3jcOLb9I10gx58XGPKg2VhZXYGaAyUTisFvxvMoa07Ilzu2oV0i
         As9ffA1Qz9TNoZDvJZu7skjLLuN92lrc4dqDcT3VxSQJyjtO8CWYN5xfVaCjIOptNM5p
         WMz2Hg9fTDkKZMapVbOzW4AOICbzPvyXBsXUv0F5ZX4Dbuv9IWbWq7sHBsGevjhXSC0y
         tIxOPX3bc/X1ZXOWT//5dY5E5hzFr1u3X5/VNHTDqJVV6U0sbqyLjoGzTWG8iDCv9gVe
         YbQiE8Nfs2mTcyxNh7joisNSeul3bXoBY2VKsgzxWF5eRFOiSo1+NXVI+RpaLWyVehQw
         tKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022033; x=1789626833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fScr4mRCKk6xdGZOiQP1hnWEEEG9rl2EUQeAyvKGaqc=;
        b=I7KGbgJSR41sTtXSy3AowGf5eZc7ZkA5IhNsjnFB3inZCET3Dlkp5PfsHoHqDh8wpm
         mfCGcI3PN401Etejk/DCwEYW/qYsu/dF4d+8isw/xsJ/VnYcJ98/nCWiAEDQIi/x+8v0
         jbIOMpVMoM0dS0bgAACLXlRijMnNnFaEwjB9Soh9y6igYnshryT+Vxku6qhfD216B5Zh
         2vaPQthL8YNa02BxticfnXz7l3LeMIUDdr2C2WW0O+g3YGxhV+7FKe+jsdRsQTrHN73N
         qOueSjmGk0/DZeAltr3YKEJu/bUhHZJZ5NT6O8sW/urRXtZg5duzdlbKvTCf/p6ay8h4
         k4KA==
X-Forwarded-Encrypted: i=1; AKwUvBxCfnqNHTv6Vv0hxdHuwK+b2ZDzIHj3x7CHJt7438ahl6t2y5EGHVPxrBfqVMWz3QWcXpwElB9xNM48kIE=@vger.kernel.org
X-Gm-Message-State: AFuF++nQEIsl1lxNxFsXShZObPyF1lSjuTs0OEHD+mtsXbEctJUH3Ys8
	48gpa2AqkkqseRN8uOJsMQzn+V7lF4mLM6tP/BDdmk76pFarLhmyqiW69NpPnXg9L/4=
X-Gm-Gg: AYBFou1mOZ1JPkBOmAS3usyM67lFQ7gf88JZxjecHC/otAkx3YJ6AoiRtBDJ7aa8iUG
	1RuGPPt4oHo/so2l9JTNSF3WDY7TQd5XQx/I3h++hhOBUjX1X4Ba+pdV18zNMyNhu0wmXhCJ/fA
	epOnuNBkxTSRORerIR52d3Bl7C7LNSm+7YbumN/r69B4Elm+5fGzajUJSkeku29/VR7xRgdjuqi
	0TWdXMGt+ZyyodlDvgR3XAhpo+ZRPWOiX7TYMaeR8aUIFs9Z3rjEf381QhJRVy7zu5uAEmWfDnt
	LDvG3ZuFByszegVVvp2gBX11+Z0//5g1Lx/fA2ulpWB3rGrr3Qxn3uhNLkMZL3617EGTP+ymUfV
	6/4b7tj4On1onT0c4miCysfKW/AnZC8SxfpaHFWiAfmAocPqK7tiSiw4KCrOvEAwYqLhG/dPt3X
	rcUgkABH8dBwLa7/foYDIKv56r4mdmp0pLIWnbd2jEgHM8QqgTBKK/YK/H4sZT3g89uWDm4Z71w
	8MBXcvZxsawIUBQunrHePnaV7gUX3HYwU7ZAAjAe1vL4g==
X-Received: by 2002:a17:90b:50cc:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-39b26202ebamr61815629a91.14.1789022032532;
        Wed, 09 Sep 2026 23:33:52 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.33.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:33:52 -0700 (PDT)
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
Subject: [PATCH v6 08/17] mm/sparse-vmemmap: support section-based vmemmap optimization
Date: Thu, 10 Sep 2026 14:32:47 +0800
Message-ID: <20260910063256.64386-9-songmuchun@bytedance.com>
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

Teach sparse-vmemmap population code to use the compound page order
when deciding whether a vmemmap page can be optimized.

With this information, the common sparse-vmemmap population path can
allocate or reuse shared tail vmemmap pages directly instead of relying
on HugeTLB-specific handling.

This centralizes vmemmap optimization logic in the sparse-vmemmap code,
based on section metadata, and prepares for sharing the same mechanism
across different users of vmemmap optimization, including HugeTLB and
DAX.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v6:
- Use the compound page order helper in the population path
  (suggested by David Hildenbrand)
- Collect Acked-by from Mike Rapoport and Qi Zheng

v5:
- Add vmemmap_alloc_pte() to keep PTE allocation handling clearer
  (suggested by Mike Rapoport)
- Move preparatory section_nr_vmemmap_pages() changes to the previous
  patch (suggested by Mike Rapoport)

v4:
- Move section_nr_vmemmap_pages() outside CONFIG_MEMORY_HOTPLUG to
  fix CONFIG_MEMORY_HOTPLUG=n builds (reported by kernel test robot)

v2:
- Keep vmemmap accounting and population logic in sparse-vmemmap.c
  (suggested by Mike Rapoport)
- Move vmemmap_get_tail() before its first use instead of adding only a
  forward declaration in the previous patch (suggested by Mike Rapoport)
- Simplify the PMD path handling for HVO-covered sections
---
 mm/sparse-vmemmap.c | 46 +++++++++++++++++++++++++++++++++++++--------
 mm/sparse.c         |  4 ++--
 mm/sparse.h         |  7 +++++++
 3 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index e2a2a5eab4dc..faebf344cdac 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -148,8 +148,7 @@ void __meminit vmemmap_verify(pte_t *pte, int node,
 			start, end - 1);
 }
 
-#ifdef CONFIG_MEMORY_HOTPLUG
-static int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
+int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
 		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
 {
 	const struct mem_section *ms = __pfn_to_section(pfn);
@@ -175,7 +174,6 @@ static int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long n
 
 	return 0;
 }
-#endif
 
 static void * __meminit vmemmap_alloc_block_zero(unsigned long size, int node)
 {
@@ -215,19 +213,44 @@ static __meminit struct page *vmemmap_get_tail(unsigned int order, struct zone *
 
 	return tail;
 }
+#else
+static inline struct page *vmemmap_get_tail(unsigned int order, struct zone *zone)
+{
+	return NULL;
+}
 #endif
 
+static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
+					 struct vmem_altmap *altmap)
+{
+	struct zone *zone;
+	struct page *page;
+	const unsigned int order = pfn_to_section_compound_order(pfn);
+
+	if (!vmemmap_optimizable_pfn(pfn))
+		return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
+
+	zone = pfn_to_zone(pfn, node);
+	page = vmemmap_get_tail(order, zone);
+	if (!page)
+		return NULL;
+
+	return page_address(page);
+}
+
 static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
 				       struct vmem_altmap *altmap,
 				       unsigned long ptpfn, unsigned long flags)
 {
 	pte_t *pte = pte_offset_kernel(pmd, addr);
+	unsigned long pfn = page_to_pfn((struct page *)addr);
+
 	if (pte_none(ptep_get(pte))) {
 		pte_t entry;
-		void *p;
 
 		if (ptpfn == (unsigned long)-1) {
-			p = vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
+			void *p = vmemmap_alloc_pte(pfn, node, altmap);
+
 			if (!p)
 				return NULL;
 			ptpfn = PHYS_PFN(__pa(p));
@@ -246,7 +269,8 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 		}
 		entry = pfn_pte(ptpfn, PAGE_KERNEL);
 		set_pte_at(&init_mm, addr, pte, entry);
-	}
+	} else if (WARN_ON_ONCE(vmemmap_optimizable_pfn(pfn)))
+		return NULL;
 	return pte;
 }
 
@@ -435,6 +459,9 @@ int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
 	pmd_t *pmd;
 
 	for (addr = start; addr < end; addr = next) {
+		unsigned long pfn = page_to_pfn((struct page *)addr);
+		const struct mem_section *ms = __pfn_to_section(pfn);
+
 		next = pmd_addr_end(addr, end);
 
 		pgd = vmemmap_pgd_populate(addr, node);
@@ -450,7 +477,7 @@ int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
 			return -ENOMEM;
 
 		pmd = pmd_offset(pud, addr);
-		if (pmd_none(pmdp_get(pmd))) {
+		if (pmd_none(pmdp_get(pmd)) && !section_vmemmap_optimizable(ms)) {
 			void *p;
 
 			p = vmemmap_alloc_block_buf(PMD_SIZE, node, altmap);
@@ -468,8 +495,11 @@ int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
 				 */
 				return -ENOMEM;
 			}
-		} else if (vmemmap_check_pmd(pmd, node, addr, next))
+		} else if (vmemmap_check_pmd(pmd, node, addr, next)) {
+			if (WARN_ON_ONCE(section_vmemmap_optimizable(ms)))
+				return -EOPNOTSUPP;
 			continue;
+		}
 		if (vmemmap_populate_basepages(addr, next, node, altmap))
 			return -ENOMEM;
 	}
diff --git a/mm/sparse.c b/mm/sparse.c
index c84b4c7b8c70..e6cb67ca9c8d 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -305,8 +305,8 @@ static void __init sparse_init_nid(int nid, unsigned long pnum_begin,
 							nid, NULL, NULL);
 			if (!map)
 				panic("Failed to allocate memmap for section %lu\n", pnum);
-			memmap_boot_pages_add(DIV_ROUND_UP(PAGES_PER_SECTION * sizeof(struct page),
-							   PAGE_SIZE));
+			memmap_boot_pages_add(section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION,
+								       NULL, NULL));
 			sparse_init_early_section(nid, map, pnum, 0);
 		}
 	}
diff --git a/mm/sparse.h b/mm/sparse.h
index 563fc1f4d717..74dd79c51e75 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -111,8 +111,15 @@ static inline void sparse_init(void) {}
  */
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 void sparse_init_subsection_map(void);
+int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
+		struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
 #else
 static inline void sparse_init_subsection_map(void) {}
+static inline int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
+		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
+{
+	return DIV_ROUND_UP(nr_pages * sizeof(struct page), PAGE_SIZE);
+}
 #endif /* CONFIG_SPARSEMEM_VMEMMAP */
 
 #endif /* __MM_SPARSE_H */
-- 
2.54.0

