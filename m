Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612397;
	b=exaTcoX5bnsenpHTmFEYY9yAZWafTPPN2hNFZlxfvgaFVWYX6ZTkU3Et75OeJaIrc3TA
	 S+r4cYMbM+9NU5Xi6nmf6zA21j05XBWyJGOKG+U1f1OPynhKYpq7H5Vogsw/c5vB7HXUd
	 1bTOjINf8MihI8sH/gxEurmtg7Z3HAgq76H/23roh19DtrymQACRfKxcQcFxjbTe4rC8n
	 nVAkZ7hpORajBj9l2KU04pKY283LBx02oD7JWGQ5lx63X4fOLHdyxci9mW3mbHAylUBBW
	 YOJewUL//C8qvTrCQf39vtlTZbW4Ne3YOIb9kgcJcJeRgD8/RzYI+3aTkw/wIPehyYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612397;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5+NjX0i7iua/kR7lRGFWkbibVVW0pqZFNgIbLWz1GKo=;
	b=N5Q7nrL6eY+V9nt87yoZftb6qso8rqPgRNF0rrr49UVul2KgLn933TSLlLe+rMsAiolA
	 loIBgcSiUyd9SdYkdvA+VT3/EJlP5Tw4/3MCLE2DSFastWxXsmvV8ToBZpY/ESmnHKiZ9
	 rB2nlYxPYXrjHtIO9iKILVQONKbp0y8yqWw6ZZFNgP9wBhUomSIo1YW99LuyuIcmh5BKw
	 3fRMWX9bVrQPlFE1u6wlpah9r6fbgqBJt9zagP61nuw7cnFhZs9Lw9l4OGKk8P3TJ5k/4
	 XGwBqaY2pmNeabSt09exBfNfo981xsSZKfuWanSLq1bfDjiP3gZmBtBzdpg1CzGdKMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igw8Vfwj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A0960A2604
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igw8Vfwj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6814F1F00A20;
	Mon,  2 Nov 2026 09:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793612396;
	bh=5+NjX0i7iua/kR7lRGFWkbibVVW0pqZFNgIbLWz1GKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=igw8VfwjliKLI10JXh2VCiiuJVYU47QEs62YYm56kH6hq4gHUHGzLVvzTzndxFQ3R
	 zSpvrba4k0UwCcK+A8JXRTAH0Er3d40HC3/LMYtYr3m5svHlDa16eg/wQNCn2xMGjk
	 6JFA6kpNiGxQ9i+TXe3SbcaXr+qynERe692KtRRR2w3jjFgSSW6MhcZSEjpCuOfwFJ
	 T7Z2FwWbQbA3VIVC9kw4H2UFl+1i7LRSV8aI3sh4451Vyx4tmuG2a3wAyknuDiP/Jt
	 aZjB/9vqzxOKfwurbdW5yPzot+NvN4hPn3LZiYUgWeNJAQAS6LLJDkB3Z09r48tBnz
	 PsEI9AVFLmIXQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id CBF5F198004A;
	Mon,  2 Nov 2026 04:39:51 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 02 Nov 2026 04:39:53 -0500
X-ME-Sender: <xms:Z1roanDiKXbFLaAe_JJjz1fKpPTxlcjc28HoEPzV-shSKxxD4vIRQg>
    <xme:Z1roaunANriIQ4cjv5gmOrFHshi6OgYcoftmDxV5RKl5LWocdSx-lJ1wgcP_bOoE-
    WnPcEewZCB60yRUEYVgc_370-s2VgD4dGBcVYzJMXDBDXl2sIk2QpvB>
X-ME-Received: <xmr:Z1roalhO9bugcueSGTsLbSVatZfypc8MnLoZe5UCZJMvJz0Sh9mAU5Mvklw>
X-ME-Proxy-Cause: dmFkZTFQzR3EIh2rxnTQ7G5RQ4h5xUtBbfaRXYhAnr/P9m7R825W5LXZo4M7w8GIKmIjGj
    qybGvaUdVk5pSieVtTsyoZ6ucg6NMIsQaSkBr3/sxQrJxCcLIhMpJSFbq+kpA46wGzaqo2
    SSshVKDj1/7+zxij4YAc74swndDYo6XkK+PNI5K+fKsZVu24yZBOMeGIGR6Gxf+6GTRxIb
    PDupXWDeZprGb+597EGq5pTehEBJgX0Qk+xDf9JOiQdRB94h2GagfZ5ody0ueOwnbFszoH
    eMQpNI0XbAvyAwAalknBNsPb7YQIm/7nk2H/0WptA+ahLU8XVv6vz+9VwN6/e1viT1lGfb
    wRb1ZkKDH5PZZzoNbYL/+/K7Cw0ZppQMLZiVDwhw2kVTflREelyTK5r5mlCYfpo95N81J2
    5OlpmLNBaW3/Lp4hEC/MdIz7koOZH5/SmY4O2qsPvP3KRBJ3hwyLDY/kcz9bJtTqy6Kt8K
    pMJvThlWmLFq9ni6HDFBt+W2KXNViZRTfyaXrZlShpsj7MTlCesuaM5f2UmQnYd2Da6/qi
    wG+dX+0ukPO6K+Tm5/H0ieG0MbALBL7od+XXjprVtmtKTSP8gtdXeoU+VaQWOXtvOK9jGU
    GgK4HUA9B+KU8shU/cGgjBmxMIbIUorA6+FOzfc7QlfWWXsTw2vJ38zfyMHw
X-ME-Proxy: <xmx:Z1roanexz0e__cOwPgnpZYMrdOThPDLeXbeyTf_2RZQLW2y-LyfkoA>
    <xmx:Z1roalA15BY6ZrEJ2_O-jstaMJ_vWK7TuHwje7oLEy-CcFWdT8ZhYQ>
    <xmx:Z1roar4rFbeIhgi0EdeuuId1PBdKBKEYblrf7zzH7SFsSA2nBiC78w>
    <xmx:Z1roaiysPDs1d1CfE8VgD1r3RbQNhctTA5Z5iLGG0uXubFTO46u96A>
    <xmx:Z1roankIc40nuHxHrYRr_YEGib1QAs0f9g2RVvb4PdiUp844xjenxyiS>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 04:39:50 -0500 (EST)
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
Subject: [PATCH v2 2/3] mm: page_alloc: make the high-order watermark check honour ALLOC_NOFRAGMENT
Date: Mon,  2 Nov 2026 09:39:35 +0000
Message-ID: <20261102093939.3340540-3-kas@kernel.org>
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

With defrag_mode, every slowpath allocation carries ALLOC_NOFRAGMENT.  A
request below pageblock_order may take a page of its own migratetype or
claim a whole free block, but not steal from another migratetype's block.
The high-order part of the watermark check still accepts a free page of
any migratetype.

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
index 6c553d0e90f8..7b2267bbf115 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -2365,6 +2365,11 @@ static enum compact_result __compact_finished(struct compact_control *cc)
 			!free_area_empty(area, MIGRATE_CMA))
 			return COMPACT_SUCCESS;
 #endif
+		/* Under ALLOC_NOFRAGMENT it may only claim a whole block */
+		if ((cc->alloc_flags & ALLOC_NOFRAGMENT) &&
+		    order < pageblock_order)
+			continue;
+
 		/*
 		 * Job done if allocation would steal freepages from
 		 * other migratetype buddy lists.
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 7730660bdd09..d53fb2c67ae1 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3586,6 +3586,11 @@ static inline long __zone_watermark_unusable_free(struct zone *z,
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
@@ -3648,6 +3653,9 @@ bool __zone_watermark_ok_mt(struct zone *z, unsigned int order,
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
@@ -4685,10 +4697,13 @@ should_reclaim_retry(gfp_t gfp_mask, unsigned order,
 
 		/*
 		 * Would the allocation succeed if we reclaimed all
-		 * reclaimable pages?
+		 * reclaimable pages?  Count free pages of every migratetype:
+		 * reclaim and compaction work across migratetypes to free a
+		 * whole pageblock, which the allocation can then claim.
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

