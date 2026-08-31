Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3593C98B5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162875; cv=none; b=btYJ5+xoQYLnLgBcr+zXnlNC97Q0fmd0PyB+vELrT35LSj2fZPPEZb/uHX6ltho+ys4X8jO69RtkV5OPedZwnh92IFkQVPlPx+zSmaHJ0PToWas6yPMOSWnczzqpLizF5bBmQSWdAYWrp2/IFpeC0H5qndC/ibvOTnhosO6OzEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162875; c=relaxed/simple;
	bh=o8Aks7xfsNOUvUy+GMfdpXSPyjdlXTmKg+NBN/YdiZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PbT7oKX4GJ/GfOUhTWQPeY10H7+Cxg7dJd+un7oT+iiIMa+ZL+HPICazsaX5T+aiy1dIF025m70kSCLHWv+TSgvuiHaRxiJ+0gZyy/0dY3zPtPTZBxE+5gmsB0Lq2/1Uc5+5QHOTd8SiiWmcJR4BSiuI6w9dM+mHPGDPwQ7j3x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=gDXK/fxu; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="gDXK/fxu"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8485b358552so3095246b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788162872; x=1788767672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XjT0Dc9Rc0+WQPw0AxlsVqG1ooKsABjb50Q/PiKd2Bg=;
        b=gDXK/fxujBhG1uzwCam1wU7ulkvRcM2+skkB0CV+uulDP67k7i1cPv2JOJecQyqjdV
         5ZOAivH+rdpARi53krkJAv6HAwpqPQEhYxZaQiB+sCiALqnHg9s4iB7BapQLFG5T/lk9
         UIWBp3QlLLW+xAJYt/DMnzuw8/mlz8OW8G/OQgZ4noGaCD0dZOnHvxH+WpXa+iUiTLBG
         y37Lsai6hpGKA1W1fxC4kePWvevY7v8JeVeX3EAbhk+XjxGER8cyMd22TDHWCMrkIcg1
         Jj2B8S4Rjr7Oc/PMInWFDvfm7WwIX+yRLqIG/+mfMa6eTIKqeN4X6q2fPcljjwKL7TVh
         DpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162872; x=1788767672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XjT0Dc9Rc0+WQPw0AxlsVqG1ooKsABjb50Q/PiKd2Bg=;
        b=g7uxNJsVAe+1afU0KFLaAx/0Kjjw0yUyI00ILpu9A6S30kELWEAxXnsOFOltPHbgrT
         C6HdnId0qU6s7faxRZxGjTjvpu10V4291gaSBxUkLZfsvMYwaDGnn5Zik/LWGKoUMFMb
         TXLR2g1/8JkvwBe1Ot+tELAZjAJ1BevEdENuBJMeUfR96l5hTQJ7bLYk4Zt5E1B5m2Pd
         pJkVWPZI9+oWLvWol1VABSF5TIBMWYX77YSZv+ZLkgK5BYhWBcXwc9AxzS5ZnAMKIUH3
         z6RI7R1Dgaeg4IqJzscqZpHaDLs/jtVrqgQe9Le3wyWiyzmia1r7Lf6N3m1Qt5ebgin/
         KujQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzcgidAgBfrP4UoTD2B0p9P/NBNwLznBO5+sVIjKqyLuaOOP8uexvsLDou7sQb0EhO4FPxxE/Y7VeLf7E=@vger.kernel.org
X-Gm-Message-State: AFuF++nmxl44/Ee9OvkgXTRAEm8SuE1hv5/7l05/DE7vfqIK6KXtSMAM
	+Sc29SE8hhJx9IM/w4bZVHXcVQUjhqQwX0/VrVeZPQZPDKwft927sGauSctMKhpB3yc=
X-Gm-Gg: AR+sD122v/SHzQ5vuqYXN1gIRsA+gImqIh/DEUCeRfdOoSneSbbbAu3/marbvBjVcdG
	5XmEbHZDux0NnMvkXwJUULSSK+A6nezQ3MgzPmaAYeuZ1xe27qrWjLUgNYHq9q+fc0nqAFm+CuV
	4eLbokhGEIQbPkfUBk0f2lh8OAZahgKkYv/LSMld51Dmrrmb8hrbT+Qt+jKoCwv+WZnbPbf7jiu
	bEo7qhJEwgP4zgMlbfKBrT6p0dL4sisaFl30QAdkVxugdctJAautLoaGNG8Y4aOtcga4eL9Aswm
	xkfivERCX+Or1DiB+gGYqmoGAQE0uNiZodsvnyUZ3kKpwPPTXvIJnQVmHArGiCGhV0QRuHZb9+N
	61PpAYV7kSNCOl+gxs4YNlsWawEtL5sfIfKcXIKT/g0yLxPGrDMKDG6VdCr+KjxTuBeSb6zYx+x
	1y96cj58Ecz3sa9ZeT9thQh6hId6wuqgF0yUdd+A4weNozfyIC+Q877JgRkTgGsnIJOdeDkm4H8
	HFNw6GAa6w1rDPuZFfWZeGr
X-Received: by 2002:a05:6a00:3c8b:b0:857:726d:2e98 with SMTP id d2e1a72fcca58-857726d2fc5mr22906110b3a.21.1788162872037;
        Mon, 31 Aug 2026 00:54:32 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f88csm3590256a12.10.2026.08.31.00.54.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 00:54:31 -0700 (PDT)
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
Subject: [PATCH 01/11] mm/sparse-vmemmap: introduce CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
Date: Mon, 31 Aug 2026 15:53:32 +0800
Message-ID: <20260831075342.57563-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831075342.57563-1-songmuchun@bytedance.com>
References: <20260831075342.57563-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The section-based vmemmap optimization infrastructure is still guarded by
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP, but it also can be used by device
DAX. Introduce CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION as a common config
for the shared infrastructure.

Select the new option from HUGETLB_PAGE_OPTIMIZE_VMEMMAP and from
DEV_DAX when the architecture opts in to DAX vmemmap optimization, and
use it to guard the generic sparse-vmemmap state and helpers.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/x86/entry/vdso/vdso32/fake_32bit_build.h |  2 +-
 drivers/dax/Kconfig                           |  1 +
 fs/Kconfig                                    |  1 +
 include/linux/mm.h                            |  3 +++
 include/linux/mmzone.h                        | 13 +++++++------
 include/linux/page-flags.h                    |  5 ++---
 mm/Kconfig                                    |  3 +++
 mm/sparse.h                                   |  4 ++--
 8 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
index bc3e549795c3..5f8424eade2b 100644
--- a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
+++ b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
@@ -11,7 +11,7 @@
 #undef CONFIG_PGTABLE_LEVELS
 #undef CONFIG_ILLEGAL_POINTER_VALUE
 #undef CONFIG_SPARSEMEM_VMEMMAP
-#undef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#undef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
 #undef CONFIG_NR_CPUS
 #undef CONFIG_PARAVIRT_XXL
 
diff --git a/drivers/dax/Kconfig b/drivers/dax/Kconfig
index 602f9a0839a9..85ad4c135cdd 100644
--- a/drivers/dax/Kconfig
+++ b/drivers/dax/Kconfig
@@ -8,6 +8,7 @@ if DAX
 config DEV_DAX
 	tristate "Device DAX: direct access mapping device"
 	depends on TRANSPARENT_HUGEPAGE
+	select SPARSEMEM_VMEMMAP_OPTIMIZATION if ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 	help
 	  Support raw access to differentiated (persistence, bandwidth,
 	  latency...) memory via an mmap(2) capable character
diff --git a/fs/Kconfig b/fs/Kconfig
index d1c210c6508f..9b32ce79cc80 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -278,6 +278,7 @@ config HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 	def_bool HUGETLB_PAGE
 	depends on ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	depends on SPARSEMEM_VMEMMAP
+	select SPARSEMEM_VMEMMAP_OPTIMIZATION
 
 config HUGETLB_PMD_PAGE_TABLE_SHARING
 	def_bool HUGETLB_PAGE
diff --git a/include/linux/mm.h b/include/linux/mm.h
index a9fbe26536f4..edadd7549b72 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -5188,6 +5188,9 @@ static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
 	unsigned long nr_pages;
 	unsigned long nr_vmemmap_pages;
 
+	if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION))
+		return false;
+
 	if (!pgmap || !is_power_of_2(sizeof(struct page)))
 		return false;
 
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index c9ae7991a8b2..e9b54ea0eff0 100644
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
+	(IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION) &&	\
+	 is_power_of_2(sizeof(struct page)) ?			\
 	 MAX_FOLIO_NR_PAGES * sizeof(struct page) : 0)
 
 /* The number of retained vmemmap pages with HVO enabled. */
@@ -116,7 +116,8 @@
 #define __VMEMMAP_OPTIMIZATION_NR_ORDERS	\
 	(MAX_FOLIO_ORDER - VMEMMAP_OPTIMIZATION_MIN_ORDER + 1)
 #define VMEMMAP_OPTIMIZATION_NR_ORDERS		\
-	(__VMEMMAP_OPTIMIZATION_NR_ORDERS > 0 ? __VMEMMAP_OPTIMIZATION_NR_ORDERS : 0)
+	((__VMEMMAP_OPTIMIZATION_NR_ORDERS > 0 &&	\
+	  IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION)) ? __VMEMMAP_OPTIMIZATION_NR_ORDERS : 0)
 
 enum migratetype {
 	MIGRATE_UNMOVABLE,
@@ -1155,7 +1156,7 @@ struct zone {
 	/* Zone statistics */
 	atomic_long_t		vm_stat[NR_VM_ZONE_STAT_ITEMS];
 	atomic_long_t		vm_numa_event[NR_VM_NUMA_EVENT_ITEMS];
-#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#ifdef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
 	struct page *vmemmap_tails[VMEMMAP_OPTIMIZATION_NR_ORDERS];
 #endif
 } ____cacheline_internodealigned_in_smp;
@@ -2019,7 +2020,7 @@ struct mem_section {
 	unsigned long section_mem_map;
 
 	struct mem_section_usage *usage;
-#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#ifdef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
 	/*
 	 * Normally, sections hold regular (order-0) pages. However, for
 	 * sections with HVO enabled, this tracks the compound page order
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index ae2ebaed6d4d..de3c06062bc6 100644
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
+	if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION))
 		return false;
 
 	return is_power_of_2(sizeof(struct page));
diff --git a/mm/Kconfig b/mm/Kconfig
index c1ddf59c0d71..b5f8372cd164 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -461,6 +461,9 @@ config SPARSEMEM_VMEMMAP
 	  pfn_to_page and page_to_pfn operations.  This is the most
 	  efficient option when sufficient kernel resources are available.
 
+config SPARSEMEM_VMEMMAP_OPTIMIZATION
+	bool
+
 #
 # Select this config option from the architecture Kconfig, if it is preferred
 # to enable the feature of HugeTLB/dev_dax vmemmap optimization.
diff --git a/mm/sparse.h b/mm/sparse.h
index 049272aba84e..b408d15baf7b 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -10,7 +10,7 @@
 
 #include <linux/mmzone.h>
 
-#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#ifdef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
 static inline unsigned int section_order(const struct mem_section *section)
 {
 	return section->order;
@@ -72,7 +72,7 @@ static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
 
 static inline bool vmemmap_optimizable_order(unsigned int order)
 {
-	if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP))
+	if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION))
 		return false;
 
 	if (!is_power_of_2(sizeof(struct page)))
-- 
2.54.0

