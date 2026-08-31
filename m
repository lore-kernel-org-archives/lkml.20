Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D043B2FC8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162903; cv=none; b=IAYEYgOUZ4QiRTZIwkrFpDDP93ut/TAX68vDIznRUl5riYO83YZAxkEkk597+hiARVuJytPW5uLz7+YPQeIBCAYuEhFNpJb4ofpwPzxpx1eOYd08wSa0sP7I3ZrJ+wGRPEoCHQ1+mRUxBesFqyS7VWYIe1dpEo3AfiaXuZPfdZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162903; c=relaxed/simple;
	bh=0fzWxzOVe0HaP6mmmUOGPsdZyD1efaBndlEqFksa+Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hOM2M1m5O8TsoZ3kjhRaomYeNfssvBkQND9vHD7pr3P19TXDwvJlX9WPU+10HseDVqQCOrT8KR+U69fH15/QwquSv1i4WxWO/HX3rke79IsScg0E6gZ8hT4oEfNap1vjJ58J6AEkgvFXUFFlK90BGYT3HECvo20lXvfgRvgHNek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=cZJrTZgn; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="cZJrTZgn"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so3268215a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788162901; x=1788767701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fLjmUTfKT3TRPIaKPcH4qoh94gQxw3yJaaLiOmIzFs=;
        b=cZJrTZgnEHnLecBRf0PB4/2x3FsLuH/pnMShQAmWNHYD55VzoqNU+iQ5uQmDWp64Sv
         fiuFEhCyNimA8bo9BITSOy16AXKCDWRYIi/MPz2kmlfEWVLnx5u/DeQxA+mLWxY18HF1
         Akammz2UppYDXnQfaBLKs2m+auisWlbmtY62FDE5frKpYoF4U47GPkmROe73cVGgE4F+
         cX3CgUP3CvDr9Z29PwFFfqOcTTYf3W/s09UQoWzsy8b1PSX5gmbzyE1ar8gvEx1q8RRb
         kLPNBmb2d0R6rW9tO6Zwqnxyud/4pu37oar9gm9IpOHjmEowQI095K8/73wBk33jkYxe
         hEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162901; x=1788767701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4fLjmUTfKT3TRPIaKPcH4qoh94gQxw3yJaaLiOmIzFs=;
        b=LXpvd5bpQESTCaXuqPisVBT4pk0H6GQIZDOyPQU8QMLBlWXAoNMpkTo/m6CiozrmH3
         xNHzlvxOFWtewJG0OxUwbKaCvmb48zr9B5UHXLfDjfsBX3SO0GeXV2wG6SLWn+1ReCvO
         ey3PYzoMROr8+XgxmPv0MqP5fZchdV0y8v4iDxYYMPePKY54OVATQ1c6TX4L7ANMQYkv
         JJraMVZ9f4AUv0M4hgeZMeCBuTVG+irvxwbI2ukqPRzpDzHRo5Tu+cUjPTjJZCpehIvI
         lmuPToVbiLk3Ot30UvZpo56MOIP4su8Jy73OOSSIZ8OB/Wpg9J1BSGd+xF3MAIx9R/PI
         gzng==
X-Forwarded-Encrypted: i=1; AHgh+RoQOMPHsJDXWIgPRNHnNziSYsinDYKlkZOz1RrxIbQKkwzD99j9gEedPM6GBiiyYVOzdroBnMj0DxYZ+jI=@vger.kernel.org
X-Gm-Message-State: AFuF++k2QTnuQeeqCv6AtjwLFtK8f9oxzpjzVAPAIkTrCp2rlDIDD3S2
	11RVpofbUgq31eV+gkDJ66afRI4m38Dj2puA+2kUQ+lLsIRjTys+KqLubmcWOtnEt5s=
X-Gm-Gg: AR+sD10t35KfVH+fuGRicJ9FDfFEt9MYxoigSxblboSOQrW5HaBmRxNOVfPOs/h/ZIM
	YB8Ad17tFyp9pXUeIhyUD8aeCUETiv5Qk+Ay+OwiZPsEXXU/Vbk/YM/ByqPO7Dv7uKsuiH783nc
	vhITAAVkBumqGAlDg99rTdPT0J84gYflYRKbvX9MOwLq17P1Y3r2B/tw6NmQQj07zyBUkl/gWrh
	bv+Nx/L4sTgJHv7DWxt25sww2rz1pPQsFHAOn8SfgwHAU8Gt8picOM8wiQ2VUdim/P/hX604gwg
	XPLbQi9l2+EvZdzoRb3H1hKI+zPVRjtFCqqxdpDEE1Y0Go2MHGKRDBpJZRdcUg6bMToYUQfb7yO
	1krAO6ehTODK37h+KoJldiQ3JU08Gb/dJxukKlPKF+ugfm/rryeTQPxvHMVzhlSOhKoQFuZ+0z2
	SQCSAOZf6ROtb+k5nZBP7irZEQBbS/MnNmOjqz5YAoM5FS51G6E0n0gJlx5fzwdSfwpQVliQvun
	h17TlCH60XZI4aCji/dUH3t
X-Received: by 2002:a05:6a21:a09:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3d26668474amr44495998637.2.1788162900583;
        Mon, 31 Aug 2026 00:55:00 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f88csm3590256a12.10.2026.08.31.00.54.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 00:55:00 -0700 (PDT)
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
Subject: [PATCH 07/11] mm/sparse-vmemmap: move HVO helpers to a public header
Date: Mon, 31 Aug 2026 15:53:38 +0800
Message-ID: <20260831075342.57563-8-songmuchun@bytedance.com>
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

The vmemmap optimization helpers currently live in mm/sparse.h,
which is an internal MM header. That works for MM code, but
prevents powerpc from using the same interfaces without including a
private header.

Move the declarations and inline helpers to
include/linux/vmemmap-optimization.h. This is a preparatory change for
powerpc, which has its own vmemmap optimization implementation and
needs to use the HVO interfaces from architecture code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 MAINTAINERS                          |  1 +
 include/linux/vmemmap-optimization.h | 88 ++++++++++++++++++++++++++++
 mm/hugetlb.c                         |  2 +-
 mm/hugetlb_vmemmap.c                 |  2 +-
 mm/memory_hotplug.c                  |  1 +
 mm/sparse.h                          | 73 +----------------------
 6 files changed, 93 insertions(+), 74 deletions(-)
 create mode 100644 include/linux/vmemmap-optimization.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a3167bcbe589..ccc7f75bbeb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12099,6 +12099,7 @@ F:	Documentation/mm/hugetlbfs_reserv.rst
 F:	Documentation/mm/vmemmap_dedup.rst
 F:	fs/hugetlbfs/
 F:	include/linux/hugetlb.h
+F:	include/linux/vmemmap-optimization.h
 F:	include/trace/events/hugetlbfs.h
 F:	mm/hugetlb.c
 F:	mm/hugetlb_cgroup.c
diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
new file mode 100644
index 000000000000..171553fabd47
--- /dev/null
+++ b/include/linux/vmemmap-optimization.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * vmemmap-optimization.h
+ *
+ * Generic vmemmap optimization declarations.
+ *
+ * Author: Muchun Song <songmuchun@bytedance.com>
+ */
+#ifndef _LINUX_VMEMMAP_OPTIMIZATION_H
+#define _LINUX_VMEMMAP_OPTIMIZATION_H
+
+#include <linux/mmzone.h>
+
+#ifdef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
+static inline unsigned int section_order(const struct mem_section *section)
+{
+	return section->order;
+}
+
+static inline void section_set_order(struct mem_section *section, unsigned int order)
+{
+	VM_WARN_ON(section_order(section) && order && section_order(section) != order);
+	section->order = order;
+}
+
+static inline void section_set_order_range(unsigned long pfn, unsigned long nr_pages,
+					   unsigned int order)
+{
+	unsigned long section_nr = pfn_to_section_nr(pfn);
+
+	if (!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION))
+		return;
+
+	for (unsigned long i = 0; i < nr_pages / PAGES_PER_SECTION; i++)
+		section_set_order(__nr_to_section(section_nr + i), order);
+}
+
+static inline unsigned int pfn_to_section_order(unsigned long pfn)
+{
+	return section_order(__pfn_to_section(pfn));
+}
+#else
+static inline unsigned int section_order(const struct mem_section *section)
+{
+	return 0;
+}
+
+static inline void section_set_order(struct mem_section *section, unsigned int order)
+{
+}
+
+static inline void section_set_order_range(unsigned long pfn, unsigned long nr_pages,
+					   unsigned int order)
+{
+}
+
+static inline unsigned int pfn_to_section_order(unsigned long pfn)
+{
+	return 0;
+}
+#endif /* CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION */
+
+static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
+{
+	const unsigned int order = pfn_to_section_order(pfn);
+	const unsigned long nr_pages = 1UL << order;
+
+	if (!is_power_of_2(sizeof(struct page)))
+		return false;
+
+	return (pfn & (nr_pages - 1)) >= VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
+}
+
+static inline bool vmemmap_optimizable_order(unsigned int order)
+{
+	if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION))
+		return false;
+
+	if (!is_power_of_2(sizeof(struct page)))
+		return false;
+
+	return order >= VMEMMAP_OPTIMIZATION_MIN_ORDER;
+}
+
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+struct page *vmemmap_shared_tail_page(unsigned int order, struct zone *zone);
+#endif /* CONFIG_SPARSEMEM_VMEMMAP */
+#endif /* _LINUX_VMEMMAP_OPTIMIZATION_H */
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 8fa1bafa03d9..5aa9c0eaf2d0 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -38,6 +38,7 @@
 #include <linux/mm_inline.h>
 #include <linux/padata.h>
 #include <linux/pgalloc.h>
+#include <linux/vmemmap-optimization.h>
 
 #include <asm/page.h>
 #include <asm/tlb.h>
@@ -52,7 +53,6 @@
 #include "hugetlb_cma.h"
 #include "hugetlb_internal.h"
 #include "mm_init.h"
-#include "sparse.h"
 #include <linux/page-isolation.h>
 
 #define HUGE_BOOTMEM_ZONES_VALID	BIT(0)
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 4a57e6c3352c..25c4e7d2664c 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -15,10 +15,10 @@
 #include <linux/mmdebug.h>
 #include <linux/pagewalk.h>
 #include <linux/pgalloc.h>
+#include <linux/vmemmap-optimization.h>
 
 #include <asm/tlbflush.h>
 #include "hugetlb_vmemmap.h"
-#include "sparse.h"
 #include "internal.h"
 
 /**
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index d28bafb6fd53..4f3387632883 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -43,6 +43,7 @@
 #include "mm_init.h"
 #include "page_alloc.h"
 #include "shuffle.h"
+#include "sparse.h"
 
 enum {
 	MEMMAP_ON_MEMORY_DISABLE = 0,
diff --git a/mm/sparse.h b/mm/sparse.h
index 59b825df83b9..e511d99fc26b 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -9,77 +9,7 @@
 #define __MM_SPARSE_H
 
 #include <linux/mmzone.h>
-
-#ifdef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
-static inline unsigned int section_order(const struct mem_section *section)
-{
-	return section->order;
-}
-
-static inline void section_set_order(struct mem_section *section, unsigned int order)
-{
-	VM_WARN_ON(section_order(section) && order && section_order(section) != order);
-	section->order = order;
-}
-
-static inline void section_set_order_range(unsigned long pfn, unsigned long nr_pages,
-					   unsigned int order)
-{
-	unsigned long section_nr = pfn_to_section_nr(pfn);
-
-	if (!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION))
-		return;
-
-	for (unsigned long i = 0; i < nr_pages / PAGES_PER_SECTION; i++)
-		section_set_order(__nr_to_section(section_nr + i), order);
-}
-
-static inline unsigned int pfn_to_section_order(unsigned long pfn)
-{
-	return section_order(__pfn_to_section(pfn));
-}
-#else
-static inline unsigned int section_order(const struct mem_section *section)
-{
-	return 0;
-}
-
-static inline void section_set_order(struct mem_section *section, unsigned int order)
-{
-}
-
-static inline void section_set_order_range(unsigned long pfn, unsigned long nr_pages,
-					   unsigned int order)
-{
-}
-
-static inline unsigned int pfn_to_section_order(unsigned long pfn)
-{
-	return 0;
-}
-#endif
-
-static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
-{
-	const unsigned int order = pfn_to_section_order(pfn);
-	const unsigned long nr_pages = 1UL << order;
-
-	if (!is_power_of_2(sizeof(struct page)))
-		return false;
-
-	return (pfn & (nr_pages - 1)) >= VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
-}
-
-static inline bool vmemmap_optimizable_order(unsigned int order)
-{
-	if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION))
-		return false;
-
-	if (!is_power_of_2(sizeof(struct page)))
-		return false;
-
-	return order >= VMEMMAP_OPTIMIZATION_MIN_ORDER;
-}
+#include <linux/vmemmap-optimization.h>
 
 /*
  * mm/sparse.c
@@ -139,7 +69,6 @@ static inline void sparse_sections_init(void) {}
  * mm/sparse-vmemmap.c
  */
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-struct page *vmemmap_shared_tail_page(unsigned int order, struct zone *zone);
 void sparse_init_subsection_map(void);
 int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
 		struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
-- 
2.54.0

