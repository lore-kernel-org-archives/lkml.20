Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB22C358381
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 02:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791339213; cv=none; b=E/8AuL61B58CnnsvVchcPxXf7D4ai5vwAfvnzPGomWks7t0GwOLf+2dpu23HDkHgd+oeyV6/Anyf24YQ270NT/N5eeqci6xlYdygSoc++x8WZVOswKm0L2x0A4iS2AS+8+DQqy9uIoZIRVZBJKd4K/QSWEBuBEmpCljgBd6GCk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791339213; c=relaxed/simple;
	bh=7sRNFc6H+Zd1SDkl9mveV0pJDk0qiweVHehAF6jOK0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jRRQucrEzjqtfCP3gOtDRfpzCzTJOcu0BAZlRbZeqOlQz8QozJABZ/mV2nyOyR2/dJ7F7PBpclTTrji+p3lWYSbRoI+WunsgDrIbaF307AmVAcqfl32RmPnJf88MQvMIpMihegmwMsEIPUNGAbyCxuDpbGPnuR6QaABD0AknV+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=ihoaRL/n; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="ihoaRL/n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=KKwgm8GYqC75llmIOjDyRDwXwz0fzp2oGMn97550NgY=; b=ihoaRL
	/nvNDCZIENCIKpJn4IOmYiiebYNBOHhRtpChwA46ZrSrYqXSBV3fJDmXg34NghbGsem1rHoACfzQG
	DOoKdkNXOLEj6+AUnRR3IIPs8+X4iYCB8an9HO1iMWEZprooieQsvNteP7EeAK4RED/oTjERwAjUK
	srktbb+uAFAQfsdPySsbyeAZMZmmIyx7HutjWmIX1NSiNRsoC6AfwM2s+Gdl71+6RwkBtM9u9I7Wk
	WHSPnHJjQTHBkZ1+1BMBSfEmpVzs9H4gbqx3+aqqhQbwRee1bCdTqaYPbue8iEF0LgfmT7k08Cpnj
	jzQ1sf+Hi65KiIXtEe+EZJpZP8Yw==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xEH9N-0000000B2cT-02Yo;
	Wed, 07 Oct 2026 02:12:57 +0000
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH 3/5] mm/page_alloc: convert any movable pageblock on a non-movable allocation
Date: Tue,  6 Oct 2026 22:12:48 -0400
Message-ID: <20261007021250.1665929-4-riel@surriel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007021250.1665929-1-riel@surriel.com>
References: <20261007021250.1665929-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

try_to_claim_block() converts a movable pageblock for a non-movable
allocation only when half its pages are free or compatible.
Otherwise the steal path takes pages without converting, and
non-movable content sits in a block still typed movable.

Convert a movable block on any non-movable claim, however few of
its pages are free, so the block's type matches the allocation it
serves.

When other pages in the block are freed later, they end up on the
non-movable free lists, directing more non-movable allocations to
the already non-movable page blocks.

Converting a non-movable pageblock to movable is made stricter:
a movable claim takes a non-movable block only when every page
is free or movable.

Blocks straddling a zone edge are never claimed;
zone_spans_pageblock() tests for a block wholly inside its zone.

Assisted-by: LLM
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 include/linux/mmzone.h | 13 ++++++++
 mm/page_alloc.c        | 71 ++++++++++++++++++++----------------------
 2 files changed, 46 insertions(+), 38 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 94f9c3ff54160..81ad83ff69073 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1227,6 +1227,19 @@ static inline bool zone_spans_pfn(const struct zone *zone, unsigned long pfn)
 	return zone->zone_start_pfn <= pfn && pfn < zone_end_pfn(zone);
 }
 
+/*
+ * Whether the pageblock holding @pfn lies wholly inside @zone. Zone
+ * spans are not pageblock-aligned, so the edge pageblocks of a zone
+ * can straddle into the next zone; those never change type.
+ */
+static inline bool zone_spans_pageblock(const struct zone *zone, unsigned long pfn)
+{
+	unsigned long start = pageblock_start_pfn(pfn);
+
+	return zone->zone_start_pfn <= start &&
+	       start + pageblock_nr_pages <= zone_end_pfn(zone);
+}
+
 static inline bool zone_is_initialized(const struct zone *zone)
 {
 	return zone->initialized;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ae38e25971559..9f1520506ae1d 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2295,18 +2295,39 @@ find_suitable_fallback(struct free_area *area, unsigned int order,
 }
 
 /*
- * This function implements actual block claiming behaviour. If order is large
- * enough, we can claim the whole pageblock for the requested migratetype. If
- * not, we check the pageblock for constituent pages; if at least half of the
- * pages are free or compatible, we can still claim the whole block, so pages
- * freed in the future will be put on the correct free list.
+ * Whether to retype a partly used block. A block wholly inside its zone
+ * takes the allocation's type, so no non-movable page sits in a
+ * movable-typed block; a straddling block is never retyped.
  */
+static bool should_claim_used_block(struct zone *zone, unsigned long start_pfn,
+				    int start_type, int block_type,
+				    int free_pages, int movable_pages)
+{
+	if (!zone_spans_pageblock(zone, start_pfn))
+		return false;
+
+	if (page_group_by_mobility_disabled)
+		return true;
+
+	/* Convert to movable only if no non-movable pages are present. */
+	if (is_migrate_movable(start_type))
+		return free_pages + movable_pages == pageblock_nr_pages;
+
+	/* Non-movable pages break compaction; claim as non-movable */
+	if (is_migrate_movable(block_type))
+		return true;
+
+	/* Unmovable or reclaimable claiming from the other. */
+	return free_pages >= (1 << (pageblock_order - 1));
+}
+
+/* Convert the block so later frees use the allocation's migratetype. */
 static struct page *
 try_to_claim_block(struct zone *zone, struct page *page,
 		   int current_order, int order, int start_type,
 		   int block_type, unsigned int alloc_flags)
 {
-	int free_pages, movable_pages, alike_pages;
+	int free_pages, movable_pages;
 	unsigned long start_pfn;
 
 	/* Take ownership for orders >= pageblock_order */
@@ -2333,39 +2354,13 @@ try_to_claim_block(struct zone *zone, struct page *page,
 				       &movable_pages))
 		return NULL;
 
-	/*
-	 * Determine how many pages are compatible with our allocation.
-	 * For movable allocation, it's the number of movable pages which
-	 * we just obtained. For other types it's a bit more tricky.
-	 */
-	if (start_type == MIGRATE_MOVABLE) {
-		alike_pages = movable_pages;
-	} else {
-		/*
-		 * If we are falling back a RECLAIMABLE or UNMOVABLE allocation
-		 * to MOVABLE pageblock, consider all non-movable pages as
-		 * compatible. If it's UNMOVABLE falling back to RECLAIMABLE or
-		 * vice versa, be conservative since we can't distinguish the
-		 * exact migratetype of non-movable pages.
-		 */
-		if (block_type == MIGRATE_MOVABLE)
-			alike_pages = pageblock_nr_pages
-						- (free_pages + movable_pages);
-		else
-			alike_pages = 0;
-	}
-	/*
-	 * If a sufficient number of pages in the block are either free or of
-	 * compatible migratability as our allocation, claim the whole block.
-	 */
-	if (free_pages + alike_pages >= (1 << (pageblock_order-1)) ||
-			page_group_by_mobility_disabled) {
-		__move_freepages_block(zone, start_pfn, block_type, start_type);
-		set_pageblock_migratetype(pfn_to_page(start_pfn), start_type);
-		return __rmqueue_smallest(zone, order, start_type);
-	}
+	if (!should_claim_used_block(zone, start_pfn, start_type, block_type,
+				     free_pages, movable_pages))
+		return NULL;
 
-	return NULL;
+	__move_freepages_block(zone, start_pfn, block_type, start_type);
+	set_pageblock_migratetype(pfn_to_page(start_pfn), start_type);
+	return __rmqueue_smallest(zone, order, start_type);
 }
 
 /*
-- 
2.53.0-Meta

