Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833477;
	b=FJB3OQvbznnLd3M8HKqNYlULfbTIlg77PSW7IfanavLbp6BFDmiv98I8g0tGWloQ6Nvw
	 XanlHu+sVdkGTzQ6rMiOFGzzArRRrCuABkhD65TAH8D3tTRx1jke9VdvG9SByiN4vjqXw
	 fduqpYopljBC5pr0dP7NoUDMUPytfo395+F+wIPhbED1ALUJzJOT57/xk0rlEjVGdHSeU
	 ElxSrCGoUgHjSxoQQwTjiAwr5P0h7jD4gEVWyLuV8Nh+EgxELTeBh+YV+i9pCQgd4i+UY
	 VkR9JA8vA1Z4TXMAMXJ1Hz45ziq5cnWmowA3Wj5WvGB+p7dRNiepVJLa4qy+NQ2nOww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833477;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jCYlLXJNTyDmNDujRtLuukrToXpkUaT1TjJ6p/R0SBk=;
	b=2BNIp/L+SYlHMVbncj8nQa4Ii3hgW0MX3n3YAEAlFLbv0NVihNOBRdBTPO8RqvvAFHbu
	 p4io8QgyRErmmhcXDEg9TXe2eAxcd7LOumkXc/o0Pzz2hLUpGGYpkppJdVkT+DtA0oj2Y
	 vER3tBfd+U4DXgwtFdKEcF1S+GK0sw/Q2wN8VJsY8YTG/Iwx7QgPABHdwIeNM9kteiE2l
	 wsjiANpYvZObtdXSfdXAOMA+tvHCrrmVVldHJq+IAr9jsWqan0zUM97MTvRYR0fLyYgKA
	 DNNRZ1SBSx6BzNwR2l96rysuwXMq6xkfOfK8KUNdQ05Cv7XTRSUEWt/CO2gjglge2uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RomHqfYI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33146606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RomHqfYI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264681F000CC;
	Mon, 16 Nov 2026 12:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833476;
	bh=jCYlLXJNTyDmNDujRtLuukrToXpkUaT1TjJ6p/R0SBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RomHqfYI4PPKwFFnxBp4865nWHDTuwGzJaVDQkqCjmGHWdlgfrSzx9LhkY3HuHmUB
	 0GBFvN+fGHqv2ylMG7o1EUC8pLC8ITTGvSNV8XsM7UC1qbCbcQeb2MmbKP7k6YfdqS
	 iGbnCzO95pdOZoBrERpqH8wyqb98GMZREl529W4B6A2qi75Un2Nlvs/2HYoxFYYmDh
	 7F6S5ec4A++htBUIkkYiZYlNmoOj6WV1X4V7M2PNwScI/EHLwygHJKAcGHAPEdC5eW
	 shUfjX3jAr7eh5MX+TH2ARcn8lVaEM/u8ToYud29VAMVxzgiPD19SNZTSx/t+aMdCV
	 bdi2djbljI3sg==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.ams.internal (Postfix) with ESMTP id 7221E1980052;
	Mon, 16 Nov 2026 07:51:11 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 16 Nov 2026 07:51:13 -0500
X-ME-Sender: <xms:Pvz6agBdZ1WFFQ_FPYmq3t8edpXFSp1E0d6elHh0HQDsCoGRvE6b5w>
    <xme:Pvz6ajlQQd7OWvpxlgN0KDTfoCsLWdB7i3b5p4fjzT1VdA89R0Y7pAtK46rZ-E-lO
    gArm_SzUy2waC3bQotBR_KhKNgNQ6V9Q6WiqwL1V4JuepK97LHJogj7>
X-ME-Received: <xmr:Pvz6amgz9uhMCqn1_Jsyt-RSl8yOn6wVjk7pq7DSWes2MAiiLrU5tnEes-Y>
X-ME-Proxy-Cause: dmFkZTFKZPcgB6Kh/KGtpP92uZmKvmotC9FH97AD/nqdyZAdrKaHq0v3CEXOTa5nVR2rZJ
    c8fMR6faKbl7tlAg0vmlVRHALUWRQAtIjtHVLobAo9+lfvs4DNznrf84ZEr78rYX5TgtId
    LnfAjm1WjEYR8equvBZ1DmRCdwP6CXxXkOvheAcl/W8VsKooSgBwB49Eu9pVfxlPTrbCdk
    Xpu4MPxfwEDwIwxcG5wkvhgCfeQCV5d4Ie2ZCHdDfAlFxb1eGCTY/J2sM0tapWd3bL7s58
    ai3M29eGUnTf++aw1QIYNNjj82vQB0TieiOnFpsxq4bc86BurBF0kM+Af4sIlKDN0dpvbx
    sIbmEtpXoN4JfdF1RzjzDMVz2FUm7JxyINdK38lSvNeceNbc2WjjTc8JGlWDJpANZjpzb2
    73C6asy3VUmhtmXFJ3ZP2N1YaBINweET4wZHiO7KWoYzO819F3yD2GK1hwahINDYpBljV5
    X0wbOY8ZxvApJHL9nNAXbujPYr0WFeeL/DVIbPb4XTQ2RHUQRDYhaB7UP2XgwoATVJOxdB
    zSsv2Go0463CnbmiP1uP7UJ99TsbAuHhr7oM/T7q4vAmU/NqlDDCuHwRavvPArVH7DywYz
    ecgfrQSyy5f+DOMiEoNEgQqDsllO+binRxTzv/uw+lF9+Cz2YdIYGkKl5/qg
X-ME-Proxy: <xmx:Pvz6akeZvUlqctmHspH4Ne4cgP7YM6jes0Z5q_pNyq3jSG2BZsUT_Q>
    <xmx:Pvz6auDINLsoOB8YJZ0iAXvmKXwva7h5w1i7_FAy6BMLGGLEIn18dg>
    <xmx:Pvz6ag5gt_rdsfKr24gMRLKJ7sZfW0BzOGhQA8SZ6-KbV9UeNvKkFA>
    <xmx:Pvz6ajzSDFzq3lIqnerg9YxZpB4OAH0EPt9tohONPkrtnm6KJ515QA>
    <xmx:P_z6akmdBX8OSrPykz5mhJCPzm3YO4jJrIbWXxtOdrgwHfqZy1LQjbdG>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Nov 2026 07:51:10 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Harry Yoo <harry@kernel.org>
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
	Usama Arif <usama.arif@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v3 1/3] mm: page_alloc: add a watermark check that knows the migratetype
Date: Mon, 16 Nov 2026 12:50:59 +0000
Message-ID: <20261116125103.2894162-2-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116125103.2894162-1-kas@kernel.org>
References: <20261116125103.2894162-1-kas@kernel.org>
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

For a high-order request, __zone_watermark_ok() accepts a free page of
any migratetype.  An ALLOC_NOFRAGMENT request below pageblock_order can
take a page of its own migratetype or claim a whole free pageblock, but
not steal from another migratetype's pageblock.  So the check can pass
for an allocation that is going to fail.

To tell these apart, the check needs the migratetype of the request.
Add __zone_watermark_ok_mt(), which takes it, and use it where the
caller asks whether this allocation can succeed:

  - zone_watermark_fast();
  - the recheck after node reclaim in get_page_from_freelist();
  - compaction_suit_allocation_order().

Other callers keep __zone_watermark_ok(), which counts every
migratetype.  kswapd and kcompactd balance the zone as a whole.
should_reclaim_retry() asks whether the allocation could succeed if all
reclaimable pages were freed, and compaction can then free a whole
pageblock for it to claim.

kcompactd passes MIGRATE_MOVABLE to compaction_suit_allocation_order().
It never sets ALLOC_NOFRAGMENT, so the value is not used.

Nothing outside mm/ uses __zone_watermark_ok().  Move its declaration
to mm/page_alloc.h, next to the new one.

Nothing reads the migratetype yet, so there is no functional change.
Preparation for making the high-order check honour ALLOC_NOFRAGMENT.

Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>
Tested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 include/linux/mmzone.h |  3 ---
 mm/compaction.c        | 11 ++++++-----
 mm/page_alloc.c        | 36 +++++++++++++++++++++++++++---------
 mm/page_alloc.h        |  8 ++++++++
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
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 9e1261521b6a..0ebfbbb5d7c5 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3588,9 +3588,10 @@ static inline long __zone_watermark_unusable_free(struct zone *z,
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
@@ -3666,6 +3667,20 @@ bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
 	return false;
 }
 
+/*
+ * Return true if free base pages in the zone are above 'mark' regardless
+ * of migratetype. Use it to check whether the zone as a whole has enough
+ * free memory. Use __zone_watermark_ok_mt() instead to check whether a
+ * particular allocation can be served.
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
@@ -3698,8 +3713,8 @@ static inline bool zone_watermark_fast(struct zone *z, unsigned int order,
 			return true;
 	}
 
-	if (__zone_watermark_ok(z, order, mark, highest_zoneidx, alloc_flags,
-					free_pages))
+	if (__zone_watermark_ok_mt(z, order, mark, highest_zoneidx, alloc_flags,
+				   free_pages, gfp_migratetype(gfp_mask)))
 		return true;
 
 	/*
@@ -3711,8 +3726,9 @@ static inline bool zone_watermark_fast(struct zone *z, unsigned int order,
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
@@ -3932,8 +3948,10 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
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
 
diff --git a/mm/page_alloc.h b/mm/page_alloc.h
index e238ee91ed24..d95420093b15 100644
--- a/mm/page_alloc.h
+++ b/mm/page_alloc.h
@@ -231,6 +231,14 @@ extern bool free_pages_prepare(struct page *page, unsigned int order);
 
 extern int user_min_free_kbytes;
 
+bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
+			 int highest_zoneidx, unsigned int alloc_flags,
+			 long free_pages);
+bool __zone_watermark_ok_mt(struct zone *z, unsigned int order,
+			    unsigned long mark, int highest_zoneidx,
+			    unsigned int alloc_flags, long free_pages,
+			    int migratetype);
+
 struct page *__alloc_frozen_pages_noprof(gfp_t gfp, unsigned int order, int nid,
 		nodemask_t *nodemask, unsigned int alloc_flags);
 #define __alloc_frozen_pages(...) \
-- 
2.54.0

