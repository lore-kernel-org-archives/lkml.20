Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612403;
	b=AeWIJq2hO5syM7uCbShZcMblbvF6n+8190FMMa8uceI+RmNSdMsG12zln6l9jFUkdovj
	 KiAKfhLFupPpqJ9CFvtyUjngXccv6RqXTziE9+sw18KOXXDPFkGx/yCxCvV48TDmv915v
	 t79GIwIWoWb4FChCtLRmjFeMB7nlThBkZZFquvhCSH92STAYnU1nbRbU+FS74L03jO+0E
	 mkzsTwDv2dl6Phhbk16kkfHvuD56yrhBTQBfNzfc17/IWm1FmCrMLzjmfdKinJ2NKJ9UT
	 yoiZR2+QXNqahkAKZ9b9ehAU7WGjPILfCVoICrO8dXGvyGvwrEobsSrB5bK//Ytdj8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612403;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZwnRUvz3SwxdgHBxrwlGXy0H9IEzMJS4UqyVR9mnGt4=;
	b=3omcqmfWVlpkCzqbFCA9Xg+zoP9ANTnjQaco/1LqeNyv9FkCwZYpAj/slIxMGdHi3BSw
	 tO/HD/b6Sm4r+3gpJropaw9qF4rhrF7mUJ769c/zZViwWBVF4fIeo/YifCCU/7oRndHKx
	 oK9D/b6p3jeZ0EzbPMO19wU4SU/WRelSkxIADZjyIK7nCR8sLk1bfOfaas2C5alQgiuNJ
	 HOmVVwGLMynSIylYJCrWI2zsR3hv9eTwf5z0TkHd4NGio6C99aCxJXYQZxfBvvFrrcLSn
	 FrtGB1Pi8ItuiI95az1YhFf+l1G/CflOeIRZQRP9BNrqeCJWSy3tU+XAGaCYPlb2VEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kLQemQVy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E274606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kLQemQVy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1591F00A1B;
	Mon,  2 Nov 2026 09:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793612402;
	bh=ZwnRUvz3SwxdgHBxrwlGXy0H9IEzMJS4UqyVR9mnGt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kLQemQVynVju20euqViIiDt0YK9kwy2/kG2VtAwAvS/9wonG9TNhcnJM/Ok4OKAPv
	 jSdb6f8Eo+N6JsL5pfTyznr8AjBoEIRCJvdRnbTiP6ei9X5h/NUEsyJsvwQrf9EZsK
	 OIAtrszQFtsdPou4eDHRkbpW/SZZ6B+BebDJHsANeYOnTcsilFvYYI6ImzUWh7/xs5
	 M7WNMLuRl7yLE8QdwDjxL6KBmI72Y+KH3ZoG67r84IcW13PWCc05zz4Zn67PIaFOLi
	 zfNjdagDu0zqqDnDBRjlepUwVgP1Ynap1vH8F3Q8FO1B1oYhTZLlvg/7vxe8/zpU+V
	 N/K5gU0zeWo8A==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id 8DF371980050;
	Mon,  2 Nov 2026 04:39:56 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 02 Nov 2026 04:39:58 -0500
X-ME-Sender: <xms:a1roav9K8JFD3toMZqmrFBA2yH_vLB0MHVevqWg85YdTlTcaUKovVA>
    <xme:a1roasy_dTO0Ypu1aSOKeceLDLAU2Xl8Uj28aBErrWDAkyAKcG9WtH2Bter8GP-ht
    -cFlXrjdEfoVuO-pCpUNb9x_JHRGPf4LavTwuVJuLqWpD-9rPIE_pFF>
X-ME-Received: <xmr:a1roav_GC6L0cjYqq6XNL4SyK_wJtkKLVg1qWwPyTQ-6_yi8tVbm4bpFyuc>
X-ME-Proxy-Cause: dmFkZTGPviSqm3YUI6GAME8zrCSvhUR5rBtNMH3Q6Juja8qKg1VfBKlS79iNDljkcrz+I3
    rNfIvfS6fYoi+1178aVw+Y4CCEFxA/81t6V5pigg87ow+iFSpO4owYX+DTVhqm4DJGRhFm
    Ex54iucggz3juJZje3Gdui3KypUVZYWqSzDUfarJzGVHyqjXlz4AeljWeOwj+Cq8LDsqe5
    6ZZxnbrh9a6uqPVicD1xVkjHebUJj9SY0HDS2X/D14Onqm+7HQOU4tc8J+d5yFTXXWyg1b
    27RFYBLd/xm8EStFnNTf2dfH+F5DmKEILnm4ckJVyRFvcufqe92/3wR3eO3brZrrnAeRgY
    oMgr/aGqxA2otXk+Jc9DabZB5oAZm5xKNPMwWSqNPGzr7P51siwq0HNQ9d1Ft8JbpCfgIf
    ocglp9ll4Zh+7GAvEvbK3o9Tu2tjfP00Rcf4JDsem23bFbM8WR2fKfel0xaivnGNOTP/IN
    /UNz3UwSpkwwzjWFhj95SETM12w1lHPQyw2HTExMS8q0qLhkrgZBfqIUIKs4IiKP38YHdT
    OXBHIOCZtj+ByyTu5W/g3OS0WH+dNVR65iP7eHePA+521R4FPkYXg3PjL8eDdHbQR7RrMf
    O3DXl39jLEZACmQPdmFja0NrR5amHEPT8sg1IkOmkQbvvxUTBfPZ/bQI+lRg
X-ME-Proxy: <xmx:a1roapIau3tr-1i7ij0Yu27xPtkXdzjmZcVby4bBMpauV7jAtd0u9g>
    <xmx:a1roas83cgG6MT_Yz1GQLub1Ky1_jjLlFjXyy7KPhNjNE2LYePuH8Q>
    <xmx:a1roatFV3pqZ_ewbYRvWXiH6oHfra2tB6izlVnXAIfHkLVmBoNXpJQ>
    <xmx:a1roakOoNDeDawQ6RsRDO61go4mpgbxndS-__b6hpJWLv5Tj0Bya-Q>
    <xmx:a1roakQIuvkbTbsKGrYn0jMgO4y8IYpdSxtEzfIUPa905MzzjxNXgrWP>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 04:39:55 -0500 (EST)
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
Subject: [PATCH v2 3/3] mm: vmscan: tell direct reclaim the allocation is ALLOC_NOFRAGMENT
Date: Mon,  2 Nov 2026 09:39:36 +0000
Message-ID: <20261102093939.3340540-4-kas@kernel.org>
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

Direct reclaim for a costly order stops as soon as the allocation could
succeed.  compaction_ready() skips a zone and should_continue_reclaim()
stops reclaiming when zone_watermark_ok() passes, and zone_watermark_ok()
accepts a free page of any migratetype.

With defrag_mode, the allocation behind the reclaim is ALLOC_NOFRAGMENT
and cannot take the free pages left in unmovable and reclaimable
pageblocks.  Reclaim stops on them anyway, having freed little.

In Dev Jain's 64K mTHP benchmark, with the high-order watermark check
already honouring ALLOC_NOFRAGMENT, an order-4 direct reclaim frees 16
pages on average with defrag_mode and 45 without.  64K faults get a bit
over half as many folios as without defrag_mode (medians of 15 runs):

                              defrag_mode=0  defrag_mode=1  defrag_mode=1
                                                            + this patch
    64K faults allocated              20750          11538         19759
    64K faults falling back to 4K       725           9945          1664

Pass ALLOC_NOFRAGMENT from the allocation down to try_to_free_pages().
Both checks then ask __zone_watermark_ok_mt() for a free page the
allocation can take, and an order-4 direct reclaim frees 40 pages on
average.

Fixes: e3aa7df331bc ("mm: page_alloc: defrag_mode")
Reported-by: Dev Jain <dev.jain@arm.com>
Closes: https://lore.kernel.org/all/4aa14b41-9b89-494c-8825-55fffd5a541c@arm.com/
Tested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/internal.h   |  3 ++-
 mm/page_alloc.c |  8 +++++---
 mm/vmscan.c     | 24 +++++++++++++++++++-----
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 8e58e2db5e09..b43947818f9a 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -65,7 +65,8 @@ void folio_mark_lazyfree(struct folio *folio);
 /* mm/vmscan.c */
 unsigned long zone_reclaimable_pages(struct zone *zone);
 unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
-				gfp_t gfp_mask, const nodemask_t *mask);
+				gfp_t gfp_mask, const nodemask_t *mask,
+				bool nofragment);
 unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru,
 			      int zone_idx);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index d53fb2c67ae1..08f9bdcd3b9f 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4451,7 +4451,7 @@ static unsigned int check_retry_zonelist(unsigned int seq)
 
 /* Perform direct synchronous page reclaim */
 static unsigned long
-__perform_reclaim(gfp_t gfp_mask, unsigned int order,
+__perform_reclaim(gfp_t gfp_mask, unsigned int order, unsigned int alloc_flags,
 					const struct alloc_context *ac)
 {
 	unsigned int noreclaim_flag;
@@ -4465,7 +4465,8 @@ __perform_reclaim(gfp_t gfp_mask, unsigned int order,
 	noreclaim_flag = memalloc_noreclaim_save();
 
 	progress = try_to_free_pages(ac->zonelist, order, gfp_mask,
-								ac->nodemask);
+				     ac->nodemask,
+				     alloc_flags & ALLOC_NOFRAGMENT);
 
 	memalloc_noreclaim_restore(noreclaim_flag);
 	fs_reclaim_release(gfp_mask);
@@ -4487,7 +4488,8 @@ __alloc_pages_direct_reclaim(gfp_t gfp_mask, unsigned int order,
 	int reclaim_order = ac->reclaim_compact_order;
 
 	psi_memstall_enter(&pflags);
-	*did_some_progress = __perform_reclaim(gfp_mask, reclaim_order, ac);
+	*did_some_progress = __perform_reclaim(gfp_mask, reclaim_order,
+					       alloc_flags, ac);
 	if (unlikely(!(*did_some_progress)))
 		goto out;
 
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 9959ca158ce8..54a16dbb84dd 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -142,6 +142,9 @@ struct scan_control {
 	/* One of the zones is ready for compaction */
 	unsigned int compaction_ready:1;
 
+	/* The allocation cannot fall back to other migratetypes' blocks */
+	unsigned int nofragment:1;
+
 	/* There is easily reclaimable cold cache in the current node */
 	unsigned int cache_trim_mode:1;
 
@@ -6316,6 +6319,17 @@ static bool in_reclaim_compaction(struct scan_control *sc)
 	return false;
 }
 
+static bool allocation_can_succeed(struct zone *zone, struct scan_control *sc,
+				   unsigned long mark)
+{
+	unsigned int alloc_flags = sc->nofragment ? ALLOC_NOFRAGMENT : 0;
+	long free_pages = zone_page_state(zone, NR_FREE_PAGES);
+	int migratetype = gfp_migratetype(sc->gfp_mask);
+
+	return __zone_watermark_ok_mt(zone, sc->order, mark, sc->reclaim_idx,
+				      alloc_flags, free_pages, migratetype);
+}
+
 /*
  * Reclaim/compaction is used for high-order allocation requests. It reclaims
  * order-0 pages before compacting the zone. should_continue_reclaim() returns
@@ -6354,8 +6368,7 @@ static inline bool should_continue_reclaim(struct pglist_data *pgdat,
 		unsigned long watermark = min_wmark_pages(zone);
 
 		/* Allocation can already succeed, nothing to do */
-		if (zone_watermark_ok(zone, sc->order, watermark,
-				      sc->reclaim_idx, 0))
+		if (allocation_can_succeed(zone, sc, watermark))
 			return false;
 
 		if (compaction_suitable(zone, sc->order, watermark,
@@ -6580,8 +6593,7 @@ static inline bool compaction_ready(struct zone *zone, struct scan_control *sc)
 		return false;
 
 	/* Allocation can already succeed, nothing to do */
-	if (zone_watermark_ok(zone, sc->order, min_wmark_pages(zone),
-			      sc->reclaim_idx, 0))
+	if (allocation_can_succeed(zone, sc, min_wmark_pages(zone)))
 		return true;
 
 	/*
@@ -6965,7 +6977,8 @@ static bool throttle_direct_reclaim(gfp_t gfp_mask, struct zonelist *zonelist,
 }
 
 unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
-				gfp_t gfp_mask, const nodemask_t *nodemask)
+				gfp_t gfp_mask, const nodemask_t *nodemask,
+				bool nofragment)
 {
 	unsigned long nr_reclaimed;
 	struct scan_control sc = {
@@ -6978,6 +6991,7 @@ unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
 		.may_writepage = 1,
 		.may_unmap = 1,
 		.may_swap = 1,
+		.nofragment = nofragment,
 	};
 
 	/*
-- 
2.54.0

