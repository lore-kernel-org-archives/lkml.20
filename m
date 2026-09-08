Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDDF309F08
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836646; cv=none; b=TS+0H1NtxZOaKv/1ZKDKYPKCkM1wro0b8r6P1XurSG/cHxdvjYJyGC+D3MOEuY+nKsSNpyQTcW6buNXG18SdH/Cb1lDiFFYpgbM+S+v6PbRQszO9UGZJFeMtxgJ943n1orgnqLHFHtexUepryDiQJuVhLYgw70uehThlPUaJJrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836646; c=relaxed/simple;
	bh=ug15MoXQkYIwBETbu7RDyCK8xzJPchFY65UExPQwebU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EqC+3Qu0uqGtAZrr+fWqpokheTTvCFLXDZU4I1t7d6R+nKZ8JgIy8NTx7pDAPmd+kIH41S4Q0lldqnDrKItJuXOGy1kqwdORH+gNmcPB2SXmdOkoTBXdPVdo9DhT7Jrq9VhBGcnu37FvRTNeYXb0B++/ONZkOIPT9XnRZzrIU/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=T5h6JRyn; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="T5h6JRyn"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84e27035206so3755552b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788836643; x=1789441443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjEcqTpfVMGQsEndFVux5pizoY7o64l8tWT5aAqDG0w=;
        b=T5h6JRynust9dNLK5JSxUbPtE9KuYNyd3wBn8HlofuZitgVAtzkx+ofwGmO82bEca7
         ODG7bM668F+fp0Wy87GQwkQ8dbYqIF+oyXPWXRHW9ZHhc6tl/IWZWNjnl/prdxWQQxDD
         rQIXTpLXLLtNW4WoaAITeeHL5h7kebPe+8fHB0jAqS8XMsGScGPoKzFigxkU1+2y6f55
         /NvQLFbqsZtWB0mGtNNhF67E01u18ql8Ye4MZCR94KwflM7kqPjdDlNbs+HTfrwfLp3p
         qABPBTFUoWBwTmjtzgvv8Q/n2G1ouYqoLM6EmPcPiPRbwP+rcYzo44kUfy453oaKF70S
         D2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788836643; x=1789441443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjEcqTpfVMGQsEndFVux5pizoY7o64l8tWT5aAqDG0w=;
        b=tG+Nq02heAt9fmPpdtGC1ugPd67vvGnrxPQkr9Eiw85tQ2Xwy7e5hUaeSFHyliUwVy
         G2SAFG2mGRMDSac51IGU8P+xuWey1POvZpZRi9cM5DnNt4NIJEgmy55MJdODSkQyVOpJ
         3DK/6YbZHPFXwx2Zrmw7GWYZ7l/wp/C7jNrnvu1Tcf+6iS3MJK5I1yHT4kwmBXklLXEp
         c/pebdSG2+GIKK//84IQL7KTKkbs+4gqrYasEbjv3qQHr+tRKapH30fUHm6M6aC3zlRw
         CC7V/jHOBgOFoLuF3XbramRjfy3L+vei6egxbkUNRYOez+ozM4OL6PsYsN/6Nu/lZLiB
         tttQ==
X-Forwarded-Encrypted: i=1; AKwUvByhZKuf4SD/n3XAp80nQ7OsOdfYM5mKQCMDvFsod7mXAN3ZVdDQ4A8fNoeWS6KQqa8QsDoVTTTrD9PQtHY=@vger.kernel.org
X-Gm-Message-State: AFuF++kFfFL4pwFUNhfp6gI1sA9OIIHtYpYkJ5X7Ea2/4UTYLwBS8V2Y
	heenIMeqp7+IOQc98EShkO5CwPLgTcv3U5q2LuD71KQX0GEb057KmymxtGB6B2IS7Kl+OeeNshT
	3XuGc
X-Gm-Gg: AYBFou0Foz1a+22/ZiZvlj+ilgndk3A5uyA+mbMQpoFweduNpfZpIty898A2M/x4e27
	8iZXrC0uu+1rRSfMDf1HKpYABtaW03D8+j40geWzg1WeAI/bbl8lp6oZZ2fpIrrVmSbjFByYXEP
	j+mST+2bdkt2wjy9f2wkZmLI/kbBwBY4KPVWH0O6SewBzitnAPGcxWL9yOuFLdoQ3x0A4hJA1Fa
	rJrscXkhjezstaa2C2jlsnVaouzAdWG6Ki1S0lxF2ft9+k3Cd8clw3FMKcW+nFEhAYIDCd6XTAz
	/2vJ7XP5LgboAf0/K9dK7eOg1qGCGkX5+CERvFAMO8DjFAABrN5BmoL9pNcE/RkMUSoWftynVZN
	SH8oHCeTv/xWGNwdNrji0MAZJY0uw6JdYUD+b9BCOClCcrGZ4sUSaJ/09QdBXF//D/wPzZHLoyH
	kh4aDwliSKelUQ/y4Hh6XYb5PoH0ayFDGF9Zg4jRf8PZqxEMVCyNzUqj7tvKmqREh0ZveolfHiZ
	cePGwrPcwx8WvEnr8brwymR
X-Received: by 2002:a05:6a00:808:b0:84e:d5e6:a085 with SMTP id d2e1a72fcca58-86164adae77mr35546667b3a.0.1788836643380;
        Mon, 07 Sep 2026 20:04:03 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152a358a2sm4868234b3a.29.2026.09.07.20.03.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 20:04:02 -0700 (PDT)
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
Subject: [PATCH v2 01/11] mm/sparse-vmemmap: introduce CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
Date: Tue,  8 Sep 2026 11:03:25 +0800
Message-ID: <20260908030335.96549-2-songmuchun@bytedance.com>
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

The section-based vmemmap optimization infrastructure is still guarded by
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP, but it also can be used by device
DAX. Introduce CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION as a common config
for the shared infrastructure.

Select the new option from HUGETLB_PAGE_OPTIMIZE_VMEMMAP and from
DEV_DAX when the architecture opts in to DAX vmemmap optimization, and
use it to guard the generic sparse-vmemmap state and helpers.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
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
index 602f9a0839a9..6250954b0fa7 100644
--- a/drivers/dax/Kconfig
+++ b/drivers/dax/Kconfig
@@ -8,6 +8,8 @@ if DAX
 config DEV_DAX
 	tristate "Device DAX: direct access mapping device"
 	depends on TRANSPARENT_HUGEPAGE
+	depends on ZONE_DEVICE
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
index c49ef99b4413..a2ebe87e7654 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -5175,6 +5175,9 @@ static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
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
index 86dd0470da11..462e89e05548 100644
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
index 79163b7d795a..288b32dcc350 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -461,6 +461,10 @@ config SPARSEMEM_VMEMMAP
 	  pfn_to_page and page_to_pfn operations.  This is the most
 	  efficient option when sufficient kernel resources are available.
 
+config SPARSEMEM_VMEMMAP_OPTIMIZATION
+	bool
+	depends on SPARSEMEM_VMEMMAP
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

