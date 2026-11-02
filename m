Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612393;
	b=1YvddYP+35ISDgFyCb+qquI2STTeT1sCxnoD5XZJmdFmk7Ncc0QyKAMZmHoU5IjHo3Wj
	 cxJM2Wezljwi5TQrP1IDEOG+gLdLX0GT0H84O3FV/L/oqeXreCu5l2jrcCaL04PN5XmDc
	 KHakYqg/w1Qh9xCNk9cTPLeC8HKC6mLWp/kvnaaZfn+TWofxv1O4kmZLGe9xRItZnfv1j
	 kqHgQG9+zxNsrmFQPN7ejAzqzpUoKDD5Srl3kwtNODM5M6+jgrdTxuJt9f0TeyPANzq+r
	 n9DOPLs/z6QsuhgzDP9Wi6Z6RkVUeZ8vmoG8Ypa6Ai+f2vYh0r35jb88H6bcaojClqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612393;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PLIU3Qu9j6PfSIppGNHBU0Z6z1EAix93GaiiwcWHaPE=;
	b=DvmTrhvJspqAPAvNC0HuTTPDBodX3IMOHUBerchZk85rQB0X7FdpaG1wO5RmnWqEHi4j
	 jwxOsEDdxxeitSMriqizWqFBa38VQYl8yFJFU6hIkgxlm/IXlj0J2GsWigN31bgcyXtxy
	 BvCrLWr2Letsb3ENGb0b7FaJCBJE7vSMLZo4msp4/9jiJ0Az76fM56KWDDCn1IXRbCqCw
	 EKsS0QfzR0Cy0/dTSrkDl0RvERW/mLjfehwDwbgbPPAW692q6sSgcOAG0ma4se9thWZEY
	 Ro43oIfJ2emYGPgusihbCN8yaphW+0ONbrPhwPLui9K2OmH3LuxRcwAV3a2G7v3Hzvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jhwU60fm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2FF606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jhwU60fm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BB01F00A18;
	Mon,  2 Nov 2026 09:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793612392;
	bh=PLIU3Qu9j6PfSIppGNHBU0Z6z1EAix93GaiiwcWHaPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jhwU60fm6fJVgEYkwuCzyPxEDNRQQGiAixg/pLIYjY8AL33HmJ7+OQGR4Wd3/KMpq
	 3O7hH195Bd8WClmdYf1jyN+iVw17AaaZWAxLnd4bYyTKWx0Jb/vm3pmMM6FU/OFf3F
	 833MDqsDSlJLwAUjmv3yOB1XoJ/PKdHiF6DmoRUVgn5+sxht2hDflpDR0pdQXPdHe7
	 8dGgXJVTw8c8tWVRzN7kuzVQiM5jBA6LGfyJhdtvZ6AhJjp+TII9roTSDp/mjxA10B
	 fJ006XuuCkc5y9xCFx8EW2SNwJUhRQhT1vRj8oaZqoxWqNcGqCJ+ogZumAxQaBBhzW
	 1Jf18NRB7qdpg==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 753DB1980050;
	Mon,  2 Nov 2026 04:39:47 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 02 Nov 2026 04:39:49 -0500
X-ME-Sender: <xms:YlroalOqjZNmffZ2WIq--wzDYJXVV4DToOOVgYy88Dgnvqc-f4yB7g>
    <xme:YlroapDOjAD6C8UmOBPP1DEyIsfLIaPVBdBwh7fYuAl4Lqjkoeoe6ynsNthK70WEA
    38qWwpCeZwclESVM8uK0VXxhhk2x-aaWF6Zp6W35FLPZsxdUfpJm8yG>
X-ME-Received: <xmr:YlroanMo0UAOMRDEEOSK4ubth7gCzDx0e2KwE0n-L3o_9VHGzPEw0dNdoWI>
X-ME-Proxy-Cause: dmFkZTFfNoVB8J0rx8nifPYd+qKRtp29PWkX9KZuHko+Ts55CioRbwnpVaVqPEFOtlMN9x
    wKYJGJgcxHY5I+jrutGMiNMby48Epfbz6j2xX8eAirJpB5JeNqfWCxIPC6qwvUtfdJGfXV
    rvRFRlQxssUsal99hVwi4glDwqlAFKJuQJiIL4KNdRZWsT0U712UtRewOVYBILBwiEkoH0
    UxnfKzJQEdnVBX8f3mna3wmC8GfiPL9QqklMzJJJk7OcjdSosgl5Jv/a0CRg6SmFxhaiZa
    ki3MzSXjhqRHWEjrsB2Ebo81ttm8ytuejLqyFyFWV08rQTTh3C274vAQrAiI7m1/lnwQJh
    TqDLeqswtxIR7uQw5T6BxtWmb9F/b2y7M6/JaTgkSPf/NO+1SeJMjqFFsvcKwV6Aum+u4k
    P/B3p/p0J3Rre/oGL2cPYKoKClsm87VqpxhINUg4SpIA/VeeQZ5x8oqrhEL0qN5DpFJmCO
    cAV4KXVApEnaknCfySe4lLwKrw3V9L0gkSLOo11QIWFbi4xQ6SeqeQBTkiHqyHOiGnme1R
    7eiBxpumn7dlI9cm/aCpG6HI06pJjm4NGuXC+NhCyP+F/LUEaHZMyt//v+gGQ02gzubtM1
    UfDnTRqoLdi8H2pDpBGqUeI0k+rbERfAyRKkCK4EdFlm6nebwYdinPWv2MZw
X-ME-Proxy: <xmx:YlroavbQQ9rquIuClf1Ms6h50CCyCJCP3Mz7wfBnTn9EwjYzjLS3Sg>
    <xmx:YlroamO4tfGP922Z5ABZPZLu2npgA8pRJ1bOT6Tu5GovNujPH-WcZA>
    <xmx:YlroatUMkW2YwyrFSeUOoWGDx0qf7t5cYKM_FG_Ac5_NXxrYP4Jfrw>
    <xmx:Ylroavcsaq0CnmcmF0slybVfYBQuryJSxCHRDrv-he2LY9h_6ryIZQ>
    <xmx:Y1roauhArdEyxPpR02lZuNk-s-6ryO81VB52QqN4z56w8_4MewkJ4m-t>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 04:39:46 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Dev Jain <dev.jain@arm.com>,
	Harry Yoo <harry@kernel.org>,
	Usama Arif <usama.arif@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v2 1/3] mm: page_alloc: add a watermark check that knows the migratetype
Date: Mon,  2 Nov 2026 09:39:34 +0000
Message-ID: <20261102093939.3340540-2-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102093939.3340540-1-kas@kernel.org>
References: <20261102093939.3340540-1-kas@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The high-order check in __zone_watermark_ok() accepts a free page of any
migratetype.  Under ALLOC_NOFRAGMENT, a request below pageblock_order can
only take a page of its own migratetype or claim a whole free block, so
the check can pass when the allocation cannot succeed.

Telling those apart needs the request's migratetype, but not every check
wants them told apart.  A check whether an allocation can be served now
has to count only the pages it can take.

A check whether there is enough free memory counts every migratetype:
kswapd and kcompactd balancing a zone, order-0 thresholds, the
slowpath's forecast whether reclaim and compaction can still make
progress.  Reclaim and compaction work across migratetypes to free whole
pageblocks.

Move the body of __zone_watermark_ok() into __zone_watermark_ok_mt(),
which takes the migratetype as well, and make __zone_watermark_ok() a
wrapper around it for the second kind of check.  These use the new
function:

  - the allocator fast path, zone_watermark_fast();
  - its recheck after node reclaim in get_page_from_freelist();
  - compaction's up-front check, compaction_suit_allocation_order().

Declare both in mm/internal.h: nothing outside mm uses them.

Nothing reads the migratetype yet: no functional change.

Tested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 include/linux/mmzone.h |  3 ---
 mm/compaction.c        | 11 ++++++-----
 mm/internal.h          |  7 +++++++
 mm/page_alloc.c        | 37 ++++++++++++++++++++++++++++---------
 4 files changed, 41 insertions(+), 17 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index ecd1ebd49756..4d9347a399fa 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1637,9 +1637,6 @@ static inline unsigned long pgdat_end_pfn(pg_data_t *pgdat)
 #include <linux/memory_hotplug.h>
 
 void build_all_zonelists(pg_data_t *pgdat);
-bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
-			 int highest_zoneidx, unsigned int alloc_flags,
-			 long free_pages);
 bool zone_watermark_ok(struct zone *z, unsigned int order,
 		unsigned long mark, int highest_zoneidx,
 		unsigned int alloc_flags);
diff --git a/mm/compaction.c b/mm/compaction.c
index f1b2060eb201..6c553d0e90f8 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -2520,7 +2520,7 @@ bool compaction_zonelist_suitable(struct alloc_context *ac, int order,
 static enum compact_result
 compaction_suit_allocation_order(struct zone *zone, unsigned int order,
 				 int highest_zoneidx, unsigned int alloc_flags,
-				 bool async, bool kcompactd)
+				 int migratetype, bool async, bool kcompactd)
 {
 	unsigned long free_pages;
 	unsigned long watermark;
@@ -2531,8 +2531,8 @@ compaction_suit_allocation_order(struct zone *zone, unsigned int order,
 		free_pages = zone_page_state(zone, NR_FREE_PAGES);
 
 	watermark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK);
-	if (__zone_watermark_ok(zone, order, watermark, highest_zoneidx,
-				alloc_flags, free_pages))
+	if (__zone_watermark_ok_mt(zone, order, watermark, highest_zoneidx,
+				   alloc_flags, free_pages, migratetype))
 		return COMPACT_SUCCESS;
 
 	/*
@@ -2588,6 +2588,7 @@ compact_zone(struct compact_control *cc, struct capture_control *capc)
 		ret = compaction_suit_allocation_order(cc->zone, cc->order,
 						       cc->highest_zoneidx,
 						       cc->alloc_flags,
+						       cc->migratetype,
 						       cc->mode == MIGRATE_ASYNC,
 						       !cc->direct_compaction);
 		if (ret != COMPACT_CONTINUE)
@@ -3073,7 +3074,7 @@ static bool kcompactd_node_suitable(pg_data_t *pgdat)
 		ret = compaction_suit_allocation_order(zone,
 				pgdat->kcompactd_max_order,
 				highest_zoneidx, alloc_flags,
-				false, true);
+				MIGRATE_MOVABLE, false, true);
 		if (ret == COMPACT_CONTINUE)
 			return true;
 	}
@@ -3116,7 +3117,7 @@ static void kcompactd_do_work(pg_data_t *pgdat)
 
 		ret = compaction_suit_allocation_order(zone,
 				cc.order, zoneid, cc.alloc_flags,
-				false, true);
+				MIGRATE_MOVABLE, false, true);
 		if (ret != COMPACT_CONTINUE)
 			continue;
 
diff --git a/mm/internal.h b/mm/internal.h
index 566cbd2dce48..8e58e2db5e09 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -726,6 +726,13 @@ extern int min_free_kbytes;
 extern int defrag_mode;
 
 void setup_per_zone_wmarks(void);
+bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
+			 int highest_zoneidx, unsigned int alloc_flags,
+			 long free_pages);
+bool __zone_watermark_ok_mt(struct zone *z, unsigned int order,
+			    unsigned long mark, int highest_zoneidx,
+			    unsigned int alloc_flags, long free_pages,
+			    int migratetype);
 void calculate_min_free_kbytes(void);
 int __meminit init_per_zone_wmark_min(void);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index a8cac5e01066..7730660bdd09 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3587,9 +3587,10 @@ static inline long __zone_watermark_unusable_free(struct zone *z,
  * one free page of a suitable size. Checking now avoids taking the zone lock
  * to check in the allocation paths if no pages are free.
  */
-bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
-			 int highest_zoneidx, unsigned int alloc_flags,
-			 long free_pages)
+bool __zone_watermark_ok_mt(struct zone *z, unsigned int order,
+			    unsigned long mark, int highest_zoneidx,
+			    unsigned int alloc_flags, long free_pages,
+			    int migratetype)
 {
 	long min = mark;
 	int o;
@@ -3665,6 +3666,21 @@ bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
 	return false;
 }
 
+/*
+ * For checks that are not about serving one allocation now: kswapd and
+ * kcompactd balancing a zone, order-0 thresholds, forecasts whether
+ * reclaim and compaction can still make progress.  They count free pages
+ * of every migratetype: reclaim and compaction work across migratetypes
+ * to free whole pageblocks.
+ */
+bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
+			 int highest_zoneidx, unsigned int alloc_flags,
+			 long free_pages)
+{
+	return __zone_watermark_ok_mt(z, order, mark, highest_zoneidx,
+				      alloc_flags, free_pages, MIGRATE_MOVABLE);
+}
+
 bool zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
 		      int highest_zoneidx, unsigned int alloc_flags)
 {
@@ -3697,8 +3713,8 @@ static inline bool zone_watermark_fast(struct zone *z, unsigned int order,
 			return true;
 	}
 
-	if (__zone_watermark_ok(z, order, mark, highest_zoneidx, alloc_flags,
-					free_pages))
+	if (__zone_watermark_ok_mt(z, order, mark, highest_zoneidx, alloc_flags,
+				   free_pages, gfp_migratetype(gfp_mask)))
 		return true;
 
 	/*
@@ -3710,8 +3726,9 @@ static inline bool zone_watermark_fast(struct zone *z, unsigned int order,
 	if (unlikely(!order && (alloc_flags & ALLOC_MIN_RESERVE) && z->watermark_boost
 		&& ((alloc_flags & ALLOC_WMARK_MASK) == WMARK_MIN))) {
 		mark = z->_watermark[WMARK_MIN];
-		return __zone_watermark_ok(z, order, mark, highest_zoneidx,
-					alloc_flags, free_pages);
+		return __zone_watermark_ok_mt(z, order, mark, highest_zoneidx,
+					      alloc_flags, free_pages,
+					      gfp_migratetype(gfp_mask));
 	}
 
 	return false;
@@ -3923,8 +3940,10 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 				continue;
 
 			/* did we reclaim enough */
-			if (!zone_watermark_ok(zone, order, mark,
-					       ac->highest_zoneidx, alloc_flags))
+			if (!__zone_watermark_ok_mt(zone, order, mark,
+					ac->highest_zoneidx, alloc_flags,
+					zone_page_state(zone, NR_FREE_PAGES),
+					gfp_migratetype(gfp_mask)))
 				continue;
 		}
 
-- 
2.54.0

