Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C23237FF68
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848820; cv=none; b=lB2SIf5yIQG//7TZJuMv7Wq6KblptDnYzHNa3ap/d3uV8uTJyQmRUbOSyY2p17nQpLJOvn2d4rv/TN9AoVUsfQPZTpxjXhcZ0sc7XFMKhqZUJolozMzbR0eqibSTigu+hp0xCfUWvgLb0F954m1bU/JFGC1uLPyFdvBelrsm8fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848820; c=relaxed/simple;
	bh=bbvVkFc5r/Z/Oop0rnRmPLVi8Lrf5mS6r5bZZGBEEQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q5Zn2/VIZNpIWWiQhDlHStfbgeZNokIJxOOJzFwajNlzG0HHUqBeT85szlXPoGDD7NzVdD4TkRJDLB3jP7QqfGJxKA5nf1WaFLAvBYm6VepgZEJxTFOZJMkjClf2uBcG55H1j56sIlD47r4r3eGfML6QU0lNSoEgtFncuXkZYNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oslJ1iop; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oslJ1iop"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so4864859a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788848818; x=1789453618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fhiEpm2qdQbWRM6RAj4bAjW4Pi/E69sJ1QXVjWM8dxg=;
        b=oslJ1iopYTnXB1Sm7UNUAvpU3W+ZjBwLYGXrv79dq6umRd1ZchEnww9fbi2Bo1p97p
         CU0AXhxsli3H8Ro6SgjHr0HiEwjDxWqLrhSzqkxXF0hRbAdD/SpIob04Wv0Ks9eDR9Yw
         jP2QvdCV222Ga1L08o0XsTqIkwCuPvgpa5FRH5tvcL+CRZns2dHyvsuJ0WjZn2Kt75I1
         YbWt4jZSgcptQWapuIjlsQk/TrjUsBmJlczWsw7rL8oBZD7CKmgnFDKro7iE3EZ2XjqB
         p68gT9wrRgTcAd10P6rfXWnd/butFLp/FD+hy83k5UXxTjFUDxic0CSp/BoZUBvllhzF
         JNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848818; x=1789453618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhiEpm2qdQbWRM6RAj4bAjW4Pi/E69sJ1QXVjWM8dxg=;
        b=eotTnhJe7xPMucMrqQ9yW9Yab+WBOUXxyOr+GQ3zKUEK4bmCGS7CFZfb5/KWMqHT3W
         ClEH9xKA1xc2yUCKk1rhwWINMSgn3p1EN0+Fgg+m0s4GOxZ0BSoaEPJl4CmM57+s7Xov
         2mkdcr8Rk3OvauaklxwwUwfif2yh6PgSGFm53Lwp4JtSyopQ7BYT3sQeGmi2x3tn4NNg
         iYWpWO1ZHigbFQSuz/2/8pPtFYstIBzSSYpISqR1QfQKZpBGQdoxWz2to1Zj1P6pT1mI
         O/sXay6vGwPMMHPs6lruJb20TT2oHzRRTrRZqNn5lVwyUrJXJM3/uSeYlhjACtGWd5yT
         5vqw==
X-Forwarded-Encrypted: i=1; AKwUvBwJ//seuu3W3wsxnEodleZSOGZjotcxp7C69yK/Peu4JQR3YEHajh1/WFjS2ZQkHF/NJyPPEOoVhB1tRE8=@vger.kernel.org
X-Gm-Message-State: AFuF++l5Q6xl5XzXWvKQEeD/DjgJqq4J2UftHp5oaalovvutVWSLwZ9u
	i++m6PlEFbU7RiemiGSQ9Y8YMF0q/l0er8DGW3/vrOwqOwH0ev1BSXs3
X-Gm-Gg: AYBFou2wN6Mm4J6T72H43N8YKDuLHTWcft06laXyBJGuSGDqk20+aHoZO2ZvbBe37Ap
	82FUyThoLYByoaFpyBPgZxU8q3VLsxN1e0/yuNu3Hqn8dH0KL32wvxH8cvJlhRJW9SB85drd3N0
	fN2yxu77wOQPvYZX6ioHkUMj1XCX96JBDnntWrtsHIQUvmmadTN8BSqs9kKeOPFEEK6s/z7ajHN
	3+oPqJG2BJEI63HUmrihAtcyUt0V0YlEaCtoEj4SgHHnrqOWGJFMVoNc/yyjItzXdD46ejfNhbV
	ed+itW0w+WG0Ng7gT4STY1lijCp/HXv2SsluvHGoJNScfe2EUZs7GKORSlvHmJYeJbDyKM2MApk
	BEue2ctPuCM95tYLiMDBasOJam3fDwp1bI4P/BNPVKre2JJg01NFe3HeHKPfZjTTAeKa8N14JMm
	b8jENzEFdn1n9Xo5IOynpb9OhKsDScBE5ptkxDqChdgSMFWFQOcF3QyPlP+Mlgn45rTXya8Wyo0
	gnUJA==
X-Received: by 2002:a17:90b:3944:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39b261b19d9mr45738602a91.14.1788848818241;
        Mon, 07 Sep 2026 23:26:58 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm30556614a91.11.2026.09.07.23.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:26:57 -0700 (PDT)
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
	ryncsn@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: [PATCH v4] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache
Date: Tue,  8 Sep 2026 14:26:49 +0800
Message-Id: <20260908062649.1045883-1-zhangbo56@xiaomi.com>
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
v3 -> v4:
 - Do nothing when MGLRU is enabled (lru_gen_enabled()). MGLRU selects the
   scan type in its own path without consulting can_reclaim_anon_pages(),
   so returning false there would not skip anon but would still lower the
   priority computed in set_initial_priority(), potentially making MGLRU
   scan more anon. Left as a FIXME; the MGLRU case needs a larger change.
   (sashiko bot, Barry Song, Kairui Song)
 - Guard the helper with CONFIG_SWAP (NR_SWAPCACHE is only defined under
   CONFIG_SWAP) and return true in the stub. (sashiko bot, Barry Song)
 - Say "GFP_NOIO reclaimer" and trim the comment. (Barry Song)

v2 -> v3:
 - Fix stats source in reclaimable_anon_is_low(): for global reclaim
   (memcg == NULL, e.g. from set_initial_priority()) use node_page_state()
   instead of mem_cgroup_lruvec(NULL), which resolves to the root memcg and
   excludes the child cgroups where anon actually lives. (sashiko bot / AI
   review, raised by Andrew Morton)
 - Add a comment explaining the heuristic and its rationale. (Andrew Morton)
 - Update the comments above the can_reclaim_anon_pages() checks. (Barry Song)
 - Note that only the traditional LRU is addressed; MGLRU is a TODO. (Barry Song)

v1 -> v2:
 - Use mem_cgroup_lruvec() instead of get_lruvec(), which returns the raw
   node lruvec for a NULL memcg and would be misinterpreted by
   lruvec_page_state()'s container_of() during global reclaim. (sashiko
   bot, Barry Song)
 - Drop the SWAP_CLUSTER_MAX cap on the threshold; the check is purely
   proportional now (swapcache below 1/64 of the anon LRU). (Barry Song)
 - Expand the changelog with the workload, the dm-verity/dm-bufio NOIO
   stack, the single shrink_lruvec() breakdown, and the aging trade-off.
   (Johannes Weiner)

 mm/vmscan.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 57 insertions(+), 5 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 245f68c75b28..226cbd9e4836 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -362,20 +362,72 @@ static bool can_demote(int nid, struct scan_control *sc,
 	return !nodes_empty(allowed_mask);
 }
 
+#ifdef CONFIG_SWAP
+static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
+		int nid, struct scan_control *sc)
+{
+	pg_data_t *pgdat = NODE_DATA(nid);
+	unsigned long anon_pages, swapcache;
+
+	/*
+	 * A GFP_NOIO reclaimer can only reclaim anon that is already in the
+	 * swapcache (adding anon to the swapcache needs IO). When swapcache is
+	 * far below the anon LRU, scanning anon reclaims nothing and only burns
+	 * CPU. The 1/64 threshold keeps this to the case where anon is
+	 * effectively unreclaimable.
+	 */
+	if (!sc || (sc->gfp_mask & __GFP_IO))
+		return false;
+
+	/*
+	 * FIXME: MGLRU doesn't fully respect can_reclaim_anon_pages() for the
+	 * scanning type, so only apply this to the traditional LRU for now.
+	 */
+	if (lru_gen_enabled())
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
+#else
+static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
+		int nid, struct scan_control *sc)
+{
+	return true;
+}
+#endif /* CONFIG_SWAP */
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

