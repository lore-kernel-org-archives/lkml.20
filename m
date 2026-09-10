Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF243C4B91
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022015; cv=none; b=cGStVY1ApTnZv2YvY28eF0e3Sqjv+PQlFdFHkHnoa0hrKlo99tK3gmegG/E3M9EFqECg/zuVdBGCB6gp5hxNAKftVmqeXxMZD/MF/oTvKU7LHfKxdJAzEwE07Z+4Ckz96vsA6tu2+W1OUR/+Z3SF+CNMGZEcphhGFdwS22pQj1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022015; c=relaxed/simple;
	bh=5jEVhUSLED19JV+A/ye0WOHwBGdcbFAykQgbHFBITD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lwaSnzoUyyaPb+/lziSHAiRvcotOSW0LI1SGwg0o7AKSUvA346qarKysqsqIRCCdSrNh/bZx56naXiEgk9HZk6wmGKhdbexkOnFMCeZ/zMpROfL9KIzCK+QC+rOAqTj2GVHW5msOxMLM8LJy1/UU+oJ3uPesC2YtN/b12J4YRkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=PitUz7m9; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="PitUz7m9"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334ddcso10047985ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022013; x=1789626813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tUBCzuDDmijmZL9894tpqO2PeM3/ckJvguvNiHP8cxU=;
        b=PitUz7m9DDqDvHB56OkcXvm5b5OkDA2Y0RqUCQww1ghuPI6M+qELGHc1VVkJrV1z3Q
         o8lBXZ8aBMtOxfH3h4Tg67Cz4mXcMxxNzUWU4vN6tUX+iTmTJZ/9Ax33vm3PqvJlmIW2
         79ZmS/HzZcJPLAqhomfclFpIzY0N/gJGbnwK/pBEZN07QUA/Ps6nfWenYVkB2R+6xkIb
         smNA6bbRrjJI+6I+gDe7Lt7CG89iScRYY3rJ2nAdkvJ0SKKhYtwKO+6Gt9WUVX3CJlWW
         bvVGpqmAYLJIfgfKhaFpdsWAoBceSwj52g8BgEQ1pt9XPGoz2JtvQzls1poiDA60tT3Q
         DC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022013; x=1789626813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tUBCzuDDmijmZL9894tpqO2PeM3/ckJvguvNiHP8cxU=;
        b=dn9/nWxINZQDclapI2z5Q4FjEWSh8NNyxF/hBoGlZhj6AbV5gSCdyDImyleMlYadxc
         4YZ+r6ELqbd/6RS1cgMxlp/eGIr0M+NOoMZCtS2q69tD2SQBlDfm1pG8X1/3j5QPvXEO
         Bp7SZfED/IFGWygV84Vce69e/03Q8DXytBqpz91154ejDpqc6/jqDTo1Y8ywzvUDfdLl
         aC1b97kZnaxNNPox3HuGCffY5e7Qx5VGMra2PKnfFEHt1vz3OFRm5xGKK2tvH2HQubp0
         P+XX6vHLgr01y53Y63CxlQo84p94nhXXTyjxrfJIP2Dqy3kghk5HHITn3/Zxi5KndZBM
         PvJQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5hCo1Vh9OPYTHHbsBPEShC+C8g9yCpOyRFE/Oq7vNMr8L6DCPRHD7+ERt52t/dUXpSTxksUE99YI9Em4=@vger.kernel.org
X-Gm-Message-State: AFuF++llXup0umQOmmp2AeOGK8kCihSHllo1EQThxxtTSgn0uMkhfMHE
	8jMsqzopQ8Ytj9hcTdBIGwJ8wJrlMTP8+Z1hFDRYrOI+XcXZ3gYYjwxmtGsjpoT1tB4=
X-Gm-Gg: AYBFou2LKB+JEy0eITpkQQGT2T9BbKo/WtdMTmi15s9CA0qlPRGr34ZGmkjZMpobIUB
	IdOlLpsjs0kLiWZrkwbBTrC5bu7XzdcpycLn6wqUDOATTGN7Mx44+w1GEwFTXOfjmuovnMvoySX
	ArGVBiHcKXrE6c2HzTvvPD1W48t3p70cLhRizX2dpAJsVqAam+Uz/D3w2t4R99l480bYGYfevv1
	R2td6nseuSH55lRLJLfxyMJbjT1cxePR4CRgNB1EwksfA02ojXfUBWD1uLL58oqThdNIbUhsvcX
	6qVo+ZAmDbARDo7N22Ipa7s9xhsxDbCd6htRLDWZgtuWat43iCK8XNtxLnQ7UktuGOLNNUoFFOc
	8ImfbU45m5WREFeWEirXUhLZ/7prAz53DLXzvSOvgI4vCcaUmTTJTKQCpm8SHGuqy6uLQSs8ec1
	pIVedUJbIcgddAiWDap0/5Z0Tldz7yYmqih/gAA+Nj2powhRfBz2v3ld5RbsMFeexKzFBUrItXh
	bYmJSV9HOEEH3p9sprEOOH6cvDEuP7ZXUc=
X-Received: by 2002:a17:90b:1e0d:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-39d70ae12b0mr7306314a91.14.1789022012813;
        Wed, 09 Sep 2026 23:33:32 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.33.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:33:32 -0700 (PDT)
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
Subject: [PATCH v6 03/17] mm/mm_init: skip initializing shared vmemmap tail pages
Date: Thu, 10 Sep 2026 14:32:42 +0800
Message-ID: <20260910063256.64386-4-songmuchun@bytedance.com>
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

memmap_init_range() initializes every struct page in the target range.
For compound pages with vmemmap optimization, the tail struct pages are
backed by a shared vmemmap page.

Initializing those tail struct pages would overwrite the shared
vmemmap page contents, requiring users such as HugeTLB to restore the
metadata afterwards.

Track the compound page order for HVO-backed sections and use that metadata
to detect struct pages that fall into the shared tail vmemmap range.
Skip those shared tail pages in memmap_init_range(), then initialize
pageblock migratetypes for the processed range with a helper after the
per-page initialization loop.

Keep direct mem_section access inside sparse helpers. Expose
pfn_to_section_compound_order() for callers that only need the order
associated with a PFN. This lets memmap_init_range() skip shared tail
vmemmap pages without exposing __pfn_to_section() to !SPARSEMEM builds.

This is a preparatory change for consolidating handling across users of
vmemmap optimization, and it also avoids redundant initialization of
shared tail vmemmap pages during early boot. That early-boot benefit
appears only once HugeTLB is switched to this common handling, since
HugeTLB is the early-boot user that creates those shared tail vmemmap
pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v6:
- Rename the section order field and helpers for compound page order
  (suggested by David Hildenbrand)
- Collect Reviewed-by from Mike Rapoport
- Collect Acked-by from Qi Zheng

v5:
- Add comments for pageblock migratetype helper callers and shared
  tail vmemmap skipping (suggested by Mike Rapoport)

v4:
- Rename pfn_vmemmap_optimizable() to vmemmap_optimizable_pfn()
  for consistency with vmemmap_optimizable_order()

v3:
- Replace the !SPARSEMEM __pfn_to_section() stub with
  pfn_to_section_order() (suggested by Mike Rapoport)

v2:
- Fold section order tracking into the first user instead of keeping a
  standalone API-only patch (suggested by Mike Rapoport)
- Rename page_vmemmap_optimizable() to pfn_vmemmap_optimizable() and
  pass a PFN directly (suggested by Mike Rapoport)
- Initialize pageblock migratetypes from a helper after the per-page
  loop (suggested by Mike Rapoport)
- Use a 1G PFN chunk for cond_resched() in the pageblock helper
  (suggested by Mike Rapoport)
- Guard section_order() with CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP so
  it returns 0 when HVO is disabled and lets the compiler optimize the
  code as much as possible (suggested by Mike Rapoport)
- Explain why the !SPARSEMEM __pfn_to_section() stub belongs here
  (suggested by Mike Rapoport)
---
 include/linux/mmzone.h |  8 ++++++++
 mm/mm_init.c           | 40 +++++++++++++++++++++++-----------------
 mm/sparse.h            | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 17 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 5fb9b37819d5..738bf3d27256 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2022,6 +2022,14 @@ struct mem_section {
 	unsigned long section_mem_map;
 
 	struct mem_section_usage *usage;
+#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+	/*
+	 * Normally, sections hold regular (order-0) pages. However, for
+	 * sections with HVO enabled, this tracks the compound page order
+	 * to enable deduplication of redundant vmemmap pages.
+	 */
+	unsigned int compound_page_order;
+#endif
 #ifdef CONFIG_PAGE_EXTENSION
 	/*
 	 * If SPARSEMEM, pgdat doesn't have page_ext pointer. We use
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 1533aebafb68..6655fe696e0f 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -29,6 +29,7 @@
 #include <linux/cma.h>
 #include <linux/crash_dump.h>
 #include <linux/execmem.h>
+#include <linux/sizes.h>
 #include <linux/vmstat.h>
 #include <linux/kexec_handover.h>
 #include <linux/hugetlb.h>
@@ -677,21 +678,19 @@ static inline void fixup_hashdist(void)
 static inline void fixup_hashdist(void) {}
 #endif /* CONFIG_NUMA */
 
-#if defined(CONFIG_ZONE_DEVICE) || defined(CONFIG_DEFERRED_STRUCT_PAGE_INIT)
 static __meminit void pageblock_migratetype_init_range(unsigned long pfn,
-		unsigned long nr_pages, int migratetype, bool atomic)
+		unsigned long nr_pages, int migratetype, bool isolate, bool atomic)
 {
 	const unsigned long end = pfn + nr_pages;
 
 	for (pfn = pageblock_align(pfn); pfn < end; pfn += pageblock_nr_pages) {
 		enum migratetype mt = kho_scratch_migratetype(pfn, migratetype);
 
-		init_pageblock_migratetype(pfn_to_page(pfn), mt, false);
-		if (!atomic && IS_ALIGNED(pfn, PAGES_PER_SECTION))
+		init_pageblock_migratetype(pfn_to_page(pfn), mt, isolate);
+		if (!atomic && IS_ALIGNED(pfn, PFN_DOWN(SZ_1G)))
 			cond_resched();
 	}
 }
-#endif
 
 #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
 static inline void pgdat_set_deferred_range(pg_data_t *pgdat)
@@ -886,6 +885,17 @@ void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone
 			}
 		}
 
+		/*
+		 * Vmemmap-optimizable PFNs are backed by shared tail struct pages,
+		 * which have already been initialized during vmemmap population.
+		 */
+		if (vmemmap_optimizable_pfn(pfn)) {
+			const unsigned int order = pfn_to_section_compound_order(pfn);
+
+			pfn = min(ALIGN(pfn, 1UL << order), end_pfn);
+			continue;
+		}
+
 		page = pfn_to_page(pfn);
 		__init_single_page(page, pfn, zone, nid);
 		if (context == MEMINIT_HOTPLUG) {
@@ -897,19 +907,13 @@ void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone
 				__SetPageOffline(page);
 		}
 
-		/*
-		 * Usually, we want to mark the pageblock MIGRATE_MOVABLE,
-		 * such that unmovable allocations won't be scattered all
-		 * over the place during system boot.
-		 */
-		if (pageblock_aligned(pfn)) {
-			enum migratetype mt = kho_scratch_migratetype(pfn, migratetype);
-
-			init_pageblock_migratetype(page, mt, isolate_pageblock);
+		if (pageblock_aligned(pfn))
 			cond_resched();
-		}
 		pfn++;
 	}
+
+	pageblock_migratetype_init_range(start_pfn, pfn - start_pfn, migratetype,
+					 isolate_pageblock, /* atomic */ false);
 }
 
 static void __init memmap_init_zone_range(struct zone *zone,
@@ -1112,7 +1116,8 @@ void __ref memmap_init_zone_device(struct zone *zone,
 				     compound_nr_pages(pfn, altmap, pgmap));
 	}
 
-	pageblock_migratetype_init_range(start_pfn, nr_pages, MIGRATE_MOVABLE, false);
+	pageblock_migratetype_init_range(start_pfn, nr_pages, MIGRATE_MOVABLE,
+					 /* isolate */ false, /* atomic */ false);
 
 	pr_debug("%s initialised %lu pages in %ums\n", __func__,
 		nr_pages, jiffies_to_msecs(jiffies - start));
@@ -1921,7 +1926,8 @@ static void __init deferred_free_pages(unsigned long pfn,
 	if (!nr_pages)
 		return;
 
-	pageblock_migratetype_init_range(pfn, nr_pages, MIGRATE_MOVABLE, true);
+	pageblock_migratetype_init_range(pfn, nr_pages, MIGRATE_MOVABLE,
+					 /* isolate */ false, /* atomic */ true);
 
 	page = pfn_to_page(pfn);
 
diff --git a/mm/sparse.h b/mm/sparse.h
index 3b744667a7e6..da79c83adeae 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -10,6 +10,39 @@
 
 #include <linux/mmzone.h>
 
+#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+static inline unsigned int section_compound_order(const struct mem_section *section)
+{
+	return section->compound_page_order;
+}
+
+static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
+{
+	return section_compound_order(__pfn_to_section(pfn));
+}
+#else
+static inline unsigned int section_compound_order(const struct mem_section *section)
+{
+	return 0;
+}
+
+static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
+{
+	return 0;
+}
+#endif
+
+static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
+{
+	const unsigned int order = pfn_to_section_compound_order(pfn);
+	const unsigned long nr_pages = 1UL << order;
+
+	if (!is_power_of_2(sizeof(struct page)))
+		return false;
+
+	return (pfn & (nr_pages - 1)) >= VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
+}
+
 /*
  * mm/sparse.c
  */
-- 
2.54.0

