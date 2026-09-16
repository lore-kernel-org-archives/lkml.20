Received: from mail-pj2-f20.google.com (mail-pj2-f20.google.com [74.125.227.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F2B3EC687
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541037; cv=none; b=q+aftKdGVeJHT9jHidlx8hcaacGNFNO2PelZdSYj3PQEg2zPZ3CgnaG8W+zjPiQevIxJxRnaHUllVhtWVXoveLCxFzQl+R8TyKDXiUg6Sl8nV8srSHHh4vNTF+4zIr8vH+lUJP/l63XzMbDwyawyDFU4E+Sg8y2HfRWl3F/xAnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541037; c=relaxed/simple;
	bh=Ko3YaiKEa0v5sLcORxbisHb1mdErqj3NkKNU1hORGAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cDtAJ/UQr5iZ13QZ8oF4rSszFujDAHfZHMsjRQLZwgR/u06aVw1shGMB2BJvvieLgfCb+kGXs4RP1ZVleJZxv4yCgdzU8RQ3NlZvpxIThwG3V5VMemyGqQWQZqZogHJVEh3QmbrvC5h16Oax+WPmoW/HupfeMy55Ajc6pqHXgEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RQNQC8nm; arc=none smtp.client-ip=74.125.227.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RQNQC8nm"
Received: by mail-pj2-f20.google.com with SMTP id d9443c01a7336-2d747ed9866so5612835ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789541034; x=1790145834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OKh9ewKICcZ4B1bMy6j7dzmXfE4aXD+pSJoYMr6des=;
        b=RQNQC8nmFNmN5M/X893TBi5w7ZfhmalW8txi4/R6MAIlre9O8TgIwmCwRT7xkAASQT
         vEEJNJNW67GRBHszJtutw4mZ7mAjVszahKrwetfFIU8A3Bp1j45/QsiHvnyX7xBjMek6
         HPgT12cTsxRZwiJGmV8UO2Rtj28eaIDXPg4/pzrgsFMyIcwsEuu62X/L4ZBvkyAGc4nS
         LD06D8GOSXTVgIx5EbzvxjcorEPTZlSXp0g2Vml/D1facW8nXy7Wh+l8M3HIhPWAiaa8
         o9iXi5ATY0WyTGtLH/i5rFgJQqJTXCLkrLXazrWHw4moO3vX1k5Wvq89wTUUPZJybssG
         UiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541034; x=1790145834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1OKh9ewKICcZ4B1bMy6j7dzmXfE4aXD+pSJoYMr6des=;
        b=btUyMngtv7JiQqpV2yApqjA1/Q4ydF3YT6T5C+FA6YN+1WRF0iGE0rAjYQUJBTmH0O
         tLuqfc4RFNt83+KDQyXhCNOeOAwpX4+A2vKigtDMzRDRUqqd8mwgEruZu75EBw5JHFEJ
         7cZTm/MZ1yJh5KZnFTzb6G2ZpIG9jB9xINiOLhL65GL7A4NkIIcchnXIuXayAGVksh0F
         vDN6rdw5RKqKxsWv6eg/jqCtTj1IJa8VCzjQOhNkZbbK75hlYZDQm9lo6uoFhOEbXdzK
         P9rA/sJoF226MSrj+8YpI11/WqlltzPUlHcFLUKF11TjJqbASkZVq4K2M+9btejcR8Vt
         YOow==
X-Forwarded-Encrypted: i=1; AKwUvBxP6/l6yPULLur4S4aNv+GIOpLDazsX//+Kq/5JDTo+OJFrG+xba6jX9voqems0uIqc6gd+G23h22Q1dSo=@vger.kernel.org
X-Gm-Message-State: AFuF++mDm7JpjqdIZnvnS19qyIX6dUqoxLeyko8FVNyuvo8223HYB52p
	4CrvKKKWlp3phuIa5S6f6Z+GwY8kPMmGq095tf2C103FcInmD3Udx3vEOhJo23yP/ps=
X-Gm-Gg: AYBFou2aX20/DI7McVMpwVDNBUZMFGbMPLT3sNZHCKQeTvK8YjIn9fv+8+lLMBGftmg
	DoTTuVGGWIT7M6qUJguQhQ2o9FfONSK88xXCV/9ka//+UwFACR5QJILdOhlBkJIP6LgXwGpw+4m
	ZYmSSdN8ZC7lcrncmDmll3V0jFniSIDQHCvAu1NP4sF+hwlJvJo3l8JE1Wwq17vKKEUxRsA6jC7
	q6Eb+t8yybwg+rE3uOjlazWBtPIWszcQXlM8f0/JaLVvL1SmV/4wM0Qym1p8kdhqKmnIPyvlUh/
	7/HsZVgmzbWJa131cCmFfTotkH5Ds7ZTUrMstsvqRNClTq5LztAsxW4P3R6ByJK9GPHDmzTIUBm
	dGANppYkWOejTAGMBI+sDWjA7A+xlbTreLEOjzeJVPH4gTdbQVHmUM9GuHrNLI1sgjcldF1uuYv
	iEbuyjpYeJK5QBlBo+MtL5vwpVYoccx81Mxz9G5N5rAK3Atxg1lNVOr4ncBYeyyFXQeWH9Xagaq
	InEjqSLbG5sK6U+ZJrxtgrvmc+nVw==
X-Received: by 2002:a17:903:1983:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd8e77e51fmr32018845ad.21.1789541034351;
        Tue, 15 Sep 2026 23:43:54 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f0592asm6074755ad.62.2026.09.15.23.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:43:53 -0700 (PDT)
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
Subject: [PATCH v4 01/11] mm/sparse-vmemmap: introduce CONFIG_VMEMMAP_OPTIMIZATION
Date: Wed, 16 Sep 2026 14:43:31 +0800
Message-ID: <20260916064341.1825793-2-songmuchun@bytedance.com>
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

The section-based vmemmap optimization infrastructure is still guarded by
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP, but it also can be used by device
DAX. Introduce CONFIG_VMEMMAP_OPTIMIZATION as a common config for the
shared infrastructure.

Select the new option from HUGETLB_PAGE_OPTIMIZE_VMEMMAP and from
DEV_DAX when the architecture opts in to DAX vmemmap optimization, and
use it to guard the generic sparse-vmemmap state and helpers.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
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
 drivers/dax/Kconfig                           |  2 ++
 fs/Kconfig                                    |  1 +
 include/linux/mm.h                            |  3 +++
 include/linux/mmzone.h                        | 13 +++++++------
 include/linux/page-flags.h                    |  5 ++---
 mm/Kconfig                                    |  4 ++++
 mm/sparse.h                                   |  4 ++--
 8 files changed, 22 insertions(+), 12 deletions(-)

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
 
diff --git a/drivers/dax/Kconfig b/drivers/dax/Kconfig
index 602f9a0839a9..f50c6b32d826 100644
--- a/drivers/dax/Kconfig
+++ b/drivers/dax/Kconfig
@@ -8,6 +8,8 @@ if DAX
 config DEV_DAX
 	tristate "Device DAX: direct access mapping device"
 	depends on TRANSPARENT_HUGEPAGE
+	depends on ZONE_DEVICE
+	select VMEMMAP_OPTIMIZATION if ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 	help
 	  Support raw access to differentiated (persistence, bandwidth,
 	  latency...) memory via an mmap(2) capable character
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
index acd94cecc0d3..56403841e887 100644
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
@@ -116,7 +116,8 @@
 #define __VMEMMAP_OPTIMIZATION_NR_ORDERS	\
 	(MAX_FOLIO_ORDER - VMEMMAP_OPTIMIZATION_MIN_ORDER + 1)
 #define VMEMMAP_OPTIMIZATION_NR_ORDERS		\
-	(__VMEMMAP_OPTIMIZATION_NR_ORDERS > 0 ? __VMEMMAP_OPTIMIZATION_NR_ORDERS : 0)
+	((__VMEMMAP_OPTIMIZATION_NR_ORDERS > 0 &&	\
+	  IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION)) ? __VMEMMAP_OPTIMIZATION_NR_ORDERS : 0)
 
 enum migratetype {
 	MIGRATE_UNMOVABLE,
@@ -1155,7 +1156,7 @@ struct zone {
 	/* Zone statistics */
 	atomic_long_t		vm_stat[NR_VM_ZONE_STAT_ITEMS];
 	atomic_long_t		vm_numa_event[NR_VM_NUMA_EVENT_ITEMS];
-#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#ifdef CONFIG_VMEMMAP_OPTIMIZATION
 	struct page *vmemmap_tails[VMEMMAP_OPTIMIZATION_NR_ORDERS];
 #endif
 } ____cacheline_internodealigned_in_smp;
@@ -2019,7 +2020,7 @@ struct mem_section {
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
index bc7befafb47b..0fa2eb76e4f2 100644
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
diff --git a/mm/sparse.h b/mm/sparse.h
index d3a71ef4fad0..d8c08a388e4e 100644
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
-- 
2.54.0

