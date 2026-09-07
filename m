Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE3B4457DF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784102; cv=none; b=K96RGUQIz0y5vdPBnlOsZCFL5vNo8txUYx0EvRehi3W5LVq4IWkRR4gPniFJIrWZFVa3V0LJIwla4dVu0bzITKW16XktHZ6qrMzEaqyMcD2c8JfyL8kgFx1h48vm7OBo90Izt9QCMMh5746OE+IsjgmbdJ6uLfQB/+eIstH1bGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784102; c=relaxed/simple;
	bh=zf8Ca+XzPYYB1/mo/qycM7+P/lumy4Wq0eW+EuNeJKY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DzyIjAxPSXTpEHCeyzWuOttv1Rhbrpo/4gtRh7eqXwg1SlSIheYZxa94k/8pWV++8BMVtYU95bKho4rr19gP4mzJvvX/kaxxaGcnLrT4kYlCrtVtz+YXSEyG3ch0OKzwRfBPhfpTVHXxfUD25odDBAfP3gjh0JVj8JEKDlGMwXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbNkyagE; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbNkyagE"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398b3d66515so3330479a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788784100; x=1789388900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTzF6RGmGUg4NezQEPwLNpok/5t7X4IGc6Kb6nHVcDw=;
        b=UbNkyagEyP5Ez8Is9fvkckQsSb8HFXB/uAutyHXS1btPgdsI1yz4I151MoHmaO5Bly
         UH6MT6+QnBMAhackfikDIeDt2Xchf6XbJEWlb6ENcvbxabfeVrzfG8nVs5f0p4sfcVKq
         ighcuvaUPYsk+W+zy6ifxt9wUGsQJGDWHT11lrcIJsfXUzXvjfJ44qRQjS6q5P98AMJH
         W5qUOYfIpWH05q9iP9LQ4Qmh7uRo/FaMR0Js3TQlzmCaXHy6DzzWPZRmxdslyzHdbOF/
         UqoHRtO2k2Tsntba3RvdzaIrSNKG/Ni5db7NVfEl+GzJMgqDvjLK3aTxWj42MrY2bfLs
         O35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784100; x=1789388900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTzF6RGmGUg4NezQEPwLNpok/5t7X4IGc6Kb6nHVcDw=;
        b=Pp+3HfZGobjOpulg0EIHId593Sb1FxvMjhjpU1Koa9AnqNWP8T9MNFDf/wVo7GHpOa
         qM8go4r3sHk7Qnz7j8neJ6XdCWSD04ndoWo52O31S/kXDgjA2vB1umaZ/r08JyH4+zDN
         8pNiI7oDGIaMcGjyEhoh/1AR+PuN0/KLZsfdvInv2dLPRj9AHPgHgc+w9HJ9G82eHmUO
         Vent2HH2gJYgCuZzVL/VAGINV+rIknp+yuvIUf6ubf1mlmryBT4ZqUSad2wRgSSbVh1t
         tQYwEQCbL/3deW2tX2KZf7J1RZL9Al488jZ4MjRbpaLrPyC/NVxuUG5lU85pCQOPrHfr
         zAIw==
X-Forwarded-Encrypted: i=1; AKwUvBwLhBAinVQFE4CRq0NfNwH7xJduirrQOfZWkzpP7RdyBGEGX1aPQVsPu8/hsXjPzJpAOMObWShzgAu/zmI=@vger.kernel.org
X-Gm-Message-State: AFuF++kyuNGukHnfytZBCC/xMqmYHqNvocZ679DX5KacAWiehMDjutDK
	PGypXpGgjAJ6Tky42/nl0OrK0q9GzTr0FpeWEddlFVQ2izpTHw4T/YY1
X-Gm-Gg: AYBFou1PxoFURLKfayWmL/zFv6tEPieWj+Ax0ylAqBt5BcyQ59aOKnyf/B96ycfqBVa
	xcDKBnUFrDCYvJOFm8ZL6Eot0lI60NldOmEhk0VNdzQtdmfCJOs/mw6RZROy0/noSZxvOerj/QZ
	0FS76dSMbr3TprtFAuzCze1GqWCqTAGWOFFQC0pcMqO41GVisC63tlO11mBfE7vaVjijtlmd+oq
	kHT1rBaWZpvBvoA9bG07mhVT9rRKQQIWvBSrbKd8xmre5EQnjFzAfjJxUGQSSZTWrna2rWh3qnk
	EndCb/ipjD2fmJ+KfF/XmRaVj/FsbjESu5ad1O55kWE9k9BvpTbzGpQB7An2t6q5cShDHSxPr21
	yeS4dApeJZ+rNxI6KsPhlcPvMhxRxPS3ddRKT70jc461OpO9W/Ppbho0h8q+MQzeQjFm9AWIl7P
	kuziDAEhrr6r+CEwMhsMPE5oI8yw8h7o1ZxMMq6frkE1fb7TnjvaH/uqkNfbDddZrkZSTH8G7vN
	quHkQ==
X-Received: by 2002:a17:90b:5106:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-39b260feb03mr33390832a91.4.1788784100350;
        Mon, 07 Sep 2026 05:28:20 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b84cce64fsm2345266a91.3.2026.09.07.05.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:28:20 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: akpm@linux-foundation.org,
	hannes@cmpxchg.org
Cc: baohua@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	david@kernel.org,
	mhocko@kernel.org,
	ljs@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: [PATCH v3] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache
Date: Mon,  7 Sep 2026 20:27:57 +0800
Message-Id: <20260907122757.748111-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have observed some cases where memory is allocated with GFP_NOIO, so
we cannot reclaim any anon folios unless they are in swapcache. We can
end up spending more than 150 ms looping in `shrink_folio_list()` scanning
non-swapcache folios without reclaiming a single folio. This is pure
overhead.

This is particularly true on systems using zRAM, where swapcache is
relatively rare. So let's check whether anon reclaim is allowed by
GFP_IO and whether there is enough swapcache to make it worthwhile. If
the swapcache is extremely low, we're essentially searching for a
needle in a haystack, so let's avoid scanning anon in the first place.

On Android this is triggered by dm-verity hash-block reads through
dm-bufio, which legitimately use GFP_NOIO because they run underneath the
IO path:

  verity_verify_io -> verity_hash_for_block -> verity_verify_level
    -> dm_bufio_read_with_ioprio -> new_read -> __bufio_new
      -> alloc_buffer
         gfp: GFP_NOIO | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN

Such a reclaimer can land on a memcg with a large, unswapped anon LRU and
a tiny file LRU (e.g. inactive_anon ~335 MB vs inactive_file ~4 MB, with
negligible swapcache). shrink_lruvec() then keeps feeding that huge anon
list into shrink_folio_list() - ~2400 shrink_folio_list() calls, ~93,000
anon folios scanned - where every folio is kept because it needs IO. The
150+ ms above is one such single shrink_lruvec() pass (not accumulated
across a reclaim cycle), and it reclaims nothing; the actual progress
comes entirely from the file side.

Aging anon alongside file does have some value for a later __GFP_IO
reclaimer, so it is not strictly pure overhead. But that aging is only
deferred, not lost: kswapd and other __GFP_IO reclaimers still walk and
age anon. Spending ~168 ms aging memory that this context cannot reclaim
is not a worthwhile trade-off in a latency-sensitive path.

To stay conservative, this only skips anon when the swapcache is really
tiny - below 1/64 of the anon LRU - i.e. when essentially no anon on the
list can be reclaimed without IO. Whenever there is a meaningful amount of
swapcached anon, the normal path is used and anon is scanned and aged as
before.

Note this only addresses the traditional active/inactive LRU. MGLRU
selects anon vs file scanning in its own path and is not covered here;
fixing the MGLRU case is left as a TODO.

Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
---
v2 -> v3:
 - Fix stats source in reclaimable_anon_is_low(): for global reclaim
   (memcg == NULL, e.g. from set_initial_priority()) use node_page_state()
   instead of mem_cgroup_lruvec(NULL), which resolves to the root memcg and
   excludes the child cgroups where anon actually lives. (reported by the
   sashiko bot / AI review, raised by Andrew Morton)
 - Add a comment explaining the heuristic and its rationale. (Andrew Morton)
 - Update the comments above the can_reclaim_anon_pages() checks. (Barry Song)
 - Note in the changelog that only the traditional LRU is addressed; MGLRU
   is left as a TODO. (Barry Song)

v1 -> v2:
 - Use mem_cgroup_lruvec() instead of get_lruvec(), which returns the raw
   node lruvec for a NULL memcg and would be misinterpreted by
   lruvec_page_state()'s container_of() during global reclaim. This also
   drops the get_lruvec() move. (sashiko bot, Barry Song)
 - Drop the SWAP_CLUSTER_MAX cap on the threshold; the check is purely
   proportional now (swapcache below 1/64 of the anon LRU). (Barry Song)
 - Expand the changelog with the workload, the dm-verity/dm-bufio NOIO
   stack, the single shrink_lruvec() breakdown, and the aging trade-off.
   (Johannes Weiner)

 mm/vmscan.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 245f68c75b28..e5c07490f5b3 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -362,20 +362,62 @@ static bool can_demote(int nid, struct scan_control *sc,
 	return !nodes_empty(allowed_mask);
 }
 
+static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
+		int nid, struct scan_control *sc)
+{
+	pg_data_t *pgdat = NODE_DATA(nid);
+	unsigned long anon_pages, swapcache;
+
+	/*
+	 * A !__GFP_IO reclaimer can only reclaim anon that is already in the
+	 * swapcache (adding anon to the swapcache needs IO). When swapcache is
+	 * far below the anon LRU, scanning anon reclaims nothing and only burns
+	 * CPU; the aging it would do is merely deferred to later __GFP_IO
+	 * reclaimers. The 1/64 threshold keeps this to the case where anon is
+	 * effectively unreclaimable.
+	 *
+	 * Use the memcg's lruvec for memcg reclaim; for global reclaim
+	 * (memcg == NULL) use node-wide stats. mem_cgroup_lruvec(NULL) would
+	 * only see the root memcg, not the child cgroups where anon lives.
+	 */
+	if (!sc || (sc->gfp_mask & __GFP_IO))
+		return false;
+
+	if (memcg) {
+		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
+
+		anon_pages = lruvec_page_state(lruvec, NR_INACTIVE_ANON) +
+			     lruvec_page_state(lruvec, NR_ACTIVE_ANON);
+		swapcache = lruvec_page_state(lruvec, NR_SWAPCACHE);
+	} else {
+		anon_pages = node_page_state(pgdat, NR_INACTIVE_ANON) +
+			     node_page_state(pgdat, NR_ACTIVE_ANON);
+		swapcache = node_page_state(pgdat, NR_SWAPCACHE);
+	}
+
+	return swapcache < (anon_pages >> 6);
+}
+
 static inline bool can_reclaim_anon_pages(struct mem_cgroup *memcg,
 					  int nid,
 					  struct scan_control *sc)
 {
 	if (memcg == NULL) {
 		/*
-		 * For non-memcg reclaim, is there
-		 * space in any swap device?
+		 * For non-memcg reclaim, is there space in any swap device?
+		 * And under GFP_NOIO, is there enough swapcached anon to make
+		 * scanning anon worthwhile?
 		 */
-		if (get_nr_swap_pages() > 0)
+		if (get_nr_swap_pages() > 0 &&
+		    !reclaimable_anon_is_low(memcg, nid, sc))
 			return true;
 	} else {
-		/* Is the memcg below its swap limit? */
-		if (mem_cgroup_get_nr_swap_pages(memcg) > 0)
+		/*
+		 * Is the memcg below its swap limit, and under GFP_NOIO does
+		 * it have enough swapcached anon to make scanning worthwhile?
+		 */
+		if (mem_cgroup_get_nr_swap_pages(memcg) > 0 &&
+		    !reclaimable_anon_is_low(memcg, nid, sc))
 			return true;
 	}
 
-- 
2.34.1

