Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69C34D9908
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777285; cv=none; b=amZNJlhXEmT2Lbwb+NF04fxF/cBajy+JBisXxZxN71bME7EzxSlbp2hhggrhpkz3RdzGaJxKxaqgBTxxzfhr8Kuz7gj7X4pAK/ifVptZ3LPZORKJ4KNq6WwdFZbduoZafTJzzxr8EwmXWl+6MyyuFpbFV7PlfnnrIU/I3Ynviks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777285; c=relaxed/simple;
	bh=cYdtlJGrIjZJ4uW0pcJOBrmvYlm8KjKJV0QBj83hZnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTvr7xyPoWaiOHOoPp/v+y8PoCybunEMEG/vQtJ4QZ3AJ2OJ05vWygmr1K3FHFxzyFypQuzBEPQcWNsZ4aRlv2JuqKQK00C1JdPETLXggteJEA/PK5YQlDapPiARflKS8bGFFJ0+nm4OJVqgTe04iKF1qQMyz3EONJAoo2iO6/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=h4MpRvmC; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="h4MpRvmC"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0eeda3e03so2132299a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790777262; x=1791382062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYQdJhIScJUHBWMaKSahvl3m7trT5SiIAd3TYhaGkKU=;
        b=h4MpRvmCBFnkB43j/ZA7Q5sMzrt1UXls4mUYHWhuncFsKEMY06cepz1uxGc0p9o8YJ
         vbQ7uapW+/AZyF84uhTvsCj4zmGZ4AM7nlQKse1wy1cgEXRivBoozlMsAtf4uxYQNySI
         LPC6A7WNE2kVtgnBWwJTGJGovqpiP6vaxPE+HOag5JEfRpteZ36VPe2lGVZ43k9q6yDA
         YqRFfTd1fAl4vcSKI4cWUFyAgX8U5A0wHNimpWzkq8KqJSyGD+WYBPVW52M8qcJFpQNK
         oSENfd4TMu1gk7ddv97Unkfo0iwGr7nAYAt8lkFWCEZvnmUTv1AS6Hx4i8kcO0sEhEwf
         Pd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777262; x=1791382062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYQdJhIScJUHBWMaKSahvl3m7trT5SiIAd3TYhaGkKU=;
        b=vELuglSDx+JujwtbzuLJYY14Vj7f2xWUtWMa+xjDbHXHgcfQweAGEKXO7ELsZf1vGw
         UIwrOx8q3EmwvdJAN85WLOJCO3FTh6W/T/MDQKRmdKKqKyXBJVywxfUN1mbSkaT6L6NL
         5Py5boR7qXzjN/1yhWXzxtt3oRawpFxMuOGv6PVYiOcu+eWD/9w4lhWPnc50TkJ9whG1
         9CwVc9o3+kguggaZ0rnlI4UFffS4T8mmfWdv+uygM2jA52su5SftSSrCXbBKCXfw1ThD
         f73dfxr1gycCrgPVyKCtCSffMYsOsCluMOa22vG5O2t5/qrUloTuKx737z3F78TdEhLG
         Rhcw==
X-Forwarded-Encrypted: i=1; AKwUvBydf+9Q4KpJZQ5LLBQAxf0qWZhIZipugxKAVXcaWiRIOIomjXFDO1fKu7LIjdocdczkTVkmM2Z0QUKXSno=@vger.kernel.org
X-Gm-Message-State: AFq9FYJn0BNqyP6BjEWac4Rn8jSwPKXCE2cpxh29BCMiHJ7PR9BdPCil
	OKboYcDdWMIACqKTwaNwSDbf4w+PudFxwBHb4cq3opHpigIqc5HUco2NyVuCmhtLNz8=
X-Gm-Gg: AYBFou1lblY8FIN6fZRLAqbkEK8wmT3TXy9vcGTnUvttLNVopTT8lAwSnCb1zLIlgL0
	f4xnGIk/EQSk624O3OggUxptPZupgg04og+GzgxR6D+qepTGcvvpKqB3JS4pDPWAGfJKQTwtZCX
	3RoY382S0EAcaWhXgMGmkns0Bh1t1A5GCgF5jrAy2sS0zp294sfHp4YHqYwE9j+DpRf5iMIeASM
	W99k3eWnYHv85pSoNMlu2UcoB9D35w/Efa6JaM5hYqEVSdIDheXVFHtqFU3pz6CkA1gwW/UfmGL
	4fVyQtHdrSg98BPX3jI1Ba1b9hZsHzI/jJ0klVchQk7ojzTJzGf1w9Kv3WcF8/vpRwu58AUDxqw
	CjyaiUXvlCm9Jst1ZFBYyMOM3M9/xPzXWTSPshmgzW8sLSvQI5MKAPaxM7oxDkfnpl+WpVsvSo4
	TuO55gmpX0+Iz4M4Q9nwq4zvCNbqD+LaDdNdHMhtwUuCCChTJNwotVgAoarL6UVA+PtEeJOejLH
	GnNnrxj10WA5g==
X-Received: by 2002:a17:90b:574b:b0:39e:6c68:1550 with SMTP id 98e67ed59e1d1-3a4d152ef8dmr727985a91.24.1790777262347;
        Wed, 30 Sep 2026 07:07:42 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e60ea12csm639509a91.1.2026.09.30.07.07.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 07:07:41 -0700 (PDT)
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
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v6 03/12] mm/sparse-vmemmap: introduce CONFIG_VMEMMAP_OPTIMIZATION
Date: Wed, 30 Sep 2026 22:06:18 +0800
Message-ID: <20260930140627.57431-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930140627.57431-1-songmuchun@bytedance.com>
References: <20260930140627.57431-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The section-based vmemmap optimization infrastructure is guarded by
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP, but it can also be used by
ZONE_DEVICE users that set dev_pagemap::vmemmap_shift. Introduce
CONFIG_VMEMMAP_OPTIMIZATION as a common config for the shared
infrastructure.

Select the new option from HUGETLB_PAGE_OPTIMIZE_VMEMMAP and from
ZONE_DEVICE when the architecture opts in to DAX vmemmap optimization,
and use it to guard the generic sparse-vmemmap state and helpers.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v6:
- Collect Acked-by from David Hildenbrand

v5:
- Move this patch after the shared tail-page factoring.
- Select VMEMMAP_OPTIMIZATION from ZONE_DEVICE instead of DEV_DAX,
  covering all users of dev_pagemap::vmemmap_shift, reported by
  Sashiko.

v4:
- Rename SPARSEMEM_VMEMMAP_OPTIMIZATION to VMEMMAP_OPTIMIZATION
  (suggested by Mike Rapoport)
- Collect Acked-by from Mike Rapoport

v2:
- Fix SPARSEMEM_VMEMMAP_OPTIMIZATION being selected without SPARSEMEM_VMEMMAP
  reported by Sashiko.
- Add an explicit DEV_DAX dependency on ZONE_DEVICE
- Collect Acked-by from Qi Zheng
---
 arch/x86/entry/vdso/vdso32/fake_32bit_build.h |  2 +-
 fs/Kconfig                                    |  1 +
 include/linux/mm.h                            |  3 +++
 include/linux/mmzone.h                        | 10 +++++-----
 include/linux/page-flags.h                    |  5 ++---
 mm/Kconfig                                    |  5 +++++
 mm/sparse-vmemmap.c                           |  2 +-
 mm/sparse.h                                   |  6 +++---
 8 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
index bc3e549795c3..72a92cb9b53d 100644
--- a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
+++ b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
@@ -11,7 +11,7 @@
 #undef CONFIG_PGTABLE_LEVELS
 #undef CONFIG_ILLEGAL_POINTER_VALUE
 #undef CONFIG_SPARSEMEM_VMEMMAP
-#undef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#undef CONFIG_VMEMMAP_OPTIMIZATION
 #undef CONFIG_NR_CPUS
 #undef CONFIG_PARAVIRT_XXL
 
diff --git a/fs/Kconfig b/fs/Kconfig
index d1c210c6508f..1454b7fe9641 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -278,6 +278,7 @@ config HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 	def_bool HUGETLB_PAGE
 	depends on ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	depends on SPARSEMEM_VMEMMAP
+	select VMEMMAP_OPTIMIZATION
 
 config HUGETLB_PMD_PAGE_TABLE_SHARING
 	def_bool HUGETLB_PAGE
diff --git a/include/linux/mm.h b/include/linux/mm.h
index c49ef99b4413..070ce27e9cd3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -5175,6 +5175,9 @@ static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
 	unsigned long nr_pages;
 	unsigned long nr_vmemmap_pages;
 
+	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
+		return false;
+
 	if (!pgmap || !is_power_of_2(sizeof(struct page)))
 		return false;
 
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 68807ff7f946..ee9cbaaa63f4 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -102,9 +102,9 @@
  *
  * HVO which is only active if the size of struct page is a power of 2.
  */
-#define MAX_FOLIO_VMEMMAP_ALIGN \
-	(IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP) && \
-	 is_power_of_2(sizeof(struct page)) ? \
+#define MAX_FOLIO_VMEMMAP_ALIGN					\
+	(IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION) &&		\
+	 is_power_of_2(sizeof(struct page)) ?			\
 	 MAX_FOLIO_NR_PAGES * sizeof(struct page) : 0)
 
 /* The number of retained vmemmap pages with HVO enabled. */
@@ -1150,7 +1150,7 @@ struct zone {
 	/* Zone statistics */
 	atomic_long_t		vm_stat[NR_VM_ZONE_STAT_ITEMS];
 	atomic_long_t		vm_numa_event[NR_VM_NUMA_EVENT_ITEMS];
-#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#ifdef CONFIG_VMEMMAP_OPTIMIZATION
 	struct page **vmemmap_tails;
 #endif
 } ____cacheline_internodealigned_in_smp;
@@ -2014,7 +2014,7 @@ struct mem_section {
 	unsigned long section_mem_map;
 
 	struct mem_section_usage *usage;
-#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#ifdef CONFIG_VMEMMAP_OPTIMIZATION
 	/*
 	 * Normally, sections hold regular (order-0) pages. However, for
 	 * sections with HVO enabled, this tracks the compound page order
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 86dd0470da11..7080a6a1a79e 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -208,14 +208,13 @@ enum pageflags {
 static __always_inline bool compound_info_has_mask(void)
 {
 	/*
-	 * Limit mask usage to HugeTLB vmemmap optimization (HVO) where it
-	 * makes a difference.
+	 * Limit mask usage to HVO where it makes a difference.
 	 *
 	 * The approach with mask would work in the wider set of conditions,
 	 * but it requires validating that struct pages are naturally aligned
 	 * for all orders up to the MAX_FOLIO_ORDER, which can be tricky.
 	 */
-	if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP))
+	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
 		return false;
 
 	return is_power_of_2(sizeof(struct page));
diff --git a/mm/Kconfig b/mm/Kconfig
index bc7befafb47b..30170a936f1f 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -461,6 +461,10 @@ config SPARSEMEM_VMEMMAP
 	  pfn_to_page and page_to_pfn operations.  This is the most
 	  efficient option when sufficient kernel resources are available.
 
+config VMEMMAP_OPTIMIZATION
+	bool
+	depends on SPARSEMEM_VMEMMAP
+
 #
 # Select this config option from the architecture Kconfig, if it is preferred
 # to enable the feature of HugeTLB/dev_dax vmemmap optimization.
@@ -1220,6 +1224,7 @@ config ZONE_DMA32
 config ZONE_DEVICE
 	bool "Device memory (pmem, HMM, etc...) hotplug support"
 	depends on MEMORY_HOTREMOVE
+	select VMEMMAP_OPTIMIZATION if ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 	select XARRAY_MULTI
 
 	help
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 0ace48268095..6916a3690778 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -169,7 +169,7 @@ static void * __meminit vmemmap_alloc_block_zero(unsigned long size, int node)
 	return p;
 }
 
-#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#ifdef CONFIG_VMEMMAP_OPTIMIZATION
 #define VMEMMAP_OPTIMIZATION_NR_ORDERS	(MAX_FOLIO_ORDER - VMEMMAP_OPTIMIZATION_MIN_ORDER + 1)
 
 static __ref struct page **vmemmap_tails(struct zone *zone)
diff --git a/mm/sparse.h b/mm/sparse.h
index 6e7aaeaa5594..326ad43bb5c3 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -10,7 +10,7 @@
 
 #include <linux/mmzone.h>
 
-#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#ifdef CONFIG_VMEMMAP_OPTIMIZATION
 static inline unsigned int section_compound_order(const struct mem_section *section)
 {
 	return section->compound_page_order;
@@ -75,7 +75,7 @@ static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
 
 static inline bool vmemmap_optimizable_order(unsigned int order)
 {
-	if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP))
+	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
 		return false;
 
 	if (!is_power_of_2(sizeof(struct page)))
@@ -142,7 +142,7 @@ static inline void sparse_sections_init(void) {}
  * mm/sparse-vmemmap.c
  */
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#ifdef CONFIG_VMEMMAP_OPTIMIZATION
 struct page *vmemmap_shared_tail_page(unsigned int order, struct zone *zone);
 #endif
 void sparse_init_subsection_map(void);
-- 
2.54.0

