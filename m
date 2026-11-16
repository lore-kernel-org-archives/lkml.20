Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833482;
	b=3y4TRif6/jbm8iFA5Ka25jO3hU+bmwfAhw9ry2bBUPFtNNssqm9CQBtE1f33xy71/rBU
	 f/+IBsA6fu0a5AU1i3IefKLxXysl1ydimSy3l2apGOjoJtAtzJwQFHM+GQpwB9ez5Dive
	 oCG/GP5Rg9SEByndJ3PSxfd1GfUwAD0DLL3Zzxx9BMuXfDkvVqT/nMY164E4NsHQmbhkN
	 FhBI6c3iYZhTxZFOi2PRLOCp/CJ9cL5c5oxfVuTmu2qe4oiPg8MHUpI4iiGnLQnJ6d4Yj
	 LmEEoybPzUR4yGC35mM6N1XMIqOVKb2oqDH2Mcsxn6rHRnkQYGJQYSdhwKF1T9GkfyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833482;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FawFGpu24nqmYgxnTPWSScuSy3Ov5v1Ccl8krMGTmys=;
	b=jZ/IBvQk0NSfwoK8qk/RA6u9rCtFL3Y4fJqaUpG/pEdJr/5gIB1eW6E48MTTBFLPHWhS
	 hIZ8LFrvaBEg1C4qZvOWO79MfRy2RNoEp9vECSo+B/qbytmVLGtktkOuohXUvc02ODh3i
	 NHwCUEtJp8LWXJ0ypS4CU7/7O2RQffjV2f9VCYLc4ZTtv5UiE3YJRQ5gXx6l7GuNwe7nd
	 +9piFqTHb3ApeOj7osBxN2mz46o7494UttweaP8tIrg2n0zha07zHogJIxZmdDNAks4sj
	 sZurQqd/VBlhuqY/gacUqdmWlzYdByle0umUaFwCMf6rUZXmi6EPr2Ne+kq33jm8fFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jvlm1zom;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131A6606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jvlm1zom
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6C11F000D1;
	Mon, 16 Nov 2026 12:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833481;
	bh=FawFGpu24nqmYgxnTPWSScuSy3Ov5v1Ccl8krMGTmys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jvlm1zom8lgjE2YfF399PEuQif74vKLO1uT8/u9rRZkhCo9/MR/J2fBMeEPTNxj0z
	 yBkZtVjxbkfYP5+YE96tzbiIUyzytZKP+aH5ykUg4VZDNyKAlKY2wHtT0I4qpq52gT
	 rkrGlRaAYvug19nSHpNLjsXCBlIyWRfAX+Y90D+90GPeDC1wa11yfBplc4p5isnEIr
	 fssDk9BGRCK0mHjWdVd/fQqgPFsk7Nd0P+dTs3hl7CrL9MF2lJw2mEgsB6jPYQNyrT
	 TEQgu2Ft2lBhejh0c9TvR9No9oMvbrcEjFlaK91MOM0dLrknLdjFwbvg9tMXQwKxqZ
	 HO+MBWZJel0+Q==
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.ams.internal (Postfix) with ESMTP id 1E982198004A;
	Mon, 16 Nov 2026 07:51:16 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Mon, 16 Nov 2026 07:51:18 -0500
X-ME-Sender: <xms:Q_z6atC5knrIKpJYfuAdL5cJeNJhfVQekE1ChuOZj9PTu8UjBL8LmA>
    <xme:Q_z6asm02pZpipO3debddEWc_4JLbs1coDZ8lmiDd0__ifIG2dG-oXVJpbJYyElan
    uX-XKBEEMpx3M9vndennPFragIXoG7VXFKMZcZRXuJgXPCVxfcqxaE>
X-ME-Received: <xmr:Q_z6arhkX-dgwz4ea6l48Ijqueyr1LT42G3rqTHInfSKWSEq9BvbJ_oTu-s>
X-ME-Proxy-Cause: dmFkZTEndR1twvEtVV9H42M6Qp3CHlOf2K86xhOcIvsHlI0qPC43EEHmYQS8lk+yVDorCL
    4AZIMFoK0mM5jxtyIPxyjz9+QW+KDyr5a1QI5LAVNOvvdezfJIUFEiBk8hqwDUM1ipGtqV
    Yj2cbe2LqPMwyAo52y79X45epac/GwTfTEU69t1sP1+Wb/QEsMx5rWyZD+nPZUaFTyFXG+
    5CQ4wZzn6SCh8TwXgLLqjmYSN52Omu45Pq5Ep93lX5zHUXxZrJ0QNbBDhUDgexZPkTOOE8
    szf9NTieQQj+m2laq7APapu9RHhoSoGNwFFQicqgJd//nPpk/ulYLPxsZmBstc/W7NyVKP
    L0TVWOyeltJ1Dtn1gieignN7lmvkRBxENIvN8YpQIucfXbD+g1AkSIh4Pd97MqwFMjd43t
    CDWdyOmng1aIntp6RfUI8PoiLHeZK7ZnDeKvKYBVA8iPBlD2J5KBy/ajJAxgYw4mAVh87y
    BBNCintJqsHd5v2ckYXBmPRSm/jVB9f8IWroAINDQn6VNnEGILq/adb2sgWASZmddAnCig
    WALZZEMCzwqS589GcXGtpcEgyavKLKqyy+DW54Oo0iW9I9Xce7DCOERlht71GEIAQhfko0
    jh8vDGuh+wEXq+35+/wvPtCK4hqABxrbirXNhPL+uR3RLORqavtfejOwQviQ
X-ME-Proxy: <xmx:Q_z6ald4lfRMZ8F97vcX40jsFdyBuQe1cVAWDiMkze63k1ZGANOoBA>
    <xmx:Q_z6arAiR-5JRz8tKSQt57ocEogBicWXKU9KjYBD-cAN6UxAbVu4ew>
    <xmx:Q_z6ap59-GHrHSM9ekcLRZO2Ke4y4zR9eSsMk0tQVYUtdcqfKxxDjQ>
    <xmx:Q_z6aozIFfQX_VyIS1ghfM2FQ88Jqveg05wL9rysonZuVC3-93913A>
    <xmx:Q_z6alld4rl4nnZTtfyVcpcFMPnmg5mkODZqXnxJRxiP2mR76b8SXzwQ>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Nov 2026 07:51:14 -0500 (EST)
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
Subject: [PATCH v3 2/3] mm: page_alloc: make the high-order watermark check honour ALLOC_NOFRAGMENT
Date: Mon, 16 Nov 2026 12:51:00 +0000
Message-ID: <20261116125103.2894162-3-kas@kernel.org>
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

With defrag_mode, every slowpath allocation carries ALLOC_NOFRAGMENT.  A
request below pageblock_order may take a page of its own migratetype or
claim a whole free block, but not steal from another migratetype's block.
For a high-order request, the watermark check still accepts a free page
of any migratetype.

Under memory pressure, movable allocations take free movable pages as
soon as reclaim frees them.  Free space in unmovable and reclaimable
pageblocks is off-limits to them under ALLOC_NOFRAGMENT, and builds up.
The free pages of order 4 and up end up mostly in those pageblocks.

A 64K mTHP fault cannot take them, but direct compaction's up-front check
counts them and returns COMPACT_SUCCESS without compacting anything.  The
allocation then fails.  Because compaction "succeeded", it is never
deferred, and every fault stalls in it again before falling back to small
pages.

Dev Jain's benchmark faults 64K mTHPs under swap pressure, in a 7G VM
with only the 64K size enabled.  With defrag_mode, those faults stall in
compaction 18 times as often and get about a third of the folios
(medians of 15 runs):

                              defrag_mode=0  defrag_mode=1  defrag_mode=1
                                                            + this patch
    compact_stall                      1690          30669          2607
    compact_fail                        621          30531           906
    64K faults allocated              20750           7391         11538
    64K faults falling back to 4K       725          13832          9945

Make __zone_watermark_ok_mt() skip other migratetypes' free lists below
pageblock_order for an ALLOC_NOFRAGMENT request.  Give
__compact_finished() the same rule for its fallback test, so that
compaction, once it runs, stops on a page the request can take.

zone_watermark_fast() calls __zone_watermark_ok_mt() too.  With
defrag_mode, an allocation now wakes kswapd and starts reclaim or
compaction as soon as the free lists hold nothing it can take.  For the
orders the per-cpu lists serve, that is earlier than before: the check
does not count their pages, so the allocation no longer uses up the local
list first.  A request that may not wake kswapd or reclaim, such as an
mTHP fault with THP defrag=never, falls back to a smaller folio instead.

Fixes: e3aa7df331bc ("mm: page_alloc: defrag_mode")
Reported-by: Dev Jain <dev.jain@arm.com>
Closes: https://lore.kernel.org/all/4aa14b41-9b89-494c-8825-55fffd5a541c@arm.com/
Tested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/compaction.c |  5 +++++
 mm/page_alloc.c | 21 ++++++++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index 6c553d0e90f8..7312f7515c53 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -2365,6 +2365,11 @@ static enum compact_result __compact_finished(struct compact_control *cc)
 			!free_area_empty(area, MIGRATE_CMA))
 			return COMPACT_SUCCESS;
 #endif
+		/* An ALLOC_NOFRAGMENT request may only claim a whole block */
+		if ((cc->alloc_flags & ALLOC_NOFRAGMENT) &&
+		    order < pageblock_order)
+			continue;
+
 		/*
 		 * Job done if allocation would steal freepages from
 		 * other migratetype buddy lists.
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 0ebfbbb5d7c5..6e75c03b303b 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3587,6 +3587,11 @@ static inline long __zone_watermark_unusable_free(struct zone *z,
  * will return true of the order-0 watermark is reached and there is at least
  * one free page of a suitable size. Checking now avoids taking the zone lock
  * to check in the allocation paths if no pages are free.
+ *
+ * Under ALLOC_NOFRAGMENT, a request below pageblock_order can take another
+ * migratetype's page only by claiming the whole block, so only free pages of
+ * @migratetype count below pageblock_order.  Without ALLOC_NOFRAGMENT,
+ * @migratetype is not used.
  */
 bool __zone_watermark_ok_mt(struct zone *z, unsigned int order,
 			    unsigned long mark, int highest_zoneidx,
@@ -3649,6 +3654,9 @@ bool __zone_watermark_ok_mt(struct zone *z, unsigned int order,
 			continue;
 
 		for (mt = 0; mt < MIGRATE_PCPTYPES; mt++) {
+			if ((alloc_flags & ALLOC_NOFRAGMENT) &&
+			    mt != migratetype && o < pageblock_order)
+				continue;
 			if (!free_area_empty(area, mt))
 				return true;
 		}
@@ -3677,8 +3685,12 @@ bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
 			 int highest_zoneidx, unsigned int alloc_flags,
 			 long free_pages)
 {
+	/* Serving an ALLOC_NOFRAGMENT request needs __zone_watermark_ok_mt() */
+	VM_WARN_ON_ONCE(order && order < pageblock_order &&
+			(alloc_flags & ALLOC_NOFRAGMENT));
 	return __zone_watermark_ok_mt(z, order, mark, highest_zoneidx,
-				      alloc_flags, free_pages, MIGRATE_MOVABLE);
+				      alloc_flags & ~ALLOC_NOFRAGMENT,
+				      free_pages, MIGRATE_MOVABLE);
 }
 
 bool zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
@@ -4693,10 +4705,13 @@ should_reclaim_retry(gfp_t gfp_mask, unsigned order,
 
 		/*
 		 * Would the allocation succeed if we reclaimed all
-		 * reclaimable pages?
+		 * reclaimable pages?  Count free pages of all migratetypes.
+		 * Compaction can then free a whole pageblock for the
+		 * allocation to claim.
 		 */
 		wmark = __zone_watermark_ok(zone, order, min_wmark,
-				ac->highest_zoneidx, alloc_flags, available);
+				ac->highest_zoneidx,
+				alloc_flags & ~ALLOC_NOFRAGMENT, available);
 		trace_reclaim_retry_zone(z, order, reclaimable,
 				available, min_wmark, *no_progress_loops, wmark);
 		if (wmark) {
-- 
2.54.0

