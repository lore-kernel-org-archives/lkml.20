Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194014;
	b=kThAG/n0pj5liQazFQt72I9TUtic38hm7QZxD3cdLKMDojQ46N3oAkhDiXmFbLImGPsv
	 9ZykGbzIrkPtL5KIO+E1cf1goKh31PPVUcRmPdn9sZSaS22HQgIV1l7QKzPNVinq1ehLQ
	 S55WUp02PWCafFWNTsUxcuZ/VWPCbfunPW/bEhOUyu3J0TUVna4ypojKOys+u6HIXaqXe
	 FQYMT60wtiTer5jwyHYk4YzWp+6icDEiXXjpHhtjGfXwworhLqhflh1m5dg98V0KmcBzJ
	 SrerKxkWhvP6/thX3Xvqgfy8EWrdI8jrzRSJXmw+IdP58t5HGdgsU3Z51FTreYfx+aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194014;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=YrU7E7QccK8LKrFkPj7ga/2PtVGNUSRWmBzKnwFgrjg=;
	b=PCUH5ELSxXfHLbgqqurFacUQAM+VA2DQTq1HMm5yiZOfOwskKNvLzpJ4X69iZ6E2U70k
	 mXc1aobwXh/IpWBvuCyqhLsxqoyzXSHONV1fCY0X0r1PjaFMMeYTm4kWuJp8LkO9Jn0ca
	 2vArYoMoZNjoFI7u/bGLLogyJL3a4yhprJm7Epk///2CsYVxndFu23paqlM6w/dtcTfjF
	 yzfW9ArhMKnRtomBLUNAQpmiwl7o9C199LRIniPA1JP3CvyLcZzzpU4VsUo4BokfO0WcS
	 T+wpUAKKK8y6ZP7pwvl+PsSs+yy9hnpSPo0pJ6fmxRsUQ4WGViHOxGOB8uHRJl6Qfhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=shutemov.name;
	spf=pass smtp.mailfrom=shutemov.name;
	dkim=pass header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=MvFyeeme;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="jrl/w1pQ";
	arc=none smtp.remote-ip=202.12.124.138
Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA3E606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA3E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=MvFyeeme;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=jrl/w1pQ
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailflow.stl.internal (Postfix) with ESMTP id 768AB1301F2F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:26:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 28 Oct 2026 09:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793194009; x=
	1793201209; bh=YrU7E7QccK8LKrFkPj7ga/2PtVGNUSRWmBzKnwFgrjg=; b=M
	vFyeeme1viX8XxGaIEallNu6vAH2dE3OCR9kkYoKJ4CbrAKRTPZ2r5Qkk+kanIDf
	Q47KEnqCfFrtiwarPj191O0kEe3zy3zhZWfjhmr/yEp4S5dQQoGVw1GfqH5ggW79
	e/Mnm278HCTZKgpiD3UoViVyjYG4pUTv1hRIFfUN2n4QxBWpxw8E+HHqtSb1URAL
	kzVA9esIhlKW1cYqKvvOqBfkkqGv1hjLmLs2l71MMxgFBdy8VpF7HOVzZS4Gtp3u
	XqQhcTNlkDPnSB6UDFFpMnxlakesU+D4NqxGpwSdwBNs1poj85mD7/PXEfMvfmCE
	YNDfsVhuik8cvWeIZ7Shg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793194009; x=1793201209; bh=Y
	rU7E7QccK8LKrFkPj7ga/2PtVGNUSRWmBzKnwFgrjg=; b=jrl/w1pQCQHUHqLJJ
	XcoxYx+4wjCS99e6HE/nOVYiQU9aps9YQQlTHA0uq4KEFyglnzdMzekXmYFhLPvB
	7zDno4ClU7pTeM50WkX/vgMjiBT/d8IU+InnUfAnZlNHgqobobC7HN22GFLKzaWh
	a8UT5Lkn4z+OMX91LFXOKrNep+D/f7iEJK31oHok3CjOFMAxmDUNYiwIIB/tfMEB
	ZNvvWFmsTAq1k8SyjNmiyvYXo9y/78VjPhoIzRGW8/oGXiNCqOhnCPiCVcyCN2Sh
	U2vMbTmFvfqglz6tPDFMc4q0N4ZtsVla0izgefvFys4zIxgdHTkHdEXBA8XgzRZz
	Afy0g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793194009; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:rB1cyxFmA9GzE5HFGXlbe5/Sc795s0NbxSyA5EL8/+348PD
	gL930YbaBSgmIZvpa7IJvHAnLcmoV3tQhJZ7FrOeDiHy61LFPRTR9htxJw6VQvV2
	1qmo6wDgrqC/9l7fsOEP//jiXP2JTpZGkUcMVRICxMc227PdeZUYorwVPHnR5zPz
	FUioYtvwfpMMJQSoIWXYONPoXBxTZ7EFK5nO+DYv6hWrsu5cptxzZWG/4PM8Spm6
	31vVak2jjD8K4PNBfG/9LgzP4noXLotbQ97ZQUvxUDMqErJJ6Uvsq35M86LXLniV
	ENZrMtJ2FufahlPjUSsmQ573Qc3NtEuoIcNw9bA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:llJrHzCyojmksEvVEVJX/AXensLrdHskwKSi9nuZw+8=:fM8nk9EXdxKDx3aJVIsYsb4568NoWIWxSaoL2tV6igg=;
X-ME-Sender: <xms:GPjhah7Ikoc5Yc92dJYUfLOkaEVC-CjkllHfFxjsux1kdI2L1fvmnw>
    <xme:GPjhav_fogDYOPL_znkISwA1pSjL_jspq4JirIXlB6tgXKm0AffIQkJHRtaLP95FC
    kII3yhtPpQctgby7SPe3pP0CjdKdoFHeXrsXrOBtepfG9b4im4DMmpG>
X-ME-Received: <xmr:GPjharZONHJ3dT6dFyqPH2Z-v1smmgX5hS0-5g4JeZuL_UZAemcPysAxOE8>
X-ME-Proxy-Cause: dmFkZTGiJZBx7qcyMq0dKKlTZWj9kSKpfH6wzQ9Z+BtCBpM9uTPaaB99Qxkebbrl4d+ztn
    na5f4l9k9iAy/DlzPUPp68n7YmMMKV+f7ELVOOzDAruQDJ5/ho+5HZC2ImMKIiyF1GUB1P
    zC0NrtwDMTRBpIcK8U1NKepNOnZdstyZV0OWj8yLS2D3t818f/hprwhJtiRBXCaPXF6UZ3
    D+UD2jjYtG2xW+XIqJE/nlJJQzd4EpQ5bg3xoP1g77lRqizaa13V+cmM7m5c7DvFkibQAP
    fLgbrloY2AuXirir0xz5hMvAUssl+404rrGNlrsuOy+ccvF9/i8f6hSQLjrh+6oTPM+HYo
    Wh07/T2tmzjdnwO3NSU7f7aq90LsLljoBH4fuye5UN2YjlvaE2UDrs/X45HRalyK/n7V/e
    lgqyzr18XLW3B6pczEKj0ez2PhmN70Jg9HKpNwuRafM41W136Y2VUch6pkfxAPAfHTNwME
    rOlkaLampMv54qQD+8QKZBcco+oLik/4omybTgjEY7hIJEbhTQfnq+BonSPvxFmwaankS+
    OFfsr7TGEBPABOI/67iI1W3UrL/UeUg6Onboz2d5szutWWRA+YauHth4UsiNLkgIOnG20a
    e47E2T7bAQKVaFBrd1CgtXNaHO5QvzgC5rGzhUXvUR94QL/lhToy2ZFKfF+A
X-ME-Proxy: <xmx:GPjhan1Nn1V0bOeys8yYZhS9GiI9N4fLx1tj9rEoNY22NliMOCvn3Q>
    <xmx:GPjhat4H_4eqyP9-xzAr_QvZk8WbnjUZGYy4Wja3Vww4w2fjKW18cw>
    <xmx:GPjhajRmlDdBDCh4FOUtIixIZpyxsJXSBpMfY8EprrOt3_rPbeqJnA>
    <xmx:GPjhamqUtnhbiH6u4_fVYnLug0ITURAZlVjI6mYoG83aLq_LQnjFaQ>
    <xmx:GfjhaoNETfdhxD8dCNPnQC7hbR0dlOSfqbvXPOtUqCx9pHf609GG722D>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Oct 2026 09:26:48 -0400 (EDT)
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
Subject: [PATCH 1/3] mm: page_alloc: add a watermark check that knows the migratetype
Date: Wed, 28 Oct 2026 13:26:35 +0000
Message-ID: <20261028132638.2560361-2-kirill@shutemov.name>
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
index aeebb3e49ed1..ed9d4ed9b847 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -728,6 +728,13 @@ extern int min_free_kbytes;
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
index 143776e671ab..963f39734d38 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3590,9 +3590,10 @@ static inline long __zone_watermark_unusable_free(struct zone *z,
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
@@ -3668,6 +3669,21 @@ bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
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
@@ -3700,8 +3716,8 @@ static inline bool zone_watermark_fast(struct zone *z, unsigned int order,
 			return true;
 	}
 
-	if (__zone_watermark_ok(z, order, mark, highest_zoneidx, alloc_flags,
-					free_pages))
+	if (__zone_watermark_ok_mt(z, order, mark, highest_zoneidx, alloc_flags,
+				   free_pages, gfp_migratetype(gfp_mask)))
 		return true;
 
 	/*
@@ -3713,8 +3729,9 @@ static inline bool zone_watermark_fast(struct zone *z, unsigned int order,
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
@@ -3926,8 +3943,10 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
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

