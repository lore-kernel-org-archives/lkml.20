Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6EF3CF69F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022070; cv=none; b=PFFhebrnzGmQSUc3LG4tkKbmDXb60BB8UhZL/rhMg9RDkn2VW/TB/84wWaFNAZV9yih+Qza4KjlTG5Djl+7KzGWS8RSIQ5NBS41bP2hdlZ61uUiB710V0XoBQE+G0olWCp+8alVD0GITQVSYGN9fXysjRBHnSlP9k3xW4DFhRHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022070; c=relaxed/simple;
	bh=2G4gUus/H6CO32P9O6vDcNapNZOu15UMTc6GJdqSTEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBr9NxGQ65OFV7bvAcosBvvDC3YkJCvTv4O35sRd1QnauxLdodwN4m7/9FoJR8+tQBfdCK2+51hBlYqNUFCj6Ozf9Z5qbBIdVFYHxtEen+VZ76V/TrIzAyM5j6djUJ5us3T2i04R8ubrr7JrbPemYhGrtO4BEqcOZv8R2E2UI7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=d7VeFncQ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="d7VeFncQ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-39675172593so5695052a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022067; x=1789626867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jQmh4S0MKyAUesk/qTiiCNB9x5yb6aCEsrSfgP9kbM=;
        b=d7VeFncQqyIXg1QlClfSNZhBl9t9SjXAZd9uK/dGa3lxEbyD4NgTSQWHtkRp+FSerP
         UnTCfRivjGYibTLUBPY5CqDa/p0ELUwW/ssBHp2sfMSqOzlbPeBaXbt0RQj1Nlm/g57m
         DbkbzyK7GYqSAKgT02CjU/3wH0fJDl4iC/h2Jexew0T0B+IO3PjIkonq/CkhOD8TYt1z
         bz6FRcRFPxuyDTdMhMyAOmK9JKLZF/CSWpqIXRLsI97RXxRF6aAFVCj9mbM+I9Ptqbmu
         py0idrUIu3fQFlas4ideAijqQo10zPdpDjSdyS1x+12F99TplawuCeDVnzw0HMy5nCDq
         DTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022067; x=1789626867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/jQmh4S0MKyAUesk/qTiiCNB9x5yb6aCEsrSfgP9kbM=;
        b=OzcqHmSVLfCL2S+NVnSStA3esz8ZjXKV2KTqjSpOfor1nxm83gyGj8mjFWKbUT3DmM
         PhS+zGVB+BddFZPO7H048j1WsoqDPWc/tb1Qo0sCUVsKGKPL5keps4GFSZsdSaD5DBLa
         Xr0A4eEZGMQLSBo4TjuWKk3O1W1LEWFLLq/yAXI8cRz6AQQ+ig6Kt5rlWkd/3Jx0eYM0
         34nAlkBPB7aF9Ba3O1Egnlb6kJy+cFjMfYokHZrWTciKnBLALdeei9GMJBnwuluj+CKm
         C8o6F10uXfQFhDRy/1TZruLPv8Wq0Dyz8qtywkHXMWvdJR3mT5Wmf3+VvfWzUCZ19QrV
         PJBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfzUS/vg8jITuI5BTOGqG7Q9r53YxM5wo6Bt/CHr6TV/u3BSgsPw8WXarOrglMCZP6J5sFiaF6KczJk1M=@vger.kernel.org
X-Gm-Message-State: AFuF++kiq4fA59swfTJonNSOELFWL7OVW+hI01jWpWelqiLZi9tk6BWL
	RZRWloN0/98d7qw6jMuJtLI3pH4W5WWPeWIjrfyVpeZZ1EPOelm/M9uYg8GkztSAMps=
X-Gm-Gg: AYBFou01BVkwzmQgx+SDcK5D/Z+h5BcArVrDDD4d3d3tRoho1Bvkge6aiTCCOjbhgFA
	vJotOxgNabJKghQvp+f3sp1I3cg5lkwlWjVQT96Oa3WhiseOBEdTZahdHyGSyDOA1Z0At+uvugJ
	LCdtGm4lPUw9veF7oZayw2hjnacUFA7D2olQJ6d9gfiQDwuDt6a/RzO9xBqeg4LWaNDwG3/ToLu
	Hrcm0nsQRCKGjuNNHm4QAM7/FRnsrdQF11yGHW+68rdQr7vHzOxw2VJgHieevtDB71czmDAPbew
	EYLL2quGzoM1jk8IF2Qc4qz8v+LlN496YihbPaxn0w1pHCQr3hzuUTn2j6oMgPPv6FTurmSRyX4
	kB/4VUdsCvrdot7WdV5nh0qsda1mh4NINygF+zarHWQ7n6Tu3Oq6IrGB/+1/9BcOPyujRuE9PFO
	Z3mb//+aD4iWEGcFpuGVAz2tDfqMtvvw2E+0W70qpQCm7Qn1FnEs3AEuc8fYFm/Jp/Wmguld0p6
	HBmRPOTHOfTPO/PcxH3lMvGu2Jm/IuSW+O0FRNPZQucwA==
X-Received: by 2002:a17:90b:538c:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39b26204a3emr62256716a91.13.1789022066635;
        Wed, 09 Sep 2026 23:34:26 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.34.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:34:26 -0700 (PDT)
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
Subject: [PATCH v6 16/17] mm/hugetlb: localize struct huge_bootmem_page
Date: Thu, 10 Sep 2026 14:32:55 +0800
Message-ID: <20260910063256.64386-17-songmuchun@bytedance.com>
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

struct huge_bootmem_page is only used by hugetlb boot-time allocation
code, but its definition currently lives in mm/internal.h because
hugetlb_vmemmap_optimize_bootmem_page() takes it as an argument. This
exposes a hugetlb-specific internal type more broadly than needed.

Change hugetlb_vmemmap_optimize_bootmem_page() to take the information
it actually needs. With that interface, mm/hugetlb_vmemmap.h no longer
needs to include mm/internal.h, and struct huge_bootmem_page can move
into mm/hugetlb.c.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v6:
- Use the compound page order range setter (suggested by David
  Hildenbrand)
- Collect Acked-by from Qi Zheng

v2:
- Pass PFN and order to hugetlb_vmemmap_optimize_bootmem_page() instead
  of struct hstate and bootmem metadata to simplify the code further
- Collect Acked-by from Mike Rapoport
---
 mm/hugetlb.c         | 8 +++++++-
 mm/hugetlb_vmemmap.c | 9 +++------
 mm/hugetlb_vmemmap.h | 5 ++---
 mm/internal.h        | 7 -------
 4 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index f9b609b84509..c8fd3a6ce812 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -55,6 +55,12 @@
 #include "sparse.h"
 #include <linux/page-isolation.h>
 
+struct huge_bootmem_page {
+	struct list_head list;
+	struct hstate *hstate;
+	unsigned long flags;
+};
+
 int hugetlb_max_hstate __read_mostly;
 unsigned int default_hstate_idx;
 struct hstate hstates[HUGE_MAX_HSTATE];
@@ -3162,7 +3168,7 @@ static bool __init alloc_bootmem_huge_page(struct hstate *h, int nid)
 	} else {
 		list_add_tail(&m->list, &huge_boot_pages[nid]);
 		m->flags |= HUGE_BOOTMEM_ZONES_VALID;
-		hugetlb_vmemmap_optimize_bootmem_page(m);
+		hugetlb_vmemmap_optimize_bootmem_page(pfn, huge_page_order(h));
 		/*
 		 * Only initialize the head struct page in memmap_init_reserved_pages,
 		 * rest of the struct pages will be initialized by the HugeTLB
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index fba0c5a7d46f..f977d0a7e002 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -19,6 +19,7 @@
 #include <asm/tlbflush.h>
 #include "hugetlb_vmemmap.h"
 #include "sparse.h"
+#include "internal.h"
 
 /**
  * struct vmemmap_remap_walk - walk vmemmap page table
@@ -705,16 +706,12 @@ void hugetlb_vmemmap_optimize_bootmem_folios(struct hstate *h, struct list_head
 	__hugetlb_vmemmap_optimize_folios(h, folio_list, true);
 }
 
-void __init hugetlb_vmemmap_optimize_bootmem_page(struct huge_bootmem_page *m)
+void __init hugetlb_vmemmap_optimize_bootmem_page(unsigned long pfn, unsigned int order)
 {
-	struct hstate *h = m->hstate;
-	unsigned long pfn = PHYS_PFN(__pa(m));
-
 	if (!READ_ONCE(vmemmap_optimize_enabled))
 		return;
 
-	section_set_compound_order_range(pfn, pages_per_huge_page(h),
-					 huge_page_order(h));
+	section_set_compound_order_range(pfn, 1UL << order, order);
 }
 
 static const struct ctl_table hugetlb_vmemmap_sysctls[] = {
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index 20eb03df542a..464192e32dec 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -9,7 +9,6 @@
 #ifndef _LINUX_HUGETLB_VMEMMAP_H
 #define _LINUX_HUGETLB_VMEMMAP_H
 #include <linux/hugetlb.h>
-#include "internal.h"
 
 /*
  * Reserve one vmemmap page, all vmemmap addresses are mapped to it. See
@@ -26,7 +25,7 @@ long hugetlb_vmemmap_restore_folios(const struct hstate *h,
 void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio);
 void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_list);
 void hugetlb_vmemmap_optimize_bootmem_folios(struct hstate *h, struct list_head *folio_list);
-void hugetlb_vmemmap_optimize_bootmem_page(struct huge_bootmem_page *m);
+void hugetlb_vmemmap_optimize_bootmem_page(unsigned long pfn, unsigned int order);
 
 static inline unsigned int hugetlb_vmemmap_size(const struct hstate *h)
 {
@@ -77,7 +76,7 @@ static inline unsigned int hugetlb_vmemmap_optimizable_size(const struct hstate
 	return 0;
 }
 
-static inline void hugetlb_vmemmap_optimize_bootmem_page(struct huge_bootmem_page *m)
+static inline void hugetlb_vmemmap_optimize_bootmem_page(unsigned long pfn, unsigned int order)
 {
 }
 #endif /* CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP */
diff --git a/mm/internal.h b/mm/internal.h
index d7673a2b5f6b..18d147487d45 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -23,13 +23,6 @@
 #include "vma.h"
 
 struct folio_batch;
-struct hstate;
-
-struct huge_bootmem_page {
-	struct list_head list;
-	struct hstate *hstate;
-	unsigned long flags;
-};
 
 /* mm/workingset.c */
 bool workingset_test_recent(void *shadow, bool file, bool *workingset,
-- 
2.54.0

