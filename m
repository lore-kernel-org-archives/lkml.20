Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194026;
	b=aP3nMuO7RA3JNgucAy6EQr+qKJA10BgYDgNsDwthwxWWq0PWfeWYoQHwiLcaQ1OW+Xe4
	 OixawMX9zHCAMmzOjDKQwAef79ihmLfyBoEnKIWGVgNRTGN3e8FtOPeou1JQPbvJYzYF/
	 lDSCfq+DbK9YgyTXax4pfX0ObL89nej6NdYNMZQvdyu11QraqDbZ3cYFcJBKsUzurIJPN
	 a6He0IkeMsSwe06suosczguzzj7PELti+goBoXxKC69nXTVVcxqMeElAS7swRPrZyk9fM
	 L7MVUX786ELdwIX284RMqasl/smMknZCBBO82qPHSt3IY6NPhoTHvUE1zmqafxoXGwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194026;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=dMoLJsAez8jjmfPfOldc+8O9gx8lNYhUeZlbdp1oE2E=;
	b=NemgvXbnwfYz88vhHTcuVuU7+RUOxkgsI9sqcfkdgFkYtH9L8bnmrMFw1vsPwwmPQnU4
	 dsS8gSz7ElEW0Fz9TGl0Wqsrvy4axqP35PKwmmnXt4ZDZnHvh4Wagk+yTE2RMSTQWVtDp
	 mb9ZXVNjzHJ9NUk1WhFq7wAe7P9H9bZ74vzClRN2MCXFnmU2w14gklabiHuQ64H1koSGz
	 wOD83R5fc4uQ13vF8nRm5rdaf7rd/m8QGO1qSDXE+yimnxm53KHu+UAAWchN3vY/tugHe
	 FA6DeW1Mz2tsw3CEwDCghiODv+2V4PR2nT58aie4xhgY7XV11b65xA8ZNmVYsWYCv6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=shutemov.name;
	spf=pass smtp.mailfrom=shutemov.name;
	dkim=pass header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=DWNTvlLz;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=xUISRKbi;
	arc=none smtp.remote-ip=202.12.124.138
Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6321560A260B
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6321560A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=DWNTvlLz;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=xUISRKbi
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.stl.internal (Postfix) with ESMTP id B73B81301F1D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:27:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 28 Oct 2026 09:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793194021; x=
	1793201221; bh=dMoLJsAez8jjmfPfOldc+8O9gx8lNYhUeZlbdp1oE2E=; b=D
	WNTvlLzdfRcCYM8TuVsrDXAdGRHXiRs+DSG9PVtvbwWX6b2nmM1lNq7vNlGkA+xe
	RIiT2McFTnxlSAoyx8qjHNW7X5o5WY2+6mOvClSB49LSxnRrHIuMMW+RScM3z3PX
	/AIm1pmYLTNg9Yc38KW/7tChRoEUDtU62Ijb3PHljveZhlFBd+NqsK1bhu557ce4
	awSyE41Kr6eSKJQSFCq2BG6b+mgYkfOaovJJnepquRrZhz/8U4JmWtncxiXMDJ0t
	7LD24ccwQq7qSCPD7Glini5lyS8HFb2iitoSqEDYOACSvKU49VmLRjzLFmqeTyIF
	3YynpV60Jr9aQONNfggbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793194021; x=1793201221; bh=d
	MoLJsAez8jjmfPfOldc+8O9gx8lNYhUeZlbdp1oE2E=; b=xUISRKbi4hf8+7yeF
	36wLNCFmAz3KuPziBq2LdZi1VuivhsQoAVJo+xeQzLRAHAdWzN0OGPwTUwRuinCD
	C+hMd73w1kUVGzG3Jz/K1a2TpLziIHqBeDhmyd4l8jFQc+71Cy7sOhZb3YohtwX0
	1Ut6gYR6lm4tzBUEVJIxAO9B2kAGVByUZzsJPS2tNW6V+Btwz8KTW5tN88hLqbVs
	VBAAHhXyzM+g7qT43oPPyJ95OX3uJLA6ctSI6TxyoMsCsPAkxr6VHAmEExRUdOl9
	hjedh2zbTnQWC6dMv7nCllG1O9g1O8yap7L2Ue/pdl70UFxK3EHTz0OabozfOfxb
	ggNWw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793194021; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:QuiahpBwFVV/O7Yi/GGCItq8VzD7LDULcwLmJN5ptfwDG2q
	+MUGF3oouYy5RbLG+MKxPqONsCQa5Rae6F2f46X4TeNoyxO+MMkGaOvg6H08uKre
	z7bk77ejr366Z4wV8lgHF+8IRcLW266MaHIwy4ROWkTKe2FB5WnMn35IVak6a3rN
	tWK5k/qdxIyXelgYPjXQiur4J/7jmG/1FuxbufNEVg/Jun+Z+RjHY3SpSLcyu+qF
	MVzcN2wd/BEzF+oRl/ziC19LMxla1MAHXpzQi9EZ/uuUIPuWekVfGnljAvTq2lXb
	gkl4aqd20FzSBUol0iFK86qaOHjSXd5Tg21dzcA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Ya82AYZmWmuTSiNol7evorkh3REZhBuD2npPhpNY9D0=:GVgsKlGU0Tkh+glMpG6kNt+2eKyt7RJpAqO9o5peJRk=;
X-ME-Sender: <xms:JfjhanE-CUW17bYMVYk_FH3L1ZLFVU0Y_Uoedesf8P3DpvfyGJJmsg>
    <xme:JfjhalbT5Sj9-N5kWqID6_CIrg2UHCRz-ApejZe0QOLj73r9zYkT-SGKd2M8dffAV
    ZYKJdI7jcereMKJrzct6nKCQBI09LFP2Ek_8nYZaX-Gu-rMD-U3HQWb>
X-ME-Received: <xmr:JfjhasEUioNrGnYYzE7vVTngaKmgkJNJdi_uDNt28PciFigs5iIC5KIUG7o>
X-ME-Proxy-Cause: dmFkZTFQ3oJtbeS5Xmzxqx8cRlrjv1Yh8slOA2ozsuZRURzU4har3NzvqQfdXDiJJUJdL6
    TeG44YhIKoRSHAWQhAjUNewbSckPVBidLps6p/lpyOE5DjNELMP6y4F2BoYzcRKfeckYz+
    QN2rD94eFek45ZPsG6cPJ21dbZGkHSVUJXD3MvqPypqO/LX7utajemwNzInOiAwQlZEn0U
    lcq8HacUjumEjtK9Zr+sGGFEGXKR87KBhK42gVHNTMRKNYGIEBd6jm9pRkEJnLVUiNttsy
    H45ruMlExqaJ4o+knJBOH2AoAc8JvQgs0Lznf53Md/qAVo+U+x/el2l8xtegqLDmnfy4Jk
    Ht958jHBDobqdbRxy95iKq5t9BFEDlfqAl6LFNm8MWI0w61L5zsp+76FYMH/dZx6+0Idru
    Z0BAxNRAp06ax4Ej8h1L3GDIEtOeFtF/d7zRBRq7rZXRKacJ/SxulAPcTfvlHZnL4VeBrI
    mvmtxn6o2nVwff0K2VVfO6wRRcQHKcCHxovjXLzEglQRtlANe04CDAGMN/t0Dg9H/GBlXH
    jht/enKX2diQm+1YER0wKazCvqMK+oNj/lt+AXqbwjcszLEWITOhF7R2PhGmoAzeoAZ/7O
    F8V/xgG4iNybmDhJaTxg8zptNKDmUOaHjeptIZ2dStau5zZ96nnWjEM60qcQ
X-ME-Proxy: <xmx:JfjhaiyCNuM_6ZbyS-HM1OQ6Gqss82STcb2_QKeUa0N0FW9OaS3_6g>
    <xmx:JfjhamGwCf7OX3bLhdbUAbVMCv7lK-Ybi_Lj3aylpvbK-inCQqHQjQ>
    <xmx:JfjhavvXRwAA_rBTkexAP9nz3XJrx9TEkDcLlWKcraxdUOxLlVfczQ>
    <xmx:JfjhaiXQyprOWBbP-61I0j2NeUoCJf2fEp_5ZmcTGLuQIJyZ4FlciA>
    <xmx:Jfjhaq56wkAUkHwUgz51YI4uuizv0xhSNZ5U0bx9sWrjL-kJntCXTJOv>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Oct 2026 09:27:01 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
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
Subject: [PATCH 3/3] mm: vmscan: tell direct reclaim the allocation is ALLOC_NOFRAGMENT
Date: Wed, 28 Oct 2026 13:26:37 +0000
Message-ID: <20261028132638.2560361-4-kirill@shutemov.name>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028132638.2560361-1-kirill@shutemov.name>
References: <20261028132638.2560361-1-kirill@shutemov.name>
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

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

Direct reclaim for a costly order stops as soon as the allocation could
succeed.  compaction_ready() skips a zone and should_continue_reclaim()
stops reclaiming when zone_watermark_ok() passes, and zone_watermark_ok()
accepts a free page of any migratetype.

With defrag_mode, the allocation behind the reclaim is ALLOC_NOFRAGMENT
and cannot take the free pages left in unmovable and reclaimable
pageblocks.  Reclaim stops on them anyway, having freed little.

In Dev Jain's 64K mTHP benchmark, an order-4 direct reclaim frees 16
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
index ed9d4ed9b847..66f7160147bf 100644
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
index 7605ee60df5c..3ee1b706b097 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4454,7 +4454,7 @@ static unsigned int check_retry_zonelist(unsigned int seq)
 
 /* Perform direct synchronous page reclaim */
 static unsigned long
-__perform_reclaim(gfp_t gfp_mask, unsigned int order,
+__perform_reclaim(gfp_t gfp_mask, unsigned int order, unsigned int alloc_flags,
 					const struct alloc_context *ac)
 {
 	unsigned int noreclaim_flag;
@@ -4468,7 +4468,8 @@ __perform_reclaim(gfp_t gfp_mask, unsigned int order,
 	noreclaim_flag = memalloc_noreclaim_save();
 
 	progress = try_to_free_pages(ac->zonelist, order, gfp_mask,
-								ac->nodemask);
+				     ac->nodemask,
+				     alloc_flags & ALLOC_NOFRAGMENT);
 
 	memalloc_noreclaim_restore(noreclaim_flag);
 	fs_reclaim_release(gfp_mask);
@@ -4490,7 +4491,8 @@ __alloc_pages_direct_reclaim(gfp_t gfp_mask, unsigned int order,
 	int reclaim_order = ac->reclaim_compact_order;
 
 	psi_memstall_enter(&pflags);
-	*did_some_progress = __perform_reclaim(gfp_mask, reclaim_order, ac);
+	*did_some_progress = __perform_reclaim(gfp_mask, reclaim_order,
+					       alloc_flags, ac);
 	if (unlikely(!(*did_some_progress)))
 		goto out;
 
diff --git a/mm/vmscan.c b/mm/vmscan.c
index fb9f8f020f63..7cfc4b509cee 100644
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
 
@@ -6317,6 +6320,17 @@ static bool in_reclaim_compaction(struct scan_control *sc)
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
@@ -6355,8 +6369,7 @@ static inline bool should_continue_reclaim(struct pglist_data *pgdat,
 		unsigned long watermark = min_wmark_pages(zone);
 
 		/* Allocation can already succeed, nothing to do */
-		if (zone_watermark_ok(zone, sc->order, watermark,
-				      sc->reclaim_idx, 0))
+		if (allocation_can_succeed(zone, sc, watermark))
 			return false;
 
 		if (compaction_suitable(zone, sc->order, watermark,
@@ -6581,8 +6594,7 @@ static inline bool compaction_ready(struct zone *zone, struct scan_control *sc)
 		return false;
 
 	/* Allocation can already succeed, nothing to do */
-	if (zone_watermark_ok(zone, sc->order, min_wmark_pages(zone),
-			      sc->reclaim_idx, 0))
+	if (allocation_can_succeed(zone, sc, min_wmark_pages(zone)))
 		return true;
 
 	/*
@@ -6966,7 +6978,8 @@ static bool throttle_direct_reclaim(gfp_t gfp_mask, struct zonelist *zonelist,
 }
 
 unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
-				gfp_t gfp_mask, const nodemask_t *nodemask)
+				gfp_t gfp_mask, const nodemask_t *nodemask,
+				bool nofragment)
 {
 	unsigned long nr_reclaimed;
 	struct scan_control sc = {
@@ -6979,6 +6992,7 @@ unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
 		.may_writepage = 1,
 		.may_unmap = 1,
 		.may_swap = 1,
+		.nofragment = nofragment,
 	};
 
 	/*
-- 
2.54.0

