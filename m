Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81D62F9D98
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022050; cv=none; b=KYzv/IJopFLL9JeZoRx5z/ED6cmMJoYa1lNPeql2xKgq2hcIsTHYxN2LTyAYVTPc7o5nj+xPf43WYW4XGE0HLCVBiJHt3HqgOCdfj/GDhh7d8U5hEwxH2I0meY6kIOiKG11uDIBP7bIg6V1V491K4213rJLKoFFqveJLgwcYXlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022050; c=relaxed/simple;
	bh=U/k/rld+9Eg8VGuMNjqIp0CcDPcMAkDReLdXY1Cw5fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UO4lfQXBEi/VLeIxW6t4VPr8Gc04jIECNIW/3ACXtp9QHPptz+G1gh+mtfXznTYXLXBrJDI2RChBx/twpwzp10NJXfuiLSiosfjqyuLI8WuQYuiKZNQjUb/XM91F6ulIVTDRRaef52DVfa6E3Qz6va6ICtKf8/CvBy8OOCpP50U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=IYHO6jxT; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="IYHO6jxT"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc891373e0so70418435ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022046; x=1789626846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0F4KwhTuI2kCSSXKNIULS4SoWuNBUuvow/5FgUy1rc=;
        b=IYHO6jxTpaI9/C8MZO/n/+N9DUq78JIyGZksBA+xqSwNGf4OLHJiGpoFmToPTsl4D1
         1t/R+Y33LeOxw5894WUZbxW3FjQvscIe4Nl8QPpOEer8sSSscHg3/LoYDvE6/A2rZ3MJ
         WrVsWQ+3AKsoLA0yNQw1s6xGrCo63hnaBunI9rphkK9VPcYhFt8GQgG+yLTm97oJgxbL
         EXD295zYqVjArsSHAWlXXheT86lVZvD4eYqBkwrObyuBFIKmrIcjKmdJDUS29IoxC0ac
         vMffPjuiKeEom0jwZUvs2xpIiDhWqM1yrtJj4AyfO1/EgzuSxo+ecbPG3hJ/NyHna15b
         +vZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022046; x=1789626846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b0F4KwhTuI2kCSSXKNIULS4SoWuNBUuvow/5FgUy1rc=;
        b=R7SbUJ6Gjpz7kraXQWUCnkakMA60tKy/2nBtb94iB2/gghNMsBJ9+9kOgCbcZSTFQK
         rLmF/8KVdhqtdBbZmIF6GcxOCplhEp7Hagn4BUs1/e+Z3T/rfdSspkbcfYJdrfAFleGf
         MhvT0kKZ+cD61/f18ibNjk28U2RpBSHjS2fEobi+x65G65qYLSIIKClINOtxGYMevlVl
         zO5+D3DQ3zozErzgfG80YJ+a8vO9yJGVHXOAL66N97ZJLFD1gHme4hKOQYnNtnfuFf8X
         el9MHwbQj4lthrUmhMbicxGSuYJOKqpgK0gAA/Bko4k6mYtri4zbi0v8FNDDBiLCRmKu
         3NTg==
X-Forwarded-Encrypted: i=1; AKwUvBzvLVAnRi2rEBNLqgQf+ebWOG3t0SwOsyAobGCVk5DMAzvsZY0whQnK36ezkMHX609psW28PSh3g/9KoU4=@vger.kernel.org
X-Gm-Message-State: AFuF++mMznBlC0RBpNyuNigrW6VMtyWcu9mxlDfCirXd5dNwrFV9T2EX
	nm97oJR+wg4XiZnmMAJMDK4uojmNbWjr7e6+00kedKRk6WriMpeOASnjc5obUw7BHr0=
X-Gm-Gg: AYBFou3vzPC1ZqItTtzVNay4EPkYt7tQv9I7bMOsJVrSazsxh3bpB1MUa+3Wv/Qt9m6
	LvL78rFx6v1IfPcM8JPlWEe7jFPeKBxefI1Ub1GPHA4ZNoviyK1c8RDXNDkckyKZileQujKvuZ0
	4sn5PO0pIdcnEOX0+ikPHLMWoa22L8SDBUNZtSpk+JHsisPvgerKSQNCfG8tNL5+4sYbpcVBvbg
	+UcGHHa/xtnU2bSOztlxQrYry43Bf1IIu6imvfOcUxxB2cdmPgtq3+llxpnrbLKIZ1IkUuBh4Ri
	ZUTl+lxAdd+jXpWabOntZfk0tVNvB25JJ0VF5QzLUTqAi0+RQxbe8mmS0yDtTMpmzI0N0X6eUOF
	AAbM8ezeNz0PozkDs/9IcRZVhH8Moi5CWBi0W+MXzU70H/arCnTWaWbEbr+6yi+iwFiki1Q+hdL
	FwRaej/QYwTu30v/uYKL1/gjDar/s0iXDSGIoP+jwffUc7s3CI86Jo/BS8BMOVGIxNpPNSCeqpc
	wUAzB1scm7fX1MpnEmItw1UI1IM7ihkfvw=
X-Received: by 2002:a17:90b:3c45:b0:398:9beb:5c19 with SMTP id 98e67ed59e1d1-39b26232bb1mr58422244a91.20.1789022045807;
        Wed, 09 Sep 2026 23:34:05 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.34.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:34:04 -0700 (PDT)
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
Subject: [PATCH v6 11/17] mm/sparse-vmemmap: remove SPARSEMEM_VMEMMAP_PREINIT support
Date: Thu, 10 Sep 2026 14:32:50 +0800
Message-ID: <20260910063256.64386-12-songmuchun@bytedance.com>
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

SPARSEMEM_VMEMMAP_PREINIT existed only to support HugeTLB's early
vmemmap optimization setup.

Now that HugeTLB bootmem vmemmap optimization uses the common
section-based sparse-vmemmap path, the sparse initialization code no
longer needs a separate pre-initialization mechanism for vmemmap
population.

Remove the related Kconfig symbols, section flag, and empty early hook,
so present sections always go through the normal sparse setup path.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v6:
- Collect Acked-by from Qi Zheng and David Hildenbrand

v2:
- Collect Acked-by from Mike Rapoport
---
 arch/x86/Kconfig       |  1 -
 fs/Kconfig             |  1 -
 include/linux/mmzone.h | 25 -------------------------
 mm/Kconfig             |  5 -----
 mm/sparse-vmemmap.c    | 13 -------------
 mm/sparse.c            | 23 ++++++++---------------
 6 files changed, 8 insertions(+), 60 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecac..7aa74bcc72f9 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -150,7 +150,6 @@ config X86
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP	if X86_64
 	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP	if X86_64
-	select ARCH_WANT_HUGETLB_VMEMMAP_PREINIT if X86_64
 	select ARCH_WANTS_THP_SWAP		if X86_64
 	select ARCH_HAS_PARANOID_L1D_FLUSH
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
diff --git a/fs/Kconfig b/fs/Kconfig
index e05917adcd60..d1c210c6508f 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -278,7 +278,6 @@ config HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 	def_bool HUGETLB_PAGE
 	depends on ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	depends on SPARSEMEM_VMEMMAP
-	select SPARSEMEM_VMEMMAP_PREINIT if ARCH_WANT_HUGETLB_VMEMMAP_PREINIT
 
 config HUGETLB_PMD_PAGE_TABLE_SHARING
 	def_bool HUGETLB_PAGE
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 2c4f63e379da..f2d39a888eac 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2095,9 +2095,6 @@ enum {
 	SECTION_IS_EARLY_BIT,
 #ifdef CONFIG_ZONE_DEVICE
 	SECTION_TAINT_ZONE_DEVICE_BIT,
-#endif
-#ifdef CONFIG_SPARSEMEM_VMEMMAP_PREINIT
-	SECTION_IS_VMEMMAP_PREINIT_BIT,
 #endif
 	SECTION_MAP_LAST_BIT,
 };
@@ -2109,9 +2106,6 @@ enum {
 #ifdef CONFIG_ZONE_DEVICE
 #define SECTION_TAINT_ZONE_DEVICE	BIT(SECTION_TAINT_ZONE_DEVICE_BIT)
 #endif
-#ifdef CONFIG_SPARSEMEM_VMEMMAP_PREINIT
-#define SECTION_IS_VMEMMAP_PREINIT	BIT(SECTION_IS_VMEMMAP_PREINIT_BIT)
-#endif
 #define SECTION_MAP_MASK		(~(BIT(SECTION_MAP_LAST_BIT) - 1))
 #define SECTION_NID_SHIFT		SECTION_MAP_LAST_BIT
 
@@ -2166,24 +2160,6 @@ static inline int online_device_section(const struct mem_section *section)
 }
 #endif
 
-#ifdef CONFIG_SPARSEMEM_VMEMMAP_PREINIT
-static inline int preinited_vmemmap_section(const struct mem_section *section)
-{
-	return (section &&
-		(section->section_mem_map & SECTION_IS_VMEMMAP_PREINIT));
-}
-
-void sparse_vmemmap_init_nid_early(int nid);
-#else
-static inline int preinited_vmemmap_section(const struct mem_section *section)
-{
-	return 0;
-}
-static inline void sparse_vmemmap_init_nid_early(int nid)
-{
-}
-#endif
-
 static inline int online_section_nr(unsigned long nr)
 {
 	return online_section(__nr_to_section(nr));
@@ -2385,7 +2361,6 @@ static inline unsigned long next_present_section_nr(unsigned long section_nr)
 #endif
 
 #else
-#define sparse_vmemmap_init_nid_early(_nid) do {} while (0)
 #define pfn_in_present_section pfn_valid
 #endif /* CONFIG_SPARSEMEM */
 
diff --git a/mm/Kconfig b/mm/Kconfig
index 604c58199acb..2c385f8b2944 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -461,8 +461,6 @@ config SPARSEMEM_VMEMMAP
 	  pfn_to_page and page_to_pfn operations.  This is the most
 	  efficient option when sufficient kernel resources are available.
 
-config SPARSEMEM_VMEMMAP_PREINIT
-	bool
 #
 # Select this config option from the architecture Kconfig, if it is preferred
 # to enable the feature of HugeTLB/dev_dax vmemmap optimization.
@@ -473,9 +471,6 @@ config ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 config ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	bool
 
-config ARCH_WANT_HUGETLB_VMEMMAP_PREINIT
-	bool
-
 config HAVE_MEMBLOCK_PHYS_MAP
 	bool
 
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 8c2b9bed236d..f22d815d7af0 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -594,19 +594,6 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 	return pfn_to_page(pfn);
 }
 
-#ifdef CONFIG_SPARSEMEM_VMEMMAP_PREINIT
-/*
- * This is called just before initializing sections for a NUMA node.
- * Any special initialization that needs to be done before the
- * generic initialization can be done from here. Sections that
- * are initialized in hooks called from here will be skipped by
- * the generic initialization.
- */
-void __init sparse_vmemmap_init_nid_early(int nid)
-{
-}
-#endif
-
 static void subsection_mask_set(unsigned long *map, unsigned long pfn,
 		unsigned long nr_pages)
 {
diff --git a/mm/sparse.c b/mm/sparse.c
index 428d81838ece..f4f393a033a4 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -283,27 +283,20 @@ static void __init sparse_init_nid(int nid, unsigned long pnum_begin,
 	if (sparse_usage_init(nid, map_count))
 		panic("Failed to allocate usemap for node %d\n", nid);
 
-	sparse_vmemmap_init_nid_early(nid);
-
 	for_each_present_section_nr(pnum_begin, pnum) {
-		struct mem_section *ms;
 		unsigned long pfn = section_nr_to_pfn(pnum);
+		struct page *map;
 
 		if (pnum >= pnum_end)
 			break;
 
-		ms = __nr_to_section(pnum);
-		if (!preinited_vmemmap_section(ms)) {
-			struct page *map;
-
-			map = __populate_section_memmap(pfn, PAGES_PER_SECTION,
-							nid, NULL, NULL);
-			if (!map)
-				panic("Failed to allocate memmap for section %lu\n", pnum);
-			memmap_boot_pages_add(section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION,
-								       NULL, NULL));
-			sparse_init_early_section(nid, map, pnum, 0);
-		}
+		map = __populate_section_memmap(pfn, PAGES_PER_SECTION,
+						nid, NULL, NULL);
+		if (!map)
+			panic("Failed to allocate memmap for section %lu\n", pnum);
+		memmap_boot_pages_add(section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION,
+							       NULL, NULL));
+		sparse_init_early_section(nid, map, pnum, 0);
 	}
 	sparse_usage_fini();
 }
-- 
2.54.0

