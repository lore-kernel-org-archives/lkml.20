Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82373CB2F8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022028; cv=none; b=G4Bbwd8N0hpL6ZzMLU2crS8WfV9XkDn9ERpzbfkAB+MuC6qA367yiZCywFSZLqvGrlqkqdNKP6aeWD+S1gr45GZ4i2uiB4h6TQtJIlTIjB/JJS6on1/WnNbmxxw/Uu6ccHJANMPYvntwIdtalzgq5MQuLq69dSWgK8A0214g3wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022028; c=relaxed/simple;
	bh=tl7UM0nvXQVy6DcRjTkdTEbH8T0nV+ihXtWeAogjpiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twnDLNAvBUBHf1nvg1478CLLNqvp9ofHm08fTf6k8nTlyZfyatipX4pd2A8Ch5w/zZ7EZf7JTBz9MiDcnwEduUASztOMQ/j9/d0dm2i+Z8P3mmWXRhKPTBb/Gr+K/x0pNSwUwAGt9E8SB12QrxH2q9VvfenZcrlwVgxaETkwPPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=H30SjaII; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="H30SjaII"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso7079181a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022021; x=1789626821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wA3VEQ0Gv26Nz0ZpUy3A1OXLwMHz5Ri5QNZ6qYOOTyY=;
        b=H30SjaIIEAtaK/+LFCjoRr3F4K92FSPdR+hZFRSAuDFTIO+fjYTlRSUL427rdb2DA3
         LRi9f6Z9B1mZfyHVy9YLlD69mwLBZKrGD1lfoSJItmG9sZ9AD7RI+l2myMGzhmA2C1cj
         KvrTi+o75Mrrdm4N/XbqIQB9BRDjHaZfaCTzaRFCy/1WX604jAlc5inzMTfK0SdKhllT
         RwdQtkYfs2XzBIBiyVPOr0fzu5B7dkCl1fYJ64kHfiqNE5ONPRRinRG8FzzSDOeV/zPQ
         E1cf/91uN5ZyFF8v6oEcDwfsXTGe0fG2xez4nR7aPyIdJcG0qxoyn95SYjkJva3t+2zB
         fGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022021; x=1789626821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wA3VEQ0Gv26Nz0ZpUy3A1OXLwMHz5Ri5QNZ6qYOOTyY=;
        b=HR4xwKbRa9X9hZJ5VhNiRBUHiwh/3nw6ewfedyprgzSmydUyp7NjaQ8Fl3EJswvbfx
         obFHv7LcPeGFH6EKH734AZ4BQOFnkTw97zvfENXXc88YH+GRnw5J+/hAI0JSkjGdW6Hr
         t3VYn9lHPvJMnZ9/1kz+JF8mNIPjgTtpaPJ2ysW3XSy12jgQJ6GRubWPGB7PxH5k5O7E
         vMMgJGd/7zjVnH7fJnlaafNLCIxjc5ITbTZl2G7RSBXe/iDmFaNkH0oKLZ/jOEFk/FaI
         IUgoejctNiueOHVbMGGjlJOsEaOTeQUqT/ev/jg2iJG4S/duudma9mTFbUoKbnby8qMl
         47gA==
X-Forwarded-Encrypted: i=1; AKwUvByjBmCy5SUq4BmCHzAjJ7TCHdBHT2IV4hPpcbCLzV0KhVcjBqgN0H7RkoZGYTFgbZ6AYk+Zr5xKT2qYsEk=@vger.kernel.org
X-Gm-Message-State: AFuF++lsS78vZY30qEk3rkfgNS2uzMoTSbDM3/FE6gamxYC8N3Efc/Ov
	PJZK92mAC8jjAvUvqL4X8rLnSPHWdb2MsqiwigtDno3Fg1LYDmVc2gGaKO0MgK6TBJg=
X-Gm-Gg: AYBFou3qlIIjDpcKN2HbpVAL/QIin4GBPDdkazkQBTzQcHooAToqVZYkWedl5pX/ZMB
	Zw0JbooPoyTDZ1FgF4UsJJKRoCJWJNILuuRn0/4epjvF+CRTz7BtYYJpewC5nMNQ+S+QjFKCdiQ
	jAu1ShlV/1ja1My/2/qIxKt0lRM/cNQLuA2fn2D2nSm+IVlTWLd1xKfaEWE0Pm1sn9KNG30gmdV
	zAGylvEnjVEV+aU291VWMytQHA77p8Vt9ccA4I/9ncITIRE6Jh5GvjvAQ3q6AsjfI28c9YredLu
	gfaw78Tm1ZhyVRCRM/2zIjjaqILAqLp6mTQo878VG7yipYGj9zIA1VNHsHkEmzoYcuAO2qMPjjQ
	Q+0ejmg/qRZFyLlbGTz0wG8g23q5FL2kuH93+0RzsZFs1N/PriZg2/00WFjOlTLOZYsLy+rSQ90
	5FjSQji/qOxOyCpOQIa5cmxLEIjTe0gUwJaE8I4PhLlJyjp+U693hp0076ZlrDi4j9bAz2yVmGI
	sLVN25mEWD+03wmDrC36H+ke3aecPjgnHk=
X-Received: by 2002:a17:90b:5844:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39b26101c20mr60325860a91.9.1789022020648;
        Wed, 09 Sep 2026 23:33:40 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.33.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:33:40 -0700 (PDT)
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
Subject: [PATCH v6 05/17] mm/sparse-vmemmap: support section-based vmemmap accounting
Date: Thu, 10 Sep 2026 14:32:44 +0800
Message-ID: <20260910063256.64386-6-songmuchun@bytedance.com>
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

section_nr_vmemmap_pages() can account ordinary sections and DAX
sections, but section-based vmemmap optimization stores the compound
page order in struct mem_section and retains a different number of
vmemmap pages.

Teach section_nr_vmemmap_pages() to recognize section-based optimized
sections and calculate their vmemmap page count from the stored
compound page order and the HVO retained page count.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v6:
- Use the compound page order helper for vmemmap accounting
  (suggested by David Hildenbrand)
- Collect Acked-by from Qi Zheng

v5:
- Collect Acked-by from Mike Rapoport

v3:
- Add vmemmap_optimizable_order() for order-based optimization checks

v2:
- Remove an unnecessary vmemmap_can_optimize() call to simplify the code
  (suggested by Mike Rapoport).
- Rewrite the commit message for better understanding.
---
 include/linux/mmzone.h |  6 ++++--
 mm/sparse-vmemmap.c    | 10 ++++++----
 mm/sparse.h            | 16 ++++++++++++++++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 738bf3d27256..2c4f63e379da 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -107,8 +107,10 @@
 	 is_power_of_2(sizeof(struct page)) ? \
 	 MAX_FOLIO_NR_PAGES * sizeof(struct page) : 0)
 
-/* The number of struct pages covered by the retained vmemmap pages with HVO enabled. */
-#define VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES	(PAGE_SIZE / sizeof(struct page))
+/* The number of retained vmemmap pages with HVO enabled. */
+#define VMEMMAP_OPTIMIZATION_PAGES		1
+#define VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES	\
+	(VMEMMAP_OPTIMIZATION_PAGES * PAGE_SIZE / sizeof(struct page))
 #define VMEMMAP_OPTIMIZATION_MIN_ORDER		(ilog2(VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) + 1)
 
 #define __VMEMMAP_OPTIMIZATION_NR_ORDERS	\
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 107215cf8488..dea7179fbc90 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -649,24 +649,26 @@ void offline_mem_sections(unsigned long start_pfn, unsigned long end_pfn)
 static int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
 		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
 {
-	const unsigned int order = pgmap ? pgmap->vmemmap_shift : 0;
+	const struct mem_section *ms = __pfn_to_section(pfn);
+	const int order = pgmap ? pgmap->vmemmap_shift : section_compound_order(ms);
+	const int vmemmap_pages = pgmap ? VMEMMAP_RESERVE_NR : VMEMMAP_OPTIMIZATION_PAGES;
 	const unsigned long pages_per_compound = 1UL << order;
 
 	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SUBSECTION));
 	VM_WARN_ON_ONCE(nr_pages > PAGES_PER_SECTION);
 
-	if (!vmemmap_can_optimize(altmap, pgmap))
+	if (!vmemmap_can_optimize(altmap, pgmap) && !section_vmemmap_optimizable(ms))
 		return DIV_ROUND_UP(nr_pages * sizeof(struct page), PAGE_SIZE);
 
 	if (order < PFN_SECTION_SHIFT) {
 		VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, pages_per_compound));
-		return VMEMMAP_RESERVE_NR * nr_pages / pages_per_compound;
+		return vmemmap_pages * nr_pages / pages_per_compound;
 	}
 
 	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION));
 
 	if (IS_ALIGNED(pfn, pages_per_compound))
-		return VMEMMAP_RESERVE_NR;
+		return vmemmap_pages;
 
 	return 0;
 }
diff --git a/mm/sparse.h b/mm/sparse.h
index da79c83adeae..563fc1f4d717 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -43,6 +43,17 @@ static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
 	return (pfn & (nr_pages - 1)) >= VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
 }
 
+static inline bool vmemmap_optimizable_order(unsigned int order)
+{
+	if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP))
+		return false;
+
+	if (!is_power_of_2(sizeof(struct page)))
+		return false;
+
+	return order >= VMEMMAP_OPTIMIZATION_MIN_ORDER;
+}
+
 /*
  * mm/sparse.c
  */
@@ -86,6 +97,11 @@ static inline size_t mem_section_usage_size(void)
 	return struct_size_t(struct mem_section_usage, pageblock_flags,
 			     BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS));
 }
+
+static inline bool section_vmemmap_optimizable(const struct mem_section *ms)
+{
+	return vmemmap_optimizable_order(section_compound_order(ms));
+}
 #else
 static inline void sparse_init(void) {}
 #endif /* CONFIG_SPARSEMEM */
-- 
2.54.0

